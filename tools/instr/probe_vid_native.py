#!/usr/bin/env python3
"""Verify VID's two original code regions with source-emitted section placement.

Diagnostic only: does not select VID for final linkage or modify live source.
"""
from pathlib import Path
import hashlib
import json
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT/'tools'))
import symlane as S
import native_recon as R
import sdk_link as N
import return_type_audit as T


def main():
    out = ROOT/'build/vid_native_probe'
    out.mkdir(parents=True, exist_ok=True)
    live = ROOT/'recon/psxsrc/vid.cpp'
    source = live.read_text()
    marker = 'void InitScreens(void);'
    declarations = (
        'void InitScreens(void) __attribute__((section(".STARTUP_text")));\n'
        'void VID_OpenModule(void) __attribute__((section(".STARTUP_text")));')
    if source.count(marker) == 1:
        source = source.replace(marker, declarations)
    elif source.count(declarations) != 1:
        raise ValueError('unexpected VID declaration layout')
    diagnostic = out/'vid.cpp'
    diagnostic.write_text(source)
    obj = S.compile_g(diagnostic)
    raw = obj.read_bytes()
    retail = (ROOT/'rom/DIABPSX.BIN').read_bytes()
    regions = {'.text': (0x80084030, 1012), '.text.vid_startup': (0x800B0320, 432),
               '.rdata': (0x8010FFE0, 16), '.sdata': (0x8011AAC8, 4),
               '.sbss': (0x8011C628, 20), '.bss': (0x8011CAE0, 224)}
    prefix, combined, mode = R.gp_carrier_plan(regions, retail, 0x8011A780, 0x8011C604)
    prefix_source = out/'prefix.s'
    prefix_source.write_bytes(('.sdata\r\n' + ''.join(
        '.byte '+','.join(str(b) for b in prefix[i:i+16])+'\r\n' for i in range(0,len(prefix),16))).encode())
    prefix_obj = out/'prefix.obj'
    subprocess.run([str(S.ASPSX), '-q', '-o', str(prefix_obj), str(prefix_source)], env=S.ENV, check=True)
    names = ['ClearKanjiCount__Fv', 'DBG_Error', 'GPUQ_InitModule__Fv', 'InitGeom',
             'PRIM_Flush__Fv', 'PRIM_GetCurrentScreen__Fv', 'PRIM_Open__FiiiP10SCREEN_ENVUl',
             'ReloadGP', 'ResetGraph', 'SetDefDispEnv', 'SetDefDrawEnv', 'SetDispMask',
             'SetDrawEnv', 'SetGP', 'SetGraphDebug', 'SetVideoMode', 'VSync', 'VSyncCallback']
    bindings = R.resolve_bindings(names, (ROOT/'configs/symbol_addrs.txt').read_text())
    bindings['_gp'] = 0x8011A780
    blocks, map_text = N.native_link('vid', raw, combined, bindings, prefix_objects=[prefix_obj], output_dir=out)
    for section, data in blocks.items():
        va = combined[section][0]
        expected = bytes(len(data)) if section in ('.bss', '.sbss') else retail[va-0x80010000:va-0x80010000+len(data)]
        if data != expected:
            raise ValueError('native VID bytes differ: '+section)
    run = subprocess.run([str(S.DUMPSYM), str(out/'vid.sym')],capture_output=True,text=True,check=True)
    (out/'vid.sym.txt').write_text(run.stdout)
    actual = S.functions(run.stdout)
    retail_text = S.RETAIL.read_text(encoding='latin-1')
    expected = S.functions(retail_text, every=True)
    declarations, retail_declarations = T.declarations(run.stdout), T.declarations(retail_text)
    functions = {p.stem: 'vid' for p in (ROOT/'asm/nonmatchings/vid').glob('*.s')}
    functions.update({'VID_OpenModule__Fv': 'startup', 'InitScreens__Fv': 'startup'})
    if set(actual) != set(functions):
        raise ValueError('VID function set differs')
    for name, segment in functions.items():
        va = S.oracle_va(segment, name)
        target, = [f for f in expected[name] if f['start'] == va]
        ok, reason = S.compare(actual[name], target)
        type_ok, why = T.compare(declarations.get(name,set()), retail_declarations.get(name,set()))
        if actual[name]['start'] != va or not ok or not type_ok:
            raise ValueError(name+': placement/SYM/type differs '+reason+' '+why)
    globals = ['VidWait','VbFunc','VidTick','VXOff','VYOff','DBufferFlag','screen']
    for name in globals:
        ours, wanted = R.data_records(run.stdout,name), R.data_records(retail_text,name)
        if len(ours) != 1 or ours != wanted:
            raise ValueError(name+': global SYM differs')
    receipt = {'diagnostic_only': True, 'functions': len(functions), 'globals': globals,
               'source_sha256': hashlib.sha256(live.read_bytes()).hexdigest(),
               'diagnostic_sha256': hashlib.sha256(diagnostic.read_bytes()).hexdigest(),
               'object_sha256': hashlib.sha256(raw).hexdigest(), 'sections': regions,
               'scaffold_gp_prefix_bytes': len(prefix)}
    (out/'receipt.json').write_text(json.dumps(receipt,indent=2)+'\n')
    print('VID: all six section payloads, 13 function placements/SYM/return types, and seven globals match retail')


if __name__ == '__main__':
    main()
