#!/usr/bin/env python3
"""link.py — full-image link check: assemble every splat data/asm object, build the TUs
(tools/build.py), link with the splat linker script and compare the binary with the retail image.

    python tools/link.py [diabpsx|frontend|pregame|game|fmv ...]   # default: all five

For each image: build/<name>.elf, build/<name>.bin, build/<name>.map and a byte comparison
against rom/<IMAGE>.BIN (the .bin may be longer because .bss is materialised as zero fill;
only the retail length is compared and the tail must be all zero)."""
import os, re, subprocess, sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools"))
import build as B

LD = B.MIPS / "mipsel-none-elf-ld.exe"
OBJCOPY = B.MIPS / "mipsel-none-elf-objcopy.exe"
IMAGES = {"diabpsx": "DIABPSX.BIN", "frontend": "FRONTEND.BIN", "pregame": "PREGAME.BIN", "game": "GAME.BIN", "fmv": "FMV.BIN"}

def assemble_raw(s: Path, obj: Path):
    """splat data/asm .s (uses glabel/dlabel macros) -> .o with plain GNU as"""
    obj.parent.mkdir(parents=True, exist_ok=True)
    tmp = obj.with_suffix(".pre.s")
    tmp.write_text('.include "macro.inc"\n.set noat\n.set noreorder\n' + s.read_text(encoding="utf-8", errors="replace"), encoding="utf-8")
    r = subprocess.run([str(B.AS), *B.AS_ARCH_SCAFFOLD, f"-G{B.G_VALUE}", "-I", str(B.INCLUDE), "-I", str(ROOT), "-o", str(obj), str(tmp)],
                       capture_output=True, text=True, cwd=ROOT)
    if r.returncode:
        sys.exit(f"[as] {s}\n{r.stderr}")

def link(name: str):
    subprocess.run([sys.executable, str(ROOT / 'tools' / 'gen_ld.py'), name], check=True, cwd=ROOT)   # ROM-order script, pinned addresses
    ld_script = ROOT / "linkers" / f"{name}.ld"
    txt = ld_script.read_text()
    objs = sorted(set(re.findall(r"(build/\S+?\.o)\(", txt)))
    for o in objs:
        op = ROOT / o
        if o.startswith("build/asm/"):
            src = ROOT / o[len("build/"):-2]
            if not op.exists() or op.stat().st_mtime < src.stat().st_mtime:
                assemble_raw(src, op)
        elif o.startswith("build/src/"):
            src = ROOT / o[len("build/"):-2]
            seg_dir = ROOT / "asm" / "nonmatchings" / src.stem        # the INCLUDE_ASM'd .s files are inputs too
            newest = max([src.stat().st_mtime] + [f.stat().st_mtime for f in seg_dir.glob("*.s")] if seg_dir.exists() else [src.stat().st_mtime])
            if not op.exists() or op.stat().st_mtime < newest:
                B.compile_any(src)
        else:
            sys.exit(f"unknown object in ld script: {o}")
    extra = [ROOT / "linkers" / f"undefined_syms_auto{'' if name == 'diabpsx' else '_' + name}.txt",
             ROOT / "linkers" / f"undefined_funcs_auto{'' if name == 'diabpsx' else '_' + name}.txt"]
    cmd = [str(LD), "-EL", "-T", str(ld_script)] + sum([["-T", str(e)] for e in extra if e.exists() and e.stat().st_size], []) + \
          ["-Map", str(ROOT / "build" / f"{name}.map"), "--no-check-sections", "-o", str(ROOT / "build" / f"{name}.elf")]
    r = subprocess.run(cmd, capture_output=True, text=True, cwd=ROOT)
    if r.returncode:
        sys.exit(f"[ld] {name}\n{r.stdout}{r.stderr[-4000:]}")
    subprocess.run([str(OBJCOPY), "-O", "binary", str(ROOT / "build" / f"{name}.elf"), str(ROOT / "build" / f"{name}.bin")], check=True, cwd=ROOT)
    ours = (ROOT / "build" / f"{name}.bin").read_bytes()
    retail = (ROOT / "rom" / IMAGES[name]).read_bytes()
    n = len(retail)
    same = ours[:n] == retail
    tail_zero = not any(ours[n:])
    if same and tail_zero:
        print(f"{name}: OK — {n} bytes identical to rom/{IMAGES[name]} (+{len(ours) - n} zero bss)")
    else:
        first = next((i for i in range(min(n, len(ours))) if ours[i] != retail[i]), None)
        ndiff = sum(1 for i in range(min(n, len(ours))) if ours[i] != retail[i]) + abs(n - min(n, len(ours)))
        print(f"{name}: DIFF — ours {len(ours)} B vs retail {n} B; first diff @ file 0x{first:X} (va 0x{first + (0x80010000 if name == 'diabpsx' else 0x80139BF8):08X}); {ndiff} differing bytes; tail_zero={tail_zero}"
              if first is not None else f"{name}: DIFF — length only (ours {len(ours)} vs {n}), tail_zero={tail_zero}")
        return False
    return True

def main():
    names = sys.argv[1:] or list(IMAGES)
    ok = all([link(n) for n in names])
    sys.exit(0 if ok else 1)

if __name__ == "__main__":
    main()
