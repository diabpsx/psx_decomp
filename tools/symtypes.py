#!/usr/bin/env python3
"""symtypes.py — read struct/typedef definitions and per-function locals out of the
DIABPSX MND SYM dump (rom/DIABPSX-SYM.txt) and print them as C.

    python tools/symtypes.py struct TextDat [Other ...]   # struct layout as C
    python tools/symtypes.py fn OnceOnlyInit__7TextDat    # params/locals/regs + SLD lines
    python tools/symtypes.py file GMAN.CPP                # every fn of that source file, in VA order

SYM record grammar (dumpsym): `OFF: $VAL 94 Def class C type T size S name N` and
`96 Def2 class C type T size S dims D ... tag TAG name N`. For a struct: STRTAG opens it,
MOS = member (VAL = byte offset), EOS closes (VAL = sizeof). MOU/UNTAG likewise for unions.
Register numbers on REG/REGPARM records are PHYSICAL MIPS regs ($VAL).
"""
import re, sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
LINES = (ROOT / "rom" / "DIABPSX-SYM.txt").read_text(encoding="latin-1").splitlines()
REC = re.compile(r"^[0-9a-f]+: \$([0-9a-f]{8}) (94|96) Def2? class (\w+) type (.*?) size (\d+)(?: dims (\d+)((?: \d+)*))?(?: tag (\S*))? name (\S+)$")
REGS = ["zero","at","v0","v1","a0","a1","a2","a3","t0","t1","t2","t3","t4","t5","t6","t7",
        "s0","s1","s2","s3","s4","s5","s6","s7","t8","t9","k0","k1","gp","sp","fp","ra"]

def parse(ln):
    m = REC.match(ln)
    if not m: return None
    val, _, cls, typ, size, ndim, dims, tag, name = m.groups()
    dims = [int(d) for d in (dims or "").split()] if ndim else []
    return dict(val=int(val, 16), cls=cls, typ=typ, size=int(size), dims=dims, tag=tag or "", name=name)

def ctype(r):
    """render a SYM type string + tag + dims as a C declarator (name embedded)."""
    t = r["typ"].split(); base = t[-1]; mods = t[:-1]
    basemap = {"INT":"int","UINT":"unsigned int","CHAR":"char","UCHAR":"unsigned char","SHORT":"short",
               "USHORT":"unsigned short","LONG":"long","ULONG":"unsigned long","VOID":"void","FLOAT":"float",
               "DOUBLE":"double","STRUCT":"struct "+r["tag"],"UNION":"union "+r["tag"],"ENUM":"enum "+r["tag"]}
    c = basemap.get(base, base)
    decl = r["name"]
    dims = list(r["dims"])
    for mod in reversed(mods):
        if mod == "PTR": decl = "*" + decl
        elif mod == "ARY":
            d = dims.pop(0) if dims else 0
            decl = f"{decl}[{d}]"
        elif mod == "FCN": decl = f"({decl})()"
    return f"{c} {decl}"

def struct(name):
    out = []; inside = False
    for ln in LINES:
        r = parse(ln)
        if not r: continue
        if r["cls"] in ("STRTAG", "UNTAG") and r["name"] == name:
            inside = True; kw = "struct" if r["cls"] == "STRTAG" else "union"
            out.append(f"{kw} {name} {{   /* size {r['size']} */"); continue
        if inside:
            if r["cls"] in ("MOS", "MOU"):
                out.append(f"    {ctype(r)};   /* +0x{r['val']:X} size {r['size']} */")
            elif r["cls"] == "FIELD":       # bitfield: val = BIT offset, size = BIT width
                out.append(f"    {ctype(r)} : {r['size']};   /* bit {r['val']} */")
            elif r["cls"] == "EOS":
                out.append(f"}};   /* sizeof {r['val']} */"); break
    return "\n".join(out) if out else f"/* {name}: not found */"

def fn_blocks():
    """yield (va, name, file, line, records[]) for every 8c Function start block."""
    cur = None
    for ln in LINES:
        m = re.match(r"^[0-9a-f]+: \$([0-9a-f]{8}) 8c Function start", ln)
        if m: cur = dict(va=int(m[1], 16), recs=[], blocks=[]); continue
        if cur is None: continue
        m2 = re.match(r"\s+(name|file|line|fsize|mask|maskoffs) = (.*)", ln)
        if m2: cur[m2[1]] = m2[2]; continue
        mb = re.match(r"^[0-9a-f]+: \$([0-9a-f]{8}) (90|92) Block (start|end)\s+line = (\d+)", ln)
        if mb: cur["blocks"].append((int(mb[1], 16), mb[3], int(mb[4]))); continue
        r = parse(ln)
        if r: cur["recs"].append(r); continue
        me = re.match(r"^[0-9a-f]+: \$([0-9a-f]{8}) 8e Function end\s+line (\d+)", ln)
        if me:
            cur["end"] = int(me[1], 16); cur["endline"] = int(me[2]); yield cur; cur = None

def show_fn(f):
    print(f"// {f['name']} @ 0x{f['va']:08X}..0x{f['end']:08X}  {f['file']}:{f['line']}-{f['endline']}  fsize={f['fsize']} mask={f['mask']}")
    for r in f["recs"]:
        loc = ""
        if r["cls"] in ("REG", "REGPARM"): loc = f"${REGS[r['val']] if r['val'] < 32 else r['val']}"
        elif r["cls"] in ("AUTO", "ARG"): loc = f"sp+0x{r['val']:X}"
        elif r["cls"] == "STAT": loc = f"@0x{r['val']:08X}"
        print(f"    {r['cls']:8s} {ctype(r):40s} {loc}")
    for va, kind, line in f["blocks"]:
        print(f"    block {kind:5s} 0x{va:08X} line {line}")

def main():
    cmd = sys.argv[1]
    if cmd == "struct":
        for n in sys.argv[2:]: print(struct(n)); print()
    elif cmd == "fn":
        want = set(sys.argv[2:])
        for f in fn_blocks():
            if f["name"] in want: show_fn(f)
    elif cmd == "file":
        want = sys.argv[2].upper()
        for f in sorted(fn_blocks(), key=lambda x: x["va"]):
            if f["file"].upper().endswith(want): show_fn(f)

if __name__ == "__main__":
    main()
