# Diablo (PlayStation, Japan SLPS-01416) — matching decompilation

Byte-matching C/C++ source reconstruction of the Japanese Diablo PSX build (Climax Studios,
linked 1998-05-29). The Japanese disc shipped its full debug symbols (`DIABPSX.SYM`, MND) and
linker map (`DIABPSX.MAP`), which give function names, types, locals, register assignments and
source line numbers for all 2871 functions — this project turns that into recompilable source
that reproduces `DIABPSX.BIN` byte for byte.

## Toolchain (identified, see `docs/TOOLCHAIN.md`)
* **PsyQ 4.0** — `CC1PSX.EXE` / `CC1PLPSX.EXE` = GNU C/C++ **2.7.2.SN32.3.7**, PsyQ 4.0 libraries.
* Assembler layer: [maspsx](https://github.com/mkst/maspsx) (ASPSX emulator) + `mipsel-none-elf-as`.
* Splitter: [splat](https://github.com/ethteck/splat) 0.50 (`configs/diabpsx.yaml`).

## Layout
* `rom/` — `DIABPSX.BIN` (main image, raw, loads at 0x80010000; gitignored), `DIABPSX.MAP`, `DIABPSX-SYM.txt`
* `configs/` — splat config, `symbol_addrs.txt`, `sections.json` (MAP section table), `sym_fns.json`
* `asm/nonmatchings/<tu>/<fn>.s` — the oracle disassembly per original translation unit
* `src/<tu>.c` — splat scaffold (`INCLUDE_ASM` per function)
* `recon/` — the reconstruction, mirroring the original tree: `source/` (game core, C++), `psxsrc/` (Climax PSX layer, C++), `glibdev/` (Climax GLIB, C)
* `tools/` — `build.py` (compile lane), `verify_asm.py` (THE gate), `diffsrc.py` (diff→source attribution), `symtypes.py` (SYM struct/fn dumper), `gen_config.py`

## Gate
```
python tools/verify_asm.py recon/psxsrc/gman.cpp __7TextDat,OnceOnlyInit__7TextDat
```
`PASS (N insns)` = byte-identical instruction stream vs the retail oracle. Relocation fields are
normalized, local branch targets are exact, and symbolic call/jump targets are verified separately.

The complete seal bar also requires an exact `tools/symlane.py` receipt plus the call-target
and jump-table audits.  Functions affected by maspsx emulation differences are checked through
the real PsyQ ASPSX 2.56 lane (`tools/aspsx_gate.py`) and listed in
`configs/aspsx_passes.txt`.  The reconstruction target is 2727 game functions; the 837 PsyQ SDK
functions are linked from the retail Sony libraries and are excluded from the reconstruction count.
