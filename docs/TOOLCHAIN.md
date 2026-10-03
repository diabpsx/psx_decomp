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

## Native MISSILES common storage and overlay receipts (2026-10-03)

The MISSILES native import now uses `-fconserve-space` for its uninitialized
public definitions. Stock GCC 2.7.2 `cp/decl.c:6027-6033` documents its
`DECL_COMMON` behavior. This reproduces the required link ownership and all
relocated bytes; it does not uniquely recover the original driver command.
No per-function instruction or record exception is used.

`native_commons.py` validates every compiler XBSS against explicit retail
symbol/size/storage metadata, assembles zero storage with original ASPSX and
links it with PSYLINK. One aligned bank holds seven named allocations (ten
bytes); 49 intervening/alignment bytes are scaffold carriers, not source
payload. Only the verified allocation slices enter the main data bridge.
The constant small-data section owns 45 bytes. Its final byte shares a scalar
scaffold row with three alignment bytes; the bridge requires matching literal
and byte annotation before preserving that suffix verbatim outside the import.

For overlay text with resident initialized pools, `sdk_link.native_link` uses
separate vendor `FILE` outputs so overlapping anchor/overlay-ID headers never
enter the runtime payload. Each section's extent/address is checked against
the native map. Raw SYM identifies the exact four-byte headers; SYMMUNGE then
produces all 115 exact function receipts without changing any payload file.
The ordinary CPE reader remains strict and unchanged.

All 69,488 text bytes, 1,272 read-only bytes (including jump tables), 45
constant small-data bytes and seven typed commons match. The main image and
four overlays pass complete comparisons. Native-source coverage is now
1,249 functions in 91 TUs at the MISSILES checkpoint, plus 19 conventional
source functions in one TU.

The subsequent MONSTER import adds 105 functions, 50,944 exact text bytes,
240 read-only bytes, 19 small-data bytes and two exact four-byte commons.
Its counselor table and wipe-counter records pass original overlay compaction
at the retail addresses. The source retains ordinary declarations and uses
the same measured common-data lane. All five images and 189 tests pass;
native-source coverage at that checkpoint is 1,354 functions in 92 TUs (1,373/93 including
the conventional lane). Large data arrays still supplied by scaffolds are
not counted as reconstructed by these emitted-section receipts.

INV subsequently adds 57 functions and uses the ordinary compiler flags.
Applying `-fconserve-space` there incorrectly changes three BRect member stores
to absolute addressing. Correct original owner declaration order, initializers
and header-constructor placement instead produce 44,260 exact text bytes,
896 read-only bytes, 104 small-data bytes and 23 exact global SYM records.
All five images and the full board remain exact at their existing scope;
190 tests pass. Current coverage is 1,411 native functions in 93 TUs plus
19 conventional functions, or 1,430 functions in 94 TUs. Function-level
relocation normalization alone had hidden reversed texture selection and
missing global initial values in this TU.

AUTOMAP then completes GAME's five source-text owners. Its 19 functions,
7,880 text bytes, 72 read-only bytes, 60 small-data bytes and 24 initialized
data bytes match, along with 12 global records. Restored ordinary declarations
give AutoMapScale its original4 initializer and AutoMapOt its original240
initializer; previously anonymous/missing storage is named from retail SYM.
No new compiler override is needed. All five images and192 tests pass.
Native coverage is1,430 functions/94 TUs; including the conventional lane,
1,449/95. GAME has297 source-linked functions and only its four-byte file ID
outside those code fragments; referenced resident data can still be scaffolded.

## DRLG_L1 packed zero storage and complete overlay import (2026-10-03)

DRLG_L1's six file-static UCHAR flags distinguish original assemblers: ASPSX
2.56 emits a 24-byte `.sbss` allocation, while 2.67 emits six contiguous bytes
at retail's `0x8011C8D8..0x8011C8DD`. The native registry therefore explicitly
selects 2.67 for this TU, retaining its uninitialized source declarations.
Initialized-flag probes are not retained. A verified four-byte resident `.sdata`
anchor supplies PSYLINK's internal GP base but is never exported as source data.

The same import restores original table storage/order and the public themeLoc,
L5ConvTbl and L5dungeon definitions, with unchanged bodies in retail function
order. Complete sections are 21,060 text, 52 read-only, 8,280 initialized data
and six BSS bytes; 40 function records and 17 global records match exactly.
The former nine data scaffolds were mechanically regrouped into two compiler
section extents, preserving all 2,593 addressed data directives and labels.
Missing end-label metadata was supplied at original fragment boundaries;
three end labels now also include their original alignment bytes. Otherwise
the format bridge imports those bytes and then emits them a second time.
The regression test assembles the final GNU data wrapper and checks all 8,280
bytes, separately from the native object. No data value, instruction,
comparator or compiler flag was changed.

All five final-image comparisons and 204 tool tests pass; the selected board,
ordered-call audit and return-declaration audit each pass 40/40. Native-source
coverage is 1,470 functions in 95 TUs (1,489/96 including the conventional lane).
This does not increase the 2725/2727 board or resolve broader source-review and
library-linkage work.

## DRLG_L4 original names and complete storage (2026-10-03)

DRLG_L4 uses ordinary compiler flags and ASPSX 2.56. Native receipts reproduce
all 24,112 text bytes, 123 read-only bytes, 7,220 initialized-data bytes, 60
small-data bytes and 28 BSS bytes. The seven file-static pointers are restored
as lpSetPiece1..4 then lppSetPiece2..4 at 0x8011C8E8..0x8011C900; the `b` files
use the lpp slots, independently confirmed from each original call address.
recurs belongs at the beginning of initialized small data (0x8011BF78), not in
the cache-pointer BSS bank. The formerly external dung/hallok/L4dungeon arrays
are defined in their original overlay, before the writable miniset tables.

All 36 function records and 32 global type/address records match. The 6,136-byte
GP prefix is borrowed scaffold, not exported source data. The final string-pool
alignment byte likewise remains scaffold-owned. The dedicated native test also
assembles both GNU data wrappers and compares their complete 124/7,220-byte
extents, covering retained alignment and avoiding duplicate inter-label bytes.
The three old scaffolds were regrouped without changing any of their 2,247
addressed data directives. No section-routing transform or instruction rewrite
is involved. Source body comparison against HEAD differs only in restoration
of the seven recorded cache names.
All five linked images and 205 tool tests pass. Source-linked coverage is now
1,525 functions across 97 TUs (1,506/96 native plus 19/1 conventional).
The overall 2725/2727 board and 349 original-library imports are unchanged;
DRLG_L2 section-routing approval is still pending and no such route is used.

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
