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
`configs/aspsx_passes.txt`.  The reconstruction target is 2727 game entries (2725 functions
and two data-only split artifacts); the 837 library-region entries are excluded
from the reconstruction count. PsyQ SDK functions must be supplied from the
retail Sony archives, not reconstructed.

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
29 needing target fixes or audit routing work. Twenty-eight have since been
repaired or routed and re-audited; the remaining one is tracked in
`configs/callaudit_pending.txt`. These are additional seal requirements beyond
the byte/SYM progress count.
The call audit follows `configs/segment_homes.txt` for functions reconstructed
outside their original segment's TU, matching the byte/SYM gate's ownership routing.
The rescan passes 2724/2725 real function entries, with only `MemcardPad`'s merged
error-sound sites still differing. The board's two extra entries (`dlg` and
`dlg_1`) contain memory-card strings and pointer/format data, not executable
functions. `tools/data_gate.py` now verifies their source-emitted bytes, pointer
relocations, and DLG small-data symbol placements against retail. The board counts
these as data receipts, keeping the requested 2727-entry scope unchanged.

Verify the source-emitted DLG data with `python tools/data_gate.py`.

For an individual relocation-free data symbol, use (for example):
```
python tools/symbol_data_gate.py recon/psxsrc/gpanel.cpp DurColors 0x800B9BCC 18
```
This verifies source bytes and extent, not final placement or a function seal.
When era assembly omits ELF symbol sizes, the tool requires the same source's
real SDB array-size record; section padding is not treated as array data.
Relocated pointer tables are rejected and need a relocation-aware gate.

## Final-image integration is still pending

The function board is not a final reconstructed-image or SDK-linkage receipt.
Currently `configs/recon_link.json` selects 24 reconstructed TUs covering
79 verified function entries. They replace their text scaffolds at the original
addresses. PCIO and DatIO also supply their complete read-only sections,
including diagnostic strings and relocated virtual-method tables, through
`configs/recon_data_link.json`. The other selected objects own no runtime data.
`python tools/link.py` verifies the resulting mixed-source images: the main
image's 1,099,272 retail bytes plus 120,300 bytes of zero BSS, and all four
overlay images, match exactly. This checks callback-address, cross-image-call,
and external-data relocations after linking, not merely normalized fields.
`configs/cross_image_symbols.json` explicitly binds main's `DrawAutomap` and
`DrawInv` references to game-overlay exports. The generator requires a unique
retail function address in the home image's symbol map and emits `PROVIDE`,
so it cannot override a source/object definition. `tools/gen_ld.py`
otherwise selects skeleton/scaffold objects, and `src/lib.c` supplies the library
region through `INCLUDE_ASM`, except for `InitHeap`: `tools/sdk_link.py` extracts
the unchanged `LIBAPI.LIB` member `C57` and links it at its retail address with
original PSYLINK. The GNU scaffold imports the verified, unchanged CPE payload
through a format bridge. `configs/sdk_link.json` selects this one entry; archive,
member, and linked-payload hashes are recorded in `build/sdk/native/receipts.json`.
This lane currently supports only self-contained, single-entry text members.
The remaining library entries still use scaffolds; this does not increase the
game-function board, which remains 2682/2727 with 45 functions not PASS.
That region also contains Climax GLIB routines (for example `GTE_SetTransXYZ`),
so the 837 excluded entries are not all Sony SDK functions. Final integration
must replace the remaining scaffolds with verified reconstructed TUs and the appropriate
retail library inputs, then verify all linked images and relocations. None of
these integration requirements is waived by the per-function PASS count.

Whole source-data placements must match the retail fragment kind and extent,
belong to reconstructed text in that image, and cannot place a source section
twice. The linker asserts the emitted extent and rejects orphan runtime
sections or common storage needing placement support. Partial/sparse source
sections and source global constructor/destructor lists still require further
integration support.

`python tools/sdk_provenance.py` screens the excluded library region against
original PsyQ 4.0 archive members and writes `build/sdk_provenance.json`.
Current strict screening identifies 122/837 entries with archive-backed
candidates; this is NOT a library PASS or link receipt. It checks exact archive
membership, function extents, and unrelocated instruction bits, records input
hashes, and rejects unknown/full-word patch masks. Relocation target expressions,
archive extraction/selection, stripped-function boundaries, and non-Sony library
provenance still need their own verification before the scaffold can be replaced.
