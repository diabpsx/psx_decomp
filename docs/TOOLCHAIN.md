# Toolchain identity — DIABPSX.BIN (SLPS-01416, 1998-05-29)

## Evidence
1. **Library version = PsyQ 4.0.** Exact byte search of every PsyQ library function blob (extracted
   from `PSX/LIB/*.LIB` with `tools/psyq_extract.py`) against the image: PsyQ 4.0 = 27 hits,
   PsyQ 4.3 = 16 hits. The discriminating set — `AddPrim, AddPrims, CatPrim, GetClut, GetTPage,
   NextPrim, IsEndPrim, TermPrim, SetDrawLoad, SetDrawTPage, SetLineG3, SetLineG4` (LIBGPU) —
   matches the 4.0 bytes and NOT the 4.3 bytes. (Most lib functions carry relocations, so an exact
   search only ever finds the relocation-free ones; a reloc-masked comparison is the follow-up.)
2. **Compiler = the PsyQ 4.0 cc1/cc1plus (gcc 2.7.2.SN32.3.7).** First compiled functions
   (`GMAN.CPP`: `TextDat::TextDat`, `OnceOnlyInit`, `InitData`) byte-match through
   `CC1PLPSX.EXE -quiet -O2 -G8` + maspsx + GNU as.
3. **Language lanes.** `SOURCE/*.CPP` and `PSXSRC/*.CPP` = C++ (gcc-2.x cfront-style mangling
   `Name__7TextDat`, dtors `_._7TextDat` → spelled `___7TextDat` by SN's assembler);
   `GLIBDEV/SOURCE/*.C` (GAL/TASKER/GSYS/…) = C. `PSXSRC/*.MIP` = hand-written MIPS assembly.
4. **Diablo does NOT use PsyQ libgte** — the `GTE_*` functions at the start of `.text` are Climax's
   own GLIB layer (`GTE_SetTransXYZ` @0x8001000C …). PsyQ libgpu/libspu/libcd/libcard/libpad/libc/
   libsn are linked from the 4.0 archives.

## Memory map (from DIABPSX.MAP)
| range | what |
|---|---|
| 80010000–8003017B | `(default)` 8 B + `.boot_text` + unnamed `.text` = GLIB + PsyQ libraries |
| 8003017C–800B031B | per-TU `.NAME_text` sections (game + PSX layer) |
| 800B031C–800B0CFF | `startup_text` (overlay ids 4/5, inside the image) + `.ctors/.dtors` |
| 800B0D00–8010DBAB | `.data` (+ per-TU `.NAME_data`) |
| 8010DBAC–8011A77F | `.rdata` |
| 8011A780–8011C603 | `.sdata`  (**$gp = 0x8011A780** = .sdata start, from the boot code) |
| 8011C604–80139BF3 | Runtime `.sbss` + `.bss`; the raw file instead has a four-byte additive checksum at its 8011C604 boundary (see `tools/image_trailer.py`) |
| 80139BF8+ | overlays b–e: pregame / frontend / game / fmv (+libpress) — separate binaries in LUMP.BIN |

## Overlay debug producer (verified 2026-10-03)

The exact SYM lane requires real overlay metadata, not just separate origins.
PSYLINK 2.52 `OVER(anchor)` groups plus `/v` emit overlay-length/switch records;
the original `SYMMUNGE /i` compactor then reproduces retail's pre-block
resident-static declaration suffix in five FMV/GAME functions. Neither stage
alone reproduces it. The byte and exact record comparators are unchanged.

`tools/symlane.py` selects overlay ownership from `configs/sections.json` and
pool ownership from `configs/native_recon_link.json` plus the MAP. DRLG_L3's
tables stay with its overlay; FMV/GAME small-data/BSS statics stay resident.
The lane preserves raw SYM and the compactor log and checks that CPE bytes do
not change. This reproduces the observed mechanism, not a claim that the
original full retail link script has been recovered.

Native dependency: `C:/Temp/psq45/BIN/SYMMUNGE.EXE`, vendor version 1.56,
SHA-256 `bd51481d903a5d8b55a2f30e7fede023772a5b6e656f50aa242a4663a4e60630`.
`DIAB_SYMMUNGE` can override the location, not the verified hash.
PsyQ 4.0 DOS SYMMUNGE 1.3 was independently tested and gives the same exact
five function receipts. Climax's original Warcraft II makefile also invokes
SYMMUNGE `/i`; details and reproduction commands are in `tools/instr/README.md`.

## Debug-object inspection (2026-10-03)

`tools/psyq_extract.py` now supports the standard source-line-debug record
layout as an explicit fallback dialect. `0x34` contains an offset and a numeric
line increment, not a counted string; `0x38/0x3A/0x3C` are line/end-SLD records,
and function/block markers occupy `0x4A..0x50`. Group records and prefixed
overlay text sections are recognized separately from common storage.
The layouts are independently documented by the
[psy-k parser](https://docs.rs/psy-k/0.4.0/psyk/enum.Section.html) and checked
against original PsyQ 4.0 DUMPOBJ output. These are record dialects, not an SDK
version identification rule.

`parse_obj_complete` requires an actual END record and rejects overrun or a
nonzero unparsed suffix. Unknown records remain errors. The default historical
reader used by existing native SDK receipts is preserved; the extractor and
archive inventory can use the new fallback. No object or instruction is patched.
The original BattleKonchuuden FADE object gives 624 text bytes, 44 read-only
bytes, two function exports and one common, agreeing with DUMPOBJ. Current
FMV, MISSILES and MONSTER debug objects also parse to completion.
All 181 tool tests pass, including six new SLD/object tests and real-object
fixtures replacing mocked parser results in the archive-inventory tests.

## Historical open items (initial toolchain investigation)
* `-G` value (default 8 assumed) and ASPSX version (2.56 assumed) — to be settled by the gp-rel
  census + gates on functions touching small globals.
* Overlay binaries (791 SYM functions live at 80139BF8+) — extract with `divination`'s `dstream`.

## Linux lane
`sh tools/linux_setup.sh && . /home/user/tc/env.sh` builds an equivalent gate lane on Linux (PsyQ 4.0 exes under
wibo, bare-metal `mipsel-none-elf` as/objdump from binutils 2.42, psx_mnd_sym as DUMPSYM) and exports the
`DIAB_*` overrides that build.py / verify_asm.py / symlane.py read. Checked 2026-09-27: `tools/status.py` reproduces
the Windows board function-for-function (2406/2702 excluding the `scratch` segment, whose oracle
`asm/nonmatchings/scratch/` is caught by the `scratch/` .gitignore rule and is not in the repo).
Use the `*-elf` binutils, not Ubuntu's `mips-linux-gnu`: its gas pads `.text` to 16 bytes, which fails the last
function of every TU on a trailing nop.
The earlier Linux receipt predates overlay compaction. The updated overlay lane
also requires the verified SYMMUNGE executable via `DIAB_SYMMUNGE` (and the
host's PE runner); Linux parity has not been revalidated for this change.
