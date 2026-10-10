#!/usr/bin/env python3
"""link_symbols.py -- link-computed symbols of the retail PSYLINK layout.

PSYLINK records, per group, `<group>_org`, `<group>_orgend` and `<group>_size`, and the Climax link
options LNK_OrgAddress / LNK_StackSize; OVERINFO.MIP and LNKOPT.MIP read those back as data words.
Here the same values are derived from the image layouts (configs/<image>.yaml) and the declared link
options, so the GNU link script defines them from its own layout (tools/gen_ld.py) and the native
receipt lane binds the members' externals to the identical numbers (tools/native_recon.py).  The
genuine retail names are cross-checked against rom/DIABPSX.MAP."""
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
OVERLAYS = ('frontend', 'pregame', 'game', 'fmv')
KSEG0 = 0x80000000
GROUP_ALIGN = 8            # PSYLINK group alignment: the overlay groups start at the main image's bss end rounded up
LAST_SIZE = 4              # `.last` group (GSYSASM.ASM's FirstFreeByte word)
LINK_OPTIONS = {'LNK_StackSize': 0x1800}   # PSYLINK /stack option of the retail link (rom/DIABPSX.MAP)
# PSYLINK group declaration order of the retail link (rom/DIABPSX.MAP group column): an overlay group's id is its
# 1-based position, and PSYLINK writes that id as the 4-byte `$<group>` word at the group's org (probe 2026-10-10:
# two OVER groups at one org each get a word there, the later group's value is what the image keeps).
GROUPS = ('(default)', 'boot_text', 'text', 'startup_text', 'map_data', 'data', 'rdata', 'sdata', 'sbss', 'bss',
          'frontend_text', 'pregame_text', 'game_text', 'fmv_text')
OVERLAY_GROUPS = ('startup_text', 'map_data') + tuple(f'{name}_text' for name in OVERLAYS)
MAP_MEMBER = 'recon/psxsrc/map.s'   # MAP: the reserved map_data member, an object whose only section is an empty .data
# yaml subsegment that holds a `$<group>` overlay-id word (the only bytes of that subsegment)
ID_WORDS = {('diabpsx', 'startup_text_hdr'): 'map_data', **{(name, f'{name}_hdr'): f'{name}_text' for name in OVERLAYS}}
ID_WORD_SIZE = 4


def group_id(group):
    return GROUPS.index(group) + 1


def main_rows():
    text = (ROOT / 'configs/diabpsx.yaml').read_text()
    return [(int(a, 16), kind, label) for a, kind, label in re.findall(r'^\s+- \[0x([0-9A-F]+), (\w+), (\w+)\]', text, re.M)]


def startup_span():
    """(org, end) of the retail startup_text group in the main image: its id word through .dtors."""
    rows = main_rows()
    names = [label for _, _, label in rows]
    first = rows[names.index('startup_text_hdr')][0]
    end = rows[names.index('dtors') + 1][0]
    return first, end


def layout(name):
    text = (ROOT / 'configs' / f'{name}.yaml').read_text()
    vram = int(re.search(r'^\s+vram: (0x[0-9A-Fa-f]+)', text, re.M)[1], 16)
    end = int(re.search(r'^\s+- \[0x([0-9A-Fa-f]+)\]\s*$', text, re.M)[1], 16)
    if name == 'diabpsx':
        sys.path.insert(0, str(ROOT / 'tools'))
        from image_trailer import runtime_segments
        rows = [(int(a, 16), kind, label) for a, kind, label in re.findall(
            r'^\s+- \[0x([0-9A-F]+), (\w+), (\w+)\]', text, re.M)]
        _, end = runtime_segments(rows, end)
    bss = re.search(r'bss_size:\s*(0x[0-9A-Fa-f]+)', text)
    ram_end = int(re.search(r'global_vram_end:\s*(0x[0-9A-Fa-f]+)', text)[1], 16)
    return vram, end, int(bss[1], 16) if bss else 0, ram_end


def compute():
    """Ordered symbol -> value, every one derived from the layouts and the declared link options."""
    vram, end, bss, ram_end = layout('diabpsx')
    main_end = vram + end + bss
    org = (main_end + GROUP_ALIGN - 1) // GROUP_ALIGN * GROUP_ALIGN
    out = {'LNK_OrgAddress': vram, '_bss_objend': org}
    out.update(LINK_OPTIONS)
    out.update({f'_{group}_id': group_id(group) for group in OVERLAY_GROUPS})
    first, stop = startup_span()
    start_org = vram + first
    out.update({'_startup_text_org': start_org, '_startup_text_obj': start_org,
                '_startup_text_orgend': vram + stop, '_startup_text_objend': vram + stop,
                '_startup_text_size': stop - first,
                '_map_data_org': start_org, '_map_data_obj': start_org,
                '_map_data_orgend': start_org + ID_WORD_SIZE, '_map_data_objend': start_org + ID_WORD_SIZE,
                '_map_data_size': ID_WORD_SIZE,
                '__MAP_data_org': start_org + ID_WORD_SIZE, '__MAP_data_obj': start_org + ID_WORD_SIZE,
                '__MAP_data_orgend': start_org + ID_WORD_SIZE, '__MAP_data_objend': start_org + ID_WORD_SIZE,
                '__MAP_data_size': 0})
    last = org
    for name in OVERLAYS:
        ov_vram, ov_end, ov_bss, _ = layout(name)
        if ov_vram != org or ov_bss:
            raise ValueError(f'{name}: overlay layout does not start at the overlay buffer')
        out[f'_{name}_text_org'] = org
        out[f'_{name}_text_size'] = ov_end
        out[f'_{name}_text_orgend'] = org + ov_end
        last = max(last, org + ov_end)
    out['__last_org'] = last
    out['FirstFreeByte'] = last
    out['__last_size'] = LAST_SIZE
    out['__last_orgend'] = last + LAST_SIZE
    out['_memcard_text_org'] = last + LAST_SIZE
    out['_memcard_text_size'] = 0
    out['__lnk_ram_size'] = ram_end - KSEG0
    out['__lnk_free_mem_size'] = ram_end - out['LNK_StackSize'] - last
    return out


def retail_values(map_text=None):
    """The genuine PSYLINK records of rom/DIABPSX.MAP for the names compute() derives."""
    text = map_text if map_text is not None else (ROOT / 'rom/DIABPSX.MAP').read_text(encoding='latin-1')
    values = {}
    for name in compute():
        found = {int(v, 16) for v in re.findall(r'^\s*([0-9A-Fa-f]{8})\s+' + re.escape(name) + r'\s*$', text, re.M)}
        if len(found) > 1:
            raise ValueError(f'{name}: ambiguous retail MAP record')
        if found:
            values[name] = found.pop()
    return values


def retail_overlay_ids(sym_text=None):
    """{group: id} from the retail SYM overlay records, matched to the computed group org/size."""
    text = sym_text if sym_text is not None else (ROOT / 'rom/DIABPSX-SYM.txt').read_text(encoding='latin-1')
    records = {(int(org, 16), int(size, 16)): int(ovid, 16) for org, size, ovid in
               re.findall(r'^[0-9a-f]+: \$([0-9a-f]{8}) overlay length \$([0-9a-f]{8}) id \$([0-9a-f]+)\s*$', text, re.M)}
    ours = compute()
    return {group: records[(ours[f'_{group}_org'], ours[f'_{group}_size'])] for group in OVERLAY_GROUPS
            if (ours[f'_{group}_org'], ours[f'_{group}_size']) in records}


def check(map_text=None, sym_text=None):
    ours, retail = compute(), retail_values(map_text)
    bad = {name: (ours[name], value) for name, value in retail.items() if ours[name] != value}
    if bad:
        raise ValueError('link-computed symbols differ from the retail MAP: ' + ', '.join(
            f'{n} 0x{a:X} != 0x{b:X}' for n, (a, b) in bad.items()))
    ids = retail_overlay_ids(sym_text)
    bad = {g: (ours[f'_{g}_id'], i) for g, i in ids.items() if ours[f'_{g}_id'] != i}
    if bad:
        raise ValueError('overlay ids from the group order differ from the retail SYM: ' + ', '.join(
            f'{g} {a} != {b}' for g, (a, b) in bad.items()))
    return retail


def id_lines():
    """Overlay-id constants (every image's script): PSYLINK numbers groups in declaration order."""
    return [f'    _{group}_id = {group_id(group)};   /* PSYLINK group #{group_id(group)} of the retail link order */'
            for group in OVERLAY_GROUPS]


def subsegment_lines(image, subsegment):
    """Lines that replace a `$<group>` id-word subsegment: the word is the link's own LONG(id); the main image also
    places the reserved MAP member (an empty .data) that PSYLINK recorded as __MAP_data_* inside map_data."""
    group = ID_WORDS.get((image, subsegment))
    if not group:
        return []
    if group == 'map_data':
        return ['_startup_text_org = .;', '_map_data_org = .;',
                f'LONG(_{group}_id);   /* PSYLINK $map_data overlay-id word; map_data is linked over startup_text at the same org, so its word is the one the image keeps */',
                '_map_data_orgend = .;', '__MAP_data_org = .;',
                f'build/{MAP_MEMBER}.o(.data);   /* MAP: the reserved map_data member, an empty .data section */',
                '__MAP_data_orgend = .;']
    return [f'LONG(_{group}_id);   /* PSYLINK ${group} overlay-id word */']


def after_subsegment_lines(image, subsegment):
    """startup_text ends with .dtors: its orgend is wherever the link put the end of that object."""
    return ['_startup_text_orgend = .;'] if (image, subsegment) == ('diabpsx', 'dtors') else []


def ld_lines(section):
    """Linker-script assignments that compute the same values inside the main image's link."""
    vram, _, _, ram_end = layout('diabpsx')
    retail = check()
    lines = ['    /* link-computed layout symbols (tools/link_symbols.py); OVERINFO.MIP and LNKOPT.MIP read them */',
             f'    LNK_OrgAddress = ADDR({section});',
             f'    _bss_objend = ALIGN(ADDR({section}) + SIZEOF({section}), {GROUP_ALIGN});']
    lines += [f'    {name} = 0x{value:X};   /* PSYLINK link option */' for name, value in LINK_OPTIONS.items()]
    ends = []
    for name in OVERLAYS:
        _, ov_end, _, _ = layout(name)
        lines += [f'    _{name}_text_org = _bss_objend;',
                  f'    _{name}_text_size = 0x{ov_end:X};   /* configs/{name}.yaml image extent */',
                  f'    _{name}_text_orgend = _{name}_text_org + _{name}_text_size;']
        ends.append(f'_{name}_text_orgend')
    expr = ends[0]
    for e in ends[1:]:
        expr = f'MAX({expr}, {e})'
    lines += [f'    __last_org = {expr};',
              '    FirstFreeByte = __last_org;',
              f'    __last_size = {LAST_SIZE};',
              '    __last_orgend = __last_org + __last_size;',
              '    _memcard_text_org = __last_orgend;',
              '    _memcard_text_size = 0;',
              f'    __lnk_ram_size = 0x{ram_end:X} - 0x{KSEG0:X};',
              f'    __lnk_free_mem_size = 0x{ram_end:X} - LNK_StackSize - FirstFreeByte;',
              '    /* startup_text / map_data overlay groups at one org; their org/orgend marks come from the subsegments */',
              '    _startup_text_obj = _startup_text_org;',
              '    _startup_text_objend = _startup_text_orgend;',
              '    _startup_text_size = _startup_text_orgend - _startup_text_org;',
              '    _map_data_obj = _map_data_org;',
              '    _map_data_objend = _map_data_orgend;',
              '    _map_data_size = _map_data_orgend - _map_data_org;',
              '    __MAP_data_obj = __MAP_data_org;',
              '    __MAP_data_objend = __MAP_data_orgend;',
              '    __MAP_data_size = __MAP_data_orgend - __MAP_data_org;']
    return lines


def ld_asserts():
    """Top-level ASSERTs (after SECTIONS) that the link-computed values equal the retail MAP records."""
    return [f'ASSERT({name} == 0x{value:X}, "link-computed {name} differs from rom/DIABPSX.MAP");'
            for name, value in check().items()]


if __name__ == '__main__':
    for name, value in compute().items():
        print(f'{value:08X}  {name}')
    check()
    print('retail MAP agrees')
