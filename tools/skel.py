#!/usr/bin/env python3
"""skel.py — print the TDR/Ghidra skeleton body of one or more functions from the
diabpsx/skeleton reference tree (refs/skeleton/JAP_1998_05_29, sibling of this repo).

    python tools/skel.py GetTexNum__C7TextDat GetFr__7TextDati ...
    python tools/skel.py --file PSXSRC/GMAN.CPP        # list function names defined in that file

A definition is `<type> <NAME>(...)` at column 0 followed by a `{ ... }` block; the
signature comment block (`// original method signature:` + SYM line/offset) above it is
printed too because it carries the REGPARM registers TDR read from the SYM."""
import re, sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SKEL = ROOT.parent / "refs" / "skeleton" / "JAP_1998_05_29" / "DIABPSX"

def files():
    return sorted(p for p in SKEL.rglob("*") if p.suffix.upper() in (".CPP", ".C", ".H", ".MIP"))

def find(name):
    pat = re.compile(r"^[A-Za-z_][^\n=;]*?[ *&]" + re.escape(name) + r"\s*\(", re.M)
    for p in files():
        txt = p.read_text(encoding="latin-1")
        for m in pat.finditer(txt):
            # skip prototypes (line ends with ';')
            line_end = txt.find("\n", m.start())
            if txt[m.start():line_end].rstrip().endswith(";"): continue
            # back up to the preceding "// decompiled code" banner
            head = txt.rfind("// decompiled code", 0, m.start())
            start = head if head != -1 and m.start() - head < 1200 else m.start()
            # forward to the closing brace at column 0
            brace = txt.find("\n{", m.start())
            end = txt.find("\n}", brace)
            yield p, txt[start:end + 2]

def main():
    if sys.argv[1] == "--file":
        want = sys.argv[2].replace("/", "\\").upper()
        for p in files():
            if str(p).upper().endswith(want):
                for m in re.finditer(r"^[A-Za-z_][^\n=;]*?[ *&](\w+)\s*\([^;]*?\)\s*\n\s*\{", p.read_text(encoding="latin-1"), re.M):
                    print(m.group(1))
        return
    for name in sys.argv[1:]:
        hits = list(find(name))
        if not hits:
            print(f"/* {name}: not found in skeleton */\n"); continue
        for p, body in hits:
            print(f"/* ===== {name}  [{p.relative_to(SKEL)}] ===== */")
            print(body); print()

if __name__ == "__main__":
    main()
