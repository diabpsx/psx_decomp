# PC twins for the remaining non-PASS functions (38)

| fn | TU | state | devilution | hellfire | devilutionx | skeleton (JAP/PAL Ghidra) |
|---|---|---|---|---|---|---|
| DrawAutomap__Fv | automap | 1337 diffs (ours 979) | automap.cpp:648 | AUTOMAP.CPP:685 | automap.cpp:1752 | JAP_1998_05_29/DIABPSX/SOURCE/AUTOMAP.CPP; JAP_1998_05_29/DIABPSX/SOURCE/AUTOMAP.H; JAP_1998_05_29/DIABPSX/SOURCE/SCROLL |
| BL_AsyncReadFile__FPcUl | biglump | 4 diffs (ours 88) | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/BIGLUMP.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/BIGLUMP.H; PAL_1997_12_12/DIABPSX/PSXSRC/BIGLUM |
| PrintMap__7CBlocksii | block | 254 diffs (ours 732) | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/BLOCK.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/BLOCK.H; PAL_1997_12_12/DIABPSX/PSXSRC/BLOCK.CPP; |
| IterateVisibleMap__7CBlocksiiPFP9CacheInfoP8map_infoii_ib | block | 160 diffs (ours 286) | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/BLOCK.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/BLOCK.H |
| PrintMonsters__7CBlocksii | block | 275 diffs (ours 682 / retail 681; fixed literal offsets preserved) | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/BLOCK.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/BLOCK.H |
| PrintObjects__7CBlocksii | block | 167 diffs (ours 280 / retail 279; fixed literal offsets preserved) | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/BLOCK.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/BLOCK.H |
| PrintItems__7CBlocksii | block | 403 diffs (ours 385 / retail 368; fixed literal offsets preserved) | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/BLOCK.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/BLOCK.H |
| DrawSpellCel__FllUclUcc | control | 94 diffs (ours 737) | control.cpp:286 | CONTROL.CPP:408 | - | JAP_1998_05_29/DIABPSX/SOURCE/CONTROL.CPP; JAP_1998_05_29/DIABPSX/SOURCE/CONTROL.H |
| SetScrollTarget__7CPlayerR12PlayerStructR7CBlocks | cplayer | 113 diffs (ours 249) | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/CPLAYER.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/CPLAYER.H; JAP_1998_05_29/DIABPSX/PSXSRC/GLUE.C |
| DoCredits__Fv | credits | 4 diffs (ours 250) | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/CREDITS.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/CREDITS.H |
| DialogPrint__Fiiiiiiiiii | dialog | 162 diffs (ours 608) | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/DIALOG.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/DIALOG.H; PAL_1997_12_12/DIABPSX/PSXSRC/DIALOG.C |
| Back__6Dialogiiii | dialog | 8 diffs (ours 1094) | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/CARDCORE.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/CTRL.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/DIALOG |
| DRLG_L5TransFix__Fv | drlg_l1 | 357 diffs (ours 273) | drlg_l1.cpp:2486 | DRLG_L1.CPP:2990 | - | JAP_1998_05_29/DIABPSX/SOURCE/DRLG_L1.CPP; JAP_1998_05_29/DIABPSX/SOURCE/DRLG_L1.H |
| set_mdec_img_buffer | fmv | 2 diffs (ours 13) | - | - | - | - |
| LoPlayFMVOverLay | fmv | 2 diffs (ours 274) | - | - | - | - |
| DrawFlask__6GPanelP7PanelXYP12PlayerStruct | gpanel | 74 diffs (ours 285) | control.cpp:1127 | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/GPANEL.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/GPANEL.H; PAL_1997_12_12/DIABPSX/PSXSRC/GPANEL.C |
| DrawSpeedBar__6GPanelP7PanelXYP12PlayerStruct | gpanel | 11 diffs (ours 460 / retail 459; packet/origin/OT/bounce bugs repaired) | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/GPANEL.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/GPANEL.H; PAL_1997_12_12/DIABPSX/PSXSRC/GPANEL.C |
| DrawDurThingy__6GPaneliiP10ItemStructi | gpanel | 49 diffs (ours 178 / retail 179; DurColors matrix and valid rectangle macro) | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/GPANEL.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/GPANEL.H; PAL_1997_12_12/DIABPSX/PSXSRC/GPANEL.C |
| DrawInvTSK__FP4TASK | inv | 8 diffs (ours 390) | - | - | - | JAP_1998_05_29/DIABPSX/SOURCE/INV.CPP; JAP_1998_05_29/DIABPSX/SOURCE/INV.H; PAL_1997_12_12/DIABPSX/SOURCE/INV.CPP; PAL_1 |
| CheckInvPaste__Fiii | inv | 1575 diffs (ours 1890; 37/37 calls exact, 12-insn length gap) | inv.cpp:1010 | INV.CPP:752 | inv.cpp:562 | JAP_1998_05_29/DIABPSX/SOURCE/INV.CPP; JAP_1998_05_29/DIABPSX/SOURCE/INV.H; PAL_1997_12_12/DIABPSX/SOURCE/INV.CPP; PAL_1 |
| GetUniqueItem__Fii | items | 88 diffs (ours 216) | items.cpp:2838 | ITEMS.CPP:2798 | items.cpp:1452 | JAP_1998_05_29/DIABPSX/SOURCE/ITEMS.CPP; JAP_1998_05_29/DIABPSX/SOURCE/ITEMS.H; PAL_1997_12_12/DIABPSX/SOURCE/ITEMS.CPP; |
| ProcessItems__Fv | items | 93 diffs (ours 192 / retail 169; frame snapshot across sound call repaired) | items.cpp:3488 | ITEMS.CPP:3460 | items.cpp:3781 | JAP_1998_05_29/DIABPSX/SOURCE/DIABLO.CPP; JAP_1998_05_29/DIABPSX/SOURCE/ITEMS.CPP; JAP_1998_05_29/DIABPSX/SOURCE/ITEMS.H |
| DoLighting__Fiiii | lighting | 373 diffs (ours 821) | lighting.cpp:509 | LIGHTING.CPP:304 | lighting.cpp:117 | JAP_1998_05_29/DIABPSX/SOURCE/LIGHTING.CPP; JAP_1998_05_29/DIABPSX/SOURCE/LIGHTING.H; PAL_1997_12_12/DIABPSX/SOURCE/LIGH |
| read_card_directory__Fi | memcard | 3 diffs (ours 151; one -1 comparison lowering) | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/MEMCARD.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/MEMCARD.H |
| DrawSpinner__FiiUcUcUciiibiT8T8Uc | options | 641 diffs (ours 415) | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/CTRL.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/OPTIONS.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/OPTIONS |
| DrawMenu__Fi | options | 965 diffs (ours 1032) | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/OPTIONS.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/OPTIONS.H; PAL_1997_12_12/DIABPSX/PSXSRC/OPTION |
| MemcardPad__Fv | options | 8 diffs (ours 583 / retail 585; selection/save control flow repaired, 33 calls exact) | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/OPTIONS.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/OPTIONS.H; PAL_1997_12_12/DIABPSX/PSXSRC/OPTION |
| SoundPad__Fv | options | 535 diffs (ours 642) | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/OPTIONS.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/OPTIONS.H; PAL_1997_12_12/DIABPSX/PSXSRC/OPTION |
| DrawOptions__FP4TASK | options | 164 diffs (ours 447) | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/OPTIONS.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/OPTIONS.H; PAL_1997_12_12/DIABPSX/PSXSRC/OPTION |
| DrawObjSelector__FiP12PlayerStruct | padfuncs | 237 diffs (ours 514) | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/PADFUNCS.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/PADFUNCS.H |
| Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc | printy | 62 diffs (ours 398) | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/CARDCORE.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/DLG.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/FE.CPP; |
| ResyncQuests__Fv | quests | 6 diffs (ours 315) | quests.cpp:739 | QUESTS.CPP:779 | quests.cpp:397 | JAP_1998_05_29/DIABPSX/SOURCE/DIABLO.CPP; JAP_1998_05_29/DIABPSX/SOURCE/LOADSAVE.CPP; JAP_1998_05_29/DIABPSX/SOURCE/QUES |
| PrintCDWaitTask__FP4TASK | stream | 17 diffs (ours 79) | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/STREAM.CPP; JAP_1998_05_29/DIABPSX/PSXSRC/STREAM.H; PAL_1997_12_12/DIABPSX/PSXSRC/STREAM.C |

| MAI_Counselor__Fi | monster | bytes PASS, SYM differs | monster.cpp:5075 | MONSTER.CPP:5885 | - | JAP_1998_05_29/DIABPSX/SOURCE/MONSTER.CPP |
| MI_Manashield__Fi | missiles | bytes PASS, SYM differs | missiles.cpp:4848 | MISSILES.CPP:5626 | - | JAP_1998_05_29/DIABPSX/SOURCE/MISSILES.CPP |
| ProcessMonsters__Fv | monster | bytes PASS, SYM differs | monster.cpp:5515 | MONSTER.CPP:6350 | monster.cpp:4257 | JAP_1998_05_29/DIABPSX/SOURCE/MONSTER.CPP |
| set_mdec_audio_volume | fmv | bytes PASS, SYM differs | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/FMV.CPP |
| stream_cdready_handler | fmv | bytes PASS, SYM differs | - | - | - | JAP_1998_05_29/DIABPSX/PSXSRC/FMV.CPP |

Legend: devilution/hellfire/devilutionx = PC twin definition file:line under refs/<repo>/Source|src; '-' = PSX-only (Climax) code, no PC twin. skeleton = Ghidra-decompiled retail PSX builds (mangled names) in refs/skeleton, the only reference for PSX-only functions.

## Verified SYM-only clusters

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
