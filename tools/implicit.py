"""tools/implicit.py TU.cpp — list implicit function declarations (they open spurious SYM levels)."""
import sys, subprocess, os
sys.path.insert(0, "tools"); import build as b
from pathlib import Path
src = Path(sys.argv[1]); t = Path("build/tmp/impl"); t.mkdir(parents=True, exist_ok=True)
i = t / (src.stem + ".i")
b.run([b.CPP, "-x", "c", "-D__cplusplus=1", *b.CPP_FLAGS, src, "-o", i])
env = dict(os.environ, TMP=str(t.resolve()), TEMP=str(t.resolve()), TMPDIR=str(t.resolve()))
r = subprocess.run([str(b.CC1PL), *[str(x) for x in b.CC1PL_FLAGS], "-Wall", str(i), "-o", str(t / "x.s")], capture_output=True, text=True, env=env)
print("\n".join(sorted(set(l for l in r.stderr.splitlines() if "implicit" in l))) or "no implicit declarations")
