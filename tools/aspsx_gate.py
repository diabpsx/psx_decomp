#!/usr/bin/env python3
"""aspsx_gate.py — alternate bytes gate through the era assembler (ASPSX 2.56) instead of maspsx+GNU as.

    python tools/aspsx_gate.py recon/psxsrc/fe.cpp [FN,FN...]     # default: every function the TU defines

Pipeline = symlane.py's SN lane (cc1plus <lane flags> -g -> ASPSX -q -g -0 -> PSYLINK -> CPE + SYM); every
function's words are taken from the linked CPE image (range from the linked SYM) and compared with the
retail oracle words (the hex column of asm/nonmatchings/<seg>/<fn>.s).  Relocated fields differ between
the two links, so for oracle instructions carrying a symbolic operand (%hi/%lo/%gp_rel, j/jal) only the
opcode/register fields are compared; PC-relative branch offsets and every other bit are compared exactly.
Use it where maspsx and ASPSX disagree (e.g. maspsx's extra load-delay nop before an indexed macro load of
a gp-eligible symbol); the maspsx gate (verify_asm.py) stays the default."""
import re, struct, sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools"))
import symlane as SL

def read_cpe(p: Path):
    """{addr: bytes} load chunks of a PsyQ CPE"""
    b = p.read_bytes()
    if b[:4] != b"CPE\x01": sys.exit(f"{p}: not a CPE")
    i, mem = 4, {}
    while i < len(b):
        tag = b[i]; i += 1
        if tag == 0: break
        if tag == 1:
            addr, n = struct.unpack_from("<II", b, i); i += 8
            mem[addr] = b[i:i + n]; i += n
        elif tag == 2: i += 4
        elif tag == 3: i += 6
        elif tag == 8: i += 1
        else: sys.exit(f"{p}: unknown CPE chunk {tag:#x} at {i - 1:#x}")
    return mem

def fetch(mem, addr, n):
    """bytes [addr, addr+n) of the image (CPE load chunks are scattered; flatten them)"""
    lo = min(mem); hi = max(a + len(d) for a, d in mem.items())
    if not (lo <= addr and addr + n <= hi): return None
    flat = bytearray(hi - lo)
    for a, d in mem.items(): flat[a - lo:a - lo + len(d)] = d
    return bytes(flat[addr - lo:addr - lo + n])

ORA = re.compile(r"/\*\s*[0-9A-Fa-f]+\s+([0-9A-Fa-f]{8})\s+([0-9A-Fa-f]{8})\s*\*/\s*(.*)")

def oracle(seg, board):
    p = ROOT / "asm" / "nonmatchings" / seg / f"{board}.s"
    if not p.is_file(): return None
    out = []
    for ln in p.read_text().splitlines():
        m = ORA.search(ln)
        if m:
            w = int.from_bytes(bytes.fromhex(m.group(2)), "little")
            out.append((w, m.group(3).strip()))
    return out

def mask_for(text, word):
    op = word >> 26
    if op in (2, 3): return 0xFC000000                      # j / jal: absolute target
    if "%hi(" in text or "%lo(" in text or "%gp_rel(" in text: return 0xFFFF0000
    return 0xFFFFFFFF

def main():
    src = ROOT / sys.argv[1]
    want = sys.argv[2].split(",") if len(sys.argv) > 2 else None
    seg = src.stem.lower()
    obj = SL.compile_g(src)
    txt = SL.link(obj)
    cpe = txt.with_name(txt.name.replace(".sym.txt", ".cpe"))
    mem = read_cpe(cpe)
    ours = SL.functions(txt.read_text(encoding="utf-8", errors="replace"))
    names = want or sorted(p.stem for p in (ROOT / "asm" / "nonmatchings" / seg).glob("*.s"))
    n_ok = 0
    for n0 in names:
        n = re.sub(r"_(?:[0-9a-f]{8}|ci)$", "", n0)
        ora = oracle(seg, n0)
        if ora is None: print(f"  {n0}: NO ORACLE"); continue
        f = ours.get(n)
        if f is None: print(f"  {n0}: NOT IN OBJECT"); continue
        data = fetch(mem, f["start"], len(ora) * 4)
        if data is None: print(f"  {n0}: NOT IN CPE"); continue
        words = struct.unpack(f"<{len(ora)}I", data)
        bad = [(i, w, o, t) for i, (w, (o, t)) in enumerate(zip(words, ora)) if (w ^ o) & mask_for(t, o)]
        ours_len = f.get("end", 0) // 4        # SYM 'Function end' offset = function length
        if not bad and ours_len == len(ora):
            print(f"  {n0}: PASS ({len(ora)} insns)"); n_ok += 1
        else:
            print(f"  {n0}: FAIL {len(bad)} diffs (ours {ours_len} / oracle {len(ora)})")
            for i, w, o, t in bad[:6]:
                print(f"      [{i:3}] ours {w:08x}  oracle {o:08x}  {t}")
    print(f"ASPSX: {n_ok}/{len(names)} PASS")

if __name__ == "__main__":
    main()
