.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching print_demo_task__FP4TASK, 0x340

glabel print_demo_task__FP4TASK
    /* 8B4EC 8009B4EC B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 8B4F0 8009B4F0 3C00B5AF */  sw         $s5, 0x3C($sp)
    /* 8B4F4 8009B4F4 1280153C */  lui        $s5, %hi(WHITER)
    /* 8B4F8 8009B4F8 D1ABB592 */  lbu        $s5, %lo(WHITER)($s5)
    /* 8B4FC 8009B4FC 3000B2AF */  sw         $s2, 0x30($sp)
    /* 8B500 8009B500 1280123C */  lui        $s2, %hi(WHITEG)
    /* 8B504 8009B504 D2AB5292 */  lbu        $s2, %lo(WHITEG)($s2)
    /* 8B508 8009B508 4000B6AF */  sw         $s6, 0x40($sp)
    /* 8B50C 8009B50C 0C80163C */  lui        $s6, %hi(MediumFont)
    /* 8B510 8009B510 D882D626 */  addiu      $s6, $s6, %lo(MediumFont)
    /* 8B514 8009B514 3400B3AF */  sw         $s3, 0x34($sp)
    /* 8B518 8009B518 01001324 */  addiu      $s3, $zero, 0x1
    /* 8B51C 8009B51C 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 8B520 8009B520 0E80113C */  lui        $s1, %hi(plr + 0x64)
    /* 8B524 8009B524 9CA53126 */  addiu      $s1, $s1, %lo(plr + 0x64)
    /* 8B528 8009B528 3800B4AF */  sw         $s4, 0x38($sp)
    /* 8B52C 8009B52C 64001424 */  addiu      $s4, $zero, 0x64
    /* 8B530 8009B530 4400BFAF */  sw         $ra, 0x44($sp)
    /* 8B534 8009B534 2800B0AF */  sw         $s0, 0x28($sp)
  .L8009B538:
    /* 8B538 8009B538 1280023C */  lui        $v0, %hi(demo_finish)
    /* 8B53C 8009B53C BCAB428C */  lw         $v0, %lo(demo_finish)($v0)
    /* 8B540 8009B540 00000000 */  nop
    /* 8B544 8009B544 7B004014 */  bnez       $v0, .L8009B734
    /* 8B548 8009B548 02000224 */   addiu     $v0, $zero, 0x2
    /* 8B54C 8009B54C BC06828F */  lw         $v0, %gp_rel(demo_load)($gp)
    /* 8B550 8009B550 00000000 */  nop
    /* 8B554 8009B554 04004010 */  beqz       $v0, .L8009B568
    /* 8B558 8009B558 00000000 */   nop
    /* 8B55C 8009B55C 2F6D020C */  jal        SetDemoPlayer__Fv
    /* 8B560 8009B560 00000000 */   nop
    /* 8B564 8009B564 BC0680AF */  sw         $zero, %gp_rel(demo_load)($gp)
  .L8009B568:
    /* 8B568 8009B568 C006828F */  lw         $v0, %gp_rel(demo_record_load)($gp)
    /* 8B56C 8009B56C 00000000 */  nop
    /* 8B570 8009B570 35004014 */  bnez       $v0, .L8009B648
    /* 8B574 8009B574 3F000324 */   addiu     $v1, $zero, 0x3F
    /* 8B578 8009B578 C16E020C */  jal        GLUE_Finished__Fv
    /* 8B57C 8009B57C 21800000 */   addu      $s0, $zero, $zero
    /* 8B580 8009B580 04004014 */  bnez       $v0, .L8009B594
    /* 8B584 8009B584 00000000 */   nop
    /* 8B588 8009B588 9291020C */  jal        IsGameLoading__Fv
    /* 8B58C 8009B58C 00000000 */   nop
    /* 8B590 8009B590 0100502C */  sltiu      $s0, $v0, 0x1
  .L8009B594:
    /* 8B594 8009B594 1A000012 */  beqz       $s0, .L8009B600
    /* 8B598 8009B598 00000000 */   nop
    /* 8B59C 8009B59C 01078393 */  lbu        $v1, %gp_rel(demo_flash)($gp)
    /* 8B5A0 8009B5A0 00000000 */  nop
    /* 8B5A4 8009B5A4 01006224 */  addiu      $v0, $v1, 0x1
    /* 8B5A8 8009B5A8 20006330 */  andi       $v1, $v1, 0x20
    /* 8B5AC 8009B5AC 010782A3 */  sb         $v0, %gp_rel(demo_flash)($gp)
    /* 8B5B0 8009B5B0 25006010 */  beqz       $v1, .L8009B648
    /* 8B5B4 8009B5B4 3F000324 */   addiu     $v1, $zero, 0x3F
    /* 8B5B8 8009B5B8 4AED010C */  jal        GetStr__Fi
    /* 8B5BC 8009B5BC F8000424 */   addiu     $a0, $zero, 0xF8
    /* 8B5C0 8009B5C0 2120C002 */  addu       $a0, $s6, $zero
    /* 8B5C4 8009B5C4 A0000524 */  addiu      $a1, $zero, 0xA0
    /* 8B5C8 8009B5C8 28000624 */  addiu      $a2, $zero, 0x28
    /* 8B5CC 8009B5CC 21384000 */  addu       $a3, $v0, $zero
    /* 8B5D0 8009B5D0 1000B3AF */  sw         $s3, 0x10($sp)
    /* 8B5D4 8009B5D4 1400A0AF */  sw         $zero, 0x14($sp)
    /* 8B5D8 8009B5D8 1800B5AF */  sw         $s5, 0x18($sp)
    /* 8B5DC 8009B5DC 1C00B2AF */  sw         $s2, 0x1C($sp)
    /* 8B5E0 8009B5E0 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 8B5E4 8009B5E4 2000B2AF */   sw        $s2, 0x20($sp)
    /* 8B5E8 8009B5E8 4AED010C */  jal        GetStr__Fi
    /* 8B5EC 8009B5EC 2E030424 */   addiu     $a0, $zero, 0x32E
    /* 8B5F0 8009B5F0 2120C002 */  addu       $a0, $s6, $zero
    /* 8B5F4 8009B5F4 A0000524 */  addiu      $a1, $zero, 0xA0
    /* 8B5F8 8009B5F8 8A6D0208 */  j          .L8009B628
    /* 8B5FC 8009B5FC 36000624 */   addiu     $a2, $zero, 0x36
  .L8009B600:
    /* 8B600 8009B600 9291020C */  jal        IsGameLoading__Fv
    /* 8B604 8009B604 00000000 */   nop
    /* 8B608 8009B608 0F004010 */  beqz       $v0, .L8009B648
    /* 8B60C 8009B60C 3F000324 */   addiu     $v1, $zero, 0x3F
    /* 8B610 8009B610 4AED010C */  jal        GetStr__Fi
    /* 8B614 8009B614 F8000424 */   addiu     $a0, $zero, 0xF8
    /* 8B618 8009B618 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 8B61C 8009B61C D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 8B620 8009B620 88000524 */  addiu      $a1, $zero, 0x88
    /* 8B624 8009B624 28000624 */  addiu      $a2, $zero, 0x28
  .L8009B628:
    /* 8B628 8009B628 21384000 */  addu       $a3, $v0, $zero
    /* 8B62C 8009B62C 1000B3AF */  sw         $s3, 0x10($sp)
    /* 8B630 8009B630 1400A0AF */  sw         $zero, 0x14($sp)
    /* 8B634 8009B634 1800B5AF */  sw         $s5, 0x18($sp)
    /* 8B638 8009B638 1C00B2AF */  sw         $s2, 0x1C($sp)
    /* 8B63C 8009B63C 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 8B640 8009B640 2000B2AF */   sw        $s2, 0x20($sp)
    /* 8B644 8009B644 3F000324 */  addiu      $v1, $zero, 0x3F
  .L8009B648:
    /* 8B648 8009B648 0E80023C */  lui        $v0, %hi(plr + 0xB0)
    /* 8B64C 8009B64C E8A54224 */  addiu      $v0, $v0, %lo(plr + 0xB0)
  .L8009B650:
    /* 8B650 8009B650 000054A0 */  sb         $s4, 0x0($v0)
    /* 8B654 8009B654 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 8B658 8009B658 FDFF6104 */  bgez       $v1, .L8009B650
    /* 8B65C 8009B65C FFFF4224 */   addiu     $v0, $v0, -0x1
    /* 8B660 8009B660 C9069093 */  lbu        $s0, %gp_rel(demo_which)($gp)
    /* 8B664 8009B664 CCCC023C */  lui        $v0, (0xCCCCCCCD >> 16)
    /* 8B668 8009B668 CDCC4234 */  ori        $v0, $v0, (0xCCCCCCCD & 0xFFFF)
    /* 8B66C 8009B66C 19000202 */  multu      $s0, $v0
    /* 8B670 8009B670 21200000 */  addu       $a0, $zero, $zero
    /* 8B674 8009B674 10400000 */  mfhi       $t0
    /* 8B678 8009B678 82180800 */  srl        $v1, $t0, 2
    /* 8B67C 8009B67C 80100300 */  sll        $v0, $v1, 2
    /* 8B680 8009B680 21104300 */  addu       $v0, $v0, $v1
    /* 8B684 8009B684 23800202 */  subu       $s0, $s0, $v0
    /* 8B688 8009B688 FF001032 */  andi       $s0, $s0, 0xFF
    /* 8B68C 8009B68C 1280013C */  lui        $at, %hi(demo_level_spell1)
    /* 8B690 8009B690 21083000 */  addu       $at, $at, $s0
    /* 8B694 8009B694 5CAE2390 */  lbu        $v1, %lo(demo_level_spell1)($at)
    /* 8B698 8009B698 04000224 */  addiu      $v0, $zero, 0x4
    /* 8B69C 8009B69C 040033A2 */  sb         $s3, 0x4($s1)
    /* 8B6A0 8009B6A0 FCFF22A2 */  sb         $v0, -0x4($s1)
    /* 8B6A4 8009B6A4 FDFF20A2 */  sb         $zero, -0x3($s1)
    /* 8B6A8 8009B6A8 000023AE */  sw         $v1, 0x0($s1)
    /* 8B6AC 8009B6AC 1280013C */  lui        $at, %hi(demo_level_spell2)
    /* 8B6B0 8009B6B0 21083000 */  addu       $at, $at, $s0
    /* 8B6B4 8009B6B4 64AE2590 */  lbu        $a1, %lo(demo_level_spell2)($at)
    /* 8B6B8 8009B6B8 7782020C */  jal        SetQSpell__Fiii
    /* 8B6BC 8009B6BC 01000624 */   addiu     $a2, $zero, 0x1
    /* 8B6C0 8009B6C0 DFFF2492 */  lbu        $a0, -0x21($s1)
    /* 8B6C4 8009B6C4 1280013C */  lui        $at, %hi(demo_level_clothe)
    /* 8B6C8 8009B6C8 21083000 */  addu       $at, $at, $s0
    /* 8B6CC 8009B6CC 6CAE2590 */  lbu        $a1, %lo(demo_level_clothe)($at)
    /* 8B6D0 8009B6D0 FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 8B6D4 8009B6D4 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 8B6D8 8009B6D8 540022AE */  sw         $v0, 0x54($s1)
    /* 8B6DC 8009B6DC 580023AE */  sw         $v1, 0x58($s1)
    /* 8B6E0 8009B6E0 940034A6 */  sh         $s4, 0x94($s1)
    /* 8B6E4 8009B6E4 960034A6 */  sh         $s4, 0x96($s1)
    /* 8B6E8 8009B6E8 9E0034A6 */  sh         $s4, 0x9E($s1)
    /* 8B6EC 8009B6EC 25208500 */  or         $a0, $a0, $a1
    /* 8B6F0 8009B6F0 DFFF24A2 */  sb         $a0, -0x21($s1)
    /* 8B6F4 8009B6F4 1280013C */  lui        $at, %hi(demo_level_dex)
    /* 8B6F8 8009B6F8 21083000 */  addu       $at, $at, $s0
    /* 8B6FC 8009B6FC 7CAE2390 */  lbu        $v1, %lo(demo_level_dex)($at)
    /* 8B700 8009B700 05000224 */  addiu      $v0, $zero, 0x5
    /* 8B704 8009B704 D80022A2 */  sb         $v0, 0xD8($s1)
    /* 8B708 8009B708 9C0023A6 */  sh         $v1, 0x9C($s1)
    /* 8B70C 8009B70C 1280013C */  lui        $at, %hi(demo_level_dam)
    /* 8B710 8009B710 21083000 */  addu       $at, $at, $s0
    /* 8B714 8009B714 74AE2290 */  lbu        $v0, %lo(demo_level_dam)($at)
    /* 8B718 8009B718 01000424 */  addiu      $a0, $zero, 0x1
    /* 8B71C 8009B71C 1280013C */  lui        $at, %hi(allspellsflag)
    /* 8B720 8009B720 44B233AC */  sw         $s3, %lo(allspellsflag)($at)
    /* 8B724 8009B724 EE80000C */  jal        TSK_Sleep
    /* 8B728 8009B728 A80022AE */   sw        $v0, 0xA8($s1)
    /* 8B72C 8009B72C 4E6D0208 */  j          .L8009B538
    /* 8B730 8009B730 00000000 */   nop
  .L8009B734:
    /* 8B734 8009B734 1280033C */  lui        $v1, %hi(demo_finish)
    /* 8B738 8009B738 BCAB638C */  lw         $v1, %lo(demo_finish)($v1)
    /* 8B73C 8009B73C 00000000 */  nop
    /* 8B740 8009B740 03006214 */  bne        $v1, $v0, .L8009B750
    /* 8B744 8009B744 00000000 */   nop
    /* 8B748 8009B748 C6F5000C */  jal        PlaySFX__Fi
    /* 8B74C 8009B74C 33000424 */   addiu     $a0, $zero, 0x33
  .L8009B750:
    /* 8B750 8009B750 A4DF010C */  jal        music_fade__Fv
    /* 8B754 8009B754 00000000 */   nop
    /* 8B758 8009B758 BEFC010C */  jal        PaletteFadeOut__Fi
    /* 8B75C 8009B75C 08000424 */   addiu     $a0, $zero, 0x8
    /* 8B760 8009B760 09004010 */  beqz       $v0, .L8009B788
    /* 8B764 8009B764 00000000 */   nop
  .L8009B768:
    /* 8B768 8009B768 ABFB010C */  jal        GetFadeState__Fv
    /* 8B76C 8009B76C 00000000 */   nop
    /* 8B770 8009B770 0C004010 */  beqz       $v0, .L8009B7A4
    /* 8B774 8009B774 01000224 */   addiu     $v0, $zero, 0x1
    /* 8B778 8009B778 EE80000C */  jal        TSK_Sleep
    /* 8B77C 8009B77C 01000424 */   addiu     $a0, $zero, 0x1
    /* 8B780 8009B780 DA6D0208 */  j          .L8009B768
    /* 8B784 8009B784 00000000 */   nop
  .L8009B788:
    /* 8B788 8009B788 1180043C */  lui        $a0, %hi(D_80110AFC)
    /* 8B78C 8009B78C FC0A8424 */  addiu      $a0, $a0, %lo(D_80110AFC)
    /* 8B790 8009B790 1180053C */  lui        $a1, %hi(D_80110B14)
    /* 8B794 8009B794 140BA524 */  addiu      $a1, $a1, %lo(D_80110B14)
    /* 8B798 8009B798 9B83000C */  jal        DBG_SendMessage
    /* 8B79C 8009B79C F1000624 */   addiu     $a2, $zero, 0xF1
    /* 8B7A0 8009B7A0 01000224 */  addiu      $v0, $zero, 0x1
  .L8009B7A4:
    /* 8B7A4 8009B7A4 1280013C */  lui        $at, %hi(PauseMode)
    /* 8B7A8 8009B7A8 A4B722A0 */  sb         $v0, %lo(PauseMode)($at)
    /* 8B7AC 8009B7AC C80682A3 */  sb         $v0, %gp_rel(demo_fade_finished)($gp)
    /* 8B7B0 8009B7B0 2B71020C */  jal        GLUE_StartGameExit__Fv
    /* 8B7B4 8009B7B4 00000000 */   nop
    /* 8B7B8 8009B7B8 1007858F */  lw         $a1, %gp_rel(old_val)($gp)
    /* 8B7BC 8009B7BC 1280013C */  lui        $at, %hi(PlayDemoFlag)
    /* 8B7C0 8009B7C0 81AC20A0 */  sb         $zero, %lo(PlayDemoFlag)($at)
    /* 8B7C4 8009B7C4 1280013C */  lui        $at, %hi(demo_pad_time)
    /* 8B7C8 8009B7C8 B4AB20AC */  sw         $zero, %lo(demo_pad_time)($at)
    /* 8B7CC 8009B7CC 1280013C */  lui        $at, %hi(demo_finish)
    /* 8B7D0 8009B7D0 BCAB20AC */  sw         $zero, %lo(demo_finish)($at)
    /* 8B7D4 8009B7D4 03EC010C */  jal        SetWalkStyle__Fii
    /* 8B7D8 8009B7D8 21200000 */   addu      $a0, $zero, $zero
    /* 8B7DC 8009B7DC 1280043C */  lui        $a0, %hi(D_8011CDC8)
    /* 8B7E0 8009B7E0 C8CD8424 */  addiu      $a0, $a0, %lo(D_8011CDC8)
    /* 8B7E4 8009B7E4 8871020C */  jal        RestoreDemoKeys__FPi
    /* 8B7E8 8009B7E8 00000000 */   nop
    /* 8B7EC 8009B7EC 0C07848F */  lw         $a0, %gp_rel(speedstore)($gp)
    /* 8B7F0 8009B7F0 EAE6000C */  jal        SetSpeed__F9GM_SPEEDS
    /* 8B7F4 8009B7F4 00000000 */   nop
    /* 8B7F8 8009B7F8 0E80013C */  lui        $at, %hi(plr + 0xD3)
    /* 8B7FC 8009B7FC 0BA620A0 */  sb         $zero, %lo(plr + 0xD3)($at)
    /* 8B800 8009B800 4400BF8F */  lw         $ra, 0x44($sp)
    /* 8B804 8009B804 4000B68F */  lw         $s6, 0x40($sp)
    /* 8B808 8009B808 3C00B58F */  lw         $s5, 0x3C($sp)
    /* 8B80C 8009B80C 3800B48F */  lw         $s4, 0x38($sp)
    /* 8B810 8009B810 3400B38F */  lw         $s3, 0x34($sp)
    /* 8B814 8009B814 3000B28F */  lw         $s2, 0x30($sp)
    /* 8B818 8009B818 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 8B81C 8009B81C 2800B08F */  lw         $s0, 0x28($sp)
    /* 8B820 8009B820 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 8B824 8009B824 0800E003 */  jr         $ra
    /* 8B828 8009B828 00000000 */   nop
endlabel print_demo_task__FP4TASK
