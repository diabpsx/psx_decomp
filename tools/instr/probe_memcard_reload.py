#!/usr/bin/env python3
"""Diagnostic qualifier probes; never modifies reconstruction or gate settings.

A match here is causal evidence only, not permission to introduce volatile.
"""
import json
from pathlib import Path
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[2]


def main():
    source = (ROOT / 'recon/psxsrc/options.cpp').read_text()
    header = (ROOT / 'recon/psxsrc/options.h').read_text()
    cases = {
        'baseline': None,
        'volatile_blocks': ('extern int save_blocks;', 'extern volatile int save_blocks;'),
        'volatile_blocks_store_order': ('extern int save_blocks;', 'extern volatile int save_blocks;'),
        'volatile_destination': ('extern char *Savefilename;', 'extern char * volatile Savefilename;'),
        'volatile_filename': ('extern char *DiabloGameFile;', 'extern char * volatile DiabloGameFile;'),
    }
    results = {}
    for name, replacement in cases.items():
        text = header
        if replacement:
            old, new = replacement
            if text.count(old) != 1:
                raise ValueError('ambiguous probe declaration')
            text = text.replace(old, new)
        target = ROOT / 'build/memcard_reload_probe' / name / 'options.cpp'
        target.parent.mkdir(parents=True, exist_ok=True)
        body = source
        if name == 'volatile_blocks_store_order':
            old = 'Savefilename = DiabloOptionFile;\n        save_blocks = 1;'
            if body.count(old) != 1:
                raise ValueError('ambiguous option-save probe')
            body = body.replace(old, 'save_blocks = 1;\n        Savefilename = DiabloOptionFile;')
        target.write_text(body.replace('#include "psxsrc/options.h"', text))
        run = subprocess.run([sys.executable, str(ROOT / 'tools/verify_asm.py'),
                              str(target), 'MemcardPad__Fv'], cwd=ROOT,
                             capture_output=True, text=True)
        results[name] = {'exit_code': run.returncode, 'stdout': run.stdout, 'stderr': run.stderr}
        print(name + ':\n' + run.stdout + run.stderr, flush=True)
    (ROOT / 'build/memcard_reload_probe/results.json').write_text(json.dumps(results, indent=2) + '\n')


if __name__ == '__main__':
    main()
