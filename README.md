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

Direct calls and tail calls can be checked with full C++ signatures:
```
python tools/callaudit.py recon/source/items.cpp
python tools/callaudit.py recon/source/automap.cpp DrawAutomap__Fv
```
This compiles the current TU and compares ordered target symbols against its oracles.
It accepts proven address aliases and TU-owned header copies, while preserving parameter
types. SDK and Climax C-library declarations must use C linkage. Jump tables and indirect
function-pointer sources still need their separate checks. The older scratch call audit
strips signatures and must not be used as the final call-target receipt.
The first full strict scan (2026-09-30) checked 129 reconstructed TUs and found
29 needing target fixes or audit routing work. Twenty-six have since been
repaired or routed and re-audited; the remaining three are tracked in
`configs/callaudit_pending.txt`. These are additional seal requirements beyond
the byte/SYM progress count.
The call audit follows `configs/segment_homes.txt` for functions reconstructed
outside their original segment's TU, matching the byte/SYM gate's ownership routing.
