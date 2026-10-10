# Toolchain identity — DIABPSX.BIN (SLPS-01416, 1998-05-29)

## Evidence
1. **Library version = PsyQ 4.0.** Exact byte search of every PsyQ library function blob (extracted
   from `PSX/LIB/*.LIB` with `tools/psyq_extract.py`) against the image: PsyQ 4.0 = 27 hits,
   PsyQ 4.3 = 16 hits. The discriminating set — `AddPrim, AddPrims, CatPrim, GetClut, GetTPage,
   NextPrim, IsEndPrim, TermPrim, SetDrawLoad, SetDrawTPage, SetLineG3, SetLineG4` (LIBGPU) —
   matches the 4.0 bytes and NOT the 4.3 bytes. (Most lib functions carry relocations, so an exact
   search only ever finds the relocation-free ones; a reloc-masked comparison is the follow-up.)
2. **Game compiler = the PsyQ 4.0 cc1/cc1plus (gcc 2.7.2.SN32.3.7).** First compiled functions
   (`GMAN.CPP`: `TextDat::TextDat`, `OnceOnlyInit`, `InitData`) byte-match through
   `CC1PLPSX.EXE -quiet -O2 -G8` + maspsx + GNU as.
3. **Language lanes.** `SOURCE/*.CPP` and `PSXSRC/*.CPP` = C++ (gcc-2.x cfront-style mangling
   `Name__7TextDat`, dtors `_._7TextDat` → spelled `___7TextDat` by SN's assembler);
   `GLIBDEV/SOURCE/*.C` (GAL/TASKER/GSYS/…) = C and independently matches the
   gcc 2.6.3-compatible `-O2 -G0` lane with original ASPSX 2.34.
   `PSXSRC/*.MIP` = hand-written MIPS assembly.
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

## Overlay-id words and the reserved MAP member (2026-10-10)

The retail SYM opens with six overlay records: id 4 `startup_text` (0x800B031C, 0x9E4),
id 5 `map_data` (0x800B031C, 4) and ids b-e for the LUMP overlays. PSYLINK 2.52 numbers
groups in declaration order (`(default)`=1, `boot_text`, `text`, `startup_text`=4,
`map_data`=5, data/rdata/sdata/sbss/bss, then the four LUMP overlays = b-e) and writes
each OVER group's id as the four-byte `$<group>` word at the group's org; when two groups
share an org the later group's word is what the image keeps, which is why the main image
reads 5 at 0x800B031C. `map_data` has exactly one member: the object MAP, whose only
section is an empty `.data` (`__MAP_data_obj = __MAP_data_objend = 0x800B0320`,
`__MAP_data_size = 0`, no text, no SLD records). It is a reserved placeholder, kept as
`recon/psxsrc/map.s` (one `.data` directive).

`tools/link_symbols.py` derives the six ids from that group order, checks them against
the SYM overlay records, and derives `_startup_text_*`, `_map_data_*` and `__MAP_data_*`
from the layout; `tools/gen_ld.py` emits every id word as the link's own `LONG(_<group>_id)`
and places the MAP object between its `__MAP_data_org/_orgend` marks. The former
`asm/data/*_hdr.data.s` scaffold words are gone. The per-TU SYM lane still models only the
four LUMP overlays, so STARTUP's `set overlay $4` switch is not reproduced there.

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

## LIGHTING native integration (2026-10-03)

LIGHTING now supplies all 7,412 text bytes, 14 read-only bytes, 4,668 data bytes,
52 small-data bytes, 44 small-BSS bytes and 128 BSS bytes. All 28 function and
31 global SYM records match at their retail addresses. The 2,749-byte CrawlTable
is copied from the original Hellfire source and independently byte-compared;
the existing vCrawlTable/RadiusAdj initializers likewise match. Restore RGB
defaults are 16, and mult_tab is the recorded 128-byte static array, not the
previous 192-byte reconstruction-only g_lightband. The eight reconstruction
aliases are replaced by recorded static names. No function logic changed.

The real header supplies the otherwise-unused gman.h literal. The two remaining
pool alignment bytes and 4,468-byte borrowed GP prefix remain scaffold-owned.
The dedicated regression verifies complete linked sections, every global, and
both final GNU data wrappers. Standard compiler flags and ASPSX 2.56 suffice.
DoLighting is separately reviewed in aspsx_passes.txt: real ASPSX matches 821
instructions; maspsx adds one nop after the global declaration restoration.
The exact comparator is unchanged. Focused status and call audit are 28/28;
all 219 tool tests pass. The main final image is 1,099,272 bytes identical,
with 120,304 zero runtime
BSS bytes verified and checksum serialized separately. Overlay links were not
rerun for this main-only integration.

Source-linked coverage is now 1,553 functions/98 TUs (1,534/97 native plus 19/1
conventional). The game board remains 2725/2727; no additional drawing PASS is
claimed. DRLG_L2 routing remains unapproved and inactive.

## QUESTS native integration complete (2026-10-03)

QUESTS now supplies all 7,784 text bytes, 33 read-only bytes, 632 data bytes,
84 small-data bytes, 8 small-BSS bytes, 80 BSS bytes and both four-byte
constructor/destructor entries. All 26 function and 27 global SYM records match.
Standard flags and ASPSX 2.56 are used; no section routing, common allocation,
symbol alias or generated-name rewrite is involved.

The decisive missing source was the original `CTextFileInfo::HasTp()` and
`HasDat()` inline header. Even unused, those inlines emit `.tp\0.dat\0` at the
start of the TU's small-data section: nine bytes from BA20 through BA28,
placing initialized `questlog` at BA29 and the aligned `ALLQUESTS` at BA2C.
The source's original CPlayer header contributes its read-only diagnostic name;
Dialog and CBlocks methods are restored to their original in-class form and
emission order. The read-only scaffold now spells the same 36 retail bytes as
two strings plus explicit retained alignment/tail bytes, allowing the strict
bridge to attribute exactly 33 source bytes without hiding the three following
scaffold bytes.

A full-address scratch link exposed thirteen incorrect data operands hidden by
the normalized 26/26 function gate. SetReturnLvlPos's Poisoned Water arm read
the Banner quest. ResyncQuests confused Mushroom active/var1/var2 fields,
addressed the wrong healer row in Qtalklist, and used the Veil sublevel/var2
instead of level/var1. DrawQuestLog used questlist's message instead of log-text
ID. Retail addresses and original Hellfire QUESTS.CPP agree on the corrections;
the literal SpawnQuestItem selection flag of 1 also preserves the retail stream.
The source corrections remain 26/26 byte/SYM PASS and 26/26 ordered calls.
test_quests_data_offsets.py compiles and links the live source with the original
tools and checks all thirteen affected instruction words without masking their
data relocations. It is a targeted regression, not a whole-TU native seal.

Before the original header was identified, a scratch candidate restored declaration order, original header
methods and owned storage. Its 33-byte pool, 632-byte data, 76-byte small-data,
8-byte small-BSS, 80-byte BSS and both constructor/destructor words agree.
All 26 function records agree, but questlog is still placed at 0x8011BA28 rather
than the recorded 0x8011BA29. Five text operands therefore differ across the
7,784-byte section. No fabricated byte or symbol alias is added to conceal this;
That intermediate result is superseded by the exact native integration. Its
diagnostic history remains under build/quests_native_probe, produced by
scratch/prepare_quests_native.py and scratch/probe_quests_native.py.

The existing common-symbol route was tested separately (`--common` on both
scratch scripts). A tentative questlog with `-fconserve-space`, bound at BA29,
and initialized small data starting at BA2C makes every emitted section byte
exact. It is nevertheless rejected: GCC names the generated initialization
functions `_GLOBAL_.I.ALLQUESTS` / `_GLOBAL_.D.ALLQUESTS`, not retail's questlog
names. The original SN16 DOS frontend gives the same names on the identical
preprocessed input. Stock 2.7.2 varasm.c explains this: common emission skips
the first_global_object_name assignment used by tree.c's initializer naming.
No flags, common allocation, function aliases or name rewrites are adopted.
The DOS diagnostic and hashes are in build/quests_dos_common/report.json;
the native common experiment is build/quests_native_probe/common_report.json.

`test_quests_native.py` proves complete sections, all records, the four final
data wrappers and the two header literals. `test_quests_data_offsets.py` keeps
the thirteen formerly hidden operands under direct linked-word comparison.
Focused status and ordered calls are 26/26; all 221 tool tests pass. The main
image is 1,099,272 bytes identical, including 120,304 zero runtime-BSS bytes
and the separately serialized checksum. Source-linked coverage is now 1,579
functions/99 TUs (1,560/98 native plus 19/1 conventional). At QUESTS integration
time the game board remained 2725/2727. A subsequent independent
DrawObjSelector source update passes its full byte/SYM/call seal, bringing the
freshly rescanned board to 2726/2727; only DrawSpellCel remains.

## Game board complete; library-region content audit (2026-10-04)

`DrawSpellCel` now matches from authentic spell-strip geometry rather than the
previously parked cancellation device. Gold CONTROL.CPP names left/right spell
edges; PSX derives `SPLICONLEFT` from the dynamic right edge and icon count.
The negative logical column is scaled and offset by left edge plus total strip
width. GCC combines away that arithmetic, leaving the four USE reservations
required for retail's 216-byte frame. With SLD order X,Y,SW,SH the function is
737/737, exact SYM, 25/25 calls and exact return declaration. CONTROL is51/51;
the complete board is **2727/2727 PASS**.

This does not by itself complete library linkage. Native Sony archive receipts
cover349 of the837 excluded-region entries. Retail body SYM assigned146 of the
then-remaining488 to Climax GLIB source and left342 unclassified. A content-based
screen across7,274 unique local objects found no new Sony import. Relocation-
masked raw hits are highly ambiguous for tiny wrappers; preserving patch
expressions and symbol-number mappings reduces the nontrivial exact-target set
to two GTIMSYS wrappers, and retail SYM proves those are Climax source. The
screen is evidence for classification, not permission to alias GLIB names to
LIBGS exports. `GTIMSYS_GetTimer` and ResetTimer source bodies independently
PASS; InitTimer remains a five-difference near-match.

The first full GLIB source TU, GMAIN.C, is now native-linked through the
extra-only routing lane. Its source object owns only `.text.lib`; the native
registry verifies all 80 bytes/SYM/bindings, and the mixed `lib` wrapper replaces
only `main` while preserving adjacent scaffolds. The main image remains exact.
Coverage after GMAIN was 1,580 functions/100 TUs (1,561/99 native plus19/1 conventional).

TICK.C establishes that these GLIB C objects use `-G0`: its TU-owned four-byte
`GazTick` common is addressed absolutely in retail, whereas `-G8` produces
gp-relative instructions. With the recovered flag, all seven functions, 172
text bytes, 21 read-only bytes and the four-byte runtime-BSS common match, as do
all function/global records. The generic read-only fragment already contains
SDK imports, so native_recon composes its exact ranges on the freshly produced
SDK bridge and gen_ld selects one combined wrapper. The main image remains
byte-identical with 120,304 zero BSS bytes. Coverage is now 1,587 functions/
101 TUs (1,568/100 native plus19/1 conventional), and the suite is224/224.
The unlinked region at that checkpoint was480 entries:138 confirmed GLIB and342 unclassified.

The other seven GLIB TUs now use the byte-proven historical lane: gcc 2.6.3-
compatible C generation with `-O2 -G0`, followed by original DOS ASPSX 2.34.
GAL, TASKER, GDEBUG, GSYS, GUTILS, GTIMSYS and VRIP contribute the remaining
138 GLIB functions. Native linkage verifies their complete code, pools,
initialized data, runtime BSS, call targets, and function/global SYM records.
TASKER's 48-byte `SchEnv` and GAL's 5,600-byte header arena are fail-closed
local-common splits that reproduce the retail BSS banks while leaving the C
function bodies unchanged. VRIP additionally proved the old LNK `0x36` SLD
record is offset16 plus increment16; the parser now checks that exact shape.
Coverage after GLIB was 1,725 functions/108 TUs (1,706/107 native plus19/1 conventional),
and all146 Climax GLIB entries are source-linked.

The pending set has a reproducible producer partition from retail address order.
`tools/eac_twin_screen.py` identified 33 boot/GTE/compression/ABL utilities and
309 functions in one EAC runtime family across six uninterrupted pending runs.
The local NFS4 EACLIB reconstruction supplies 45 same-name candidates; ten have
exact relocation-masked bodies. Those are source-twin leads only, not original-
archive receipts, so they remain pending until reconstructed/native-linked under
the Diablo layout. TEXTCRNT.C (`putm`/`puti`) and the original hand-assembly
GETM.ASM shape (`getm`/`geti`) are now the first two linked EAC modules. Because
retail stripped their body-SYM records, their explicit seal proves complete
exports, exact member offsets/MAP addresses and final bytes. The original
CRC.ASM module and its exact 512-byte table are linked as well; separate source
members supply `gettick` and `resettick`, including the latter's exact
`tickset`/`tickval` small-data ownership. The complete original BLKFILL.ASM
member supplies `blockclear`/`blockfill`, preserving Diablo's two-instruction
tail-loop ordering variant. The two empty NASYNC debug hooks are also promoted
from `src/lib.c` into an exact source member. SAVEGP's three hand-assembly
semantics are expressed in C with gcc 2.6.3 global register variables bound to
`$gp` and `$zero`, retaining authentic relocations and the exact four-byte data
word. Diablo's polling-only `timedwait` variant is separately reconstructed in
natural C. Coverage is now 1,740 functions/117 TUs (1,721/116 native plus19/1
conventional), the suite was231/231, and327 library entries remained at that
checkpoint:33 boot utilities plus294 EAC runtime.
The machine-readable result is `build/eac_twin_screen.json`.

After the complete library integration and native promotion of PREGAME.CPP and
PRESONLY.CPP, TITLESCR.CPP, PREAUTO.CPP, the VERSION.CPP startup suffix and the
remaining GMAN/MEM/PADS startup blocks, CREDITS.CPP, DIALOG.CPP, GPANEL.CPP and
MEMCARD.CPP, BIGLUMP.CPP, STREAM.CPP, CPLAYER.CPP, CARDCORE.CPP, CTRL.CPP,
DRLG_L2.CPP, PADFUNCS.CPP, OPTIONS.CPP, BLOCK.CPP and DIABLO.CPP, the complete
DLG_2.CPP overlay object, MISPRINT.CPP, CONTROL.CPP, GMAN.CPP, FE.CPP,
STORES.CPP, ITEMS.CPP, MSG.CPP, PLAYER.CPP and FMV.CPP, native coverage is 3,196
functions/178 TUs; including the one conventional TU gives 3,215/179. All
2,727/2,727 game-board entries are final-image source-owned (including DLG_2's two
native raw-data exports). All 270 tool tests and all five exact-image comparisons
pass.
This is a source-integration backlog, not a matching backlog.

## EA Canada EACLIB and Climax hand-assembly lanes (2026-10-04)

The 342 library entries that are neither Sony archive members nor Climax GLIB are
EA Canada's PlayStation runtime (EA published the title) and Climax's `PSXSRC/*.MIP`
files. Their retail objects have no function-body SYM records, so the seal is the
native link of each complete source member at its retail addresses.

**EACLIB compiler identity (measured on 294 functions):** the PsyQ 3.6 DOS `CC1PSX`
(version string `2.7.2.SN.1`) at `-O2 -G8 -fsigned-char`, assembled by ASPSX 2.56
with its default divide guard (`bnez/nop/break 7`, no `-0`), reproduces every EAC
function. The PsyQ 4.0 `CC1PSX` reproduces most and differs only in sched1 load
placement (a load scheduled next to its use where 3.6 keeps a three-instruction gap);
the gcc 2.6.3 / ASPSX 2.34 GLIB lane fails on every small constant (`addiu` in the
EA objects means an assembler of 2.50 or later). libddx (`SwapByte`, `PutLong`,
`GetLong`, `DDX*`) is `-O1 -G0` with an assembler older than 2.50 (small constants as
`ori`); the compiler is undetermined between gcc 2.6.3 and PsyQ 4.0 at that level.
EA's build had plain `char` unsigned. `tools/symlane.py` runs the DOS compiler under
DOSBox (`compile_dos_cc1`) and routes its `.section .text.lib` back to `.text`: this
compiler honours the section attribute only until its first inline jump table, so a TU
would otherwise split over two sections while the retail objects are plain `.text`.
Registry keys: `"compiler": "psyq36-dos"` in `tools/build.py` `PER_TU_FLAGS`,
`"assembler": "2.56", "divide_guard": true` in `configs/native_recon_link.json`.

**Member boundaries** come from the EAC abort strings (`cmn/async.c`, `psx/blockio.c`,
`psx/cdrom.c`, `psx/fileio.c`, ...), from exact `.rodata`/`.sdata` extents and from the
zero-length NULLFUNC.ASM SLD records PSYLINK left at object ends. TIMER is one object
(`gettick` .. `timedwait`): `tickcount`, `setticks` and `testticks` address
`tickset`/`tickval` gp-relative, which only the defining object does. Retail statics with
a SYM name record but no MAP entry (`PSXiasyncreader`, `internalupdateasyncqueue`,
`asyncdirentrycallback`) stay file-static and are verified by their name-record address
inside the covering oracle span (`function_aliases`, `covered_functions`); CRUNCH.MIP's
six unnamed helpers are declared `static_functions`. `cdrombufsector` sits in the
linker's common pool (0x80139BE0, among the libpress/libcd commons), so it is a
tentative definition, not a static. Commons of stripped members are receipted through
their retail name record and MAP address (`untyped_data_symbols`); a `-G8` member whose
only small data are commons gets the GP anchor word so PSYLINK can resolve gp-relative
patches to externally bound symbols.

**Hand assembly** (`recon/psxsrc/*.s`, `recon/eaclib/{blkfill,crc,getm,blkmov,print}.s`)
is assembler-neutral: `.set noat`/`.set noreorder`, explicit delay slots, numeric
registers, `la $r,sym` / `lw $r,sym` macros instead of GNU `%hi`/`%lo` pairs (ASPSX
2.34 and 2.56 reject `%hi(`), GTE commands as `.word`. BOOT.MIP owns only the
`.boot_text` entry word; the retail SLD "line 34 of BOOT.MIP" at 0x8001000C is the
code-free section-switch record ASMPSX emits and PSYLINK places at a section end, so
GTE.MIP owns `GTE_SetTransXYZ` and REPLACE.MIP owns `longjmp`.

**Rulings in force for these members:** `volatile` only where the oracle proves a
CD-callback / timer-interrupt path shares the object (reload after store, kept mask,
store-before-load order), and one `volatile` stack local in the MMIO routine
`SwapByte` (the kept `andi 0xFF` after the stack re-read is the compiler's refusal to
fold a zero-extension into a volatile load), accepted 2026-10-04 as part of the MMIO
exception and never elsewhere.

### Data-only members and link-computed PSYLINK symbols (2026-10-06)

Three retail objects carry no code: EA's CALLBACK (the `loadfilecallback` cell) and Climax's
OVERINFO.MIP (overlay load addresses and sizes @8010DBAC) and LNKOPT.MIP (link option words
@8010DBD8). The CALLBACK cell is registered in `configs/native_source_data.json`; the registry key
`data_only` lets a stripped member of `configs/native_recon_link.json` own only data, and the
native lane checks the object exports no code and compares the data whole.

OVERINFO/LNKOPT contain nothing but link results: PSYLINK's per-group `_<group>_org` /
`_orgend` / `_size` records and the Climax link options `LNK_OrgAddress` / `LNK_StackSize`.
So they are hand-authored `.s` files whose words are symbol references, and the registry row
`link_object` makes the GNU link place the member's own object (`build/recon/psxsrc/<x>.s.o`)
instead of a verified-bytes scaffold; `native_recon.carve_linked_objects` gives each one its
own layout fragment (it must lead its retail fragment, the remainder keeps the fragment's
name). `tools/link_symbols.py` derives every referenced value from the layouts: the overlay
buffer is the main image's bss end rounded to the group alignment, each overlay's size is its
image extent, `.last`/`FirstFreeByte` follows the largest overlay, the RAM size comes from
`global_vram_end`, and the free-memory size is RAM top minus the declared stack option minus
`FirstFreeByte`. `gen_ld` emits the same relations as linker-script expressions in
`linkers/diabpsx.ld` (`ALIGN(ADDR+SIZEOF)`, `MAX(...)`), followed by `ASSERT`s against the
genuine `rom/DIABPSX.MAP` records, and the native lane binds the members' externals to the
identical numbers, so no address of theirs is written by hand anywhere.

## Retail small-data order from source order (2026-10-07 .. 2026-10-10)

The game TUs' `.sdata`/`.sbss`/`.bss` rows and their post-assemble splits were replaced by single
retail-order rows for DIABLO, MONSTER, ITEMS, MEMCARD, STORES, CONTROL, TOWN, TEXTDAT, PFILE,
OBJECTS, PLAYER, ATTRACT, OPTIONS, GAMEMENU, DPIECE, GENDUNG, MEM, FMV and GMAN by reconstructing
the source order the compiler needs.  The rules, each verified with a probe TU on the retail
cc1plus and then by the members' native gates:

- An initialised global (including `= 0`, and a `static ... = 0`) is emitted at its definition,
  in source order, interleaved with the `.sdata` string literals of the functions compiled so
  far.  The retail bytes therefore fix where in the file a definition stood (for example
  LastFrCount after CreateLevel's "STACK" literal, CrossCount after DrawSpellList).
- Every uninitialised global is deferred to the end of the TU, in first-declaration order; the
  first declaration is usually an `extern` in a header, so the generated externs headers now
  declare those names first and in retail order.
- An uninitialised `static` is `.lcomm` (in definition order) and goes to `.sbss`/`.bss` by
  size; with `-fconserve-space` (MONSTER) uninitialised globals are commons (`common_symbols`).
  Statics are named from the SYM STAT records (cineflag, sgnTimeoutCurs, Passedlvldir, TempStack,
  pauseo, deathdelay2, sg_previousFilter, ...).
- ASPSX 2.56 pads an 8-byte `.lcomm` object to 8-byte alignment; ASPSX 2.67 keeps it 4-aligned,
  which is what retail's RECT statics show (STORES, CONTROL use 2.67).  FMV's 64-byte static is
  8-aligned under both.
- A TU that includes the GMAN.H inlines starts its `.sdata` with the 12-byte ".tp"/".dat" literal
  pool (psxsrc/textfileinfo_header.h); some TUs contribute only that pool.  Bytes between
  objects (alignment padding) can be non-zero retail garbage and stay scaffold-supplied.
- SN's cc1plus mangles the class static CPlayer::PActiveArray as `_7CPlayer.PActiveArray`; every
  TU reaches it as the member, and the native link accepts dotted PSYLINK symbol names
  (external_binding_aliases map the dotted name to the C-identifier address entry).
- TEXTAB.MIP (TX_DatTab and 372 CTextFileInfo entries) is a hand-authored data object linked
  directly (`link_object`); the gte/gp data rows are linked objects too so the carve chain leads
  its fragment, and link.py strips the GNU-assembled text of such sources with objcopy because ld
  resolves symbols before `/DISCARD/` would drop them.
- Same-named statics in different TUs (TempStack in DIABLO and FMV) need `data_record_addresses`
  to pick the member's own SYM record.
- Not reproducible from natural source: TONY's in-place patch of its "DEMOPAD0.DAT" literal
  (retail stores through the literal's symbol; gcc materialises a literal's address in a
  register), so `D_80110B24` stays a documented bound alias.

### Round 2: literal positions of header inlines (2026-10-10)

MSG, ITEMS (.rdata), BLOCK, STREAM, BIGLUMP, CPLAYER, MISPRINT and CARDCORE lost their remaining
post-assemble splits, section renames and source-move flags.  Two more compiler rules, probed on
the retail cc1plus (scratch `probe_lit`/`probe_tail` cases):

- An inline function's string literal is emitted where its *body is parsed*, never at its first
  use; an inline that is never used still emits the literal (so a TU that merely includes the
  GMAN.H inlines starts its `.rdata` with "psxsrc/gman.h" and its `.sdata` with the ".tp"/".dat"
  pool).  The out-of-line copies of the inlines a TU uses are emitted at the end of the TU in
  reverse *definition* order; declaration order does not matter.
- Retail therefore fixes where PRIMPOOL.H's PRIM_GetPrim body was parsed: after the constructor
  in CPLAYER (its literal follows the CPLAYER.CPP literals and precedes FindAction's table),
  after FuncFLASH in MISPRINT, at the end in GMAN.  Those TUs declare the inline first and carry
  the body (the "header copy") at that point, as BLOCK, LOADING, PLAYER and DAVEL already did.
- The rows now start at each TU's literal pool.  Where a row starts or ends inside a splat label
  of the shared scaffold, the scaffold's bytes up to that boundary must be explicit annotated
  rows (`.word`/`.byte`/`.short`, or `.asciz` ending exactly there); an `.asciz` plus `.align`
  pad is not carveable (BIGLUMP's and CPLAYER's pools, CPLAYER's "psxsrc/cplayer.h" pad).
- A row ends at the object's extent, not at the next aligned object: MISPRINT's `.rdata` ends two
  bytes after its final "psxsrc/primpool.h" literal and the alignment pad stays scaffold.

Exceptions kept with splits: GMAN's `.rdata`/`.sdata` (its header inlines defined out of line at
the end of the file reproduce retail text; defining them in the class changes the copy order and
the text) and ITEMS' `.bss` (retail 8-aligns its 9- and 127-byte statics, which neither ASPSX
2.56 nor 2.67 does).

### Round 3: overlay modules as one emission-order stream; GLIB BSS by assembler threshold (2026-10-10)

CREDITS, MEMCARD and DRLG_L2 were linked with per-occurrence section renames, a symbol route and a
label pad so that a composed PSYLINK group could interleave their read-only data, initialised data
and code the way the retail overlay streams do.  Probe (scratch `probe_merge.py`): assembling each
TU's unchanged cc1plus output with every `.rdata`/`.data` directive turned into `.text` reproduces the
retail `.CREDITS_text` / `.MEMCARD_text` / `.DRLG_L2_text` streams byte for byte at the retail
offsets (only the gp-relative immediates differ in the unbound probe link).  Those three members now
use the uniform `merge_sections_into_text` property and a composed group of just `.text`.  FMV is
not such a stream (its data and code drift apart at the first function), so it keeps the composed
`.rdata`/`.data`/`.text` order; LoPlayFMVOverLay's six-entry switch table sits inside retail's text,
which no cc1plus option gives without changing code (`-membedded-pic` alters the code,
`-fpic`/`-mabicalls` make `.gpword` tables), so that one occurrence rename stays.

FE's and FMV's resident small data were 35 and 86 post-assemble pieces; both are now single retail-
order rows: FE moves DrawBackOn .. FMVPress after FeDrawChrClass (its " " and "%i" literals sit
between fadeval and DrawBackOn) and starts with the literal pool; FMV defines its 106 small globals in
one explicitly initialised block in retail order, including the twelve unreferenced EA cdstream/mdec
globals retail kept (mfn, mdec_scale = 0x1000, ...), and names its statics as the SYM does
(FMVName, CreateEnv, Passedfilename, Passedw).  FMV's local statics then fall into .sbss and .bss in
retail order by the assembler's small-data threshold, except that retail 8-aligns the 64-byte
voice_attr after the 12-byte subcode and ASPSX 2.34, 2.56 and 2.67 all pack it at +12 (probe: a
12/64/32/48/9/127-byte `.lcomm` sequence gives .bss 296 under 2.34/2.56 and 303 under 2.67, which
8-aligns only the 127-byte object), so FMV's .bss stays two rows split at that pad.

GLIB's gal/tasker `split_lcomm` is gone: the code is -G0, but the objects were assembled with the
default small-data threshold, under which ASPSX homes every `.lcomm` of 8 bytes or less in .sbss and
the larger statics (SchEnv, MemHdrBlocks) in .bss, exactly the retail rows; the lane's new
`assembler_g_value` keeps the compiler at -G0 and passes -G8 to the assembler only.

### Round 4: GMAN natural; the ITEMS/FMV local-BSS alignment (2026-10-10)

GMAN's `.rdata`/`.sdata` splits are gone.  GMAN.H now carries its in-class inline bodies for every TU
(no owner mode): the ".tp"/".dat" pool and the DumpDatFile literal are parsed at the include and head
GMAN's sections as in retail, LoadHdr is declared in the header and defined in GMAN.CPP (its ".hdr"
literal follows `int wank = 8`, defined between DecompFrame and MakeCreatureOffsetTab), and
GMAN.CPP parses PRIMPOOL.H's bodies last (declarations first via `PRIMPOOL_DECLARE_ONLY`), so the
primpool literal is the last read-only item and the two copies lead the tail.  In-class inline
bodies are compiled at the end of their class in member order, and the out-of-line copies are
emitted in reverse definition order, so the header's member order is retail's copy order
(HasTp, HasDat, GetName; ... GetNumOfCreatures, GetCreature, GetTexNum, ...).

The ITEMS and FMV `.bss` rows remain split, and the evidence is now complete: retail places those
statics at gcc's 8-byte-rounded sizes (curruitem 108 -> itemhold at 112, itemhold 9 -> itemactivelist
at 128, itemactivelist 127 -> mult_tab at 256; FMV subcode 12 -> voice_attr at 16).  Every cc1plus
2.7.2 build on disk (SN32.3.7 Build 0001, .0002, the SN16 DOS builds) emits `.lcomm name,size` with
the exact size under every flag tried (-fno-common, -fconserve-space, -G0, ...), and every ASPSX
build (2.34 .. 2.56, 2.67, 2.79, DOS and Win32, every single-letter switch, -G0/-G8) packs `.lcomm`
objects at 4-byte alignment (2.67+ adds odd 4-byte pads that match retail no better); ASMPSX does not
read gcc syntax.  No reachable tool reproduces the rounding, so the two rows per TU stay (probe
receipts: scratch `la.s` layouts in build/tmp/pref).

### FRONTEND DLG.CPP data (2026-10-10)

DLG's `.rdata` (0x801435E8..0x801436EB) is one compiled section: the DumpDatFile inline's
"psxsrc/gman.h" literal (textdat_header.h), `extern const int ClassStrTbl[3]`, the three BISLPS
file-name literals, the three `extern const FeTable McLoad*Menu` tables and the sprintf formats.
splat labelled the two literal runs as code (`dlg`, `dlg_1`), so a data row's `scaffold` list may
now name a `<fragment>.c` part it covers completely; native_recon emits the member's bytes for
such a part as a raw span and gen_ld places it like a raw code segment (no section renames, no
split).  A `.data` row may likewise name a `.rodata`-labelled fragment.

DLG's zero `.data` (save_buffer, CharDataStruct, TempStr, AlertStr; 0x801436EC..0x8015958F) is
not reproduced yet: retail keeps a four-byte zero gap between save_buffer and CharDataStruct.
cc1plus emits `.align 3` before the struct, but ASPSX 2.56/2.67 and PSYLINK 2.52 apply that
alignment to the section-relative offset (verified with a probe object and with the member linked
as a composed rdata/data/text group), where 0x14000 is already aligned, so our object has no gap
and everything after it lands four bytes early.  No SYM record names a four-byte object there.
The range stays scaffold-supplied; cardcore and options now reach the block as CharDataStruct
(cardcore clears it whole, options reads CharSlots[cs - 1].pName[0]).

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
