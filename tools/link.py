#!/usr/bin/env python3
"""link.py — full-image link check: assemble every splat data/asm object, build the TUs
(tools/build.py), link with the splat linker script and compare the binary with the retail image.

    python tools/link.py [diabpsx|frontend|pregame|game|fmv ...]   # default: all five

For each image: build/<name>.elf, build/<name>.bin, build/<name>.map and a byte comparison
against rom/<IMAGE>.BIN. Main also emits a .runtime.bin with exact MAP-derived
zero BSS; its .bin serializes only initialized payload plus computed checksum.
Other images may have a zero-filled tail after the retail file extent."""
import json, os, re, subprocess, sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools"))
import build as B
from data_gate import Elf

LD = B.MIPS / "mipsel-none-elf-ld.exe"
OBJCOPY = B.MIPS / "mipsel-none-elf-objcopy.exe"
IMAGES = {"diabpsx": "DIABPSX.BIN", "frontend": "FRONTEND.BIN", "pregame": "PREGAME.BIN", "game": "GAME.BIN", "fmv": "FMV.BIN"}

def validate_runtime_sections(elf, selected):
    """Do not silently let unplaced source data become linker orphan sections."""
    discarded = {".reginfo", ".comment", ".pdr", ".gnu.attributes", ".MIPS.abiflags"}
    for name, section in zip(elf.names, elf.sections):
        if section[2] & 2 and section[5] and name not in selected:
            if name not in discarded and not name.startswith(".mdebug"):
                raise ValueError(f"source runtime section has no explicit placement: {name}")
    if any(index == 0xFFF2 for symbols in elf.symbols.values()
           for name, value, size, info, other, index in symbols):
        raise ValueError("source common symbols need explicit placement support")

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
    if name == "diabpsx":
        import sdk_link
        sdk_link.build()
    import native_archive
    archive_registry = json.loads((ROOT / 'configs/native_archive_link.json').read_text())
    archive_groups = [entry for entry, spec in archive_registry.items() if spec['image'] == name]
    if archive_groups:
        native_archive.build(archive_groups)
    import native_recon
    native_registry = json.loads((ROOT / 'configs/native_recon_link.json').read_text())
    native_text_sources = {spec['source'] for spec in native_registry.values()
                           if any(row.get('link_object') for row in spec['sections'].values())
                           and any(s == '.text' or s.startswith('.text.') for s in spec['sections'])}
    bss_path = ROOT / 'configs/recon_bss_link.json'
    conventional_bss = json.loads(bss_path.read_text()).get(name, {}) if bss_path.exists() else {}
    conventional_sources = json.loads((ROOT / 'configs/recon_link.json').read_text())
    if any(name == spec['image'] or any(row.get('image', spec['image']) == name
           for row in spec['sections'].values()) for spec in native_registry.values()):
        native_recon.build()
    subprocess.run([sys.executable, str(ROOT / 'tools' / 'gen_ld.py'), name], check=True, cwd=ROOT)   # ROM-order script, pinned addresses
    ld_script = ROOT / "linkers" / f"{name}.ld"
    txt = ld_script.read_text()
    objs = sorted(set(re.findall(r"(build/\S+?\.o)\(", txt)))
    inputs = {}
    for obj, section in re.findall(r"(build/\S+?\.o)\((\.[\w.]+)\)", txt):
        inputs.setdefault(obj, set()).add(section)
    for o in objs:
        op = ROOT / o
        if o.startswith(("build/sdk/native/", "build/native_source/", "build/native_archive/")):
            assemble_raw(ROOT / o[:-2], op)
        elif o.startswith("build/asm/"):
            src = ROOT / o[len("build/"):-2]
            if not op.exists() or op.stat().st_mtime < src.stat().st_mtime:
                assemble_raw(src, op)
        elif o.startswith("build/src/"):
            src = ROOT / o[len("build/"):-2]
            seg_dir = ROOT / "asm" / "nonmatchings" / src.stem        # the INCLUDE_ASM'd .s files are inputs too
            newest = max([src.stat().st_mtime] + [f.stat().st_mtime for f in seg_dir.glob("*.s")] if seg_dir.exists() else [src.stat().st_mtime])
            if src.stem == "lib" or not op.exists() or op.stat().st_mtime < newest:
                B.compile_any(src)
        elif o.startswith("build/skel/"):
            src = ROOT / o[len("build/"):-2]
            seg_dirs = [ROOT / "asm" / "nonmatchings" / d for d in re.findall(r'INCLUDE_ASM\("asm/nonmatchings/(\w+)"', src.read_text(encoding="utf-8"))]
            newest = max([src.stat().st_mtime] + [f.stat().st_mtime for d in set(seg_dirs) for f in d.glob("*.s")])
            if not op.exists() or op.stat().st_mtime < newest:
                B.compile_any(src)
        elif o.startswith("build/recon/"):
            src = ROOT / o[len("build/"):-2]
            if src.suffix.lower() == ".s":
                assemble_raw(src, op)
                if o[len("build/"):-2] in native_text_sources:
                    # A hand-authored source whose data section is linked directly (`link_object`) may also
                    # carry code; that code is placed from the native lane's verified text bridge, so the
                    # GNU-assembled text (and its symbols) is removed from the object before the link.
                    r = subprocess.run([str(OBJCOPY), "-w", "-R", ".text*", str(op)], capture_output=True, text=True)
                    if r.returncode:
                        sys.exit("[objcopy] " + o + "\n" + r.stderr)
                continue
            hdrs = [f for f in (ROOT / "recon").rglob("*.h")]
            newest = max([src.stat().st_mtime] + [f.stat().st_mtime for f in hdrs])
            if not op.exists() or op.stat().st_mtime < newest:
                B.compile_any(src)
        else:
            sys.exit(f"unknown object in ld script: {o}")
        if o.startswith("build/recon/"):
            validate_runtime_sections(Elf(op), inputs[o])
            from recon_bss import validate_object
            for owner, sections in conventional_bss.items():
                if o == f'build/{conventional_sources[owner]}.o':
                    validate_object(Elf(op), sections)
    extra = [ROOT / "linkers" / f"undefined_syms_auto{'' if name == 'diabpsx' else '_' + name}.txt",
             ROOT / "linkers" / f"undefined_funcs_auto{'' if name == 'diabpsx' else '_' + name}.txt"]
    cmd = [str(LD), "-EL", "-T", str(ld_script)] + sum([["-T", str(e)] for e in extra if e.exists() and e.stat().st_size], []) + \
          ["-Map", str(ROOT / "build" / f"{name}.map"), "--no-check-sections", "-o", str(ROOT / "build" / f"{name}.elf")]
    r = subprocess.run(cmd, capture_output=True, text=True, cwd=ROOT)
    if r.returncode:
        sys.exit(f"[ld] {name}\n{r.stdout}{r.stderr[-4000:]}")
    runtime_path = ROOT / 'build' / (f'{name}.runtime.bin' if name == 'diabpsx' else f'{name}.bin')
    subprocess.run([str(OBJCOPY), "-O", "binary", str(ROOT / "build" / f"{name}.elf"), str(runtime_path)], check=True, cwd=ROOT)
    if name == 'diabpsx':
        from image_trailer import map_extents, serialize_runtime
        payload_size, bss_size = map_extents((ROOT / 'rom/DIABPSX.MAP').read_text(encoding='latin-1'))
        serialized = serialize_runtime(runtime_path.read_bytes(), payload_size, bss_size)
        (ROOT / 'build' / f'{name}.bin').write_bytes(serialized)
        print(f'{name}: runtime verified, {bss_size} zero BSS bytes; checksum serialized separately')
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
