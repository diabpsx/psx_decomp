#!/usr/bin/env python3
"""symhdr.py — emit compilable C/C++ declarations straight from DIABPSX.SYM.

    python tools/symhdr.py struct TownerStruct QuestStruct ...   # structs/unions + every tag they need, dependency order
    python tools/symhdr.py enum  PLR_MODE ...
    python tools/symhdr.py extern towner numtowners ...           # `extern <type> name[dims];` from the EXT data records
    python tools/symhdr.py proto LoadFileInMem__FPCcPUl ...       # prototypes (C linkage-free spelling: return type + params)

Rendering rules (SYM truth, verified against retail SYM output of our own builds):
  bitfields keep width/order; base subobjects appear as a member named like the base (SysObj) — emitted as-is, the
  hand-written headers turn them into inheritance where the code needs it; `.vf` vtable pointer members are dropped
  (declare virtuals by hand); anonymous tags `._N` are emitted as `struct _anon_N`."""
import re, sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools"))
import symtypes as ST

RECS = [r for r in (ST.parse(ln) for ln in ST.LINES) if r]

def tagname(t):
    return re.sub(r"^\._(\d+)$", r"_anon_\1", t)

def ctype(r, name=None):
    r = dict(r, tag=tagname(r["tag"]))
    s = ST.ctype(r if name is None else dict(r, name=name))
    return s

def members(tag, cls_open):
    """member records of one STRTAG/UNTAG/ENTAG definition (first definition wins)"""
    out, inside = [], False
    for r in RECS:
        if r["cls"] == cls_open and r["name"] == tag: inside = True; continue
        if inside:
            if r["cls"] == "EOS": return out
            out.append(r)
    return out

def deps(recs):
    for r in recs:
        if r["cls"] in ("MOS", "MOU", "FIELD") and r["tag"] and ("STRUCT" in r["typ"] or "UNION" in r["typ"] or "ENUM" in r["typ"]):
            yield ("enum" if "ENUM" in r["typ"] else ("union" if "UNION" in r["typ"].split()[-1] else "struct")), r["tag"]

def render_struct(tag, kw):
    recs = members(tag, "STRTAG" if kw == "struct" else "UNTAG")
    hdr = next((r for r in RECS if r["cls"] in ("STRTAG", "UNTAG") and r["name"] == tag), None)
    total = hdr["size"] if hdr else None
    lines = [f"{kw} {tagname(tag)} {{" + (f"   /* sizeof {total} */" if total else "")]
    mos = [r for r in recs if r["cls"] in ("MOS", "MOU", "FIELD")]
    for i, r in enumerate(mos):
        if r["name"].startswith(".vf"): lines.append(f"    /* {ctype(r)}  (vtable pointer: declare the virtuals by hand) */"); continue
        if r["cls"] == "FIELD":
            lines.append(f"    {ctype(r)} : {r['size']};"); continue
        t = r["typ"].split()
        # dumpsym prints 64-bit scalars as LONG/ULONG: an 8-aligned scalar followed by an 8-byte gap is `long long`
        if kw == "struct" and t in (["ULONG"], ["LONG"]):
            nxt = mos[i + 1]["val"] if i + 1 < len(mos) else (total if total else r["val"] + 4)
            if r["val"] % 8 == 0 and nxt - r["val"] == 8:
                lines.append(f"    {'unsigned ' if t == ['ULONG'] else ''}long long {r['name']};   /* +0x{r['val']:X} (SYM says {t[0]}; 8 bytes) */"); continue
        lines.append(f"    {ctype(r)};   /* +0x{r['val']:X} */")
    lines.append("};")
    return "\n".join(lines)

def render_enum(tag):
    recs = members(tag, "ENTAG")
    return f"enum {tagname(tag)} {{\n" + ",\n".join(f"    {r['name']} = {r['val']}" for r in recs if r["cls"] == "MOE") + "\n};"

def emit_types(wanted):
    done, out = set(), []
    def visit(kind, tag):
        if (kind, tag) in done: return
        done.add((kind, tag))
        if kind == "enum":
            out.append(render_enum(tag)); return
        recs = members(tag, "STRTAG" if kind == "struct" else "UNTAG")
        # pointers to structs only need a forward declaration; embedded structs/enums must be complete first
        for r in recs:
            if not r["tag"] or r["tag"] == tag: continue
            t = r["typ"].split()
            embedded = "PTR" not in t[:-1] or (t[0] == "ARY" and "PTR" not in t)
            k = "enum" if t[-1] == "ENUM" else ("union" if t[-1] == "UNION" else "struct")
            if embedded or k == "enum": visit(k, r["tag"])
            elif (k, r["tag"]) not in done: out.append(f"{k} {tagname(r['tag'])};")
        out.append(render_struct(tag, kind))
    for kind, tag in wanted: visit(kind, tag)
    return "\n\n".join(out)

def emit_externs(names):
    out = []
    for n in names:
        r = next((r for r in RECS if r["cls"] == "EXT" and r["name"] == n and not r["typ"].startswith("FCN")), None)
        if r is None: out.append(f"/* {n}: no EXT data record */"); continue
        out.append(f"extern {ctype(r)};   /* @0x{r['val']:08X} */")
    return "\n".join(out)

def emit_protos(names):
    import gen_skeleton as GS
    out = []
    for n in names:
        f = next((f for f in ST.fn_blocks() if f["name"] == n), None)
        fr = next((r for r in RECS if r["typ"].startswith("FCN") and r["name"] == n), None)
        if f is None: out.append(f"/* {n}: no SYM function block */"); continue
        out.append(GS.signature(f, fr).replace("struct ", "") + f";   /* @0x{f['va']:08X} {f['file'].split(chr(92))[-1]}:{f['line']} */")
    return "\n".join(out)

if __name__ == "__main__":
    cmd, args = sys.argv[1], sys.argv[2:]
    if cmd == "struct": print(emit_types([("struct", a) for a in args]))
    elif cmd == "union": print(emit_types([("union", a) for a in args]))
    elif cmd == "enum": print("\n\n".join(render_enum(a) for a in args))
    elif cmd == "extern": print(emit_externs(args))
    elif cmd == "proto": print(emit_protos(args))
