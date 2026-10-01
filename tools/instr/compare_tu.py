#!/usr/bin/env python3
"""compare_tu.py <recon.cpp> [<recon.cpp> ...]
For each Diablo recon TU: cpp -> real PsyQ CC1PLPSX vs our stock cc1plus,
using IDENTICAL flags (CC1PL_FLAGS from tools/build.py), then diff the two
.s outputs after stripping filename/ident-only lines and applying the same
dtor-name normalization build.py itself does. Reports IDENTICAL / DIFFERS.
"""
import argparse
import sys, subprocess, re, tempfile
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import build as B

OURS = Path(r"C:/temp/dmt-cc1/gccbuild-ecoff/cc1plus.exe")

def normalize(txt):
    txt = txt.replace("_._", "___")
    txt = txt.replace("_GLOBAL_.I.", "_GLOBAL__I_").replace("_GLOBAL_.D.", "_GLOBAL__D_")
    lines = [l for l in txt.splitlines()
             if not l.strip().startswith("#") and not l.strip().startswith(".file")
             and not l.strip().startswith(".ident")
             # SN's CC1PLPSX never emits `.set nobopt` (a no-op assembler directive --
             # inert after maspsx+as, byte-identical either way); our stock FSF 2.7.2
             # cc1plus always emits it. Cosmetic-only, strip for the .s-level compare.
             and l.strip() != ".set\tnobopt" and l.strip() != ".set nobopt"]
    return "\n".join(lines)

def one(src):
    src = Path(src).resolve()
    rel = src.relative_to(B.ROOT)
    flags = B.per_tu_flags(src)
    g = str(flags.get("g_value", B.G_VALUE))
    parent = B.BUILD / "tmp_cmp"
    parent.mkdir(parents=True, exist_ok=True)
    tmp = Path(tempfile.mkdtemp(prefix='c-', dir=parent))
    print('Artifacts:', tmp)
    i_file = tmp / (src.stem + ".i")
    cpp = [B.CPP, "-x", "c", "-D__cplusplus=1", *B.CPP_FLAGS, src, "-o", i_file]
    r = B.run(cpp)
    if r.returncode:
        print("CPP-FAIL", rel, r.stderr[:300]); return None
    cc1_flags = [f"-G{g}" if f == f"-G{B.G_VALUE}" else f for f in B.CC1PL_FLAGS] + flags.get("extra", [])
    s_real = tmp / (src.stem + ".real.s")
    s_ours = tmp / (src.stem + ".ours.s")
    r1 = B.run([B.CC1PL, *cc1_flags, i_file, "-o", s_real])
    r2 = B.run([OURS, *cc1_flags, i_file, "-o", s_ours])
    if r1.returncode:
        print("REAL-CC1-FAIL", rel, (r1.stdout+r1.stderr)[:500]); return None
    if r2.returncode:
        print("OURS-CC1-FAIL", rel, (r2.stdout+r2.stderr)[:500]); return None
    a = normalize(s_real.read_text(errors="replace"))
    b = normalize(s_ours.read_text(errors="replace"))
    if a == b:
        print("IDENTICAL", rel)
        return True
    else:
        print("DIFFERS   ", rel)
        # quick diff summary
        al, bl = a.splitlines(), b.splitlines()
        import difflib
        d = list(difflib.unified_diff(al, bl, lineterm="", n=1))
        for l in d[:30]:
            print("   ", l)
        return False

def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('sources', nargs='+')
    args = parser.parse_args(argv)
    results = [one(s) for s in args.sources]
    n_id = sum(1 for r in results if r is True)
    n_diff = sum(1 for r in results if r is False)
    n_fail = sum(1 for r in results if r is None)
    print(f"\nSUMMARY: {n_id} identical / {n_diff} differ / {n_fail} failed (of {len(results)})")
    return 2 if n_fail else 1 if n_diff else 0


if __name__ == "__main__":
    sys.exit(main())
