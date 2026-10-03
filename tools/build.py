#!/usr/bin/env python3
"""build.py — Diablo PSX (SLPS-01416) matching-decomp build driver.

Toolchain identity (settled 2026-09-26, see docs/TOOLCHAIN.md): the retail
image was built with PsyQ 4.0 — CC1PSX/CC1PLPSX gcc 2.7.2.SN32.3.7 — and
ASPSX.  Our lane: cpp -> real PsyQ cc1/cc1plus -> maspsx (aspsx emulator)
-> mipsel-none-elf-as.  Byte identity vs rom/DIABPSX.BIN is the criterion;
tools/verify_asm.py is the sole gate.

    python tools/build.py [--skip-asm] [--out DIR] [FILE.c|FILE.cpp ...]

Environment overrides: DIAB_CC1, DIAB_CC1PL, DIAB_CPP, DIAB_AS, DIAB_MIPS.
"""
import os, subprocess, sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
MIPS = Path(os.environ.get("DIAB_MIPS", r"C:/Tools/mips-ps1/mips/bin"))
PSYQ = Path(os.environ.get("DIAB_PSYQ", r"C:/Temp/nfs3-clean/psyq400/COMPILER"))
CC1 = Path(os.environ.get("DIAB_CC1", PSYQ / "CC1PSX.EXE"))
CC1PL = Path(os.environ.get("DIAB_CC1PL", PSYQ / "CC1PLPSX.EXE"))
CPP = Path(os.environ.get("DIAB_CPP", MIPS / "mipsel-none-elf-cpp.exe"))
AS = Path(os.environ.get("DIAB_AS", MIPS / "mipsel-none-elf-as.exe"))
MASPSX = ROOT / "tools" / "maspsx" / "maspsx.py"
PY = sys.executable

RECON = ROOT / "recon"
SRC = ROOT / "src"
INCLUDE = ROOT / "include"
BUILD = ROOT / "build"
OUT = BUILD

ASPSX_VERSION = "2.56"       # PsyQ 4.0-era assembler.  NO --expand-div: gcc 2.7.2 emits `div $zero,rs,rt` (raw op) and
                             # the retail image carries NO divide guard (TpLoadCallBack oracle: bare div+mfhi).
G_VALUE = os.environ.get("DIAB_G", "8")   # TODO settle by gate (sdata census)
AS_ARCH = ["-EL", "-march=r3000", "-mtune=r3000"]
AS_ARCH_SCAFFOLD = ["-EL", "-march=mips64", "-mabi=32"]   # splat scaffolds (src/*.c, INCLUDE_ASM only): retail lib bytes include data-as-code words that decode as MIPS-II traps (tltu)

CPP_FLAGS = ["-nostdinc", "-undef", "-D__GNUC__=2", "-D__OPTIMIZE__",
             "-Dmips", "-D__mips__", "-D__psx__", f"-I{INCLUDE}", f"-I{RECON}"]
CC1_FLAGS = ["-quiet", "-O2", f"-G{G_VALUE}", "-fsigned-char"]   # -fsigned-char: retail SYM types plain char as CHAR (MIPS gcc default char is unsigned); codegen-neutral on GMAN
CC1PL_FLAGS = ["-quiet", "-O2", f"-G{G_VALUE}", "-fno-inline", "-fsigned-char"]   # retail never inlines in-class methods (out-of-line copies per TU, callers jal them)

# per-TU flag overrides: {repo-relative posix path: {"g_value": "0", "lane": "c"...}}
PER_TU_FLAGS = {
    # Climax GLIB C modules use absolute addressing even for four-byte owned
    # commons (TICK/GazTick), proving their original small-data threshold was 0.
    "recon/glibdev/gmain.c": {"g_value": "0"},
    "recon/glibdev/tick.c": {"g_value": "0"},
    "recon/glibdev/tasker.c": {"g_value": "0"},   # 16 four-byte statics at 8011C98C.. reached absolutely (scratch/glib/tasker)
    "recon/glibdev/gal.c": {"g_value": "0"},      # same: GAL statics addressed absolutely (scratch/glib/gal)
    # Reproduce linker-placed zero commons. These unchanged GAME objects link
    # all text/pool bytes and their typed globals at the retail homes.
    "recon/source/missiles.cpp": {"extra": ["-fconserve-space"]},
    "recon/source/monster.cpp": {"extra": ["-fconserve-space"]},
}


def per_tu_flags(src: Path) -> dict:
    rel = src.resolve().relative_to(ROOT).as_posix()
    return PER_TU_FLAGS.get(rel, {})


def _cc1_env():
    r"""PsyQ's DOS-era cc1/cc1plus write scratch files via TMPDIR/TMP/TEMP and need a
    WINDOWS path WITH a trailing backslash, else `\/ctaNNNNN: No such file or directory`."""
    tmp = BUILD / "tmp" / str(os.getpid()); tmp.mkdir(parents=True, exist_ok=True)   # per-process: parallel cc1 runs clobber fixed scratch names
    env = dict(os.environ); w = str(tmp).replace("/", "\\") + "\\"
    env["TMPDIR"] = env["TMP"] = env["TEMP"] = w
    return env


def run(cmd, **kw):
    cmd = [str(c) for c in cmd]
    kw.setdefault("env", _cc1_env())
    return subprocess.run(cmd, capture_output=True, text=True, **kw)


def _maspsx_assemble(s_file: Path, obj: Path, g_value: str, rel):
    arch = AS_ARCH_SCAFFOLD if str(rel).replace("\\", "/").split("/")[0] in ("src", "skel") else AS_ARCH
    cmd = [PY, MASPSX, f"--aspsx-version={ASPSX_VERSION}",
           "--run-assembler", f"--gnu-as-path={AS}", *arch, f"-G{g_value}",
           "-I", INCLUDE, "-I", ROOT, "-o", obj]
    r = subprocess.run([str(c) for c in cmd], input=s_file.read_text(),
                       capture_output=True, text=True, cwd=ROOT)
    if r.returncode or not obj.exists():
        sys.exit(f"[maspsx/as] {rel}\n{r.stdout}{r.stderr}")


def compile_c(src: Path, skip_asm: bool = False) -> Path:
    """cpp -> CC1PSX (gcc 2.7.2) -> maspsx -> as => build/<rel>.o"""
    rel = src.resolve().relative_to(ROOT)
    flags = per_tu_flags(src)
    g = str(flags.get("g_value", G_VALUE))
    obj = OUT / (str(rel) + ".o"); obj.parent.mkdir(parents=True, exist_ok=True)
    i_file, s_file = obj.with_suffix(".i"), obj.with_suffix(".s")
    cpp = [CPP, *CPP_FLAGS] + (["-DSKIP_ASM"] if skip_asm else []) + [src, "-o", i_file]
    r = run(cpp)
    if r.returncode:
        sys.exit(f"[cpp] {rel}\n{r.stderr}")
    cc1_flags = [f"-G{g}" if f == f"-G{G_VALUE}" else f for f in CC1_FLAGS] + flags.get("extra", [])
    r = run([CC1, *cc1_flags, i_file, "-o", s_file])
    if r.returncode:
        sys.exit(f"[cc1] {rel}\n{r.stdout}{r.stderr}")
    _maspsx_assemble(s_file, obj, g, rel)
    return obj


def compile_cpp(src: Path, skip_asm: bool = False) -> Path:
    """cpp (C mode, -D__cplusplus) -> CC1PLPSX (g++ 2.7.2) -> maspsx -> as"""
    rel = src.resolve().relative_to(ROOT)
    flags = per_tu_flags(src)
    g = str(flags.get("g_value", G_VALUE))
    obj = OUT / (str(rel) + ".o"); obj.parent.mkdir(parents=True, exist_ok=True)
    i_file, s_file = obj.with_suffix(".i"), obj.with_suffix(".s")
    cpp = [CPP, "-x", "c", "-D__cplusplus=1", *CPP_FLAGS] + (["-DSKIP_ASM"] if skip_asm else []) + [src, "-o", i_file]
    r = run(cpp)
    if r.returncode:
        sys.exit(f"[cpp++] {rel}\n{r.stderr}")
    cc1_flags = [f"-G{g}" if f == f"-G{G_VALUE}" else f for f in CC1PL_FLAGS] + flags.get("extra", [])
    r = run([CC1PL, *cc1_flags, i_file, "-o", s_file])
    if r.returncode:
        sys.exit(f"[cc1plus] {rel}\n{r.stdout}{r.stderr}")
    # cfront dtor label: our cc1plus emits `_._Class`; SN's convention is `___Class`
    txt = s_file.read_text().replace("_._", "___")
    txt = txt.replace("_GLOBAL_.I.", "_GLOBAL__I_").replace("_GLOBAL_.D.", "_GLOBAL__D_")   # static ctor/dtor thunks, C-identifier spelling used by configs/symbol_addrs.txt
    s_file.write_text(txt)
    _maspsx_assemble(s_file, obj, g, rel)
    return obj


def compile_any(src: Path, skip_asm=False) -> Path:
    return compile_c(src, skip_asm) if src.suffix.lower() == ".c" else compile_cpp(src, skip_asm)


def main():
    global OUT
    args = sys.argv[1:]
    skip = "--skip-asm" in args
    if "--out" in args:
        i = args.index("--out"); OUT = ROOT / args[i + 1]; del args[i:i + 2]
    files = [ROOT / a for a in args if not a.startswith("--")]
    if not files:
        files = sorted(list(RECON.rglob("*.c")) + list(RECON.rglob("*.cpp")) +
                       list(SRC.rglob("*.c")))
    for f in files:
        obj = compile_any(f, skip)
        print(f"ok  {obj.relative_to(ROOT)}")


if __name__ == "__main__":
    main()
