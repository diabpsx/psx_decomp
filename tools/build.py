#!/usr/bin/env python3
"""build.py — Diablo PSX (SLPS-01416) matching-decomp build driver.

Toolchain identity (see docs/TOOLCHAIN.md): game/PSX objects use PsyQ 4.0 —
CC1PSX/CC1PLPSX gcc 2.7.2.SN32.3.7 — while Climax GLIB objects use the
reviewed gcc 2.6.3-compatible/ASPSX 2.34 lane. The ordinary lane is cpp ->
real PsyQ cc1/cc1plus -> maspsx (aspsx emulator)
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
    # VERSION.CPP was compiled on the timestamp embedded in the retail object.
    # Preserve the original source's __DATE__/__TIME__ use while reproducing
    # that preprocessing environment.
    "recon/source/startup_1.cpp": {"cpp_extra": [
        '-D__DATE__="May 29 1998"', '-D__TIME__="14:30:45"']},
    # Retail CREDITS_text is one overlay group ordered as two header literals,
    # initialized tables, the later PRIMPOOL.H literal, then code.  The vendor
    # object therefore gives the post-.data literal its own section identity.
    "recon/psxsrc/credits.cpp": {"split_section_after": {
        "after": ".data", "section": ".rdata", "as": ".rdata.credits_tail"}},
    # Retail DIALOG.CPP packs its four file-static byte arrays into one 16-byte
    # small-BSS bank instead of ASPSX's default four-byte-per-.lcomm spacing.
    "recon/psxsrc/dialog.cpp": {"pack_lcomm": {
        "section": ".sbss", "size": 16,
        "symbols": [["DialogGBack", 0, 1], ["GShadeX", 1, 1],
                    ["GShadeY", 2, 1], ["RandBTab", 8, 8]]}},
    # MEMCARD_text interleaves initialized strings, two zero-filled banks and
    # code in one overlay group; its resident small-data order also starts with
    # the invalid-character flag before the two filename literals.
    "recon/psxsrc/memcard.cpp": {
        "route_symbol_sections": {
            "card_dir": ".data.memcard_zeros",
            "card_header": ".data.memcard_zeros"},
        "move_symbol_before": {
            "symbol": "to_ascii_invalid_char", "size": 4, "before": "$LC0"},
        "section_occurrence_renames": [
            {"section": ".rdata", "occurrence": 2, "as": ".text"}]},
    "recon/psxsrc/biglump.cpp": {"move_symbols_before": [
        {"symbol": "BL_NoLumpFiles", "size": 4, "before": "FileLoaded"},
        {"symbol": "BL_NoStreamFiles", "size": 4, "before": "FileLoaded"},
        {"symbol": "LFileTab", "size": 4, "before": "FileLoaded"},
        {"symbol": "SFileTab", "size": 4, "before": "FileLoaded"},
        {"symbol": "NoQuedAsyncs", "size": 1, "before": "CurrAsync"}]},
    "recon/psxsrc/stream.cpp": {"move_initialized_after": [
        {"symbol": "Time", "directive": "word", "value": "0", "after": "$LC4"},
        {"symbol": "CDWAIT", "directive": "word", "value": "0", "after": "$LC4"}]},
    "recon/psxsrc/cplayer.cpp": {
        "move_symbol_before": {
            "symbol": "_7CPlayer.PActiveArray", "size": 8, "before": "$LC3"},
        "move_literals_after": [
            {"label": "$LC0", "literal": "psxsrc/primpool.h\\000", "after": "$LC2"}]},
    "recon/psxsrc/cardcore.cpp": {"move_symbols_before": [
        {"symbol": "MemCardActive", "size": 4, "before": "never_hooked_events"},
        {"symbol": "MemcardOverlay", "size": 4, "before": "never_hooked_events"},
        {"symbol": "NewCardFlag", "size": 4, "before": "never_hooked_events"},
        {"symbol": "countdownloadcharblock", "size": 4, "before": "never_hooked_events"},
        {"symbol": "mem_card_event_handler", "size": 4, "before": "card_side_empty"},
        {"symbol": "saveflag", "size": 4, "before": "card_side_empty"},
        {"symbol": "loadflag", "size": 4, "before": "card_side_empty"},
        {"symbol": "formatflag", "size": 4, "before": "card_side_empty"},
        {"symbol": "DoLoadedGame", "size": 4, "before": "card_side_empty"}]},
    "recon/psxsrc/ctrl.cpp": {"pack_lcomm": {
        "section": ".sbss", "size": 16,
        "symbols": [["ctrl_select_line", 0, 1], ["ctrl_select_side", 1, 1],
                    ["ckeyheld", 2, 1], ["CtrlRect", 8, 8]]}},
    "recon/psxsrc/options.cpp": {"pack_lcomm": {
        "section": ".sbss", "size": 40,
        "symbols": [["Slider", 0, 4], ["sw", 4, 4], ["sx", 8, 4],
                    ["sy", 12, 4], ["Adjust", 16, 1], ["qspin", 17, 1],
                    ["lqspin", 18, 1], ["OrigLang", 20, 4],
                        ["OldLang", 24, 4], ["NewLang", 28, 4],
                        ["ORect", 32, 8]]}},
    "recon/psxsrc/block.cpp": {"pack_lcomm": {
        "section": ".bss.block_xy", "size": 28,
        "symbols": [["dx", 0, 12], ["dy", 16, 12]]}},
    "recon/source/diablo.cpp": {
        "route_symbol_sections": {"D_8012EC28": ".bss.diablo_jmp"},
        "pack_lcomm": {
            "section": ".bss.diablo_seeds", "size": 308,
            "symbols": [["glEndSeed", 0, 68], ["glMid1Seed", 80, 68],
                        ["glMid2Seed", 160, 68], ["glMid3Seed", 240, 68]]}},
    "recon/source/drlg_l2.cpp": {
        "extra": ["-fwritable-strings"],
        "section_occurrence_renames": [
            {"section": ".rdata", "occurrence": 1, "as": ".text"}],
        "pad_before_labels": {"$L429": 4}},
    # Retail FMV keeps LoPlayFMVOverLay's six-entry language switch table in
    # the overlay text stream; moving the final readonly occurrence before
    # ASPSX preserves both its relocated words and the branch displacements.
    "recon/psxsrc/fmv.cpp": {"section_occurrence_renames": [
        {"section": ".rdata", "occurrence": 8, "as": ".text"}]},
    "recon/psxsrc/dlg_2.cpp": {"section_occurrence_renames": [
        {"section": ".rdata", "occurrence": 4, "as": ".rdata.dlg_formats"},
        {"section": ".rdata", "occurrence": 4, "as": ".rdata.dlg_formats"}]},
    "recon/source/misprint.cpp": {"section_occurrence_renames": [
        {"section": ".rdata", "occurrence": 2, "as": ".rdata.misprint_prim"}]},
    "recon/eaclib/blkfill.s": {"g_value": "0"},
    "recon/eaclib/crc.s": {"g_value": "0"},
    "recon/eaclib/getm.s": {"g_value": "0"},
    "recon/eaclib/nasync_debug.c": {"g_value": "0", "compiler": "gcc-2.6.3"},
    "recon/eaclib/savegp.c": {"g_value": "0", "compiler": "gcc-2.6.3"},
    "recon/eaclib/textcrnt.c": {"g_value": "0", "compiler": "gcc-2.6.3"},
    # EA Canada EACLIB C members (lib segment, 2026-10-04 round): measured identity = PsyQ 3.6 DOS
    # CC1PSX "2.7.2.SN.1" at -O2 -G8 -fsigned-char with ASPSX 2.56 default divide guards (registry key
    # "divide_guard"); the PsyQ 4.0 cc1 differs only in sched1 load placement, the gcc 2.6.3 lane
    # in the small-li form (ASPSX < 2.50).  libddx (ddx.c) alone is -O1 -G0 with an ASPSX < 2.50.
    **{f"recon/eaclib/{name}.c": {"g_value": "8", "compiler": "psyq36-dos"} for name in (
        "lock", "systask", "getcycle", "addtimer", "inittmr", "timer", "filesize", "filexist", "iocoord",
        "loadcall", "eac_async", "abortmsg", "cdstream", "exit", "filename", "stricmp", "strnicmp", "blockio",
        "cdrom", "eac_fileio", "memman", "cache", "compact", "resize", "validmem", "loadfat", "seekmsec",
        "callback")},
    "recon/eaclib/ddx.c": {"g_value": "0", "compiler": "gcc-2.6.3", "extra": ["-O1"]},
    "recon/eaclib/blkmov.s": {"g_value": "0"},
    "recon/eaclib/print.s": {"g_value": "0"},
    # Climax hand-assembly PSXSRC/*.MIP transcriptions (assembler-neutral .s)
    **{f"recon/psxsrc/{name}.s": {"g_value": "0"} for name in ("boot", "gte", "replace", "crunch", "gp", "ablock")},
    # Climax GLIB C modules use absolute addressing even for four-byte owned
    # commons (TICK/GazTick), proving their original small-data threshold was 0.
    "recon/glibdev/gmain.c": {"g_value": "0"},
    "recon/glibdev/tick.c": {"g_value": "0"},
    "recon/glibdev/tasker.c": {"g_value": "0", "compiler": "gcc-2.6.3",
        "split_lcomm": {"SchEnv": {"size": 48, "section": ".bss.sch"}}},
    "recon/glibdev/gal.c": {"g_value": "0", "compiler": "gcc-2.6.3",
        "split_lcomm": {"MemHdrBlocks": {"size": 5600, "section": ".bss.hdr"}}},
    "recon/glibdev/gutils.c": {"g_value": "0", "compiler": "gcc-2.6.3"},
    "recon/glibdev/gtimsys.c": {"g_value": "0", "compiler": "gcc-2.6.3"},
    "recon/glibdev/vrip.c": {"g_value": "0", "compiler": "gcc-2.6.3"},
    "recon/glibdev/gsys.c": {"g_value": "0", "compiler": "gcc-2.6.3"},
    "recon/glibdev/gdebug.c": {"g_value": "0", "compiler": "gcc-2.6.3"},
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
    cpp = [CPP, *CPP_FLAGS, *flags.get("cpp_extra", [])] + (["-DSKIP_ASM"] if skip_asm else []) + [src, "-o", i_file]
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
    cpp = [CPP, "-x", "c", "-D__cplusplus=1", *CPP_FLAGS, *flags.get("cpp_extra", [])] + (["-DSKIP_ASM"] if skip_asm else []) + [src, "-o", i_file]
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
