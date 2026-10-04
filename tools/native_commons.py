"""Allocate source-declared zero commons in explicit initialized retail storage.

The original compiler object stays unchanged. ASPSX/PSYLINK allocate the exact
XBSS sizes in aligned data banks. Intervening retail bytes are labelled scaffold
carriers and never exported as common payloads.
"""
import hashlib
import re
import build as B
import sdk_link as N


def placements(obj, declared, symbols, layouts, data_symbols):
    rows = [r for r in obj['xdefs'] if 'bss' in r]
    if (not isinstance(declared, dict) or len(rows) != len({r['name'] for r in rows})
            or {r['name'] for r in rows} != set(declared)
            or not set(declared) <= set(data_symbols)):
        raise ValueError('source commons require exact declarations and typed data receipts')
    result = {}
    for row in rows:
        name = row['name']
        spec = declared[name]
        if (not isinstance(spec, dict) or set(spec) not in
                ({'va','size','scaffold'}, {'va','size','storage'})):
            raise ValueError('source common placement requires va/size/scaffold')
        size, scaffold = spec['size'], spec.get('scaffold')
        if (type(size) is not int or size <= 0 or size != row['bss']
                or obj['sections'].get(row['sect']) not in ('.sbss','.bss')
                or (scaffold is not None and (not isinstance(scaffold,str)
                                               or not re.fullmatch(r'\w+\.(?:sdata|data)',scaffold)))):
            raise ValueError('source common size/storage differs from compiler declaration')
        va = int(spec['va'],0)
        if N.data_address(symbols,name) != va:
            raise ValueError('source common differs from retail symbol address')
        if scaffold is None:
            if spec.get('storage') != 'bss':
                raise ValueError('unknown source common storage')
            extent = layouts['diabpsx'].get(('bss','__zero_fill'))
        else:
            label,kind = scaffold.rsplit('.',1)
            extent = layouts['diabpsx'].get((kind,label))
        if extent is None or not extent[0] <= va < va+size <= sum(extent):
            raise ValueError('source common outside initialized scaffold')
        result[name] = dict(va=va,size=size,scaffold=scaffold,storage='bss' if scaffold is None else 'initialized',
                            limit=sum(extent),start=extent[0])
    ordered = sorted((r['va'],r['size']) for r in result.values())
    if any(a+n>b for (a,n),(b,m) in zip(ordered,ordered[1:])):
        raise ValueError('source commons overlap')
    return result


def allocate(segment, rows, retail, assembler, out, assemble=None):
    if not re.fullmatch(r'[A-Za-z_][A-Za-z0-9_]*',segment):
        raise ValueError('invalid common allocation owner')
    if not rows:
        return {}, {}
    banks = {}
    for name,row in rows.items():
        if row['storage'] == 'bss':
            continue
        banks.setdefault(row['scaffold'],[]).append((row['va'],row['size'],name))
    runtime = {name: {'va':hex(row['va']),'size':row['size']}
               for name,row in rows.items() if row['storage'] == 'bss'}
    if not banks:
        return {}, {'banks': {}, 'runtime_bss': runtime}
    lines, regions, owners, carriers = [], {}, {}, {}
    for index,(scaffold,items) in enumerate(sorted(banks.items())):
        items.sort()
        start, end = items[0][0]&~3, max(a+n for a,n,_ in items)
        if (start < rows[items[0][2]]['start']
                or not 0x80010000 <= start < end <= 0x80010000+len(retail)):
            raise ValueError('common alignment carrier exceeds its scaffold')
        section = '.common_'+str(index)
        regions[section] = (start,end-start)
        lines.append('.section '+section)
        cursor = start
        for va,size,name in items:
            gap = retail[cursor-0x80010000:va-0x80010000]
            initial = retail[va-0x80010000:va-0x80010000+size]
            if len(gap) != va-cursor or len(initial)!=size or any(initial):
                raise ValueError('common initialization/extent differs from retail')
            lines.extend('.byte '+','.join(str(v) for v in gap[i:i+16]) for i in range(0,len(gap),16))
            lines.extend(['.globl '+name,name+':','.space '+str(size)])
            owners[name] = (section,va-start,size)
            cursor = va+size
        carriers[section] = dict(va=hex(start),size=end-start,
                                scaffold_bytes=end-start-sum(n for _,n,_ in items))
    source, obj = out/(segment+'_commons.s'), out/(segment+'_commons.obj')
    source.write_bytes(('\r\n'.join(lines)+'\r\n').encode('ascii'))
    run = (assemble(assembler, ['-q'], source, obj) if assemble
           else B.run([assembler,'-q','-o',obj,source]))
    if run.returncode:
        raise ValueError('source common allocation assembly failed: '+run.stdout+run.stderr)
    raw = obj.read_bytes()
    blocks,map_text = N.native_link(segment+'_storage',raw,regions,{},output_dir=out)
    for section,data in blocks.items():
        va,size = regions[section]
        if data != retail[va-0x80010000:va-0x80010000+size]:
            raise ValueError('source common allocation/carrier differs from retail')
    payloads = {}
    for name,(section,offset,size) in owners.items():
        actual = {int(a,16) for a in re.findall(r'^\s*([0-9a-f]{8})\s+'+re.escape(name)+r'\s*$',map_text,re.M|re.I)}
        if actual != {rows[name]['va']}:
            raise ValueError('source common allocation address differs')
        payloads[name] = blocks[section][offset:offset+size]
        if len(payloads[name])!=size or any(payloads[name]):
            raise ValueError('source common allocation is not exact zero storage')
    return payloads, dict(object_sha256=hashlib.sha256(raw).hexdigest(),banks=carriers,runtime_bss=runtime)
