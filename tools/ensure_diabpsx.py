#!/usr/bin/env python3
r"""Make C:/diabpsx (the original source root) available as the compile working directory.

ASPSX records a source file name as its working directory, in the case it was typed, plus the
upper-cased relative path from the `.file` directive; the retail DIABPSX.SYM paths are
`C:\diabpsx\SOURCE\X.CPP`, `C:\diabpsx\PSXSRC\X.CPP` and (DOS-built GLIB) `C:\DIABPSX\GLIBDEV\...`,
so the original build ran from `C:\diabpsx` on `source/X.CPP`-style relative paths.  This script
makes `C:\diabpsx` a directory junction onto recon/ (`mklink /J`, a per-machine link, nothing is
installed; the RE2 lane does the same with `subst D:`).  If `C:\diabpsx` exists and is not our
junction, nothing is changed and the script explains what to do.
"""
import os, subprocess, sys
from pathlib import Path
ROOT = Path(__file__).resolve().parents[1]
RECON = ROOT / 'recon'
LINK = Path('C:/diabpsx')


def is_ours():
    try:
        return LINK.is_dir() and os.path.samefile(LINK, RECON)
    except OSError:
        return False


def main():
    if is_ours():
        print('ok:', LINK, '->', RECON); return 0
    if LINK.exists():
        print(f'{LINK} exists but is not a junction onto {RECON}; remove it (rmdir C:/diabpsx) and re-run.',
              file=sys.stderr); return 1
    r = subprocess.run(['cmd', '/c', 'mklink', '/J', str(LINK).replace('/', chr(92)), str(RECON)],
                       capture_output=True, text=True)
    if r.returncode or not is_ours():
        print('mklink failed:', r.stdout, r.stderr, file=sys.stderr); return 1
    print('linked', LINK, '->', RECON); return 0


if __name__ == '__main__':
    sys.exit(main())
