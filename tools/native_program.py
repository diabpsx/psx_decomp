#!/usr/bin/env python3
"""Build untouched native source objects for the whole-program PSYLINK lane.

Only compiler identity, ordinary compiler flags and preprocessing settings are
retained. No assembly rearrangement, binary section split, GP carrier or payload
extraction is performed. The inventory records remaining source dependencies;
successful compilation alone does not constitute a retail image or SYM seal.
"""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess

import build as B
import native_recon as R
import psyq_extract as P
import symlane as S
import sdk_link as SDK

OUT = B.BUILD / 'native_program'
IDENTITY_FLAGS = {'compiler', 'g_value', 'extra', 'cpp_extra'}


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def cache_matches(stamp, inputs, obj, assembly):
    """Fail closed on incomplete receipts or changed inputs/output artifacts."""
    try:
        receipt = json.loads(stamp.read_text())
        return (receipt['inputs'] == inputs
                and receipt['object_sha256'] == digest(obj)
                and receipt['assembly_sha256'] == digest(assembly))
    except (OSError, ValueError, KeyError, TypeError):
        return False


def archive_exports():
    """Inventory only the authentic archive members already selected by receipts."""
    registry = json.loads((B.ROOT / 'configs/sdk_link.json').read_text())
    receipt_path = B.BUILD / 'sdk/native/receipts.json'
    receipts = json.loads(receipt_path.read_text())
    hashes = {(row['sdk'], row['library']): row['archive_sha256'] for row in receipts}
    archives = {}
    definitions = {}
    selected = [(spec.get('sdk', SDK.DEFAULT_SDK), spec['library'], spec['member'])
                for spec in registry.values()]
    group_registry = json.loads((B.ROOT / 'configs/native_archive_link.json').read_text())
    for spec in group_registry.values():
        hashes[(spec['sdk'], spec['library'])] = spec['archive_sha256']
        selected.extend((spec['sdk'], spec['library'], member) for member in spec['members'])
    data_registry = json.loads((B.ROOT / 'configs/native_archive_data.json').read_text())
    for spec in data_registry.values():
        hashes[(spec['sdk'], spec['library'])] = spec['archive_sha256']
        selected.append((spec['sdk'], spec['library'], spec['member']))
    for sdk, library, name in sorted(set(selected)):
        key = sdk, library
        if key not in archives:
            raw = (SDK.ARCHIVE_ROOTS[sdk] / library).read_bytes()
            if hashlib.sha256(raw).hexdigest() != hashes.get(key):
                raise ValueError(f'{sdk}/{library}: archive provenance hash differs')
            members, consumed = P.lib_members(raw)
            if consumed != len(raw):
                raise ValueError(f'{library}: archive parse incomplete')
            archives[key] = {member['name']: member for member in members}
        member = archives[key].get(name)
        if member is None:
            raise ValueError(f'{library}/{name}: archive member missing')
        parsed = P.parse_obj_complete(member['data'])
        for row in parsed['xdefs']:
            definitions.setdefault(row['name'], []).append({
                'sdk': sdk, 'library': library, 'member': name,
                'archive_sha256': hashes[key]})
    return definitions


def checked_run(command, **kwargs):
    result = subprocess.run([str(value) for value in command], capture_output=True,
                            text=True, cwd=B.ROOT, **kwargs)
    if result.returncode:
        raise ValueError(result.stdout + result.stderr)
    return result


def compile_object(owner, spec, folder, reuse=False):
    source = (B.ROOT / spec['source']).resolve()
    source.relative_to(B.ROOT)
    folder.mkdir(parents=True, exist_ok=True)
    flags = B.per_tu_flags(source)
    g = str(flags.get('g_value', B.G_VALUE))
    version, assembler, dos, assembler_flags = R.source_assembler_options(spec)
    obj = folder / f'{owner}.obj'
    assembly = folder / f'{owner}.s'
    stamp = folder / f'{owner}.build.json'
    compiler = None
    preprocessed = None
    reused = False
    inputs = {
        'schema': 1, 'source': spec['source'], 'source_sha256': digest(source),
        'assembler': str(assembler), 'assembler_sha256': digest(assembler),
        'assembler_version': version, 'assembler_dos': dos,
        'assembler_flags': ['-q', '-g', *assembler_flags, f'-G{g}'],
    }
    if source.suffix.lower() == '.s':
        wanted = source.read_bytes().replace(b'\r\n', b'\n').replace(b'\n', b'\r\n')
        inputs['assembly_input_sha256'] = hashlib.sha256(wanted).hexdigest()
        reused = reuse and cache_matches(stamp, inputs, obj, assembly)
        assembly.write_bytes(wanted)
    else:
        is_cpp = source.suffix.lower() != '.c'
        preprocessed = folder / f'{owner}.i'
        checked_run([B.CPP, '-x', 'c', *(['-D__cplusplus=1'] if is_cpp else []),
                     *B.CPP_FLAGS, *flags.get('cpp_extra', []), source,
                     '-o', preprocessed])
        base = B.CC1PL_FLAGS if is_cpp else B.CC1_FLAGS
        compiler_flags = [f'-G{g}' if value == f'-G{B.G_VALUE}' else value
                          for value in base] + flags.get('extra', []) + ['-g']
        compiler, compiler_dos = S.compiler_lane(source, is_cpp)
        inputs.update({
            'preprocessed_sha256': digest(preprocessed),
            'compiler': str(compiler), 'compiler_sha256': digest(compiler),
            'compiler_dos': compiler_dos, 'compiler_flags': compiler_flags,
            'preprocessor_sha256': digest(B.CPP),
            'cpp_flags': [*B.CPP_FLAGS, *flags.get('cpp_extra', [])],
            'language': 'c++' if is_cpp else 'c',
        })
        reused = reuse and cache_matches(stamp, inputs, obj, assembly)
        if not reused:
            if compiler_dos:
                result = S.compile_dos_cc1(compiler, compiler_flags, preprocessed, assembly)
                if result.returncode:
                    raise ValueError(result.stdout + result.stderr)
            else:
                checked_run([compiler, *compiler_flags, preprocessed, '-o', assembly],
                            env=B._cc1_env())
            # Preserve every assembly token. ASPSX requires DOS line endings.
            assembly.write_bytes(assembly.read_bytes().replace(b'\r\n', b'\n')
                                 .replace(b'\n', b'\r\n'))
    if not reused:
        assembled = S.assemble_native(assembler, ['-q', '-g', *assembler_flags, f'-G{g}'],
                                      assembly, obj, dos)
        if assembled.returncode or not obj.is_file():
            raise ValueError(assembled.stdout + assembled.stderr)
    raw = obj.read_bytes()
    parsed = P.parse_obj_complete(raw)
    definitions = [row['name'] for row in parsed['xdefs']]
    if len(definitions) != len(set(definitions)):
        raise ValueError(f'{owner}: duplicate native exports')
    stamp.write_text(json.dumps({
        'inputs': inputs, 'object_sha256': digest(obj),
        'assembly_sha256': digest(assembly),
    }, indent=2) + '\n')
    return {
        'owner': owner, 'source': spec['source'],
        'image': spec['image'],
        'object': obj.relative_to(B.ROOT).as_posix(),
        'source_sha256': hashlib.sha256(source.read_bytes()).hexdigest(),
        'object_sha256': hashlib.sha256(raw).hexdigest(),
        'assembly_sha256': hashlib.sha256(assembly.read_bytes()).hexdigest(),
        'compiler_sha256': hashlib.sha256(compiler.read_bytes()).hexdigest() if compiler else None,
        'assembler_version': version,
        'assembler_sha256': hashlib.sha256(assembler.read_bytes()).hexdigest(),
        'compiler_settings': {key: value for key, value in flags.items()
                              if key in IDENTITY_FLAGS},
        'legacy_transforms_disabled': sorted(set(flags) - IDENTITY_FLAGS),
        'preprocessed_sha256': hashlib.sha256(preprocessed.read_bytes()).hexdigest()
                              if preprocessed else None,
        'sections': {parsed['sections'][index]: {
            'size': len(data), 'zero_storage': parsed['bss'].get(index, 0),
            'sha256': hashlib.sha256(data).hexdigest()}
            for index, data in parsed['code'].items()},
        'exports': sorted(definitions),
        'commons': {row['name']: {'section': parsed['sections'][row['sect']],
                                'size': row['bss']}
                    for row in parsed['xdefs'] if 'bss' in row},
        'references': sorted(set(parsed['xrefs'])),
        'retail_match_proven': False,
        'reused_after_build_identity': reused,
    }


def build(owners=None, reuse=False):
    registry = json.loads((B.ROOT / 'configs/native_recon_link.json').read_text())
    data_registry = json.loads((B.ROOT / 'configs/native_source_data.json').read_text())
    if set(registry) & set(data_registry):
        raise ValueError('duplicate function/data-only source owner')
    registry.update(data_registry)
    hand_registry = json.loads((B.ROOT / 'configs/native_hand_asm.json').read_text())
    for segment, spec in hand_registry.items():
        owner = 'hand_' + segment
        if owner in registry:
            raise ValueError('duplicate hand-assembly source owner')
        registry[owner] = {'source': spec['source'], 'image': spec['image'],
                           'assembler': spec['assembler']}
    # The conventional source TU must also be a direct native linker input.
    conventional = json.loads((B.ROOT / 'configs/recon_link.json').read_text())
    for owner, source in conventional.items():
        if owner in registry:
            raise ValueError(f'{owner}: duplicate source owner')
        registry[owner] = {'source': source, 'image': 'diabpsx', 'assembler': '2.67'}
    selected = list(registry) if owners is None else owners
    if len(selected) != len(set(selected)) or set(selected) - set(registry):
        raise ValueError('unknown or duplicate native program source owner')
    objects = []
    for owner in selected:
        row = compile_object(owner, registry[owner], OUT / 'objects', reuse=reuse)
        objects.append(row)
        print(f'{owner}: untouched native object; {len(row["exports"])} exports; '
              f'{len(row["legacy_transforms_disabled"])} legacy assembly transformations disabled',
              flush=True)
    definitions = {name for row in objects for name in row['exports']}
    unresolved = sorted({name for row in objects for name in row['references']} - definitions)
    archive_definitions = archive_exports()
    source_missing = [name for name in unresolved if name not in archive_definitions]
    report = {'scope': 'complete' if owners is None else 'selected owners only',
              'objects': objects,
              'unresolved_source_references': unresolved,
              'verified_archive_candidates': {name: archive_definitions[name]
                                              for name in unresolved if name in archive_definitions},
              'missing_source_definitions': {
                  name: [row['owner'] for row in objects if name in row['references']]
                  for name in source_missing},
              'original_archives_linked': False,
              'retail_image_match_proven': False}
    OUT.mkdir(parents=True, exist_ok=True)
    name = 'inventory.json' if owners is None else 'selected_inventory.json'
    (OUT / name).write_text(json.dumps(report, indent=2) + '\n')
    return report


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--reuse', action='store_true',
                        help='reuse only with identical inputs, tools, flags and output hashes')
    parser.add_argument('owners', nargs='*')
    args = parser.parse_args()
    build(args.owners or None, reuse=args.reuse)
