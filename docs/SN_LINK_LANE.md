# SN-native link lane (PSYLINK 2.52) — feasibility check, 2026-09-26

Question: can the NFS4 "Route C" build (slink Beta 3.0 + factory PsyQ libs + a reconstructed .LNK script)
be reused for Diablo?

## Verdict

* **slink itself: no.** `DIABPSX.MAP` is in **PSYLINK** format — it has the `Program entry point : 00000000`
  line and two spaces between address and name in the symbol table (slink writes neither), and the build
  (1998-05-29) predates slink Beta 3.0 (1999-01). Object chunks are 4-aligned, no dead stripping.
* **The Route C *method*: yes, and it is easier here than for NFS4/NFS2.** PsyQ 4.0 ships Win32
  `PSYLINK.EXE` (v2.52) and `ASPSX.EXE` (v2.56) that run natively on this machine — no DOS emulation.
  A probe link of GMAN reproduced the retail MAP layout byte-for-byte in format:

```
    Start     Stop   Length      Obj Group            Section name
 80010010 800134BB 000034AC 80010010 text             .GMAN_text
 800134BC 8001434B 00000E90 800134BC text             .GMAN_data
 8001434C 8001437F 00000034 8001434C text             .GMAN_rdata
 80014380 800143BB 0000003C 80014380 text             .GMAN_sdata
```

## What the probe established

| fact | how |
|---|---|
| per-object section names (`.GMAN_text`, `.GMAN_rdata`, …) are plain section renames | cc1plus `.text/.data/.rdata/.sdata` → `.section .GMAN_text` etc. in the `.s`; ASPSX 2.56 accepts it, PSYLINK groups them with `section .GMAN_text,text` |
| ASPSX 2.56 assembles the gate's cc1plus output directly (no maspsx) | `ASPSX -q -G8 -o gman.obj gman.cpp.s` — input must be **CRLF** |
| PSYLINK .LNK syntax | directives INDENTED (`\torg\t$80010000`), group names at column 0 (`text\tgroup`), `\tsection\t<name>,<group>`, `\tinclude\t<obj>` (backslash paths), CRLF file; run with `MSYS2_ARG_CONV_EXCL='*'` from bash or the `/c` switch becomes `C:/` |
| `/e` with a long equate list crashes PSYLINK 2.52 (Win32) | satisfy externals with a stub object instead |
| MAP + SYM + CPE come from one link | `psylink /c /m @x.lnk,x.cpe,x.sym,x.map` |

Probe files: `build/sn/` (gman_r.s / gman_r.obj / stub.s / probe.lnk / probe.map / probe.sym).

## Why it is worth building (later)

1. **SYM compare per function** — link with `-g` objects and diff our SYM against `DIABPSX.SYM`
   (fsize, register/stack assignment of every local, block nesting) exactly like the NFS4 debug-SYM
   compare: a stronger per-function oracle than bytes alone for local naming/scoping.
2. **Factory PsyQ members via `inclib`** for the lib region (LIBGPU/LIBETC/LIBAPI/LIBC…/LIBPRESS in the FMV
   overlay) instead of INCLUDE_ASM scaffolds.
3. **Overlays the retail way**: `frontend group over(text),file(FRONTEND.BIN)` … the MAP's `frontend_text /
   pregame_text / game_text / fmv_text` groups, all at 0x80139BF8, and the id word `$<group>_text` first.

## What a full DIABPSX.LNK needs (all derivable from the MAP / configs)

* `org $80010000`; groups in MAP order: `(default)` (the 8-byte header code), `boot_text`, `text`,
  `startup_text` (overlay $4), `data`, `rdata`, `sdata`, `sbss`, `bss`, then the four overlay groups.
* `section .<OBJ>_text,text` … for every object (order = `configs/sections.json`), Sony members through
  `inclib LIB*.LIB` (PsyQ 4.0), the startup object and the `.boot_text` word.
* The section-rename step in the build (`.text` → `.<OBJ>_text` …) for every compiled/assembled object.

The GNU-ld lane (`tools/link.py`, byte-identical today) stays the day-to-day gate; the SN lane is the
retail-fidelity check to add when the lib region and SYM compare are tackled.

## Direct archives and slink comparison (2026-10-05)

The current goal requires whole images emitted directly by native compilation,
assembly and linking. Function PASS receipts and a GNU link of extracted native
payloads do not establish that goal. The final native build must consume original
Sony SDK/SYSLIB archives with their matching headers, source objects for all game,
GLIB and EACLIB owners, and the original overlay/group order. Source data, commons,
alignment and GP placement still need restoration to eliminate the fragment pins,
GP carriers, object rewrites and payload bridges in the current image lane.

`python tools/linker_archive_probe.py` now tests original `LIBPRESS.LIB` through
direct `inclib` with both PSYLINK and slink 4.00d. Only the group origin and section
order are declared; a separate diagnostic root object requests `DecDCTReset`,
`DecDCTvlc2` and `DecDCTvlcBuild`. Both linkers resolve the three original members
and produce all 7,136 retail bytes and thirteen exact export addresses naturally.
The probe does not extract library members. Its report is under
`build/linker_archive_probe/`.

Slink 4.00d also reproduces GMAN's 76 function-body SYM records and complete native
linked sections on the existing diagnostic placements. This is evidence of linker
compatibility, not evidence of natural whole-program placement. On the FMV object,
the raw slink records differ for `stream_cdready_handler` and
`set_mdec_audio_volume`; retail SYMMUNGE 1.56 rejects the slink overlay SYM with
`unknown storage class 67`. The PSYLINK plus SYMMUNGE path already matches all 44
FMV function records. The diagnostic tool retains this failure in
`fmv_debug_report.json` without claiming an overlay SYM pass.

Slink Beta 3.01 was separately tried with the same direct archive script. It resolves
the selected members in a different order: BUILD, VLC_C, LIBPRESS, placing
`DecDCTvlcBuild` at the group text start instead of `DecDCTReset`. Thus the section
sizes match, but bytes and export addresses differ. This does not prove the version
cannot be configured for the retail order; it establishes that identical scripts
are insufficient. For now PSYLINK is the proven choice for the required overlay
SYM fidelity, with slink retained as an experimental candidate.

FMV now includes the original PsyQ 4.1 `LIBPRESS.H` and references the actual
`DecDCTReset`, `DecDCTBufSize`, `DecDCTin`, `DecDCTout`, `DecDCToutCallback`,
`DecDCTvlc2` and `DecDCTvlcBuild` exports. The anonymous address-based source
declarations and their seven absolute bindings have been removed. The archive
manifest hashes the header as well as the library. The complete native FMV test
still proves all 44 function records and fully relocated bytes. This establishes
the correct source/header boundary for a final direct `inclib` integration.

All 140 Sony SDK member selections (349 function entries) have been verified
against the canonical archives under `C:/Temp/PSYQ/psyq-{400,410}/PSX/LIB`.
Sixty-six selections use PsyQ 4.0 and 74 explicitly use PsyQ 4.1. The five 4.0
archives used by the registry are SHA-identical to the independently recovered
NFS3 PsyQ 4.0 copies. A separate forced-4.1 experiment also passes all 140 linked
member gates: ten of the 66 raw objects are identical and 56 differ as archive
objects, yet their selected linked extents still reproduce retail. The committed
lane retains the measured mixed 4.0/4.1 selection and canonical roots. Every text
extent, owned initialized section, common/BSS allocation, relocation target and
export address matches retail. This verifies archive-member output; the final
whole-program direct `inclib` link remains a separate unfinished requirement.

## Natural storage restoration (2026-10-05)

PLAYER now defines `myplr`, `deathflag` and `light_rad` explicitly in source,
with zero initial values and retail order. The compiler emits the entire six-byte
small-data bank directly; both post-assembly pieces and the section rewrite are
removed. All 136 fully relocated function byte streams, body SYM records and
named data records still match.

OPTIONS now emits its complete 108-byte small-data bank through ordinary typed
initializers in retail order. Its unused `allspellsflag`, `OptionsSeed` and
`VideoVol` definitions replace twelve previously scaffold-supplied bytes.
Twenty-four post-assembly pieces are removed. Its file statics are declared in
retail storage order, and original ASPSX 2.67 naturally packs the three byte
objects and aligned larger objects into the exact 40-byte small-BSS section.
The `pack_lcomm` rewrite is removed; all 38 functions and named data records match.

CTRL and DIALOG also naturally produce their sixteen-byte small-BSS banks with
ASPSX 2.67 and their existing source declaration order. Their `pack_lcomm`
rewrites are removed, with all 28 CTRL and eleven DIALOG functions still exact
in bytes and function SYM records. These four TUs eliminate 26 post-assembly
pieces and three assembly storage rewrites. Original assembler selection is
recorded as toolchain identity in the native registry, rather than rewriting
the emitted assembly to simulate a different assembler's allocation rules.

The isolated TU verifier still supplies a GP prefix to establish the retail
base. Removing those diagnostic carriers and the final payload bridges remains
part of the whole-program native link requirement. These storage fixes should
therefore be counted as progress toward that requirement, not completion of it.
The complete native registry was rebuilt after these changes and the final main
image was regenerated: all 1,099,272 serialized bytes still match retail, with
120,304 verified zero runtime BSS bytes. This check reused the previously verified,
unchanged SDK member outputs and rebuilt every native source TU and final wrapper.

BLOCK also naturally emits one 44-byte BSS section with ASPSX 2.67: its function
static `AddVal` occupies offset 0, followed by `dx` at 16 and `dy` at 32. The
separate handwritten `.bss.block_xy` allocation and `pack_lcomm` override are
removed. All 68 function records, complete relocated bytes and named data records
pass the native object check.

DIABLO's address-named public `D_8012EC28` buffer has been restored to the retail
file-static `CreateEnv` definition. It follows the four seed arrays in one
naturally emitted 368-byte BSS section; ASPSX 2.67 supplies the original internal
alignment. Both `pack_lcomm` and `route_symbol_sections` are removed. All 33
functions and the exact typed `CreateEnv` record pass. Retail contains another
file-static `CreateEnv` in a different TU, so the diagnostic record selector uses
0x8012EC28 to disambiguate them; this selector does not place or rewrite code.
No `pack_lcomm` override remains. Other section transformations, GP carriers and
final integration bridges remain unfinished.

The subsequent full main-image rebuild sealed BLOCK and DIABLO's natural BSS:
1,099,272 serialized retail bytes still match, and all 120,304 runtime BSS bytes
are zero. All native source receipts were regenerated.

MSG now restores the three unused retail statics `sgbRecvCmd`, `sgdwRecvOffset`
and `sgbDeltaChunks`. With ASPSX 2.67, its function-static `sbLastCmd` followed
by those three definitions and `sgbDeltaChanged` naturally forms the exact ten-byte
small-BSS bank. All 111 functions, body records and named data records pass.
Both `.sbss` pieces and the borrowed zero-byte prefix are removed. MSG's remaining
two `.sdata` pieces still need source/link-layout recovery.

The full main-image rebuild including MSG also remains exact: 1,099,272
serialized bytes and 120,304 zero runtime BSS bytes.

## Untouched objects for the whole-program link

`python tools/native_program.py` compiles all 178 registered native source TUs
plus PRIMPOOL into original LNK-format objects under `build/native_program/objects`.
This lane preserves compiler identity and ordinary flags, but applies no
assembly rearrangement, section-occurrence rename, packed allocation rewrite,
post-assembly split, GP prefix or binary payload extraction. The only assembly
file conversion is the CRLF format required by ASPSX. It preserves original
compiler symbol spellings, including destructor and initializer names.

All 179 TUs successfully compile and assemble in this lane. The inventory records
input/output hashes, sections, commons, exports, references and disabled legacy
transformations. It explicitly does not claim a retail image or SYM match from
compilation alone. The current inventory has 295 references not resolved by
source objects; 132 have candidate definitions in the hash-verified original SDK
archive members, leaving 163 names requiring source definitions, alias/name
recovery or genuine linker definitions. Consumers are listed per missing name
in `build/native_program/inventory.json`.

The direct archive prefix probe now demonstrates the native routing mechanism:
`inclib "LIBPRESS.LIB",libpress` produces `libpress.rdata`, `libpress.data` and
`libpress.text`, matching the retail MAP's section identities. Both PSYLINK and
slink 4.00d reproduce all 7,136 bytes and thirteen export addresses through that
syntax, without modifying or extracting any archive member. This provides the
section-prefix mechanism needed to route complete source objects and archives
in the future whole-program link script.

## NFS4 data-only EACLIB twins

NFS4's `recon/eaclib/psx/eacpsxz/vars.c` identifies Diablo's missing VARS data
owner. The Diablo variant keeps the older `finebios`, `biosticks`, `cdreaddone`
and `timerperiod` fields, omits the later filesystem selectors and abort flag,
and initializes `timerhz` to 100. `recon/eaclib/vars.c` naturally emits the exact
64-byte callback-array section and 180-byte small-data bank. The real compiler
and PSYLINK verify all 244 bytes and 47 retail MAP export addresses. The existing
`callback.c` likewise verifies the four-byte `loadfilecallback` cell and export.

`configs/native_source_data.json` registers these genuine data-only source inputs.
`python tools/native_source_data.py` verifies their complete objects without
inventing a function, inserting a GP carrier or emitting a payload bridge. It
allows native CPE sparse reservations only for entirely zero source sections;
nonzero bytes receive complete comparisons. Section origins here are diagnostic
placements; whole-program placement remains unproven. `native_program.py` now
compiles 181 TUs including both data-only owners.

The raw-source dependency list loses eleven VARS references plus
`loadfilecallback`. Restoring AmLTab/AmRTab, AllItemsUseable and
automapview/automaptype removes five more names, reducing 163 unresolved names
to 146. Those game-data owners pass their complete native TU byte/SYM checks.

The NFS4 `sintbl`, `asintbl`, `atantbl`, `fatantbl` and `isqrttbl` definitions
were checked by name against Diablo's MAP/SYM and by complete initializer bytes
against all five retail images. None has a same-name record or an identical
payload. This does not rule out different revisions or related mathematical
tables, but provides no basis for importing these specific NFS4 objects.

## Canonical Sony archives and EA NULLFUNC

The 349 Sony function entries are selected from the canonical original archives
under `C:/Temp/PSYQ/psyq-400/PSX/LIB` and
`C:/Temp/PSYQ/psyq-410/PSX/LIB`: 66 member selections use 4.0 and 74 use 4.1.
All 140 member receipts pass complete linked text, data, BSS/common, relocation
and export-address checks. The five 4.0 archives used by this registry are
SHA-identical to the independently recovered NFS3 copies. A forced-4.1 run also
passes every selected extent, but the committed lane retains the measured mixed
versions. These archive payloads feed the current final mixed library wrapper;
replacing that wrapper with one whole-program `inclib` link is still pending.

Two remaining runtime data names come directly from original libraries. PsyQ 4.1
`LIBC.LIB(CTYPE0)` supplies all 144 bytes and `_ctype_` at 0x800B5DBC;
`LIBSN.LIB(SNDEF)` supplies the eight-byte `_stacksize`/`_ramsize` pair at
0x800B42B4. `python tools/native_archive_data.py` proves both with direct PSYLINK
`inclib`, using an external diagnostic root object and emitting no payload bridge.

NFS4 identifies Diablo's leading eight-byte code section as EA's hand-written
`NULLFUNC.ASM`. `recon/eaclib/nullfunc.s` restores the one `jr ra; return 0` body
and all 28 coequal retail exports. Both real ASPSX/PSYLINK and the final GNU image
lane consume the assembler-neutral source; the old `asm/header_code.s` scaffold
is no longer selected. `native_hand_asm.py` verifies all bytes and MAP addresses.

`python tools/nfs4_owner_screen.py` performs an exact, case-sensitive scan of
the original 146-name checkpoint over NFS4's authoritative reconstruction,
configs, docs and provenance tools. It finds the three owners above. `Circle`
and `object` are incidental English/source-token matches, and 141 names have no
exact NFS4 occurrence. The report also inventories every NFS4 data-only module.
This establishes that differently named structural matching may still be useful,
but the remaining Diablo game tables cannot be assigned to NFS4 merely from an
assumption that every name exists there. The reproducible evidence is written to
`build/nfs4_owner_screen.json`.

## Raw-object checkpoint and cache receipts

`docs/REMAINING_SOURCE_DEFINITIONS.md` preserves the 143-name unresolved-source
checkpoint with retail VAs. Six INV arrays now have source definitions and pass
isolated native byte/body-SYM verification; the full raw inventory still needs
refreshing before reporting a new remaining count.

`native_program.py --reuse` now requires a per-owner build receipt covering fresh
preprocessing, source and tool hashes, compiler/assembler flags and language/DOS
lanes, plus cached assembly/object hashes. Missing, malformed or changed receipts
force rebuilding. Existing objects without receipts are not silently grandfathered.
This strengthens build provenance only: neither compilation nor cache acceptance
proves a whole-program retail byte/SYM match. The strict original-archive native
whole-program link remains pending.

## GPANEL structures and MAP ownership audit

The retail MAP at lines 15732–15739 assigns four `DefP*PanelXY` globals to
GPANEL.DATA. Retail typed SYM records prove each is a `PanelXY` of 88 bytes;
the final 106-byte span consists of the fourth structure plus existing
`DurColors[6][3]` (18 bytes). Source aggregate initializers in `gpanel.cpp`,
in ordinary declaration order, now produce the complete 370-byte data section.
Isolated native verification passes all 13 functions, all four new data records
and the existing state records. The untouched raw-object lane exports all four
names without assembly transformations. This does not remove the isolated
verifier's existing GP-prefix carrier or prove a strict whole-program native link.
The gate and raw-flow GPANEL objects are SHA-identical:
`bdb9008ddb152a45cd22b9bb63be8a79700b56debf44765512a35c57b3720603`.
Fresh `python tools/link.py diabpsx` verification passes the full source/archive
receipt set and the current transitional final-image lane: all 1,099,272
serialized bytes match retail, with 120,304 runtime zero BSS bytes verified.
That final lane still uses native payload bridges and is not the strict native
whole-program PSYLINK completion claim.

`python tools/map_source_owners.py` audits all 143 checkpoint names against
explicit retail object bounds and same-name typed SYM records. The generated
`docs/REMAINING_SOURCE_OWNERS.md` lists 70 single enclosing candidates, 11
ambiguous overlapping-overlay candidates and 62 without explicit object bounds.
Enclosing addresses alone are not used to resolve overlay ownership. Clear next
data-owner candidates include ITEMDAT's item tables, OBJDAT's object tables,
MISDAT's missile tables, SPELLDAT's spell table and PREOBJ's `StoryText`.
The `OVR_*`/`OPT_*` names instead occupy merged `.rdata` without typed SYM or
per-object boundaries. Existing OVERLAY/STARTUP declarations identify their
descriptor/options role; authentic link-time generation must be investigated
before turning those names into hard-coded C definitions.
