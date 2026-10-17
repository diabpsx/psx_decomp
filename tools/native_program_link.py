#!/usr/bin/env python3
"""Whole-program PSYLINK link of all five retail images from the native objects and the original archives.

One PSYLINK 2.52 run, driven by a link script in the retail shape (rom/DIABPSX.MAP): the group order, the
per-object section declarations in MAP order, the game objects included in the retail include order, the Sony
archives and the Climax GLIB/EACLIB archive resolved by PSYLINK's own library search, the four LUMP overlays as
OVER groups.  The CPE PSYLINK writes is split into the five images by group and compared with the retail files.

    python tools/native_program_link.py [--reuse] [--no-link]
"""
import argparse
import hashlib
import json
import re
import shutil
import subprocess
import sys
from pathlib import Path
from unittest.mock import patch

import build as B
import link_symbols as LS
import native_recon as R
import psyq_extract as P
import sdk_link as SDK
import symlane as S

OUT = B.BUILD / 'native_program' / 'link'
OBJ = OUT / 'obj'
SDK_ROOT = SDK.ARCHIVE_ROOTS['4.1']
# PsyQ 4.1's PSYLINK 2.60: every overlay group file is written at the group's own extent (2.52 pads the last
# declared OVER group's file to the overlay set's end plus the following group, which retail's FMV.BIN is not)
PSYLINK = Path('C:/Temp/PSYQ/psyq-410/PSSN/PSYLINK.EXE')
# PsyQ 4.0's SYMMUNGE (DOS extender build, run under DOSBox): merges contiguous SLD blocks like the retail SYM
SYMMUNGE_DOS = Path('C:/Temp/PSYQ/psyq-400-DTL-S2002/PSSN/BIN/SYMMUNGE.EXE')
# retail library search order (the pull sequence of rom/DIABPSX.MAP's plain .text: LIBSN first, LIBGTE last)
SDK_LIBRARIES = ['LIBSN.LIB', 'LIBAPI.LIB', 'LIBETC.LIB', 'LIBGPU.LIB', 'LIBSPU.LIB', 'LIBC.LIB', 'LIBCARD.LIB',
                 'LIBCD.LIB', 'LIBTAP.LIB', 'LIBGTE.LIB']
# Climax GLIB + EA EACLIB members in the retail pull order (plain .text/.data/.sdata sequence of the MAP);
# PSYLINK pulls demanded members in archive order, so this order reproduces the retail placement.
GLIB_MEMBERS = ['tasker', 'tick', 'gutils', 'gmain', 'gdebug', 'gtimsys', 'gsys', 'gal', 'ddx',
                'eac_async', 'abortmsg', 'vrip', 'print', 'blockio', 'cdrom', 'eac_fileio', 'filesize', 'filexist',
                'iocoord', 'loadcall', 'callback', 'crc', 'loadfat', 'seekmsec', 'cache', 'memman', 'compact',
                'resize', 'validmem', 'blkfill', 'blkmov', 'getm', 'textcrnt', 'cdstream', 'filename', 'stricmp',
                'exit', 'lock', 'systask', 'vars', 'getcycle', 'addtimer', 'inittmr', 'savegp', 'timer',
                'gsysasm', 'hand_header_code']
LINK_EQUATES = dict(LS.LINK_OPTIONS)   # the retail link's `equ` symbols (rom/DIABPSX.MAP)
IMAGES = {'diabpsx': 'DIABPSX.BIN', 'frontend': 'FRONTEND.BIN', 'pregame': 'PREGAME.BIN', 'game': 'GAME.BIN',
          'fmv': 'FMV.BIN'}
OVERLAY_GROUPS = ['frontend_text', 'pregame_text', 'game_text', 'fmv_text']
# hand-assembled members whose retail section name differs from the reconstruction's GNU-lane spelling
SECTION_SPELLINGS = {'recon/eaclib/nullfunc.s': {'.text': 'code'},
                     'recon/psxsrc/map.s': {'.data': '.MAP_data'}}


def digest(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def owners():
    """owner -> spec for every native source object (function members, data-only members, hand assembly, MAP)."""
    registry = json.loads((B.ROOT / 'configs/native_recon_link.json').read_text())
    data = json.loads((B.ROOT / 'configs/native_source_data.json').read_text())
    hand = json.loads((B.ROOT / 'configs/native_hand_asm.json').read_text())
    if set(registry) & set(data):
        raise ValueError('duplicate function/data-only source owner')
    specs = dict(registry)
    specs.update(data)
    for segment, spec in hand.items():
        owner = 'hand_' + segment
        if owner in specs:
            raise ValueError('duplicate hand-assembly owner')
        specs[owner] = {'source': spec['source'], 'image': spec['image'], 'assembler': spec['assembler']}
    specs['map'] = {'source': LS.MAP_MEMBER, 'image': 'diabpsx', 'assembler': '2.56'}
    specs['gsysasm'] = {'source': 'recon/glibdev/source/psx/gsysasm.s', 'image': 'diabpsx', 'assembler': '2.56'}
    return specs


def object_name(owner, spec):
    return S.retail_object_name(B.ROOT / spec['source'])


def stripped_library_object(source):
    """EA's EACLIB came as prebuilt objects without debug records: the retail SYM has no function, SLD or type
    records for any of its C members (its hand-assembled members carry SLD lines), so the whole-program lane
    builds those C objects without -g."""
    relative = Path(source).resolve().relative_to(B.ROOT.resolve())
    return relative.parts[:2] == ('recon', 'eaclib') and relative.suffix.lower() == '.c'


def compile_owner(owner, spec, reuse):
    """The member's native object under its retail object name (the gate's compiler/assembler lane, no carriers)."""
    source = B.ROOT / spec['source']
    name = object_name(owner, spec)
    target = OBJ / f'{name}.OBJ'
    stamp = OBJ / f'{name}.json'
    flags = B.per_tu_flags(source)
    version, assembler, dos, assembler_flags = R.source_assembler_options(spec)
    work = OUT / 'work'
    work.mkdir(parents=True, exist_ok=True)
    debug = not stripped_library_object(source)
    inputs = {'source': spec['source'], 'source_sha256': digest(source), 'flags': flags,
              'assembler': version, 'assembler_sha256': digest(assembler), 'debug': debug,
              'spellings': SECTION_SPELLINGS.get(spec['source'], {}), 'assembly_rules': 6}
    if source.suffix.lower() != '.s':
        # headers are inputs too: key the cache on the preprocessed text
        is_cpp = source.suffix.lower() != '.c'
        preprocessed = work / f'{name}.key.i'
        run = subprocess.run([str(B.CPP), '-x', 'c', *(['-D__cplusplus=1'] if is_cpp else []), *B.CPP_FLAGS,
                              *flags.get('cpp_extra', []), str(source), '-o', str(preprocessed)],
                             capture_output=True, text=True, cwd=B.ROOT)
        if run.returncode:
            raise ValueError(f'{owner}: preprocessing failed: ' + run.stderr)
        inputs['preprocessed_sha256'] = digest(preprocessed)
    if reuse and stamp.is_file() and target.is_file():
        try:
            receipt = json.loads(stamp.read_text())
            if receipt['inputs'] == inputs and receipt['object_sha256'] == digest(target):
                return target, True
        except (ValueError, KeyError):
            pass
    spellings = SECTION_SPELLINGS.get(spec['source'])
    if source.suffix.lower() == '.s':
        # the retail section name of a hand-assembled member: the GNU-lane source spells `.text.lib` (the GNU
        # link's library-text placement) or a generic name; retail's objects are plain `.text` / `code` / ...
        text = source.read_text()
        text = re.sub(r'^[ \t]*\.section[ \t]+\.text\.\w+[^\n]*$', '\t.text', text, flags=re.M)
        for generic, retail in (spellings or {}).items():
            text = re.sub(r'^[ \t]*' + re.escape(generic) + r'[ \t]*$', f'\t.section {retail}', text, flags=re.M)
        source = work / source.name
        source.write_text(text)
    with patch.object(S, 'OUT', work):
        if source.suffix.lower() == '.s':
            # assemble the work copy with the original member's -G (per-TU flags are keyed by the repository path)
            g = str(flags.get('g_value', B.G_VALUE))
            obj = work / f'{name}.g.obj'
            assembly = work / f'{name}.g.s'
            assembly.write_bytes(source.read_bytes().replace(b'\r\n', b'\n').replace(b'\n', b'\r\n'))
            run = S.assemble_native(assembler, ['-q', '-g', *assembler_flags, f'-G{g}'], assembly, obj, dos)
            if run.returncode or not obj.is_file():
                raise ValueError(f'{owner}: native assembly failed: ' + run.stdout + run.stderr)
        else:
            # retail's library objects are plain `.text`; `.text.lib` only exists for the GNU image lane
            obj = R.compile_source(source, assembler, dos, assembler_flags, plain_library_text=True,
                                   sn_spellings=True, debug=debug)
    raw = obj.read_bytes()
    if raw[:4] != b'LNK\x02':
        raise ValueError(f'{owner}: not a native LNK object')
    OBJ.mkdir(parents=True, exist_ok=True)
    target.write_bytes(raw)
    stamp.write_text(json.dumps({'inputs': inputs, 'object_sha256': digest(target)}, indent=2) + '\n')
    return target, False


def shared_section_chains(specs):
    """For every object section that several included objects feed (`.sdata`, `.sbss`, `.bss`, `.ctors`,
    `.STARTUP_text`, the hand-assembled objects' plain `.text`/`.data`/`.rdata`, ...): its contributors in
    retail address order (the registry rows' retail addresses), i.e. the order PSYLINK concatenated them in."""
    library = set(GLIB_MEMBERS)
    homes = {}
    for owner, spec in specs.items():
        if owner in library:
            continue
        names = R.object_section_names(spec) if spec.get('sections') else {}
        rows = spec.get('sections') or ({spec['section']: spec} if spec.get('section') else {})
        for section, row in rows.items():
            if not isinstance(row, dict) or 'va' not in row:
                continue
            name = row.get('source_section') or names.get(section)
            if name is None:
                name = '.text' if re.fullmatch(r'\.text\.\w+', section) else section
            name = SECTION_SPELLINGS.get(spec['source'], {}).get(name, name)
            homes.setdefault(name, []).append((int(row['va'], 16), owner))
    chains = {}
    for name, rows in homes.items():
        owners = []
        for va, owner in sorted(rows):
            if owner not in owners:
                owners.append(owner)
        if len(owners) > 1:
            chains[name] = owners
    return chains


def lane(spec):
    """The retail source tree an object came from (its include lane): PSXSRC, SOURCE, or the EA library tree."""
    return Path(spec['source']).parts[1]


def include_order(specs):
    """The retail include order, from two retail facts.  (1) The concatenation order of every shared object
    section (shared_section_chains): PSXSRC's objects precede SOURCE's in all of them, and within a lane the
    order is the lane's retail section-declaration order (rom/DIABPSX.MAP), the makefile's object list.
    (2) Objects that feed no shared section (PCIO, DATIO, LZNP, PAK, ITEMDAT, TESTCODE, STORM, the overlay
    markers) take their place in that same per-lane section order: that is where the retail SYM needs them,
    because SYMMUNGE drops function records that arrive in a high->low->high address sequence, and PSYLINK
    writes an object's SYM records at its include position (library members after every include).
    BOOT (the entry object) comes first; hand-assembled objects and data-only objects without a declared text
    section lead their lane, ordered only by their chains."""
    import heapq
    library = set(GLIB_MEMBERS)
    declared = [section for _, section in section_declarations()]
    position = {section: index for index, section in enumerate(declared)}
    lanes = []
    for owner, spec in specs.items():
        if owner not in library and lane(spec) not in lanes:
            lanes.append(lane(spec))
    chains = shared_section_chains(specs)
    # the lane order is the shared sections' verdict: the lane of the first contributor comes first
    first = {}
    for owners in chains.values():
        for index, owner in enumerate(owners):
            first.setdefault(lane(specs[owner]), index)
    lanes.sort(key=lambda name: first.get(name, len(specs)))

    def key(owner):
        spec = specs[owner]
        if owner == 'hand_boot_text':
            return (-1, 0, 0)
        text = f'.{object_name(owner, spec)}_text'
        return (lanes.index(lane(spec)), 0 if text in position else -1, position.get(text, 0))

    successors = {owner: [] for owner in specs if owner not in library}
    pending = {owner: 0 for owner in successors}
    for owners in chains.values():
        for before, after in zip(owners, owners[1:]):
            successors[before].append(after)
            pending[after] += 1
    ready = [(key(owner), owner) for owner, count in pending.items() if count == 0]
    heapq.heapify(ready)
    order = []
    while ready:
        _, owner = heapq.heappop(ready)
        order.append(owner)
        for after in successors[owner]:
            pending[after] -= 1
            if pending[after] == 0:
                heapq.heappush(ready, (key(after), after))
    if len(order) != len(successors):
        raise ValueError('shared-section chains contradict each other: ' + ', '.join(sorted(set(successors) - set(order))))
    return order


def retail_groups():
    """[(group, org, orgend)] of the retail link in declaration order (rom/DIABPSX.MAP `_<group>_org` symbols)."""
    text = (B.ROOT / 'rom/DIABPSX.MAP').read_text(encoding='latin-1').split('Names in address order')[-1]
    values = {n: int(a, 16) for a, n in re.findall(r'^ ([0-9A-F]{8})  (\S+)$', text, re.M)}
    groups = ['boot_text', 'text', 'startup_text', 'map_data', 'data', 'rdata', 'sdata', 'sbss', 'bss'] + OVERLAY_GROUPS
    return [(g, values[f'_{g}_org'], values[f'_{g}_orgend']) for g in groups], values


def section_declarations(available=None):
    """[(group, section)] in retail declaration order: every section the retail link declared, read from the
    `__<section>_org` symbols (the MAP group table lists only the non-empty ones; an empty section still gets its
    group position, e.g. OBJDAT's `.OBJDAT_text` at .OBJECTS_text's start, declared ahead of it).  Sections of
    objects we do not link (the ~370 empty asset objects) are left out when `available` names the sections our
    objects carry.  An overlay module's text section belongs to its image's group (the four LUMP groups share
    one address range)."""
    groups, values = retail_groups()
    overlay_of = {}
    for cfg in ('configs/native_recon_link.json', 'configs/native_source_data.json'):
        for spec in json.loads((B.ROOT / cfg).read_text()).values():
            image = spec.get('image', 'diabpsx')
            if image != 'diabpsx':
                overlay_of[S.retail_object_name(B.ROOT / spec['source'])] = f'{image}_text'
    stems = sorted({n[2:-4] for n in values if n.startswith('__') and n.endswith('_org')})
    out = []
    for stem in stems:
        section = '.' + stem
        if available is not None and section not in available:
            continue
        org = values[f'__{stem}_org']
        empty = 0 if values.get(f'__{stem}_size') else 1
        if stem == 'boot_text':
            out.append((org, empty, 'boot_text', section)); continue
        if stem == 'last':
            out.append((org, empty, 'last', section)); continue
        if section == '.MAP_data':
            out.append((org, empty, 'map_data', section)); continue
        if stem in ('ctors', 'dtors'):
            out.append((org, empty, 'startup_text', section)); continue
        if stem.endswith('_text') and stem[:-5] in overlay_of:
            out.append((org, empty, overlay_of[stem[:-5]], section)); continue
        home = None
        for g, lo, hi in groups:
            if lo <= org < hi:
                home = g; break
            if org == hi and g not in ('startup_text', 'map_data'):
                home = g
        if home in OVERLAY_GROUPS:
            # a data-only overlay module's empty text section: the LUMP group whose declared section starts
            # there (MONSTDAT at INV's start) or whose extent ends there (PREITEM at PREMSG's end)
            starts = {(row['group'], row['start']) for row in json.loads((B.ROOT / 'configs/sections.json').read_text())}
            home = next((g for g, lo, hi in groups if g in OVERLAY_GROUPS and (g, org) in starts), None) \
                or next((g for g, lo, hi in groups if g in OVERLAY_GROUPS and org == hi), None)
        if home is None:
            continue
        if home in ('sdata', 'sbss', 'bss') and stem != home:
            continue
        out.append((org, empty, home, section))
    # LIBPRESS's members land in the FMV overlay group under the archive prefix (`inclib ...,libpress`)
    for name in ('libpress.rdata', 'libpress.data', 'libpress.text'):
        out.append((values[f'_{name.replace(".", "_")}_org'], 0, 'fmv_text', name))
    # declaration order: by position; an empty section ahead of the non-empty one that starts where it sits
    out.sort(key=lambda row: (row[0], -row[1], row[3]))
    return [(g, s) for _, _, g, s in out]


def write_script(specs, order, available=None):
    declared = section_declarations(available)
    by_group = {}
    for group, section in declared:
        by_group.setdefault(group, []).append(section)
    lines = ['\torg\t$80010000']
    def group(name, options=''):
        lines.append(f'{name}\tgroup' + (f'\t{options}' if options else ''))
        for section in by_group.get(name, []):
            lines.append(f'\tsection\t{section},{name}')
    group('boot_text')
    group('text')
    group('startup_text')
    group('map_data', 'over(startup_text)')
    group('data')
    group('rdata')
    group('sdata')
    group('sbss', 'bss')
    group('bss', 'bss')
    group('frontend_text', f'file("{IMAGES["frontend"]}")')
    for name in OVERLAY_GROUPS[1:]:
        group(name, f'over(frontend_text),file("{IMAGES[name.split("_")[0]]}")')
    group('memend')
    group('last')
    group('memcard_text')
    for name, value in LINK_EQUATES.items():
        lines.append(f'{name}\tequ\t${value:X}')
    for owner in order:
        lines.append(f'\tinclude\tobj\\{object_name(owner, specs[owner])}.OBJ')
    for library in SDK_LIBRARIES:
        lines.append(f'\tinclib\t"{SDK_ROOT / library}"')
    # LIBPRESS ahead of the Climax/EA archive: retail's undeclared empty libpress sections read 0x80010000,
    # i.e. they were evaluated before NULLFUNC's `code` section reached the default group
    lines.append(f'\tinclib\t"{SDK_ROOT / "LIBPRESS.LIB"}",libpress')
    lines.append('\tinclib\tGLIB.LIB')
    script = OUT / 'diabpsx.lnk'
    script.write_bytes(('\r\n'.join(lines) + '\r\n').encode('ascii'))
    return script


def build_glib(specs):
    """GLIB.LIB: the Climax GLIB + EACLIB objects as one PSYLIB archive in the retail pull order.
    PSYLIB 2.07 takes 8.3 member names (it hangs on longer ones), so the staged copies are truncated."""
    library = OUT / 'GLIB.LIB'
    staging = OUT / 'glib'
    if staging.exists():
        shutil.rmtree(staging)
    staging.mkdir(parents=True)
    members, used = [], set()
    for owner in GLIB_MEMBERS:
        name = object_name(owner, specs[owner])[:8]
        if name in used:
            raise ValueError(f'{owner}: ambiguous 8.3 library member name')
        used.add(name)
        shutil.copyfile(OBJ / f'{object_name(owner, specs[owner])}.OBJ', staging / f'{name}.OBJ')
        members.append(f'{name}.OBJ')
    for start in range(0, len(members), 8):
        run = subprocess.run([str(S.PSYQ / 'PSYLIB.EXE'), '/a', 'GLIB.LIB', *members[start:start + 8]],
                             capture_output=True, text=True, cwd=staging, env=S.ENV, timeout=60)
        if run.returncode or not (staging / 'GLIB.LIB').is_file():
            raise ValueError('PSYLIB failed: ' + run.stdout + run.stderr)
    shutil.copyfile(staging / 'GLIB.LIB', library)
    return library


def run_psylink():
    """PSYLINK as retail ran it: /v writes the overlay id words, /p writes the main image as a pure binary
    (the LUMP overlays go to their own files), /n raises the module limit above the default."""
    for name in IMAGES.values():
        if (OUT / name).exists():
            (OUT / name).unlink()
    run = subprocess.run([str(PSYLINK), '/c', '/m', '/v', '/p', '/n600',
                          f'@diabpsx.lnk,{IMAGES["diabpsx"]},diabpsx.sym,diabpsx.map'],
                         capture_output=True, text=True, cwd=OUT, env=S.ENV)
    (OUT / 'psylink.log').write_text(run.stdout + run.stderr)
    return run


def compare():
    """The five link outputs against the retail files; the main image takes Climax's additive checksum trailer."""
    from image_trailer import encode, map_extents
    report = {}
    for name, filename in IMAGES.items():
        retail = (B.ROOT / 'rom' / filename).read_bytes()
        ours = (OUT / filename).read_bytes()
        if name == 'diabpsx':
            payload_size, _ = map_extents((B.ROOT / 'rom/DIABPSX.MAP').read_text(encoding='latin-1'))
            ours = encode(ours[:payload_size]) if len(ours) >= payload_size else ours
            (OUT / 'DIABPSX.BIN.checksummed').write_bytes(ours)
        n = min(len(ours), len(retail))
        diffs = [i for i in range(n) if ours[i] != retail[i]]
        report[name] = {'size': len(ours), 'retail_size': len(retail),
                        'differing_bytes': len(diffs) + abs(len(ours) - len(retail)),
                        'first_diff': f'0x{diffs[0]:X}' if diffs else None,
                        'identical': not diffs and len(ours) == len(retail)}
        print(f'{name}: {len(ours)} bytes, retail {len(retail)}, {report[name]["differing_bytes"]} differing'
              + (f', first at file offset {report[name]["first_diff"]}' if diffs else ''))
    return report


def munge_dos(raw, munged):
    """SYMMUNGE /i with the PsyQ 4.0 DOS build under DOSBox (symlane.compile_dos_cc1's harness).  The DOS
    builds of PsyQ 4.0-4.4 are one program; the 1.56 Win32 build (PsyQ 4.5+) keeps every object's End-SLD
    record, the 4.0 one merges contiguous SLD blocks as the retail SYM shows."""
    import tempfile
    with tempfile.TemporaryDirectory(prefix='symmunge-', dir=OUT) as directory:
        work = Path(directory)
        shutil.copyfile(SYMMUNGE_DOS, work / 'SYMMUNGE.EXE')
        shutil.copyfile(raw, work / 'RAW.SYM')
        run = subprocess.run([str(S.DOSBOX), '--noprimaryconf', '--nolocalconf', '--noautoexec',
                              '--set', 'output=texture', '--set', 'texture_renderer=software',
                              '--set', 'mididevice=none', '--set', 'cpu_cycles=max',
                              '-c', 'mount c ' + str(work), '-c', 'c:',
                              '-c', 'symmunge /i RAW.SYM OUT.SYM > SM.LOG', '-c', 'exit'],
                             capture_output=True, text=True, cwd=work,
                             env=dict(S.ENV, SDL_VIDEODRIVER='dummy', SDL_AUDIODRIVER='dummy'),
                             timeout=900, creationflags=getattr(subprocess, 'CREATE_NO_WINDOW', 0))
        log = (work / 'SM.LOG').read_text(encoding='latin-1', errors='replace') if (work / 'SM.LOG').is_file() else ''
        if run.returncode or not (work / 'OUT.SYM').is_file() or 'compacted OK' not in log:
            raise ValueError('SYMMUNGE failed: ' + run.stdout + run.stderr + log[-2000:])
        shutil.copyfile(work / 'OUT.SYM', munged)
    return log


def check_sym():
    """SYMMUNGE /i the link's SYM as retail did and count what survives: every function record must (SYMMUNGE
    silently drops records that arrive out of address order, see include_order), and the End-SLD count tells
    how many SLD runs stayed separate (retail: 6)."""
    raw, munged = OUT / 'diabpsx.sym', OUT / 'diabpsx.munged.sym'
    log = munge_dos(raw, munged)
    (OUT / 'symmunge.log').write_text(log)
    run = subprocess.CompletedProcess([], 0, log, '')
    counts = {}
    for name, path in (('raw', raw), ('munged', munged)):
        dump = subprocess.run([str(S.DUMPSYM), str(path)], capture_output=True, text=True, env=S.ENV,
                              encoding='latin-1')
        path.with_suffix('.sym.txt').write_text(dump.stdout, encoding='latin-1')
        counts[name] = {kind: sum(1 for line in dump.stdout.splitlines() if re.match(r'^[0-9a-f]+: \$[0-9a-f]{8} ' + kind + ' ', line))
                        for kind in ('8c', '8a', '88', '2')}
    counts['struct_warnings'] = run.stdout.count('non-matching definitions')
    counts['compacted'] = 'compacted OK' in run.stdout
    print('SYM: raw functions', counts['raw']['8c'], 'munged', counts['munged']['8c'],
          'End-SLD records', counts['munged']['8a'], 'struct warnings', counts['struct_warnings'])
    return counts


def compare_map(map_text):
    """Group table rows that differ from the retail MAP, and symbol address disagreements."""
    retail = (B.ROOT / 'rom/DIABPSX.MAP').read_text(encoding='latin-1')
    row = re.compile(r'^ ([0-9A-F]{8}) ([0-9A-F]{8}) ([0-9A-F]{8}) ([0-9A-F]{8}) (\S+)\s+(\S+)\s*$', re.M)
    ours = [(m[5], m[6], int(m[1], 16), int(m[3], 16)) for m in row.finditer(map_text.split('Program entry')[0])]
    theirs = [(m[5], m[6], int(m[1], 16), int(m[3], 16)) for m in row.finditer(retail.split('Program entry')[0])]
    their_index = {(g, s): (a, n) for g, s, a, n in theirs}
    our_index = {(g, s): (a, n) for g, s, a, n in ours}
    table = []
    for key in sorted(set(their_index) | set(our_index)):
        if their_index.get(key) != our_index.get(key):
            table.append((key, their_index.get(key), our_index.get(key)))
    sym = re.compile(r'^ ([0-9A-F]{8})  (\S+)$', re.M)
    def symbols(text):
        part = text.split('Names in address order')[-1]
        return {name: int(value, 16) for value, name in sym.findall(part)}
    ours_syms, their_syms = symbols(map_text), symbols(retail)
    differing = {n: (their_syms[n], ours_syms[n]) for n in their_syms if n in ours_syms and their_syms[n] != ours_syms[n]}
    missing = sorted(n for n in their_syms if n not in ours_syms)
    extra = sorted(n for n in ours_syms if n not in their_syms)
    print(f'MAP group table: {len(table)} rows differ of {len(their_index)}; symbols: {len(their_syms)} retail, '
          f'{len(differing)} differ, {len(missing)} missing, {len(extra)} extra')
    for key, a, b in table[:40]:
        print(f'   {key[0]:14s} {key[1]:24s} retail={a} ours={b}')
    return {'group_rows_differ': [(list(k), a, b) for k, a, b in table], 'symbols_differ': differing,
            'symbols_missing': missing, 'symbols_extra': extra}


def build(reuse=False, link=True):
    specs = owners()
    OBJ.mkdir(parents=True, exist_ok=True)
    reused = 0
    for owner, spec in specs.items():
        _, hit = compile_owner(owner, spec, reuse)
        reused += hit
        print(f'{owner}: {object_name(owner, spec)}.OBJ' + (' (reused)' if hit else ''), flush=True)
    print(f'{len(specs)} objects, {reused} reused')
    order = include_order(specs)
    build_glib(specs)
    available = set()
    for owner, spec in specs.items():
        parsed = P.parse_obj_complete((OBJ / f'{object_name(owner, spec)}.OBJ').read_bytes())
        available.update(parsed['sections'].values())
    available.update({'libpress.rdata', 'libpress.data', 'libpress.text'})
    write_script(specs, order, available)
    if not link:
        return None
    run = run_psylink()
    if run.returncode or '0 error(s)' not in run.stdout:
        print(run.stdout[-3000:] + run.stderr[-1000:])
        raise ValueError('PSYLINK failed')
    map_text = (OUT / 'diabpsx.map').read_text(encoding='latin-1')
    report = {'images': compare(), 'map': compare_map(map_text), 'sym': check_sym()}
    (OUT / 'report.json').write_text(json.dumps(report, indent=2) + '\n')
    return report


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--reuse', action='store_true')
    parser.add_argument('--no-link', action='store_true')
    args = parser.parse_args()
    build(reuse=args.reuse, link=not args.no_link)
