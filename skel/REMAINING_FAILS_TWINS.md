# PC twins for the remaining non-PASS functions

## Current snapshot — 2026-10-03

Full `python tools/status.py` rescan: **2725/2727 PASS**. Only these two
entries remain non-PASS; the older 31-entry table below is historical.

| Function | TU | Current gate | Source reference |
|---|---|---|---|
| DrawSpellCel__FllUclUcc | control | 68 differences, 737/737 instructions; frame 184 vs retail 216 | Devilution `control.cpp:286`, Hellfire `CONTROL.CPP:408`; PSX skeleton CONTROL.CPP |
| DrawObjSelector__FiP12PlayerStruct | padfuncs | 237 differences, 503/514 instructions; frame 264 vs retail 280 | PSX-only; skeleton PADFUNCS.CPP |

The five former byte-PASS/SYM-differs functions are now PASS:
`stream_cdready_handler`, `set_mdec_audio_volume`, `MI_Manashield__Fi`,
`MAI_Counselor__Fi`, and `ProcessMonsters__Fv`. Actual PSYLINK overlay groups
(`OVER` plus `/v`) followed by the original SYMMUNGE `/i` reproduce their
retail declaration membership; the exact comparator was not relaxed.
All five also pass real-ASPSX bytes and call-target audits. Full return-type
audits pass FMV 44/44, MISSILES 115/115 and MONSTER 105/105.

Reference macro probes (`setRECT`, `setRGB0..3`) did not improve either
remaining function. See `tools/instr/README.md` for the tested definitions,
negative results and the successful overlay-producer investigation.
This board is not a complete final-image/SDK-linkage seal.

## Historical 31-entry worklist (superseded; retained for twin locations)

| fn | TU | state | devilution | hellfire | devilutionx | skeleton (JAP/PAL Ghidra) |
|---|---|---|---|---|---|---|
| DrawAutomap__Fv | automap | 1292 diffs (979/979; LineY/AMPlayer restored, 8 lifetime-name SYM records corrected; PSX custom rasterizer) | automap.cpp:648 | AUTOMAP.CPP:685 | automap.cpp:1752 | JAP_1998_05_29/DIABPSX/SOURCE/AUTOMAP.CPP; JAP_1998_05_29/DIABPSX/SOURCE/AUTOMAP.H; JAP_1998_05_29/DIABPSX/SOURCE/SCROLL |
| BL_AsyncReadFile__FPcUl | biglump | 4 diffs (ours 88) | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/BIGLUMP.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/BIGLUMP.H; PAL_1997_12_12/DIABPSX/PSXSRC/BIGLUM |
| PrintMap__7CBlocksii | block | 254 diffs (ours 732) | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/BLOCK.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/BLOCK.H; PAL_1997_12_12/DIABPSX/PSXSRC/BLOCK.CPP; |
| IterateVisibleMap__7CBlocksiiPFP9CacheInfoP8map_infoii_ib | block | 160 diffs (ours 286) | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/BLOCK.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/BLOCK.H |
| PrintMonsters__7CBlocksii | block | 100 diffs (681/681; MyInfraFlag slot, GType/transfile/paloff/SPal lifetimes, bx order and accumulated products restored; 50 ASPSX aligned diffs; 27 calls exact) | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/BLOCK.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/BLOCK.H |
| PrintObjects__7CBlocksii | block | 23 diffs (280/279; exact LoadIndex $v1 record plus accumulated/reordered coordinate lifetimes; 18 ASPSX aligned diffs; one scratch-base +4 instruction remains; 14 calls exact) | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/BLOCK.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/BLOCK.H |
| PrintItems__7CBlocksii | block | 261 diffs (371/368; negative-height reset/store schedule, retained special render branch and accumulated coordinate lifetimes restored; 145 ASPSX aligned diffs; 14 calls exact) | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/BLOCK.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/BLOCK.H |
| DrawSpellCel__FllUclUcc | control | 94 diffs (737/737; 32-byte unreferenced retail frame gap survives all assignment-order/compiler screens) | control.cpp:286 | CONTROL.CPP:408 | - | JAP_1998_05_29/DIABPSX/SOURCE/CONTROL.CPP; JAP_1998_05_29/DIABPSX/SOURCE/CONTROL.H |
| SetScrollTarget__7CPlayerR12PlayerStructR7CBlocks | cplayer | 113 diffs (ours 249) | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/CPLAYER.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/CPLAYER.H; JAP_1998_05_29/DIABPSX/PSXSRC/GLUE.C |
| DoCredits__Fv | credits | 4 diffs (250/250; real RTL: dbr chooses Mode for delay slot; reversed source is cross-jumped to case-2 decrement) | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/CREDITS.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/CREDITS.H |
| DialogPrint__Fiiiiiiiiii | dialog | 110 diffs (608/608; shade/Y order plus 8 u/v SYM lifetimes restored, 78 ASPSX aligned diffs, extra GX record, 30 calls exact) | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/DIALOG.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/DIALOG.H; PAL_1997_12_12/DIABPSX/PSXSRC/DIALOG.C |
| DRLG_L5TransFix__Fv | drlg_l1 | 10 diffs (273/273; exact SYM, gold loop ownership plus late-combine comparison) | drlg_l1.cpp:2486 | DRLG_L1.CPP:2990 | - | JAP_1998_05_29/DIABPSX/SOURCE/DRLG_L1.CPP; JAP_1998_05_29/DIABPSX/SOURCE/DRLG_L1.H |
| set_mdec_img_buffer | fmv | 2 diffs (ours 13) | - | - | - | - |
| LoPlayFMVOverLay | fmv | 2 diffs (ours 274) | - | - | - | - |
| DrawFlask__6GPanelP7PanelXYP12PlayerStruct | gpanel | 34 diffs (285/285; exact SYM and 11 calls, packet and expression forms screened exhaustively) | control.cpp:1127 | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/GPANEL.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/GPANEL.H; PAL_1997_12_12/DIABPSX/PSXSRC/GPANEL.C |
| DrawSpeedBar__6GPanelP7PanelXYP12PlayerStruct | gpanel | 6 diffs (459/459; exact SYM, right-edge scheduling remains) | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/GPANEL.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/GPANEL.H; PAL_1997_12_12/DIABPSX/PSXSRC/GPANEL.C |
| DrawDurThingy__6GPaneliiP10ItemStructi | gpanel | 48 diffs (179/179; DurY hoist fixes body, only eight-byte unreferenced frame gap remains) | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/GPANEL.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/GPANEL.H; PAL_1997_12_12/DIABPSX/PSXSRC/GPANEL.C |
| DrawInvTSK__FP4TASK | inv | 4 maspsx diffs / 2 ASPSX aligned diffs (390/390; exact SYM, retail entry schedule restored; final invflag/sel_data store order remains) | - | - | - | JAP_1998_05_29/DIABPSX/SOURCE/INV.CPP; JAP_1998_05_29/DIABPSX/SOURCE/INV.H; PAL_1997_12_12/DIABPSX/SOURCE/INV.CPP; PAL_1 |
| CheckInvPaste__Fiii | inv | 1575 diffs (ours 1890; 37/37 calls exact, 12-insn length gap) | inv.cpp:1010 | INV.CPP:752 | inv.cpp:562 | JAP_1998_05_29/DIABPSX/SOURCE/INV.CPP; JAP_1998_05_29/DIABPSX/SOURCE/INV.H; PAL_1997_12_12/DIABPSX/SOURCE/INV.CPP; PAL_1 |
| ProcessItems__Fv | items | 93 diffs (192/169; exhaustive six-phase pointer spelling screen bottoms at 74, named reference at 69 but fails SYM) | items.cpp:3488 | ITEMS.CPP:3460 | items.cpp:3781 | JAP_1998_05_29/DIABPSX/SOURCE/DIABLO.CPP; JAP_1998_05_29/DIABPSX/SOURCE/ITEMS.CPP; JAP_1998_05_29/DIABPSX/SOURCE/ITEMS.H |
| DoLighting__Fiiii | lighting | 373 diffs (ours 812 / retail 821) | lighting.cpp:509 | LIGHTING.CPP:304 | lighting.cpp:117 | JAP_1998_05_29/DIABPSX/SOURCE/LIGHTING.CPP; JAP_1998_05_29/DIABPSX/SOURCE/LIGHTING.H; PAL_1997_12_12/DIABPSX/SOURCE/LIGH |
| DrawSpinner__FiiUcUcUciiibiT8T8Uc | options | 589 diffs (416/415; coordinate/color lifetimes restored) | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/CTRL.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/OPTIONS.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/OPTIONS |
| DrawMenu__Fi | options | 751 diffs (1033/1032; frame and local names restored, allocation open) | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/OPTIONS.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/OPTIONS.H; PAL_1997_12_12/DIABPSX/PSXSRC/OPTION |
| DrawObjSelector__FiP12PlayerStruct | padfuncs | 237 diffs (503/514; exact retail nx/ny formulas restore one spill and a 264-byte frame; 30 calls exact) | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/PADFUNCS.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/PADFUNCS.H |
| ResyncQuests__Fv | quests | 6 diffs (315/315; unused gold x/y and cached banner-pointer forms rejected) | quests.cpp:739 | QUESTS.CPP:779 | quests.cpp:397 | JAP_1998_05_29/DIABPSX/SOURCE/DIABLO.CPP; JAP_1998_05_29/DIABPSX/SOURCE/LOADSAVE.CPP; JAP_1998_05_29/DIABPSX/SOURCE/QUES |
| PrintCDWaitTask__FP4TASK | stream | 17 diffs (76/79; unnamed mutable plr-base lifetime still needed; volatile/member/parameter forms rejected) | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/STREAM.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/STREAM.H; PAL_1997_12_12/DIABPSX/PSXSRC/STREAM.C |

| MAI_Counselor__Fi | monster | bytes PASS, SYM differs | monster.cpp:5075 | MONSTER.CPP:5885 | - | JAP_1998_05_29/DIABPSX/SOURCE/MONSTER.CPP |
| MI_Manashield__Fi | missiles | bytes PASS, SYM differs | missiles.cpp:4848 | MISSILES.CPP:5626 | - | JAP_1998_05_29/DIABPSX/SOURCE/MISSILES.CPP |
| ProcessMonsters__Fv | monster | bytes PASS, SYM differs | monster.cpp:5515 | MONSTER.CPP:6350 | monster.cpp:4257 | JAP_1998_05_29/DIABPSX/SOURCE/MONSTER.CPP |
| set_mdec_audio_volume | fmv | bytes PASS, SYM differs | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/FMV.CPP |
| stream_cdready_handler | fmv | bytes PASS, SYM differs | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/FMV.CPP |

Legend: devilution/hellfire/devilutionx = PC twin definition file:line under refs/<repo>/Source|src; '-' = PSX-only (Climax) code, no PC twin. skeleton = Ghidra-decompiled retail PSX builds (mangled names) in refs/skeleton, the only reference for PSX-only functions.

## Verified SYM-only clusters

Resolved `read_card_directory`: restored the complete original Climax control
and declaration shape from `C:/Temp/ps1-decomp-refs/warcraft2/memcard.c`:
declaration-initialized `dir`, one `i, fh, r` declaration, `fh = open(...)`
inside the success condition, and a separate `fh == -1 || r == -1` error
test. This removes the redundant `nor/beqz` lowering while preserving Diablo's
title conversion, delay, and dirty-slot behavior. Both byte lanes match all
151 instructions, exact SYM passes, and all eleven calls match.

Resolved `GetUniqueItem`: preserve OUid, copy it to uid, then apply uid's
low-byte mask in a separate statement. Both byte lanes match 216 instructions,
exact SYM and all seven calls pass. No additional locals or forced registers.

Resolved `SoundPad`: move the special cancellation branch's Adjust reset after
the cmenu/cs assignments. The late jump pass no longer merges the cmenu store.
Both byte lanes match all 642 instructions, exact SYM and 41 calls pass.
OPTIONS is now 35/38; no additional locals or compiler/gate changes were needed.

Resolved `DrawOptions`: restored owned Qfromoptions/PadFrig/old_pad with their
retail initial values, explicit menu-selection stores and controller-exit
branch order. The TASK definition now has its actual 92-byte layout. Both
byte lanes match 447 instructions, exact SYM and 63 calls; OPTIONS is 34/38.

Resolved `CFont::Print`: reuse c for the second left-justified Kanji byte and
zero-extend the centre/right lead bytes before shifting. All 398 instructions,
exact SYM and thirteen calls pass in both byte lanes. PRINTY is 19/19.

Resolved `BgTask`: retail local types/names and separate startup/render player
address lifetimes restore all 299 instructions. JustLoadedPlayer's byte type
also fixes the draft's word store. Exact SYM and 53 calls pass; GLUE is 28/28.

Resolved `CheckIsoBodge`: preserve wy and pass wy+oy to both CheckDirs calls,
use the shared final newdir return and the CheckCentre-negative body, and
retain the initial CheckDirs result in a const local. Both byte lanes (219
instructions), exact SYM scopes and fifteen call targets pass. GAMEPAD is 42/42.

Resolved `M_ChangeLightOffset`: each Y correction branch assigns ly from y2,
then a separate const temporary computes the scaled Y argument. This preserves
both y2 and ly in retail's a0 records, with all 90 instructions, local branch
targets, real ASPSX output, and the ChangeLightOff call verified. MONSTER is
103/105; MAI_Counselor and ProcessMonsters remain open.

Resolved MSG pair: `DeltaAddItem` now resets and reuses pD from saved OpD for
the second scan, then releases and returns directly after a successful fill.
`delta_get_item` uses root-scope Dl/pD/i and natural release-and-return paths in
both scans, with no cached bc or shared goto label. The compiler performs the
retail tail merging itself. Both byte lanes, exact SYM, and call audits pass
(138 and 115 instructions respectively); MSG is now 111/111 PASS.

`ProcessItems` follow-up: retail retains the incremented byte frame in `$s1`
across `PlaySfxLoc` (0x80045AB8 through 0x80045AD0); reloading the field after
the call was incorrect. A const byte snapshot after the increment reduces
136 diffs (193 instructions, not the old table's 169) to 93 (192/169).
The three call targets match; the Items TU remains 104/106 PASS. The remaining
allocation issue keeps `ii` live across calls instead of retaining retail's
item offset and base pointer. Real compiler allocation evidence is available
with `tools/instr/real_rtl.py recon/source/items.cpp ProcessItems --dump greg`.
Pointer-caching trials were reverted: 163 or 172 instructions did not match
retail. `PrintGameOver` is now resolved: the old CFont declaration had no data
members. Restoring its actual 540-byte SYM layout and calling MediumFont
directly reproduces all 80 instructions and exact SYM without the Font local.
It passes both assemblers and all 13 ordered calls; GAMEOVER is now 12/12.

- Local-static membership: `set_mdec_audio_volume`, `stream_cdready_handler`, `MI_Manashield__Fi`, and `ProcessMonsters__Fv` are byte-exact, but the current PsyQ 4.0 debug lane emits their function-local `STAT` records inside the outer block while retail emits them immediately before it. PsyQ 4.1, 4.3, and 4.6 were tested and change code bytes, so they are not valid substitutes.
- Resolved temporary records: `wait_cdstream` now passes using the original Climax five-second frame-timeout expression from `ps1-decomp-refs/warcraft2/cdstream.c`, with no artificial wait flag or address-taking. `GLUE_StartGameExit__Fv` now passes: declaring the actual `PlayerStruct plr[2]` and clearing its `plractive` fields in an ascending two-player loop lets the compiler reverse and eliminate the source induction variable, reproducing all 27 instructions without an `i` record. A cast from the old byte-array declaration does not produce the same loop optimization. `DRLG_L2PlaceMiniSet__FPUciiiiii` now passes: a const random-selection index plus a direct tile-offset expression removes its reused `r` record without changing the 228 instructions. `CheckMissileCol__FiiiUciiUcb` now passes: function-scope `int earflag` preserves the bytes and loses the extra record emitted for `unsigned char earflag`. `MakeGt4__7CBlocksP8POLY_GT4P9FRAME_HDR` now also passes: a `const unsigned short W` temporary fixes its mask scheduling without adding a SYM record.
`PrintItemPower__FcPC10ItemStruct` also passes after c3d42ca: explicit in-place output-pointer updates raise tstr's allocator priority above x's (confirmed with the 9cc6504 instrumented compiler lane). MATCH_PROGRESS.md is the authoritative gate board.
