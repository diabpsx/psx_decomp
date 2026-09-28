"""Reuse the diablo build.py cpp step to produce a .i for a chosen recon TU,
without invoking cc1/cc1plus (so we can feed the .i to BOTH the real PsyQ
cc1plus and our stock/instrumented build for comparison)."""
import sys
sys.path.insert(0, r"C:/temp/diablo-psx/psx_decomp/tools")
import build as B
from pathlib import Path

src = Path(sys.argv[1]).resolve()
out_i = Path(sys.argv[2]).resolve()
flags = B.per_tu_flags(src)
g = str(flags.get("g_value", B.G_VALUE))
cpp = [B.CPP, "-x", "c", "-D__cplusplus=1", *B.CPP_FLAGS, src, "-o", out_i]
r = B.run(cpp)
if r.returncode:
    sys.exit("[cpp++] %s\n%s" % (src, r.stderr))
print("wrote", out_i)
