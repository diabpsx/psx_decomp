.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawInvTSK__FP4TASK, 0x618

glabel DrawInvTSK__FP4TASK
    /* 1F504 801590FC C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 1F508 80159100 2800B6AF */  sw         $s6, 0x28($sp)
    /* 1F50C 80159104 1280163C */  lui        $s6, %hi(myplr)
    /* 1F510 80159108 08BAD68E */  lw         $s6, %lo(myplr)($s6)
    /* 1F514 8015910C AC1B8293 */  lbu        $v0, %gp_rel(invflag)($gp)
    /* 1F518 80159110 2C00B7AF */  sw         $s7, 0x2C($sp)
    /* 1F51C 80159114 1280173C */  lui        $s7, %hi(sel_data)
    /* 1F520 80159118 2CB7F78E */  lw         $s7, %lo(sel_data)($s7)
    /* 1F524 8015911C 3000BFAF */  sw         $ra, 0x30($sp)
    /* 1F528 80159120 2400B5AF */  sw         $s5, 0x24($sp)
    /* 1F52C 80159124 2000B4AF */  sw         $s4, 0x20($sp)
    /* 1F530 80159128 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1F534 8015912C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1F538 80159130 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1F53C 80159134 06004010 */  beqz       $v0, .L80159150
    /* 1F540 80159138 1000B0AF */   sw        $s0, 0x10($sp)
    /* 1F544 8015913C 1280043C */  lui        $a0, %hi(options_pad)
    /* 1F548 80159140 50B2848C */  lw         $a0, %lo(options_pad)($a0)
    /* 1F54C 80159144 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 1F550 80159148 08008214 */  bne        $a0, $v0, .L8015916C
    /* 1F554 8015914C 00000000 */   nop
  .L80159150:
    /* 1F558 80159150 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 1F55C 80159154 A41B80AF */  sw         $zero, %gp_rel(D_8011C324)($gp)
    /* 1F560 80159158 AC1B80A3 */  sb         $zero, %gp_rel(invflag)($gp)
    /* 1F564 8015915C 1280013C */  lui        $at, %hi(options_pad)
    /* 1F568 80159160 50B222AC */  sw         $v0, %lo(options_pad)($at)
    /* 1F56C 80159164 B9650508 */  j          .L801596E4
    /* 1F570 80159168 00000000 */   nop
  .L8015916C:
    /* 1F574 8015916C 1280013C */  lui        $at, %hi(myplr)
    /* 1F578 80159170 08BA24AC */  sw         $a0, %lo(myplr)($at)
    /* 1F57C 80159174 FD25020C */  jal        PAD_GetPad__FiUc
    /* 1F580 80159178 21280000 */   addu      $a1, $zero, $zero
    /* 1F584 8015917C B426020C */  jal        Flush__4CPad
    /* 1F588 80159180 21204000 */   addu      $a0, $v0, $zero
    /* 1F58C 80159184 01000224 */  addiu      $v0, $zero, 0x1
    /* 1F590 80159188 1280013C */  lui        $at, %hi(CDWAIT)
    /* 1F594 8015918C ECAD22AC */  sw         $v0, %lo(CDWAIT)($at)
    /* 1F598 80159190 01000224 */  addiu      $v0, $zero, 0x1
    /* 1F59C 80159194 1280013C */  lui        $at, %hi(PauseMode)
    /* 1F5A0 80159198 A4B722A0 */  sb         $v0, %lo(PauseMode)($at)
    /* 1F5A4 8015919C 896E020C */  jal        GLUE_SuspendGame__Fv
    /* 1F5A8 801591A0 00000000 */   nop
    /* 1F5AC 801591A4 1280023C */  lui        $v0, %hi(sghMusic)
    /* 1F5B0 801591A8 B4BB428C */  lw         $v0, %lo(sghMusic)($v0)
    /* 1F5B4 801591AC 00000000 */  nop
    /* 1F5B8 801591B0 15004010 */  beqz       $v0, .L80159208
    /* 1F5BC 801591B4 00000000 */   nop
    /* 1F5C0 801591B8 4C00428C */  lw         $v0, 0x4C($v0)
    /* 1F5C4 801591BC 00000000 */  nop
    /* 1F5C8 801591C0 04004228 */  slti       $v0, $v0, 0x4
    /* 1F5CC 801591C4 10004010 */  beqz       $v0, .L80159208
    /* 1F5D0 801591C8 00000000 */   nop
    /* 1F5D4 801591CC 01001024 */  addiu      $s0, $zero, 0x1
  .L801591D0:
    /* 1F5D8 801591D0 1280013C */  lui        $at, %hi(PauseMode)
    /* 1F5DC 801591D4 A4B730A0 */  sb         $s0, %lo(PauseMode)($at)
    /* 1F5E0 801591D8 896E020C */  jal        GLUE_SuspendGame__Fv
    /* 1F5E4 801591DC 00000000 */   nop
    /* 1F5E8 801591E0 EE80000C */  jal        TSK_Sleep
    /* 1F5EC 801591E4 01000424 */   addiu     $a0, $zero, 0x1
    /* 1F5F0 801591E8 1280023C */  lui        $v0, %hi(sghMusic)
    /* 1F5F4 801591EC B4BB428C */  lw         $v0, %lo(sghMusic)($v0)
    /* 1F5F8 801591F0 00000000 */  nop
    /* 1F5FC 801591F4 4C00428C */  lw         $v0, 0x4C($v0)
    /* 1F600 801591F8 00000000 */  nop
    /* 1F604 801591FC 04004228 */  slti       $v0, $v0, 0x4
    /* 1F608 80159200 F3FF4014 */  bnez       $v0, .L801591D0
    /* 1F60C 80159204 00000000 */   nop
  .L80159208:
    /* 1F610 80159208 EC6E020C */  jal        GLUE_SetShowPanelFlag__Fb
    /* 1F614 8015920C 21200000 */   addu      $a0, $zero, $zero
    /* 1F618 80159210 EE80000C */  jal        TSK_Sleep
    /* 1F61C 80159214 01000424 */   addiu     $a0, $zero, 0x1
    /* 1F620 80159218 D7F3000C */  jal        stream_stop__Fv
    /* 1F624 8015921C 00000000 */   nop
    /* 1F628 80159220 0C80023C */  lui        $v0, %hi(SFXTab + 0x84)
    /* 1F62C 80159224 649C4280 */  lb         $v0, %lo(SFXTab + 0x84)($v0)
    /* 1F630 80159228 00000000 */  nop
    /* 1F634 8015922C 0A004010 */  beqz       $v0, .L80159258
    /* 1F638 80159230 00000000 */   nop
  .L80159234:
    /* 1F63C 80159234 D7F3000C */  jal        stream_stop__Fv
    /* 1F640 80159238 00000000 */   nop
    /* 1F644 8015923C EE80000C */  jal        TSK_Sleep
    /* 1F648 80159240 01000424 */   addiu     $a0, $zero, 0x1
    /* 1F64C 80159244 0C80023C */  lui        $v0, %hi(SFXTab + 0x84)
    /* 1F650 80159248 649C4280 */  lb         $v0, %lo(SFXTab + 0x84)($v0)
    /* 1F654 8015924C 00000000 */  nop
    /* 1F658 80159250 F8FF4014 */  bnez       $v0, .L80159234
    /* 1F65C 80159254 00000000 */   nop
  .L80159258:
    /* 1F660 80159258 896E020C */  jal        GLUE_SuspendGame__Fv
    /* 1F664 8015925C 00000000 */   nop
    /* 1F668 80159260 E16E020C */  jal        GLUE_SetShowGameScreenFlag__Fb
    /* 1F66C 80159264 21200000 */   addu      $a0, $zero, $zero
    /* 1F670 80159268 EE80000C */  jal        TSK_Sleep
    /* 1F674 8015926C 01000424 */   addiu     $a0, $zero, 0x1
    /* 1F678 80159270 6410020C */  jal        VID_SetDBuffer__Fb
    /* 1F67C 80159274 01000424 */   addiu     $a0, $zero, 0x1
    /* 1F680 80159278 1280043C */  lui        $a0, %hi(_spselflag)
    /* 1F684 8015927C 50B6848C */  lw         $a0, %lo(_spselflag)($a0)
    /* 1F688 80159280 00000000 */  nop
    /* 1F68C 80159284 03008010 */  beqz       $a0, .L80159294
    /* 1F690 80159288 00000000 */   nop
    /* 1F694 8015928C 5281000C */  jal        TSK_Kill
    /* 1F698 80159290 00000000 */   nop
  .L80159294:
    /* 1F69C 80159294 1280043C */  lui        $a0, %hi(_spselflag + 0x4)
    /* 1F6A0 80159298 54B6848C */  lw         $a0, %lo(_spselflag + 0x4)($a0)
    /* 1F6A4 8015929C 00000000 */  nop
    /* 1F6A8 801592A0 03008010 */  beqz       $a0, .L801592B0
    /* 1F6AC 801592A4 00000000 */   nop
    /* 1F6B0 801592A8 5281000C */  jal        TSK_Kill
    /* 1F6B4 801592AC 00000000 */   nop
  .L801592B0:
    /* 1F6B8 801592B0 1280023C */  lui        $v0, %hi(sel_data)
    /* 1F6BC 801592B4 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 1F6C0 801592B8 1280013C */  lui        $at, %hi(_spselflag)
    /* 1F6C4 801592BC 50B620AC */  sw         $zero, %lo(_spselflag)($at)
    /* 1F6C8 801592C0 1280013C */  lui        $at, %hi(_spselflag + 0x4)
    /* 1F6CC 801592C4 54B620AC */  sw         $zero, %lo(_spselflag + 0x4)($at)
    /* 1F6D0 801592C8 1280013C */  lui        $at, %hi(_trigflag)
    /* 1F6D4 801592CC 21082200 */  addu       $at, $at, $v0
    /* 1F6D8 801592D0 74BB20A0 */  sb         $zero, %lo(_trigflag)($at)
    /* 1F6DC 801592D4 E4DF010C */  jal        ClrCursor__Fi
    /* 1F6E0 801592D8 21200000 */   addu      $a0, $zero, $zero
    /* 1F6E4 801592DC E4DF010C */  jal        ClrCursor__Fi
    /* 1F6E8 801592E0 01000424 */   addiu     $a0, $zero, 0x1
    /* 1F6EC 801592E4 7B46020C */  jal        BL_GetCurrentBlocks__Fv
    /* 1F6F0 801592E8 00000000 */   nop
    /* 1F6F4 801592EC 1280033C */  lui        $v1, %hi(leveltype)
    /* 1F6F8 801592F0 0DC16390 */  lbu        $v1, %lo(leveltype)($v1)
    /* 1F6FC 801592F4 00000000 */  nop
    /* 1F700 801592F8 03006014 */  bnez       $v1, .L80159308
    /* 1F704 801592FC 21A84000 */   addu      $s5, $v0, $zero
    /* 1F708 80159300 CA87050C */  jal        DumpMonsters__7CBlocks_80161f28
    /* 1F70C 80159304 2120A002 */   addu      $a0, $s5, $zero
  .L80159308:
    /* 1F710 80159308 8C1B828F */  lw         $v0, %gp_rel(InvGfxTData)($gp)
    /* 1F714 8015930C 00000000 */  nop
    /* 1F718 80159310 04004014 */  bnez       $v0, .L80159324
    /* 1F71C 80159314 00000000 */   nop
    /* 1F720 80159318 044F020C */  jal        GM_UseTexData__Fi
    /* 1F724 8015931C CF000424 */   addiu     $a0, $zero, 0xCF
    /* 1F728 80159320 8C1B82AF */  sw         $v0, %gp_rel(InvGfxTData)($gp)
  .L80159324:
    /* 1F72C 80159324 1280023C */  lui        $v0, %hi(myplr)
    /* 1F730 80159328 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 1F734 8015932C 1280033C */  lui        $v1, %hi(_pcurs)
    /* 1F738 80159330 30B76324 */  addiu      $v1, $v1, %lo(_pcurs)
    /* 1F73C 80159334 80100200 */  sll        $v0, $v0, 2
    /* 1F740 80159338 21204300 */  addu       $a0, $v0, $v1
    /* 1F744 8015933C 0000838C */  lw         $v1, 0x0($a0)
    /* 1F748 80159340 09000224 */  addiu      $v0, $zero, 0x9
    /* 1F74C 80159344 02006214 */  bne        $v1, $v0, .L80159350
    /* 1F750 80159348 01000224 */   addiu     $v0, $zero, 0x1
    /* 1F754 8015934C 000082AC */  sw         $v0, 0x0($a0)
  .L80159350:
    /* 1F758 80159350 D784050C */  jal        InvSetItemCurs__Fv
    /* 1F75C 80159354 01001124 */   addiu     $s1, $zero, 0x1
    /* 1F760 80159358 6410020C */  jal        VID_SetDBuffer__Fb
    /* 1F764 8015935C 21200000 */   addu      $a0, $zero, $zero
    /* 1F768 80159360 EE80000C */  jal        TSK_Sleep
    /* 1F76C 80159364 01000424 */   addiu     $a0, $zero, 0x1
    /* 1F770 80159368 0C80133C */  lui        $s3, %hi(MediumFont)
    /* 1F774 8015936C D8827326 */  addiu      $s3, $s3, %lo(MediumFont)
    /* 1F778 80159370 1280143C */  lui        $s4, %hi(options_pad)
    /* 1F77C 80159374 50B2948E */  lw         $s4, %lo(options_pad)($s4)
    /* 1F780 80159378 FFFF1224 */  addiu      $s2, $zero, -0x1
    /* 1F784 8015937C 1280013C */  lui        $at, %hi(CDWAIT)
    /* 1F788 80159380 ECAD20AC */  sw         $zero, %lo(CDWAIT)($at)
    /* 1F78C 80159384 1280013C */  lui        $at, %hi(PauseMode)
    /* 1F790 80159388 A4B720A0 */  sb         $zero, %lo(PauseMode)($at)
  .L8015938C:
    /* 1F794 8015938C 78002012 */  beqz       $s1, .L80159570
    /* 1F798 80159390 21880000 */   addu      $s1, $zero, $zero
    /* 1F79C 80159394 01000224 */  addiu      $v0, $zero, 0x1
    /* 1F7A0 80159398 1280013C */  lui        $at, %hi(options_pad)
    /* 1F7A4 8015939C 50B234AC */  sw         $s4, %lo(options_pad)($at)
    /* 1F7A8 801593A0 AC1B82A3 */  sb         $v0, %gp_rel(invflag)($gp)
  .L801593A4:
    /* 1F7AC 801593A4 AC1B8293 */  lbu        $v0, %gp_rel(invflag)($gp)
    /* 1F7B0 801593A8 00000000 */  nop
    /* 1F7B4 801593AC 3B004010 */  beqz       $v0, .L8015949C
    /* 1F7B8 801593B0 00000000 */   nop
    /* 1F7BC 801593B4 1280023C */  lui        $v0, %hi(options_pad)
    /* 1F7C0 801593B8 50B2428C */  lw         $v0, %lo(options_pad)($v0)
    /* 1F7C4 801593BC 00000000 */  nop
    /* 1F7C8 801593C0 36004004 */  bltz       $v0, .L8015949C
    /* 1F7CC 801593C4 21206002 */   addu      $a0, $s3, $zero
    /* 1F7D0 801593C8 E82A020C */  jal        SetOTpos__5CFonti
    /* 1F7D4 801593CC FC000524 */   addiu     $a1, $zero, 0xFC
    /* 1F7D8 801593D0 1280033C */  lui        $v1, %hi(options_pad)
    /* 1F7DC 801593D4 50B2638C */  lw         $v1, %lo(options_pad)($v1)
    /* 1F7E0 801593D8 1280013C */  lui        $at, %hi(myplr)
    /* 1F7E4 801593DC 08BA23AC */  sw         $v1, %lo(myplr)($at)
    /* 1F7E8 801593E0 1280013C */  lui        $at, %hi(sel_data)
    /* 1F7EC 801593E4 2CB723AC */  sw         $v1, %lo(sel_data)($at)
    /* 1F7F0 801593E8 3D83050C */  jal        ControlInv__Fv
    /* 1F7F4 801593EC 21804000 */   addu      $s0, $v0, $zero
    /* 1F7F8 801593F0 1280023C */  lui        $v0, %hi(options_pad)
    /* 1F7FC 801593F4 50B2428C */  lw         $v0, %lo(options_pad)($v0)
    /* 1F800 801593F8 00000000 */  nop
    /* 1F804 801593FC 07005210 */  beq        $v0, $s2, .L8015941C
    /* 1F808 80159400 00000000 */   nop
    /* 1F80C 80159404 1280013C */  lui        $at, %hi(myplr)
    /* 1F810 80159408 08BA22AC */  sw         $v0, %lo(myplr)($at)
    /* 1F814 8015940C 1280013C */  lui        $at, %hi(sel_data)
    /* 1F818 80159410 2CB722AC */  sw         $v0, %lo(sel_data)($at)
    /* 1F81C 80159414 C565050C */  jal        DoThatDrawInv__Fv
    /* 1F820 80159418 00000000 */   nop
  .L8015941C:
    /* 1F824 8015941C 21206002 */  addu       $a0, $s3, $zero
    /* 1F828 80159420 E82A020C */  jal        SetOTpos__5CFonti
    /* 1F82C 80159424 21280002 */   addu      $a1, $s0, $zero
    /* 1F830 80159428 896E020C */  jal        GLUE_SuspendGame__Fv
    /* 1F834 8015942C 00000000 */   nop
    /* 1F838 80159430 EE80000C */  jal        TSK_Sleep
    /* 1F83C 80159434 01000424 */   addiu     $a0, $zero, 0x1
    /* 1F840 80159438 1280023C */  lui        $v0, %hi(options_pad)
    /* 1F844 8015943C 50B2428C */  lw         $v0, %lo(options_pad)($v0)
    /* 1F848 80159440 00000000 */  nop
    /* 1F84C 80159444 40180200 */  sll        $v1, $v0, 1
    /* 1F850 80159448 21186200 */  addu       $v1, $v1, $v0
    /* 1F854 8015944C 80180300 */  sll        $v1, $v1, 2
    /* 1F858 80159450 21186200 */  addu       $v1, $v1, $v0
    /* 1F85C 80159454 00190300 */  sll        $v1, $v1, 4
    /* 1F860 80159458 23186200 */  subu       $v1, $v1, $v0
    /* 1F864 8015945C 80180300 */  sll        $v1, $v1, 2
    /* 1F868 80159460 21186200 */  addu       $v1, $v1, $v0
    /* 1F86C 80159464 C0180300 */  sll        $v1, $v1, 3
    /* 1F870 80159468 0E80013C */  lui        $at, %hi(plr + 0x11C)
    /* 1F874 8015946C 21082300 */  addu       $at, $at, $v1
    /* 1F878 80159470 54A6228C */  lw         $v0, %lo(plr + 0x11C)($at)
    /* 1F87C 80159474 00000000 */  nop
    /* 1F880 80159478 83110200 */  sra        $v0, $v0, 6
    /* 1F884 8015947C C9FF401C */  bgtz       $v0, .L801593A4
    /* 1F888 80159480 21280000 */   addu      $a1, $zero, $zero
    /* 1F88C 80159484 05000424 */  addiu      $a0, $zero, 0x5
    /* 1F890 80159488 21300000 */  addu       $a2, $zero, $zero
    /* 1F894 8015948C 53EB010C */  jal        PostGamePad__Fiiii
    /* 1F898 80159490 21380000 */   addu      $a3, $zero, $zero
    /* 1F89C 80159494 1280013C */  lui        $at, %hi(options_pad)
    /* 1F8A0 80159498 50B232AC */  sw         $s2, %lo(options_pad)($at)
  .L8015949C:
    /* 1F8A4 8015949C 1280023C */  lui        $v0, %hi(myplr)
    /* 1F8A8 801594A0 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 1F8AC 801594A4 1280033C */  lui        $v1, %hi(_pcurs)
    /* 1F8B0 801594A8 30B76324 */  addiu      $v1, $v1, %lo(_pcurs)
    /* 1F8B4 801594AC 80100200 */  sll        $v0, $v0, 2
    /* 1F8B8 801594B0 21204300 */  addu       $a0, $v0, $v1
    /* 1F8BC 801594B4 0000838C */  lw         $v1, 0x0($a0)
    /* 1F8C0 801594B8 00000000 */  nop
    /* 1F8C4 801594BC FEFF6224 */  addiu      $v0, $v1, -0x2
    /* 1F8C8 801594C0 0200422C */  sltiu      $v0, $v0, 0x2
    /* 1F8CC 801594C4 04004014 */  bnez       $v0, .L801594D8
    /* 1F8D0 801594C8 01000224 */   addiu     $v0, $zero, 0x1
    /* 1F8D4 801594CC 04000224 */  addiu      $v0, $zero, 0x4
    /* 1F8D8 801594D0 02006214 */  bne        $v1, $v0, .L801594DC
    /* 1F8DC 801594D4 01000224 */   addiu     $v0, $zero, 0x1
  .L801594D8:
    /* 1F8E0 801594D8 000082AC */  sw         $v0, 0x0($a0)
  .L801594DC:
    /* 1F8E4 801594DC 1280023C */  lui        $v0, %hi(myplr)
    /* 1F8E8 801594E0 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 1F8EC 801594E4 00000000 */  nop
    /* 1F8F0 801594E8 80100200 */  sll        $v0, $v0, 2
    /* 1F8F4 801594EC 1280013C */  lui        $at, %hi(_pcurs)
    /* 1F8F8 801594F0 21082200 */  addu       $at, $at, $v0
    /* 1F8FC 801594F4 30B7228C */  lw         $v0, %lo(_pcurs)($at)
    /* 1F900 801594F8 00000000 */  nop
    /* 1F904 801594FC 0C004228 */  slti       $v0, $v0, 0xC
    /* 1F908 80159500 A2FF4014 */  bnez       $v0, .L8015938C
    /* 1F90C 80159504 00000000 */   nop
    /* 1F910 80159508 087C050C */  jal        TryInvPut__Fv
    /* 1F914 8015950C 00000000 */   nop
    /* 1F918 80159510 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1F91C 80159514 10004014 */  bnez       $v0, .L80159558
    /* 1F920 80159518 01000424 */   addiu     $a0, $zero, 0x1
    /* 1F924 8015951C 02A9010C */  jal        StoreAutoPlace__Fv
    /* 1F928 80159520 00000000 */   nop
    /* 1F92C 80159524 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1F930 80159528 98FF4014 */  bnez       $v0, .L8015938C
    /* 1F934 8015952C 00000000 */   nop
    /* 1F938 80159530 1280023C */  lui        $v0, %hi(numitems)
    /* 1F93C 80159534 88B8428C */  lw         $v0, %lo(numitems)($v0)
    /* 1F940 80159538 00000000 */  nop
    /* 1F944 8015953C 7A004228 */  slti       $v0, $v0, 0x7A
    /* 1F948 80159540 05004014 */  bnez       $v0, .L80159558
    /* 1F94C 80159544 01000424 */   addiu     $a0, $zero, 0x1
    /* 1F950 80159548 C6F5000C */  jal        PlaySFX__Fi
    /* 1F954 8015954C D3030424 */   addiu     $a0, $zero, 0x3D3
    /* 1F958 80159550 E3640508 */  j          .L8015938C
    /* 1F95C 80159554 01001124 */   addiu     $s1, $zero, 0x1
  .L80159558:
    /* 1F960 80159558 0A000524 */  addiu      $a1, $zero, 0xA
    /* 1F964 8015955C 21300000 */  addu       $a2, $zero, $zero
    /* 1F968 80159560 F63E010C */  jal        NetSendCmdPItem__FUcUcUcUc
    /* 1F96C 80159564 21380000 */   addu      $a3, $zero, $zero
    /* 1F970 80159568 E3640508 */  j          .L8015938C
    /* 1F974 8015956C 00000000 */   nop
  .L80159570:
    /* 1F978 80159570 C8C7000C */  jal        ClearPanel__Fv
    /* 1F97C 80159574 00000000 */   nop
    /* 1F980 80159578 D7F3000C */  jal        stream_stop__Fv
    /* 1F984 8015957C 00000000 */   nop
    /* 1F988 80159580 0C80023C */  lui        $v0, %hi(SFXTab + 0x84)
    /* 1F98C 80159584 649C4280 */  lb         $v0, %lo(SFXTab + 0x84)($v0)
    /* 1F990 80159588 00000000 */  nop
    /* 1F994 8015958C 0A004010 */  beqz       $v0, .L801595B8
    /* 1F998 80159590 00000000 */   nop
  .L80159594:
    /* 1F99C 80159594 D7F3000C */  jal        stream_stop__Fv
    /* 1F9A0 80159598 00000000 */   nop
    /* 1F9A4 8015959C EE80000C */  jal        TSK_Sleep
    /* 1F9A8 801595A0 01000424 */   addiu     $a0, $zero, 0x1
    /* 1F9AC 801595A4 0C80023C */  lui        $v0, %hi(SFXTab + 0x84)
    /* 1F9B0 801595A8 649C4280 */  lb         $v0, %lo(SFXTab + 0x84)($v0)
    /* 1F9B4 801595AC 00000000 */  nop
    /* 1F9B8 801595B0 F8FF4014 */  bnez       $v0, .L80159594
    /* 1F9BC 801595B4 00000000 */   nop
  .L801595B8:
    /* 1F9C0 801595B8 6410020C */  jal        VID_SetDBuffer__Fb
    /* 1F9C4 801595BC 01000424 */   addiu     $a0, $zero, 0x1
    /* 1F9C8 801595C0 8C1B848F */  lw         $a0, %gp_rel(InvGfxTData)($gp)
    /* 1F9CC 801595C4 01000224 */  addiu      $v0, $zero, 0x1
    /* 1F9D0 801595C8 1280013C */  lui        $at, %hi(CDWAIT)
    /* 1F9D4 801595CC ECAD22AC */  sw         $v0, %lo(CDWAIT)($at)
    /* 1F9D8 801595D0 01000224 */  addiu      $v0, $zero, 0x1
    /* 1F9DC 801595D4 1280013C */  lui        $at, %hi(PauseMode)
    /* 1F9E0 801595D8 A4B722A0 */  sb         $v0, %lo(PauseMode)($at)
    /* 1F9E4 801595DC 604F020C */  jal        GM_FinishedUsing__FP7TextDat
    /* 1F9E8 801595E0 00000000 */   nop
    /* 1F9EC 801595E4 1280023C */  lui        $v0, %hi(leveltype)
    /* 1F9F0 801595E8 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 1F9F4 801595EC 8C1B80AF */  sw         $zero, %gp_rel(InvGfxTData)($gp)
    /* 1F9F8 801595F0 03004010 */  beqz       $v0, .L80159600
    /* 1F9FC 801595F4 00000000 */   nop
    /* 1FA00 801595F8 83650508 */  j          .L8015960C
    /* 1FA04 801595FC D0000424 */   addiu     $a0, $zero, 0xD0
  .L80159600:
    /* 1FA08 80159600 1836020C */  jal        SetTownersGraphics__7CBlocks
    /* 1FA0C 80159604 2120A002 */   addu      $a0, $s5, $zero
    /* 1FA10 80159608 CD000424 */  addiu      $a0, $zero, 0xCD
  .L8015960C:
    /* 1FA14 8015960C 514F020C */  jal        GM_ForceTpLoad__Fi
    /* 1FA18 80159610 00000000 */   nop
    /* 1FA1C 80159614 1280013C */  lui        $at, %hi(CDWAIT)
    /* 1FA20 80159618 ECAD20AC */  sw         $zero, %lo(CDWAIT)($at)
    /* 1FA24 8015961C 1280013C */  lui        $at, %hi(PauseMode)
    /* 1FA28 80159620 A4B720A0 */  sb         $zero, %lo(PauseMode)($at)
    /* 1FA2C 80159624 6410020C */  jal        VID_SetDBuffer__Fb
    /* 1FA30 80159628 21200000 */   addu      $a0, $zero, $zero
    /* 1FA34 8015962C C8C7000C */  jal        ClearPanel__Fv
    /* 1FA38 80159630 00000000 */   nop
    /* 1FA3C 80159634 1280023C */  lui        $v0, %hi(options_pad)
    /* 1FA40 80159638 50B2428C */  lw         $v0, %lo(options_pad)($v0)
    /* 1FA44 8015963C A41B80AF */  sw         $zero, %gp_rel(D_8011C324)($gp)
    /* 1FA48 80159640 10004004 */  bltz       $v0, .L80159684
    /* 1FA4C 80159644 80100200 */   sll       $v0, $v0, 2
    /* 1FA50 80159648 1280013C */  lui        $at, %hi(ScrollFlag)
    /* 1FA54 8015964C 21082200 */  addu       $at, $at, $v0
    /* 1FA58 80159650 B8B8228C */  lw         $v0, %lo(ScrollFlag)($at)
    /* 1FA5C 80159654 00000000 */  nop
    /* 1FA60 80159658 0A004010 */  beqz       $v0, .L80159684
    /* 1FA64 8015965C 05000424 */   addiu     $a0, $zero, 0x5
    /* 1FA68 80159660 21280000 */  addu       $a1, $zero, $zero
    /* 1FA6C 80159664 21300000 */  addu       $a2, $zero, $zero
    /* 1FA70 80159668 53EB010C */  jal        PostGamePad__Fiiii
    /* 1FA74 8015966C 21380000 */   addu      $a3, $zero, $zero
    /* 1FA78 80159670 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 1FA7C 80159674 1280013C */  lui        $at, %hi(options_pad)
    /* 1FA80 80159678 50B222AC */  sw         $v0, %lo(options_pad)($at)
    /* 1FA84 8015967C A8650508 */  j          .L801596A0
    /* 1FA88 80159680 00000000 */   nop
  .L80159684:
    /* 1FA8C 80159684 1280023C */  lui        $v0, %hi(myplr)
    /* 1FA90 80159688 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 1FA94 8015968C 01000324 */  addiu      $v1, $zero, 0x1
    /* 1FA98 80159690 80100200 */  sll        $v0, $v0, 2
    /* 1FA9C 80159694 1280013C */  lui        $at, %hi(_pcurs)
    /* 1FAA0 80159698 21082200 */  addu       $at, $at, $v0
    /* 1FAA4 8015969C 30B723AC */  sw         $v1, %lo(_pcurs)($at)
  .L801596A0:
    /* 1FAA8 801596A0 E4DF010C */  jal        ClrCursor__Fi
    /* 1FAAC 801596A4 21200000 */   addu      $a0, $zero, $zero
    /* 1FAB0 801596A8 E4DF010C */  jal        ClrCursor__Fi
    /* 1FAB4 801596AC 01000424 */   addiu     $a0, $zero, 0x1
    /* 1FAB8 801596B0 1280013C */  lui        $at, %hi(myplr)
    /* 1FABC 801596B4 08BA36AC */  sw         $s6, %lo(myplr)($at)
    /* 1FAC0 801596B8 1280013C */  lui        $at, %hi(sel_data)
    /* 1FAC4 801596BC 2CB737AC */  sw         $s7, %lo(sel_data)($at)
    /* 1FAC8 801596C0 AC1B80A3 */  sb         $zero, %gp_rel(invflag)($gp)
    /* 1FACC 801596C4 9E6E020C */  jal        GLUE_ResumeGame__Fv
    /* 1FAD0 801596C8 00000000 */   nop
    /* 1FAD4 801596CC EC6E020C */  jal        GLUE_SetShowPanelFlag__Fb
    /* 1FAD8 801596D0 01000424 */   addiu     $a0, $zero, 0x1
    /* 1FADC 801596D4 E16E020C */  jal        GLUE_SetShowGameScreenFlag__Fb
    /* 1FAE0 801596D8 01000424 */   addiu     $a0, $zero, 0x1
    /* 1FAE4 801596DC E86E020C */  jal        GLUE_SetHomingScrollFlag__Fb
    /* 1FAE8 801596E0 01000424 */   addiu     $a0, $zero, 0x1
  .L801596E4:
    /* 1FAEC 801596E4 3000BF8F */  lw         $ra, 0x30($sp)
    /* 1FAF0 801596E8 2C00B78F */  lw         $s7, 0x2C($sp)
    /* 1FAF4 801596EC 2800B68F */  lw         $s6, 0x28($sp)
    /* 1FAF8 801596F0 2400B58F */  lw         $s5, 0x24($sp)
    /* 1FAFC 801596F4 2000B48F */  lw         $s4, 0x20($sp)
    /* 1FB00 801596F8 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 1FB04 801596FC 1800B28F */  lw         $s2, 0x18($sp)
    /* 1FB08 80159700 1400B18F */  lw         $s1, 0x14($sp)
    /* 1FB0C 80159704 1000B08F */  lw         $s0, 0x10($sp)
    /* 1FB10 80159708 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 1FB14 8015970C 0800E003 */  jr         $ra
    /* 1FB18 80159710 00000000 */   nop
endlabel DrawInvTSK__FP4TASK
