#!/usr/bin/env python3
"""gen_m2c.py — decompile every splat oracle (asm/nonmatchings/<seg>/*.s) with the local
m2c fork (C:/Temp/m2c-updated, COP0/COP2-GTE aware) into ../refs/m2c/<seg>.c, one file per
TU in VA order.  Draft-only reference (NOT the gate — tools/verify_asm.py is the verdict).

    python tools/gen_m2c.py [seg ...]          # default: every segment
    python tools/gen_m2c.py --context ctx.h    # optional m2c --context header

A segment is run as ONE m2c invocation (all its .s files + the TU's splat jump tables); if
that fails, each function is retried alone and failures are recorded as a comment so the
file stays complete."""
import re, subprocess, sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
M2C = Path("C:/Temp/m2c-updated/m2c.py")
OUT = ROOT.parent / "refs" / "m2c"
NONM = ROOT / "asm" / "nonmatchings"
BASE = [sys.executable, str(M2C), "--target", "mipsel-gcc-c", "--valid-syntax"]
TMP = ROOT / "build" / "m2c_in.s"

def first_va(p: Path) -> int:
    m = re.search(r"^\s*/\* [0-9A-F]+ ([0-9A-F]{8}) ", p.read_text(encoding="utf-8", errors="replace"), re.M)
    return int(m.group(1), 16) if m else 0

def jtbl_files(seg):
    """splat puts a TU's switch tables in asm/data/rodata_<seg>.rodata.s (or the shared rodata.rodata.s)"""
    out = []
    for name in (f"rodata_{seg}.rodata.s", "rodata.rodata.s"):
        f = ROOT / "asm" / "data" / name
        if f.exists() and "jtbl_" in f.read_text(encoding="utf-8", errors="replace"):
            out.append(f)
    return out

IMAGES = None
def images():
    """(vram, bytes) for every image we can read table words from"""
    global IMAGES
    if IMAGES is None:
        IMAGES = [(0x80010000, (ROOT / "rom" / "DIABPSX.BIN").read_bytes())]
        for n in ("FRONTEND.BIN", "PREGAME.BIN", "GAME.BIN", "FMV.BIN"):
            f = ROOT / "rom" / n
            if f.exists(): IMAGES.append((0x80139BF8, f.read_bytes()))
    return IMAGES

def synth_jtbls(files, seg):
    """For every `jtbl_XXXXXXXX` a function references that no rodata file of this segment defines
    (overlay switch tables live in the main image's .rdata), read the words from the image and
    emit a spimdisasm-style table: consecutive words that land inside the referencing function."""
    have = "".join(f.read_text(encoding="utf-8", errors="replace") for f in jtbl_files(seg))
    out = []; targets = set()
    for f in files:
        txt = f.read_text(encoding="utf-8", errors="replace")
        vas = [int(m, 16) for m in re.findall(r"^\s*/\* [0-9A-F]+ ([0-9A-F]{8}) ", txt, re.M)]
        if not vas: continue
        lo, hi = min(vas), max(vas) + 4
        for t in sorted({int(m, 16) for m in re.findall(r"%hi\(jtbl_([0-9A-F]{8})\)", txt)}):
            if f"jtbl_{t:08X}" in have: continue
            for vram, img in images():
                o = t - vram
                if not (0 <= o < len(img)): continue
                words = []
                while o + 4 <= len(img):
                    w = int.from_bytes(img[o:o+4], "little")
                    if not (lo <= w < hi): break
                    words.append(w); o += 4
                if words:
                    out.append(f"jlabel jtbl_{t:08X}\n" + "".join(f"/* synth */ .word .L{w:08X}\n" for w in words))
                    have += f"jtbl_{t:08X}"; targets.update(words)
                break
    return "\n".join(out), targets


def add_labels(text, targets):
    """insert `.L<va>:` before the instruction at each jump-table target that has no label yet"""
    if not targets: return text
    present = set(int(m, 16) for m in re.findall(r"^\.L([0-9A-F]{8}):", text, re.M))
    need = {t for t in targets if t not in present}
    lines = text.split("\n"); out = []
    for ln in lines:
        m = re.match(r"^\s*/\* [0-9A-F]+ ([0-9A-F]{8}) [0-9A-F]{8} \*/", ln)
        if m and int(m[1], 16) in need:
            out.append(f".L{m[1]}:"); need.discard(int(m[1], 16))
        out.append(ln)
    return "\n".join(out)

def run(files, extra, seg):
    """concatenate the .s files (+ jump tables) into one temp input (Windows argv is limited to 32K)"""
    TMP.parent.mkdir(parents=True, exist_ok=True)
    srcs = list(files) + jtbl_files(seg)
    body = "\n".join(f.read_text(encoding="utf-8", errors="replace") for f in srcs)
    tables, targets = synth_jtbls(files, seg)
    TMP.write_text(add_labels(body, targets) + "\n" + tables, encoding="utf-8")
    r = subprocess.run(BASE + extra + [str(TMP)], capture_output=True, text=True, cwd=ROOT)
    return r.returncode, r.stdout, r.stderr

def errline(o, e):
    for txt in (e, o):
        lines = [l for l in txt.strip().splitlines() if l.strip() and not l.startswith(("/*", "*/"))]
        if lines:
            return lines[-1][:200]
    return "?"

def main():
    args = sys.argv[1:]
    extra = []
    if "--context" in args:
        i = args.index("--context"); extra = ["--context", args[i + 1]]; del args[i:i + 2]
    segs = args or sorted(p.name for p in NONM.iterdir() if p.is_dir())
    OUT.mkdir(parents=True, exist_ok=True)
    for seg in segs:
        files = sorted((NONM / seg).glob("*.s"), key=first_va)
        if not files:
            continue
        rc, out, err = run(files, extra, seg)
        if rc != 0:
            parts = []
            for f in files:
                rc1, o1, e1 = run([f], extra, seg)
                parts.append(o1 if rc1 == 0 else f"/* m2c FAILED on {f.stem}: {errline(o1, e1)} */\n")
            out = "\n".join(parts)
        hdr = f"/* m2c draft of segment '{seg}' ({len(files)} fns) — generated by tools/gen_m2c.py; reference only */\n\n"
        (OUT / f"{seg}.c").write_text(hdr + out, encoding="utf-8")
        print(f"{seg}: {len(files)} fns{'  (per-fn fallback)' if rc else ''}")

if __name__ == "__main__":
    main()
