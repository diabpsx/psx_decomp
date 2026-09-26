#!/usr/bin/env python3
"""ida_rename.py — rewrite the raw Hex-Rays exports in ../rom/*.BIN.c with the retail SYM names
(`sub_800931CC` -> `SetUVTpGT3__7TextDatP9FRAME_HDRP8POLY_GT3`, `dword_8011AAB4` -> `ThisOt`, ...)
into ../refs/ida/<image>.c.  Types are NOT recovered (the export was made without the SYM loaded);
this only makes the decompile grep-able by function/global name.

    python tools/ida_rename.py            # all images found in ../rom/*.BIN.c
"""
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
ROM = ROOT.parent / "rom"
OUT = ROOT.parent / "refs" / "ida"
SYMS = {   # image -> symbol files (main first so cross-image references resolve)
    "DIABPSX.BIN": ["symbol_addrs.txt"],
    "OVL4_STARTUP.BIN": ["symbol_addrs.txt"],
    "FRONTEND.BIN": ["symbol_addrs.txt", "symbol_addrs_frontend.txt"],
    "PREGAME.BIN": ["symbol_addrs.txt", "symbol_addrs_pregame.txt"],
    "GAME.BIN": ["symbol_addrs.txt", "symbol_addrs_game.txt"],
    "FMV.BIN": ["symbol_addrs.txt", "symbol_addrs_fmv.txt"],
}
PREFIX = re.compile(r"\b(sub|loc|dword|word|byte|off|unk|asc|stru|flt|dbl|qword|jpt|def|locret|nullsub)_([0-9A-F]{8})\b")

def load(files):
    m = {}
    for f in files:
        for name, va in re.findall(r"^(\w+) = 0x([0-9A-F]{8});", (ROOT / "configs" / f).read_text(), re.M):
            m.setdefault(int(va, 16), name)     # first file (main image) wins for duplicates
    return m

def main():
    OUT.mkdir(parents=True, exist_ok=True)
    for image, files in SYMS.items():
        src = ROM / f"{image}.c"
        if not src.exists(): continue
        names = load(files)
        txt = src.read_text(encoding="utf-8", errors="replace")
        hits = [0]
        def rep(m):
            va = int(m.group(2), 16)
            n = names.get(va)
            if n is None: return m.group(0)
            hits[0] += 1
            return n
        out = PREFIX.sub(rep, txt)
        (OUT / f"{image}.c").write_text(out, encoding="utf-8")
        total = len(PREFIX.findall(txt))
        print(f"{image}: {hits[0]}/{total} IDA auto-names renamed -> {OUT / (image + '.c')}")

if __name__ == "__main__":
    main()
