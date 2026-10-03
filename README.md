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

The standalone SYM command exits nonzero for missing, mismatching, or empty
results. Generated initializer/destructor bodies are compared with retail
under their canonical names; they are not automatic N/A passes.
Overlay SYM receipts follow the retail MAP's text ownership: PSYLINK `OVER(...)`
groups with `/v`, followed by the original `SYMMUNGE /i` compactor. This is
necessary for function-local statics referencing resident data. The raw SYM
and compactor log are retained beside each receipt; the linked CPE is unchanged.
The native runner uses hash-verified SYMMUNGE 1.56 at
`C:/Temp/psq45/BIN/SYMMUNGE.EXE` (override its location with `DIAB_SYMMUNGE`).
The same five previously failing local-static records were independently
reproduced with PsyQ 4.0's DOS SYMMUNGE 1.3. Exact record comparison is unchanged.
The real-ASPSX command likewise exits nonzero for incomplete or mismatching
results, including absent or empty oracles.

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
29 needing target fixes or audit routing work. All have since been repaired or
routed and re-audited; `configs/callaudit_pending.txt` now has no pending TUs.
These are additional seal requirements beyond
the byte/SYM progress count.
The call audit follows `configs/segment_homes.txt` for functions reconstructed
outside their original segment's TU, matching the byte/SYM gate's ownership routing.
The full call-target rescan passes 2725/2725 real function entries. MemcardPad's
33 call sites, both byte lanes, and exact SYM now match after restoring its
asynchronous save-state accesses and structured control flow.
The board's two extra entries (`dlg` and
`dlg_1`) contain memory-card strings and pointer/format data, not executable
functions. `tools/data_gate.py` now verifies their source-emitted bytes, pointer
relocations, and DLG small-data symbol placements against retail. The board counts
these as data receipts, keeping the requested 2727-entry scope unchanged.

Verify the source-emitted DLG data with `python tools/data_gate.py`.

Run `python tools/check_c_escapes.py` to reject unknown escapes in reconstructed
string and character literals. PsyQ can silently discard invalid backslashes;
normalized instruction matches do not verify the resulting string bytes.
This check supplements, rather than replaces, relocated-data verification.

`python tools/return_type_audit.py recon/psxsrc/fmv.cpp` checks emitted function
declaration return types against retail SYM. These types are not encoded in
C linkage names or the function-body local-record comparison. FMV passes 44/44.
The full repository-wide rescan verifies all 2699 available return declarations.
`configs/return_type_pending.json` has no pending type differences and separately
lists 26 generated initializer/destructor thunks lacking retail declarations.
Those must have compiler-emitted void declarations and still pass their byte,
call, and exact function-body SYM checks; all 26 do have retail body records.
They are not counted as verified retail return-type declarations. Other
missing or ambiguous declarations remain failures. This audit is separate from
the byte/function-body-SYM board.
The native source linker enforces the same declaration checks before importing
a TU's verified payloads.

For an individual relocation-free data symbol, use (for example):
```
python tools/symbol_data_gate.py recon/psxsrc/gpanel.cpp DurColors 0x800B9BCC 18
```
This verifies source bytes and extent, not final placement or a function seal.
When era assembly omits ELF symbol sizes, the tool requires the same source's
real SDB array-size record; section padding is not treated as array data.
Relocated pointer tables are rejected and need a relocation-aware gate.

## Final-image integration is still pending

MISSILES follow-up (2026-10-03): restored retail function order, the original
GMAN/CPLAYER header inlines and seven real CrawlNum local initializers. The
complete 1,272-byte read-only pool now matches, including both relocated jump
tables. Unmasked linking exposed and corrected errors hidden by normalized
instruction matching: Firewall's two direction fields were reversed, Nova's
table columns were off by one, Teleport's second light-fix used the vision ID,
its diagnostic filename had wrong case, and two light tables had a nonzero
final element instead of the gold source's implicit zero.
MISSILES remains 115/115 for bytes/SYM, calls and return declarations.

MISSILES is now integrated through the native-source registry. Its measured
PsyQ `-fconserve-space` lane emits seven linker-placed zero commons. Original
ASPSX/PSYLINK allocate their exact ten bytes at the retail addresses, with
typed SYM, size, bounds, overlap and zero-value checks. The allocation bank's
49 carrier bytes are not imported as common data. The 45-byte constant pool
retains its three neighboring scaffold alignment bytes; none is claimed as
reconstructed output.

The native overlay link uses explicit `FILE` groups, `OVER`, `/v` and the
hash-verified vendor SYMMUNGE. Overlay-ID file headers are verified against raw
SYM and excluded from code payloads; no source instruction is changed. All
115 exact function SYM records pass at their retail addresses.
`tools/tests/test_missiles_native_probe.py` checks all 69,488 relocated text
bytes, the complete read-only pool, constant small data and real common
allocations without masking. All 192 tool tests and all five final-image
comparisons pass. Other unreconstructed data and TUs remain scaffold.

MONSTER now uses the same native route for all 105 functions: 50,944 text
bytes, 240 read-only bytes, 19 small-data bytes and two four-byte common
variables. Restoring retail function order, the original unused header inlines
and the actual `", "` literal removes the reconstruction-only ROM-string alias.
Only PrintMonstHistory's string arguments changed inside a function body;
the other 104 bodies are unchanged. The two static-local functions also pass
exact native SYM at their final addresses. The common allocation bank contains
eight owned bytes and 44 non-exported carrier bytes. All five images were
rechecked after this import; no additional SDK entry is claimed.

INV adds another 57 native-linked functions, 44,260 exact text bytes, 896
read-only bytes and 104 small-data bytes. Its 23 global records now have the
retail names, types, initial values and addresses: this restores OT defaults
249/250, CursGlowDx=8, the recorded InvOn/sgdwLastTime/InvSel storage and the
original `%i/%i` format. It also fixes InvDrawItem's reversed texture selection.
Complete forward declarations preserve call signatures after retail function
ordering. The in-class Dialog constructor reproduces the original header-copy
order. Redundant early externs for owned variables are removed; INV uses the
ordinary compiler flags, not the common-data override. All five images and
the complete 2725/2727 board were rechecked, with no regression.

AUTOMAP completes source-text coverage of GAME: all 297 functions across its
five code fragments are now native-linked (172,580 code bytes, plus the separate
four-byte overlay ID). AUTOMAP supplies 7,880 text bytes, 72 read-only bytes,
60 small-data bytes, the 24-byte SetLevelName table and 12 exact global records.
This restores AutoMapScale=4, the real AutoMapOt=240 static, and the recorded
AutoMapX/AutoMapY storage. Only ordinary source definitions and compiler flags
are used. All five images remain exact. Resident arrays and other untranslated
TUs still have scaffold ownership; complete GAME code is not whole-project
completion.

The main file contains 1,099,268 payload bytes followed by the four-byte
additive checksum `0x02A12C64`. Its checksum is now a separate file-format
segment, not initialized small data. `link.py` emits `build/diabpsx.runtime.bin`
with all 120,304 BSS bytes zero from the MAP boundary `0x8011C604`, then
serializes `build/diabpsx.bin` with the computed checksum. Both runtime layout
and the complete retail file match are enforced. Independently recheck with
`python tools/image_trailer.py --runtime build/diabpsx.runtime.bin`.
The serializer rejects bad BSS rather than repairing linked bytes. MAIN now
supplies its complete 688-byte text and four-byte `GameTaskPtr` static at the
first BSS address, with exact native bytes, function SYM, and static type/address.

The function board is not a final reconstructed-image or SDK-linkage receipt.
Conventional source zero-fill placement is supported through
`configs/recon_bss_link.json`. Entries require a selected source TU, an exact
allocated NOBITS section, valid main-image BSS bounds, and no overlap with SDK
or native allocations. PRIMPOOL uses this lane for its packed 32-byte BSS,
with all eleven individual symbol offsets enforced on the original object.
TRIGS now supplies its 22 functions, all twenty trigger/block lists, mutable
trigger tables, header/jump-table pool, and initialized state. Its 40 named
global records match retail. Native relocation verification also corrected
IsTrigger to read quest sublevel/active fields rather than log/type fields.
MINITEXT now supplies all 17 functions, 96 initialized-data bytes, its 160-byte
header/string/jump-table pool, 52 small-data bytes, 36 BSS bytes, and both
constructor/destructor pointers. All 22 named global types and placements
match retail. This includes MtPrevText and the restored 120/200 timing defaults.
Currently `configs/recon_link.json` selects one reconstructed TU covering
19 verified function entries, while `configs/native_recon_link.json` supplies
1430 functions across ninety-four TUs through real ASPSX/PSYLINK: 1449 source-linked
functions across 95 TUs in total. They replace their text scaffolds at the original
addresses. PCIO and DatIO also supply their complete read-only sections,
including diagnostic strings and relocated virtual-method tables, through
`configs/recon_data_link.json`. SPELLS supplies its complete 20-byte jump table
at 0x801189E8; the preceding 40 bytes of unused header literals remain in a
separate scaffold fragment. COREAUTO, ATTRACT, and INTERFAC also supply their
complete read-only sections after separate 16-byte unused header-literal
prefixes; this includes both COREAUTO jump tables and INTERFAC's dispatch table.
COREFMV supplies its six-entry `FmvTab` (48 initialized bytes), all movie-name
strings, and its dispatch table (132 read-only bytes), retaining only the unused
16-byte header-literal prefix as scaffold. The array definition reproduces the
retail string-pool order, including the otherwise unused `FPRST3.MOV` name.
MLIST supplies its two zero-initialized 16-byte selection arrays and diagnostic
filename. Its 17-byte source string is separately extent-checked before exactly
three zero alignment bytes complete the 20-byte retail fragment.
VERSION supplies its zero-initialized 120-byte output buffer and 24-byte format
string. The surrounding codeword pool and build-date strings remain unchanged
in separate scaffold fragments; no compiler-output slicing is used.
SPLTARGT supplies all 17 functions and its 48-byte AutoTargetSpells array.
Its three emitted header methods follow retail order, and CanTalkToMonst is
explicitly bound to its game-overlay export.
The other selected objects own no runtime data.
PREQUEST's formerly missing header-literal pool is also repaired. Native
linkage supplies its complete code in PREGAME and its 140-byte pool in the main
image, including the relocated jump table and original header literals. All
nine SYM records match at retail addresses. Per-section image ownership and
YAML bounds are validated before importing the verified source payloads.
PREOBJ likewise supplies all 16,132 code bytes in PREGAME and its complete
484-byte main-image pool, including dispatch tables. Its original unused
GMAN header method restores the filename literal; TextDat's header definition
is shared with PREQUEST without adding unrelated implementation dependencies.
PREMON supplies its 19 functions and 286-byte pool after repairing five escaped
file paths, the debug-message arguments, and source definition order. Its two
trailing retail padding bytes remain scaffold data, not reconstructed output.
DEAD owns its complete 372-byte initialized corpse table and eight bytes of
small-data counters; their bytes, native addresses, and global SYM types match
retail along with both functions.
SOUND supplies all nine functions, the six-entry music-track table, its
33-byte read-only string pool, and 40-byte header/small-data group. Its ten
global records match retail, including restored master/music/sound/speech
volume defaults and music-track index. Three original nonzero alignment
bytes following its string pool remain explicitly identified scaffold.
GWIN supplies its five functions, complete 280-byte read-only pool including
all eleven relocated message-name pointers, and the CurrentProc BSS static.
Both named global records match retail type and placement.
EFFECTS supplies all 20 functions, its typed 992-entry sound-effect table,
14-byte header pool, and 48-byte small-data group. All ten named global
records match retail, including external stream-state pointers and the
SFXX/SFXY/SFXW/SFXH screen bounds. The table expands typed TSFX initializers
from retail flag runs and sequential bank IDs, not a binary data include.
TOWN supplies its eight functions, the complete 128-byte header/filename pool,
and the P3Tiles BSS pointer with exact retail type and placement.
PRETRIGS supplies all nine PREGAME functions and its 33-byte main-image header
pool. Its original three trailing nonzero bytes remain scaffold padding.
GPUQ supplies all seven functions, its initialized 30-entry image-transfer
queue (840 bytes), diagnostic string, and ArgsSoFar counter. Both global
records and their native placement match retail.
PRIMPOOL supplies all 19 functions through the approved maspsx/GNU lane,
with its 20-byte small-data group, 25-byte string pool, and packed BSS.
All 15 global types and final addresses match retail. Shared small-data
scaffolds are split around its owned section; its three nonzero string-padding
bytes are explicit linker padding, not source payload or patched compiler output.
VID supplies its eleven ordinary functions and two STARTUP functions through
compiler-emitted section placement, plus its string pool and complete small/large
BSS state. Unselected STARTUP functions remain original assembly scaffolds.
Extra text sections require explicit routed ownership and complete contiguous
function coverage; all seven VID global records and thirteen function records match.
DECOMP supplies its five ordinary functions and DEC_Open in STARTUP, plus its
34-byte header/diagnostic pool and typed 40-byte requestor array. Its two trailing
read-only padding bytes remain scaffold-owned.
SYSINIT supplies its five ordinary functions and SYSI_Init in STARTUP, with
the complete 112-byte string pool, FileSYS state, and both file-system pointers.
OVERLAY supplies thirteen ordinary entries and OVR_Open in STARTUP, including
its generated initializer and constructor pointer. Its six global records match
retail; HaltTab is restored as the original typed three-word array copied with
memcpy, replacing the byte-struct stand-in.
PAUSE supplies its 34 ordinary entries and PA_Open in STARTUP, both relocated
vtables, constructor/destructor pointers, and the correctly named CanPause,
Paused, PBack, and TPtr globals. Paused is restored to retail's BOOL type.
SCRATCH supplies all 25 functions, the initialized 492-byte palette collection,
its complete 100-byte read-only pool, and the two-byte ShadClut global. Its
unchanged class definitions naturally emit the correct initialized-data section.
FILEIO supplies all 15 functions, its complete vtable/string pool, 50-byte
FileToLoad buffer, and path separator. Its explicit C++ static-member alias
must agree with both the retail SYM address and the native linker map.
SYSOBJ supplies all four functions and restores NewHnd's retail -1 initializer.
Its symbol address is verified, while the absent retail type declaration is
explicitly recorded as unavailable rather than counted as a type match.
CDIO supplies all nine functions, its complete 104-byte vtable/string pool,
and the six-byte CD filename format, with its required backslash preserved.
TMALLOC supplies all four functions, the restored typed 480-byte allocation
table, diagnostic strings, and allocation counter. Original nonzero string
padding remains scaffold-owned.
PROF supplies all ten functions and its state, with TimePerFrame and the other
four timer variables restored to their retail INT declarations.
DAVEL supplies all 36 functions and complete spell/particle state. Native
relocation checks restored the retail menu-flag load order; all twelve named
global records and the palette/header pool match retail.
SNDBANK supplies all twelve functions and complete sample-bank state. Its
explicit ASPSX 2.67 selection reproduces retail BSS packing from unchanged
compiler output; the default source assembler remains 2.56. Receipts record
the selected version and executable hash, and still require complete byte/SYM matches.
PSXMSG supplies all fifteen functions, its restored level-palette and read-only
backdrop tables, complete header/string/jump-table pool, and CutScreen state.
TONY supplies all seventeen functions and its demo-control tables/state, with
all 25 named globals verified. Its ambient-light initialization stores now
follow retail order; the mutable demo filename pool label is explicitly bound.
GLUE supplies all 28 functions, the 81-entry PlayerInfo table, 62 read-only
bytes, 356 small-data bytes and 24 zero-initialized bytes. All fourteen named
globals and fully relocated source bytes match retail; the two trailing
read-only alignment bytes remain scaffold-owned.
PRINTY supplies all 19 functions, 2040 initialized bytes for both fonts and
their character/descriptor tables, 34 read-only bytes, 36 small-data bytes,
and its original constructor pointer. All 21 named globals match retail.
The actual header extension literals account for the colors' odd start address;
the original 04 00 read-only alignment bytes remain scaffold-owned.
GAMEPAD supplies 42 functions, its 60-byte found-object array, complete 248-byte
read-only pool, 39 small-data bytes, 436 BSS bytes and constructor pointer.
Original ASPSX 2.67 reproduces the two GamePad instances' packing; all eleven
globals match retail. Full relocation also corrected SetWalkStyle's table index
and the order of the spell-selection flag clears.
GENDUNG supplies its 16 functions, 164-byte constant pool, complete 108-byte
small-data group, and all 124,516 initialized data bytes. Its 43 named globals,
including the dungeon/map arrays and ScrollInfo, have verified addresses and
SYM types; no raw data blob substitutes for the typed source definitions.
THEMES supplies its 31 functions, 688-byte placement tables and theme array,
212-byte constant pool, and 84-byte small-data group. All 21 named data symbols
and the function-local initialization templates match retail.
GARYL supplies its three debug functions and the LastAddr global, including
the verified MemCb callback address passed to the original GLIB routine.
CURSOR supplies its nine functions and 66-byte small-data group, with all 15
globals verified by native address and SYM type. Trailing alignment remains scaffold.
DRLG_L3 supplies its 37 functions, local constants and tables inside PREGAME,
and main-image small data and `.sbss`. Source BSS placement is bounds-checked
and checked for overlap with original-library allocations. Combined scaffold
copies preserve every original label and padding byte; the originals remain intact.
ERROR supplies all three functions and its restored localized message-ID table,
message queue, state bytes, and original header literals. Its six data-symbol
types and addresses match retail; trailing literal padding remains scaffold.
ENGINE supplies its nine functions, diagnostic filename, seed globals, and
static critical-section storage. All five data-symbol records and addresses
match, including the unused retail orgseed and sgnWidth definitions.
PORTAL supplies its ten functions, portal array and warp coordinates, header
literal, and static portal index. A separate verified scaffold word establishes
GP for its `.sbss`-only state; that carrier is not imported as source payload.
PFILE supplies its three functions, original header literal, and one-byte
save-valid flag. Neighboring nonzero padding remains unchanged scaffold data.
GRAHAM supplies its two palette tasks, ten correctly initialized globals, and
original header literals, preserving the trailing nonzero literal padding.
DPIECE supplies all 20 functions, its diagnostic/header literals, and the
typed dPiece pointer. Its external map/property arrays remain GENDUNG-owned.
DAVEO supplies its 16 functions, existing constant pools, and four owned state
symbols. Its original nonzero filename padding remains scaffold data.
GAMEOVER supplies all twelve functions in retail order, including its own
Dialog constructor/destructor and header-method copies. Unused header data
still remains scaffold; this source TU emits no runtime data sections.
`python tools/link.py` verifies the resulting mixed-source images: the main
image's 1,099,272 serialized retail bytes, 120,304 zero runtime BSS bytes, and all four
overlay images, match exactly. This checks callback-address, cross-image-call,
and external-data relocations after linking, not merely normalized fields.
`configs/cross_image_symbols.json` explicitly binds main's `DrawAutomap` and
`DrawInv` references and SPELLS' `RemoveScroll`, `UseStaffCharge`, `GetSpellLevel`,
and `AddMissile` calls to game-overlay exports, plus ATTRACT's `InitFrontEnd`
call to its frontend-overlay export and COREFMV's `PlayFMVOverLay` call to the
FMV-overlay export. MLIST's `CM_ChooseMonsterList` and `CM_ShowMonsterList`
calls are bound to their pregame-overlay exports. The generator requires a unique
retail function address in the home image's symbol map and emits `PROVIDE`,
so it cannot override a source/object definition. `tools/gen_ld.py`
otherwise selects skeleton/scaffold objects, and `src/lib.c` supplies the library
region through `INCLUDE_ASM`, except for 349 entries: `tools/sdk_link.py` extracts
unchanged members from original PsyQ archives (the version is explicit per member)
and links each at its retail address with original PSYLINK. The GNU scaffold
imports the verified, unchanged CPE payload through a format bridge.
`configs/sdk_link.json` selects these entries; archive,
member, and linked-payload hashes are recorded in `build/sdk/native/receipts.json`.
This lane supports complete members with explicitly placed text and initialized
data sections, including multiple exported function entries. Explicit BSS placements
must stay inside the main image's zero-fill region and cannot overlap one another.
Every export must be declared, uniquely aligned, and match its retail address
without changing the member's relative offsets. The GNU bridge partitions the
complete linked payload at those exports, without dropping padding or other bytes.
Each partition must also cover its entire old scaffold fragment, including any
trailing data. A byte-exact member alone does not justify dropping surrounding bytes.
Declared external references must
exactly cover each member's XREFs and resolve to unique retail function addresses;
PSYLINK performs the relocations, and the complete result must match retail with
no masking. The receipt records those bindings. `PCread` and `PCwrite` call the
already imported SN read/write members; `SpuInit` still calls scaffold `_SpuInit`.
The remaining 488 library-region entries are not native-linked: 484 use assembly
scaffolds and four already have C bodies in `src/lib.c`. This does not increase the
game-function board, now 2725/2727 with two functions not PASS.
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

Optional source-data `payload_size` and `alignment` distinguish emitted bytes
from trailing linker alignment. The runtime start must be aligned, rounding
the exact payload size must equal the complete retail fragment, and the linker
asserts both sizes with zero fill between them. This is not a way to accept a
short or oversized payload with an arbitrary gap.

`python tools/native_recon.py` provides a reproducible native-source receipt for
Objects, configured in `configs/native_recon_link.json`. It recompiles the live
TU through the established real compiler/ASPSX lane, links unchanged objects at
retail placements, checks every source byte and all 96 function SYM records,
and checks the four owned global data records including their types and addresses.
The 4,672-byte GP prefix is explicitly identified as existing data scaffold;
only the TU's own text/read-only/small-data payloads are exported. Receipts in
`build/native_source/receipts.json` include source, preprocessed-input, object,
payload, and scaffold-prefix hashes. This route is wired into the final image:
generated wrappers preserve the original text symbols, and data bridges replace
only Objects' verified payload bytes. The one-byte InitObjFlag payload is imported
without replacing its three neighboring padding bytes. The GP prefix is neither
imported a second time nor counted as source. Every main-image link rebuilds and
verifies the native source receipt before consuming its payloads.

`python tools/sdk_provenance.py` screens the excluded library region against
original PsyQ 4.0 archive members and writes `build/sdk_provenance.json`.
Current strict screening identifies 122/837 entries with archive-backed
candidates; this is NOT a library PASS or link receipt. It checks exact archive
membership, function extents, and unrelocated instruction bits, records input
hashes, and rejects unknown/full-word patch masks. Relocation target expressions,
archive extraction/selection, stripped-function boundaries, and non-Sony library
provenance still need their own verification before the scaffold can be replaced.

PsyQ 4.1 screening is also available from the local original archives at
`C:/Temp/PSYQ/psyq-410/PSX/LIB`. Using `tools/psyq_extract.py` into
`build/sdk41_extracted` and `tools/sdk_provenance.py --archives` / `--sdk` with
those paths yields 146/837 candidates in `build/sdk41_provenance.json`, versus
122 for 4.0. Neither number is a link receipt. In particular, the five exports
of 4.1 `LIBGPU/EXT` all imply the same retail base, `0x80012D7C`, and its complete
text is 672 bytes. The 4.0 member is 688 bytes and its five exports imply five
different bases, so it cannot be imported unchanged at one address. The 4.1
member now passes full native-link/relocation verification and is integrated:
`LoadTPage`, `LoadClut`, `LoadClut2`, `SetDefDrawEnv`, and `SetDefDispEnv`.
This library-version evidence does not change the game's identified compiler
or authorize substituting another compiler in the reconstruction gates.

Further 4.1 imports verified through the full image are `_card_clear`, `memcmp`,
`memmove`, `_SpuDataCallback`, `SpuSetKeyOnWithAttr`, and `SpuSetReverbVoice`.
The 752-byte `LIBSPU/S_N2P` member and 32-byte `LIBC/A63` member are also imported,
covering the three pitch functions and `puts`. The eight bytes at 0x80019DCC
formerly attached to `_spu_pitch2note` are A63's exact leading bytes, before its
`puts` export at offset eight. Explicit `prefix_owner` metadata preserves that
prefix in the preceding scaffold's partition. The linker requires a selected,
unique, contiguous owner and an exact match against the scaffold's tail; both
complete members are independently native-linked and byte-verified. Unknown
surrounding bytes remain an error, not padding to discard or invent.

The complete 4.1 `LIBGPU/PRIM` member has also passed a native-link probe:
1,760 bytes of `.text` at 0x8001301C, 208 bytes of `.rdata` at 0x8010DDA8,
all 39 export addresses, and its external `GPU_printf` data binding at
0x800B54A8 match retail. The probe artifacts are `build/sdk/native/probe41_prim.*`.
All 39 functions and the complete read-only section are now integrated and
included in the 346 imported entries. The generated data bridge preserves the
original scaffold's labels and unrelated data, replacing only whole labeled
objects with slices of the verified native-linked data section. When a library
boundary lies inside a scaffold label, only contiguous, explicitly addressed
single-word rows can be replaced; all labels and surrounding bytes are retained.
The original scaffold remains unchanged. Both fragment boundaries must be exact; missing
placements, overlapping replacements, and competing source-data ownership fail.
All five images match after linking. The CPE reader also rejects overlapping,
uncovered, and undeclared regions; native-linked data hashes and placements are
included in the receipts.

PsyQ 4.1 `LIBCD/SYS` (23 functions), `LIBCD/TOC` (two functions), and
`LIBCARD/INIT` (three functions) are also fully imported. Their complete text,
read-only data, and initialized data are native-linked with explicit function
and data bindings, byte-verified, then checked again in all five final images.
This includes the CD parameter table at 0x800B5E6C and the card member's data at
0x800B5E5C, whose boundaries do not coincide with the old scaffold labels.

Whole-member screening beyond the function-candidate list also verified 22
additional 4.1 members (24 functions), including SPU allocation/reverb routines,
`CdRead2`, `__divdi3`, and `__builtin_delete`. They are integrated with exact
full-image receipts. Local scaffold labels are retained as checked symbol
aliases into the unchanged native payload when other fragments refer to them.
For example, the existing word at 0x80010ACC is disassembled as a branch to
`.L800112D0` inside `__divdi3`; preserving the label keeps that scaffold word
resolvable without editing the word or the imported library instructions.

Additional complete members now linked are `LIBAPI/COUNTER` (five root-counter
functions and 32 data bytes at 0x800B6374), `LIBCD/EVENT` (`CdInit` and 32
read-only bytes at 0x8010E248), and `LIBSN/_UDIVMOD` (`__udivmoddi4` and its
256-byte read-only table at 0x8010DBF8). Each section's entire original byte
sequence has one matching retail placement; native relocations, function
addresses, scaffold extents, and all five complete images are checked as usual.

`LIBETC/VMODE`, `LIBC/C40` (`bzero`), `LIBGTE/MSC00` (`InitGeom`), and
`LIBSPU/S_SVA` (`SpuSetVoiceAttr`) are also integrated. The zero-filled video-mode
and geometry sections are placed from retail references (0x800B544C and
0x800B634C), not from an ambiguous zero-byte search. MSC00's eight-byte prefix
is explicitly owned by the preceding bzero scaffold. S_SVA's 64-byte read-only
section at 0x8010E128 contains relocated jump tables; their final native-linked
addresses match retail without masking, and the whole-image comparison passes.

Two BSS-bearing members are now imported with explicit native and final-image placement.
`LIBAPI/PATCH` has 160 exact text bytes at 0x80011E7C and 16 zero bytes of BSS
at 0x8012FFA0. `LIBSPU/S_SCA` has 896 exact text bytes at 0x80018FFC, 64 exact
relocated jump-table bytes at 0x8010E0E8, and four zero BSS bytes at 0x80139BC4;
PSYLINK also places its exported `SpuCommonError` at that exact retail address.
Probe artifacts are `build/sdk/native/probe41_padpatch.*` and
`build/sdk/native/probe41_spucommon.*`. The importer verifies zero contents,
complete storage extents, and each declared common export's native address
against the retail symbol map. Dedicated GNU BSS objects occupy those exact
ranges in the final image, with linker extent asserts; unplaced, out-of-bounds,
and overlapping BSS are rejected. All five images match after integration.

The BSS path also imports `LIBAPI/SENDPAD` (two functions), `LIBAPI/CHCLRPAD`,
`LIBCARD/END`, and `LIBGTE/PATCHGTE`. Their respective 16-byte storage ranges at
0x8012FFB0, 0x8012FFC0, 0x80130130, and 0x80132590 are explicitly owned and
placed. Complete original text, internal patch data, external relocations,
and the final images match; none of these routines is reconstructed in C.

`LIBCARD/A76` (`StopCARD2`) and the complete 464-byte `LIBCARD/PATCH` member
are imported together. PATCH's 152-byte leading code region was attached to the
old StopCARD2 scaffold; explicit prefix ownership preserves it and its internal
data/jump labels. Label aliases are emitted only after validating the complete
scaffold extent, including the neighbor's verified prefix. PATCH's 16-byte BSS
is pinned at 0x80130120, and all five linked images still match retail.

`LIBETC/PAD` adds `PadInit`, `PadRead`, and `PadStop`. Its private 16-byte BSS
is at 0x8012FF80, while the four-byte common `PadIdentifier` is at 0x80135220.
Original PSYLINK accepts an explicit binding for the common without modifying
the archive object. The importer checks its original XBSS size, retail/native
address, and a separate final-image allocation; common and private allocations
share the same bounds/overlap checks. All five images match with both present.

Library-region inventory at this checkpoint: of the 487 remaining assembly
entries, 11 have same-name exported text symbols in the original PsyQ 4.1
archives, 7 have anonymous `func_` names, and 469 are other named entries
without such exports. The latter group includes Climax task, timing, and GLIB
routines; absence from that export list alone does not establish provenance.
The four existing C bodies are `DBG_PollHost`, `SendPsyqString`, `dumpasync`,
and `validateasyncblocks`. Together with the 346 native imports, these account
for all 837 library-region oracle files. No GLIB/Climax-named `.lib` archive
was found in the supplied `refs` and `C:/Temp/ps1-decomp-refs` trees; other
archive names and locations remain to be investigated. The retail map merges
library sections rather than identifying each member's data placement, so
repeated unreferenced data patterns still need additional placement evidence.

The broader `tools/sdk_archive_inventory.py` scan now checks all archive names
under those two supplied reference roots, including ignored files. It inspected
319 archives, parsed 260 complete SN archives, and screened 98 pending-name
export/member pairs without finding a strict byte candidate. The MAINSYS debug
object is now supported by the corrected SLD reader. An independent original-PSYLINK
probe also rules out its `main`: 1392 bytes and an initial 112-byte stack adjustment,
versus Diablo's 80 bytes and 24-byte adjustment. The report
is `build/sdk_archive_inventory.json`. This is conservative provenance screening,
not a linkage receipt or proof that unrecognized archive formats contain no match.

The 2026-10-03 expanded investigation also inspected 2,088 paths across the
local `C:/Temp/PSYQ` archive versions and standalone `.OBJ` files in both
reference roots. The corrected reader parses 848 relevant object occurrences
(456 unique contents), versus 244 before the fix; 84 object parses remain
unresolved. The 206 pending-name comparisons yield no strict candidate.
`build/pending_sdk_versions.json` retains paths, hashes, parser dialects,
rejections and errors; this is screening only. Existing native SDK linkage was
rerun successfully for all 349 selected entries; no additional import is claimed.
Retail function-body SYM independently identifies 146 of the 488 unlinked
library-region entries as Climax GLIB source, while 342 lack a matching body
record. The latter are unclassified, not automatically Sony SDK functions.

`LIBAPI/PAD` is now imported as one complete 784-byte text member with its
16-byte data section at 0x800B42BC and 16-byte BSS at 0x8012FF90. Besides its
six archive exports, it supplies `func_80011CC0` and `func_80011D38`, whose
scaffold ranges lie inside that fully verified member. `internal_entries`
explicitly records these anonymous partitions; names, addresses, uniqueness,
and complete scaffold extents are checked, and receipts distinguish them from
actual archive exports. This does not reconstruct or modify their code.

`LIBETC/VSYNC` now supplies `VSync` and `func_800121D4` from its complete
528-byte text section, plus 16 read-only bytes at 0x8010DCF8 and 32 initialized
bytes at 0x800B42CC. Its initialized export `Hcount` is checked at 0x800B42DC
against both the original object's section offset and native PSYLINK map.
Initialized exports must be explicitly declared and remain inside their placed
sections; those addresses are recorded separately from function entries.

`LIBSPU/S_INI`, `LIBSPU/SPU`, and `LIBETC/INTR_VB` add 18 verified entries
(14 archive exports and four anonymous internal entries). Their data bases are
independently constrained by 13, 11, and one initialized exports respectively:
0x800B55CC, 0x800B5A4C, and 0x800B53EC. The 20-byte `_spu_RQ` common allocation
is placed at 0x80135200. The bridge handles a partial word-aligned boundary
followed by complete labeled arrays, preserving their labels and exact extent.
All native sections, exported data addresses, and all five images match retail.

The complete `LIBETC/INTR`, `LIBETC/INTR_DMA`, and `LIBAPI/C114` members add
15 entries (12 original exports and three internal entries). INTR's 4,352-byte
initialized section at 0x800B42EC includes relocated callback pointers; the
entire linked data matches retail. Its final internal scaffold owns C114's
eight-byte prefix, and this ownership must pass the same contiguous full-member
and complete-scaffold checks as named owners. All five images remain exact.

The complete `LIBGPU/SYS` member contributes 49 entries (33 archive exports and
16 internal entries). Its 12,112 text bytes start at 0x800136FC; all 544 read-only
bytes at 0x8010DE78 and 368 initialized bytes at 0x800B545C match after native
relocation. The four initialized exports independently agree on that data base.
Private BSS occupies 336 bytes at 0x8012FFD0, while `_que` owns a separate
6,144-byte common allocation at 0x801383B8. Both are explicitly placed and
checked. All five final images remain byte-exact with the whole member imported.

`LIBCD/BIOS` contributes 13 entries (12 archive exports plus its leading internal
routine). Its 5,984 text bytes at 0x8001B43C, 592 read-only bytes at 0x8010E278,
and 800 initialized bytes at 0x800B5EEC all match after native relocation.
Thirteen initialized exports independently agree on that data base. Its private
48-byte BSS is placed at 0x80130140, and the four-byte `StMode` common is placed
at 0x801351D8. Both allocations and all five complete images are verified.

`LIBCD/ISO9660`, `LIBCD/CDREAD`, and `LIBC/C24` add 13 entries (seven archive
exports and six internal entries). ISO9660 supplies its complete 9,216-byte
private BSS at 0x80130170, plus initialized state and read-only strings.
CDREAD's leading 812 bytes were attached to the strncmp scaffold; explicit
prefix ownership now places them from CDREAD alongside the unchanged original
strncmp member. All text, initialized sections, buffers, and five images match.

`LIBC/SPRINTF` is integrated with 2,192 text bytes, its 224-byte read-only
formatting/jump-table section at 0x8010E168, and 16 initialized bytes at
0x800B5E4C. A probe using an earlier identical zero-filled data range produced
one real relocated-word mismatch; the retail instruction identifies the correct
address above. Native linking there matches every section and all five images,
without patching code. The LIBC2 member has a different instruction layout and
was not substituted merely because it exports the same function name.

The complete `LIBTAP/TAP` member adds 17 entries (six archive exports and eleven
internal entries), with 4,768 text bytes, 64 initialized bytes at 0x800B630C,
and 128 small-BSS bytes at 0x8011C90C. Its code uses absolute references to
that small-BSS section; a probe placed 16 bytes higher exposed 27 relocated-word
mismatches. Correct section placement resolves all of them without modifying
instructions. Every native section and all five final images match retail.

The seven CD-streaming members `C_004`, `CDROM`, `C_002`, `C_005`, `C_008`,
`C_010`, and `C_011` add ten entries (eight exports and two internal entries).
Their data occupies the contiguous 0x800B625C..0x800B630C range between the
verified CDREAD and TAP data, retaining the members' code/section order and
checking all actual relocations. Two private BSS sections and twenty separate
common allocations are explicitly placed, including the two-byte
`Stsector_offset`. Each declared common size and native address is checked;
all five linked images remain exact.

The initial `LIBSN/SNMAIN` isolated probe did not permit an import. Isolated
native linking gives 13 differing text words and six differing initialized-data
words, all in whole-link boundary/constructor/GP values. Retail's map specifies
`.text` at 0x8001000C (0x20170 bytes), `.data` at 0x800B0D00 (0x6388 bytes),
15 constructor pointers at 0x800B0C98, 11 destructor pointers at 0x800B0CD4,
and `.sbss` beginning at 0x8011C604. SNMAIN's own four-byte small-BSS cell is
at 0x8011C908, not that group start. The map's `.bss` spans 0x1D114 bytes from
0x8011CAE0, while startup's stored size is 0x1D118 and its clear/heap boundary
is 0x80139BF8. These original boundary expressions need whole-link integration;
substituting isolated-member extents or patching the resulting words is not
valid. Artifacts: `build/sdk/native/probe41_snmain.*`.

Follow-up: `python tools/snmain_probe.py` links the unchanged PsyQ 4.1 member
with whole-section extent carriers and reproduces all 384 text bytes, 36 data
bytes, and its four-byte small-BSS cell exactly. This resolves the isolated
probe's boundary-expression differences without patching the object. The
zero-filled carriers are diagnostic placeholders, not runtime code; this is
not by itself a final-link import or an increase in the imported SDK entries.
The report in `build/snmain_layout_probe/report.json` includes archive/member
hashes. Final integration must preserve actual surrounding sections and the
four-byte heap-alignment padding after the MAP's BSS end.

SNMAIN is now imported through `tools/sdk_layout.py`, which supplies actual
retail scaffold bytes surrounding the unchanged archive member and checks
every resulting whole-section byte. Only the member's complete text/data/BSS
sections are exported to the final link; surrounding scaffold is not counted
as library code. Its three functions (`__SN_ENTRY_POINT`, `__main`, and
`__do_global_dtors`), eight initialized-data exports, and private small-BSS
cell pass native placement checks. This raises native SDK imports to 349.
The main file remains exact with independently verified zero runtime BSS.
