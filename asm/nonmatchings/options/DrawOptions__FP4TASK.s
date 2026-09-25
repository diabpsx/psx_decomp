.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawOptions__FP4TASK, 0x6FC

glabel DrawOptions__FP4TASK
    /* 9A2D0 800AA2D0 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 9A2D4 800AA2D4 D00A838F */  lw         $v1, %gp_rel(options_pad)($gp)
    /* 9A2D8 800AA2D8 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 9A2DC 800AA2DC 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 9A2E0 800AA2E0 1800B2AF */  sw         $s2, 0x18($sp)
    /* 9A2E4 800AA2E4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 9A2E8 800AA2E8 0A006214 */  bne        $v1, $v0, .L800AA314
    /* 9A2EC 800AA2EC 1000B0AF */   sw        $s0, 0x10($sp)
    /* 9A2F0 800AA2F0 1280023C */  lui        $v0, %hi(deathflag)
    /* 9A2F4 800AA2F4 0CBA4290 */  lbu        $v0, %lo(deathflag)($v0)
    /* 9A2F8 800AA2F8 00000000 */  nop
    /* 9A2FC 800AA2FC 05004014 */  bnez       $v0, .L800AA314
    /* 9A300 800AA300 00000000 */   nop
    /* 9A304 800AA304 73AA020C */  jal        ToggleOptions__Fv
    /* 9A308 800AA308 00000000 */   nop
    /* 9A30C 800AA30C 6CAA0208 */  j          .L800AA9B0
    /* 9A310 800AA310 00000000 */   nop
  .L800AA314:
    /* 9A314 800AA314 D00A848F */  lw         $a0, %gp_rel(options_pad)($gp)
    /* 9A318 800AA318 FD25020C */  jal        PAD_GetPad__FiUc
    /* 9A31C 800AA31C 21280000 */   addu      $a1, $zero, $zero
    /* 9A320 800AA320 21200000 */  addu       $a0, $zero, $zero
    /* 9A324 800AA324 044F020C */  jal        GM_UseTexData__Fi
    /* 9A328 800AA328 21904000 */   addu      $s2, $v0, $zero
    /* 9A32C 800AA32C 21204000 */  addu       $a0, $v0, $zero
    /* 9A330 800AA330 701F84AF */  sw         $a0, %gp_rel(D_8011C6F0)($gp)
    /* 9A334 800AA334 A5AD020C */  jal        GetFr__7TextDati_800ab694
    /* 9A338 800AA338 96000524 */   addiu     $a1, $zero, 0x96
    /* 9A33C 800AA33C 0800428C */  lw         $v0, 0x8($v0)
    /* 9A340 800AA340 1280033C */  lui        $v1, %hi(deathflag)
    /* 9A344 800AA344 0CBA6390 */  lbu        $v1, %lo(deathflag)($v1)
    /* 9A348 800AA348 FF014230 */  andi       $v0, $v0, 0x1FF
    /* 9A34C 800AA34C FEFF4224 */  addiu      $v0, $v0, -0x2
    /* 9A350 800AA350 741F82AF */  sw         $v0, %gp_rel(D_8011C6F4)($gp)
    /* 9A354 800AA354 02006014 */  bnez       $v1, .L800AA360
    /* 9A358 800AA358 08000224 */   addiu     $v0, $zero, 0x8
    /* 9A35C 800AA35C 01000224 */  addiu      $v0, $zero, 0x1
  .L800AA360:
    /* 9A360 800AA360 BC0A82AF */  sw         $v0, %gp_rel(cmenu)($gp)
    /* 9A364 800AA364 A80A8293 */  lbu        $v0, %gp_rel(Qfromoptions)($gp)
    /* 9A368 800AA368 00000000 */  nop
    /* 9A36C 800AA36C 05004010 */  beqz       $v0, .L800AA384
    /* 9A370 800AA370 00000000 */   nop
    /* 9A374 800AA374 B00A82AF */  sw         $v0, %gp_rel(D_8011B230)($gp)
    /* 9A378 800AA378 A80A80A3 */  sb         $zero, %gp_rel(Qfromoptions)($gp)
    /* 9A37C 800AA37C EAA80208 */  j          .L800AA3A8
    /* 9A380 800AA380 00000000 */   nop
  .L800AA384:
    /* 9A384 800AA384 1280023C */  lui        $v0, %hi(FeFlag)
    /* 9A388 800AA388 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 9A38C 800AA38C 00000000 */  nop
    /* 9A390 800AA390 04004014 */  bnez       $v0, .L800AA3A4
    /* 9A394 800AA394 01000224 */   addiu     $v0, $zero, 0x1
    /* 9A398 800AA398 C6F5000C */  jal        PlaySFX__Fi
    /* 9A39C 800AA39C 33000424 */   addiu     $a0, $zero, 0x33
    /* 9A3A0 800AA3A0 01000224 */  addiu      $v0, $zero, 0x1
  .L800AA3A4:
    /* 9A3A4 800AA3A4 B00A82AF */  sw         $v0, %gp_rel(D_8011B230)($gp)
  .L800AA3A8:
    /* 9A3A8 800AA3A8 811F80A3 */  sb         $zero, %gp_rel(D_8011C701)($gp)
    /* 9A3AC 800AA3AC 821F80A3 */  sb         $zero, %gp_rel(D_8011C702)($gp)
    /* 9A3B0 800AA3B0 D80A80AF */  sw         $zero, %gp_rel(OptionsSetSeed)($gp)
    /* 9A3B4 800AA3B4 2EA8020C */  jal        GetVolumes__Fv
    /* 9A3B8 800AA3B8 21800000 */   addu      $s0, $zero, $zero
    /* 9A3BC 800AA3BC E86E020C */  jal        GLUE_SetHomingScrollFlag__Fb
    /* 9A3C0 800AA3C0 21200000 */   addu      $a0, $zero, $zero
    /* 9A3C4 800AA3C4 EC6E020C */  jal        GLUE_SetShowPanelFlag__Fb
    /* 9A3C8 800AA3C8 21200000 */   addu      $a0, $zero, $zero
    /* 9A3CC 800AA3CC 896E020C */  jal        GLUE_SuspendGame__Fv
    /* 9A3D0 800AA3D0 00000000 */   nop
    /* 9A3D4 800AA3D4 EE80000C */  jal        TSK_Sleep
    /* 9A3D8 800AA3D8 01000424 */   addiu     $a0, $zero, 0x1
    /* 9A3DC 800AA3DC 01000224 */  addiu      $v0, $zero, 0x1
    /* 9A3E0 800AA3E0 EC0A82AF */  sw         $v0, %gp_rel(D_8011B26C)($gp)
    /* 9A3E4 800AA3E4 55AD020C */  jal        GetDown__C4CPad_800ab554
    /* 9A3E8 800AA3E8 21204002 */   addu      $a0, $s2, $zero
    /* 9A3EC 800AA3EC 40004230 */  andi       $v0, $v0, 0x40
    /* 9A3F0 800AA3F0 06004014 */  bnez       $v0, .L800AA40C
    /* 9A3F4 800AA3F4 00000000 */   nop
    /* 9A3F8 800AA3F8 55AD020C */  jal        GetDown__C4CPad_800ab554
    /* 9A3FC 800AA3FC 21204002 */   addu      $a0, $s2, $zero
    /* 9A400 800AA400 10004230 */  andi       $v0, $v0, 0x10
    /* 9A404 800AA404 02004010 */  beqz       $v0, .L800AA410
    /* 9A408 800AA408 00000000 */   nop
  .L800AA40C:
    /* 9A40C 800AA40C 01001024 */  addiu      $s0, $zero, 0x1
  .L800AA410:
    /* 9A410 800AA410 02000012 */  beqz       $s0, .L800AA41C
    /* 9A414 800AA414 00000000 */   nop
    /* 9A418 800AA418 EC0A80AF */  sw         $zero, %gp_rel(D_8011B26C)($gp)
  .L800AA41C:
    /* 9A41C 800AA41C D2EC010C */  jal        LANG_GetLang__Fv
    /* 9A420 800AA420 00000000 */   nop
    /* 9A424 800AA424 D00A838F */  lw         $v1, %gp_rel(options_pad)($gp)
    /* 9A428 800AA428 1280043C */  lui        $a0, %hi(msgflag)
    /* 9A42C 800AA42C 6BB88480 */  lb         $a0, %lo(msgflag)($a0)
    /* 9A430 800AA430 841F82AF */  sw         $v0, %gp_rel(D_8011C704)($gp)
    /* 9A434 800AA434 881F82AF */  sw         $v0, %gp_rel(D_8011C708)($gp)
    /* 9A438 800AA438 E00A80AF */  sw         $zero, %gp_rel(PadFrig)($gp)
    /* 9A43C 800AA43C F40A83AF */  sw         $v1, %gp_rel(old_pad)($gp)
    /* 9A440 800AA440 0F008010 */  beqz       $a0, .L800AA480
    /* 9A444 800AA444 00000000 */   nop
  .L800AA448:
    /* 9A448 800AA448 1280023C */  lui        $v0, %hi(msgholdflag)
    /* 9A44C 800AA44C 69B84280 */  lb         $v0, %lo(msgholdflag)($v0)
    /* 9A450 800AA450 00000000 */  nop
    /* 9A454 800AA454 0A004010 */  beqz       $v0, .L800AA480
    /* 9A458 800AA458 00000000 */   nop
    /* 9A45C 800AA45C 1280013C */  lui        $at, %hi(msgholdflag)
    /* 9A460 800AA460 69B820A0 */  sb         $zero, %lo(msgholdflag)($at)
    /* 9A464 800AA464 EE80000C */  jal        TSK_Sleep
    /* 9A468 800AA468 01000424 */   addiu     $a0, $zero, 0x1
    /* 9A46C 800AA46C 1280023C */  lui        $v0, %hi(msgflag)
    /* 9A470 800AA470 6BB84280 */  lb         $v0, %lo(msgflag)($v0)
    /* 9A474 800AA474 00000000 */  nop
    /* 9A478 800AA478 F3FF4014 */  bnez       $v0, .L800AA448
    /* 9A47C 800AA47C 00000000 */   nop
  .L800AA480:
    /* 9A480 800AA480 C80A828F */  lw         $v0, %gp_rel(optionsflag)($gp)
    /* 9A484 800AA484 00000000 */  nop
    /* 9A488 800AA488 09014010 */  beqz       $v0, .L800AA8B0
    /* 9A48C 800AA48C 00000000 */   nop
    /* 9A490 800AA490 01001024 */  addiu      $s0, $zero, 0x1
    /* 9A494 800AA494 04001124 */  addiu      $s1, $zero, 0x4
  .L800AA498:
    /* 9A498 800AA498 D00A838F */  lw         $v1, %gp_rel(options_pad)($gp)
    /* 9A49C 800AA49C FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 9A4A0 800AA4A0 03016210 */  beq        $v1, $v0, .L800AA8B0
    /* 9A4A4 800AA4A4 00000000 */   nop
    /* 9A4A8 800AA4A8 BC0A838F */  lw         $v1, %gp_rel(cmenu)($gp)
    /* 9A4AC 800AA4AC 00000000 */  nop
    /* 9A4B0 800AA4B0 1C00622C */  sltiu      $v0, $v1, 0x1C
    /* 9A4B4 800AA4B4 99004010 */  beqz       $v0, .L800AA71C
    /* 9A4B8 800AA4B8 80100300 */   sll       $v0, $v1, 2
    /* 9A4BC 800AA4BC 1180013C */  lui        $at, %hi(jtbl_80110D50)
    /* 9A4C0 800AA4C0 21082200 */  addu       $at, $at, $v0
    /* 9A4C4 800AA4C4 500D228C */  lw         $v0, %lo(jtbl_80110D50)($at)
    /* 9A4C8 800AA4C8 00000000 */  nop
    /* 9A4CC 800AA4CC 08004000 */  jr         $v0
    /* 9A4D0 800AA4D0 00000000 */   nop
  jlabel .L800AA4D4
    /* 9A4D4 800AA4D4 BC0A848F */  lw         $a0, %gp_rel(cmenu)($gp)
    /* 9A4D8 800AA4D8 BD9C020C */  jal        DrawMenu__Fi
    /* 9A4DC 800AA4DC 00000000 */   nop
    /* 9A4E0 800AA4E0 98A4020C */  jal        SoundPad__Fv
    /* 9A4E4 800AA4E4 00000000 */   nop
    /* 9A4E8 800AA4E8 C7A90208 */  j          .L800AA71C
    /* 9A4EC 800AA4EC 00000000 */   nop
  jlabel .L800AA4F0
    /* 9A4F0 800AA4F0 BC0A848F */  lw         $a0, %gp_rel(cmenu)($gp)
    /* 9A4F4 800AA4F4 BD9C020C */  jal        DrawMenu__Fi
    /* 9A4F8 800AA4F8 00000000 */   nop
    /* 9A4FC 800AA4FC ABA7020C */  jal        CalcVolumes__Fv
    /* 9A500 800AA500 00000000 */   nop
    /* 9A504 800AA504 98A4020C */  jal        SoundPad__Fv
    /* 9A508 800AA508 00000000 */   nop
    /* 9A50C 800AA50C C7A90208 */  j          .L800AA71C
    /* 9A510 800AA510 00000000 */   nop
  jlabel .L800AA514
    /* 9A514 800AA514 7675020C */  jal        DrawCtrlSetup__Fv
    /* 9A518 800AA518 00000000 */   nop
    /* 9A51C 800AA51C 1280023C */  lui        $v0, %hi(FeFlag)
    /* 9A520 800AA520 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 9A524 800AA524 00000000 */  nop
    /* 9A528 800AA528 04004010 */  beqz       $v0, .L800AA53C
    /* 9A52C 800AA52C 02000224 */   addiu     $v0, $zero, 0x2
    /* 9A530 800AA530 B00A82AF */  sw         $v0, %gp_rel(D_8011B230)($gp)
    /* 9A534 800AA534 C7A90208 */  j          .L800AA71C
    /* 9A538 800AA538 00000000 */   nop
  .L800AA53C:
    /* 9A53C 800AA53C 07000224 */  addiu      $v0, $zero, 0x7
    /* 9A540 800AA540 B00A82AF */  sw         $v0, %gp_rel(D_8011B230)($gp)
    /* 9A544 800AA544 C7A90208 */  j          .L800AA71C
    /* 9A548 800AA548 00000000 */   nop
  jlabel .L800AA54C
    /* 9A54C 800AA54C 34BB020C */  jal        DrawHelp__Fv
    /* 9A550 800AA550 00000000 */   nop
    /* 9A554 800AA554 1280023C */  lui        $v0, %hi(FeFlag)
    /* 9A558 800AA558 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 9A55C 800AA55C 00000000 */  nop
    /* 9A560 800AA560 04004010 */  beqz       $v0, .L800AA574
    /* 9A564 800AA564 05000224 */   addiu     $v0, $zero, 0x5
    /* 9A568 800AA568 B00A82AF */  sw         $v0, %gp_rel(D_8011B230)($gp)
    /* 9A56C 800AA56C C7A90208 */  j          .L800AA71C
    /* 9A570 800AA570 00000000 */   nop
  .L800AA574:
    /* 9A574 800AA574 09000224 */  addiu      $v0, $zero, 0x9
    /* 9A578 800AA578 B00A82AF */  sw         $v0, %gp_rel(D_8011B230)($gp)
    /* 9A57C 800AA57C C7A90208 */  j          .L800AA71C
    /* 9A580 800AA580 00000000 */   nop
  jlabel .L800AA584
    /* 9A584 800AA584 BC0A848F */  lw         $a0, %gp_rel(cmenu)($gp)
    /* 9A588 800AA588 BD9C020C */  jal        DrawMenu__Fi
    /* 9A58C 800AA58C 00000000 */   nop
    /* 9A590 800AA590 DDAA020C */  jal        FormatPad__Fv
    /* 9A594 800AA594 00000000 */   nop
    /* 9A598 800AA598 C7A90208 */  j          .L800AA71C
    /* 9A59C 800AA59C 00000000 */   nop
  jlabel .L800AA5A0
    /* 9A5A0 800AA5A0 1280013C */  lui        $at, %hi(current_card)
    /* 9A5A4 800AA5A4 60B420AC */  sw         $zero, %lo(current_card)($at)
    /* 9A5A8 800AA5A8 E7A0020C */  jal        CharacterLoadPad__Fv
    /* 9A5AC 800AA5AC 00000000 */   nop
    /* 9A5B0 800AA5B0 C4A90208 */  j          .L800AA710
    /* 9A5B4 800AA5B4 00000000 */   nop
  jlabel .L800AA5B8
    /* 9A5B8 800AA5B8 1280013C */  lui        $at, %hi(current_card)
    /* 9A5BC 800AA5BC 60B430AC */  sw         $s0, %lo(current_card)($at)
    /* 9A5C0 800AA5C0 E7A0020C */  jal        CharacterLoadPad__Fv
    /* 9A5C4 800AA5C4 00000000 */   nop
    /* 9A5C8 800AA5C8 C4A90208 */  j          .L800AA710
    /* 9A5CC 800AA5CC 00000000 */   nop
  jlabel .L800AA5D0
    /* 9A5D0 800AA5D0 2EAC020C */  jal        CharCardSelectMemcardPad__Fv
    /* 9A5D4 800AA5D4 00000000 */   nop
    /* 9A5D8 800AA5D8 C4A90208 */  j          .L800AA710
    /* 9A5DC 800AA5DC 00000000 */   nop
  jlabel .L800AA5E0
    /* 9A5E0 800AA5E0 9FAB020C */  jal        SaveOverwritePad__Fv
    /* 9A5E4 800AA5E4 00000000 */   nop
    /* 9A5E8 800AA5E8 C4A90208 */  j          .L800AA710
    /* 9A5EC 800AA5EC 00000000 */   nop
  jlabel .L800AA5F0
    /* 9A5F0 800AA5F0 3CA2020C */  jal        MemcardPad__Fv
    /* 9A5F4 800AA5F4 00000000 */   nop
    /* 9A5F8 800AA5F8 C4A90208 */  j          .L800AA710
    /* 9A5FC 800AA5FC 00000000 */   nop
  jlabel .L800AA600
    /* 9A600 800AA600 BC0A848F */  lw         $a0, %gp_rel(cmenu)($gp)
    /* 9A604 800AA604 BD9C020C */  jal        DrawMenu__Fi
    /* 9A608 800AA608 00000000 */   nop
    /* 9A60C 800AA60C 1AA7020C */  jal        CentrePad__Fv
    /* 9A610 800AA610 00000000 */   nop
    /* 9A614 800AA614 C7A90208 */  j          .L800AA71C
    /* 9A618 800AA618 00000000 */   nop
  jlabel .L800AA61C
    /* 9A61C 800AA61C BC0A80AF */  sw         $zero, %gp_rel(cmenu)($gp)
    /* 9A620 800AA620 B00A91AF */  sw         $s1, %gp_rel(D_8011B230)($gp)
    /* 9A624 800AA624 BEFC010C */  jal        PaletteFadeOut__Fi
    /* 9A628 800AA628 08000424 */   addiu     $a0, $zero, 0x8
  .L800AA62C:
    /* 9A62C 800AA62C ABFB010C */  jal        GetFadeState__Fv
    /* 9A630 800AA630 00000000 */   nop
    /* 9A634 800AA634 08004010 */  beqz       $v0, .L800AA658
    /* 9A638 800AA638 00000000 */   nop
    /* 9A63C 800AA63C BC0A848F */  lw         $a0, %gp_rel(cmenu)($gp)
    /* 9A640 800AA640 BD9C020C */  jal        DrawMenu__Fi
    /* 9A644 800AA644 00000000 */   nop
    /* 9A648 800AA648 EE80000C */  jal        TSK_Sleep
    /* 9A64C 800AA64C 01000424 */   addiu     $a0, $zero, 0x1
    /* 9A650 800AA650 8BA90208 */  j          .L800AA62C
    /* 9A654 800AA654 00000000 */   nop
  .L800AA658:
    /* 9A658 800AA658 6DF4040C */  jal        func_8013D1B4
    /* 9A65C 800AA65C 00000000 */   nop
    /* 9A660 800AA660 7CFC010C */  jal        PaletteFadeIn__Fi
    /* 9A664 800AA664 08000424 */   addiu     $a0, $zero, 0x8
    /* 9A668 800AA668 C7A90208 */  j          .L800AA71C
    /* 9A66C 800AA66C 00000000 */   nop
  jlabel .L800AA670
    /* 9A670 800AA670 D00A828F */  lw         $v0, %gp_rel(options_pad)($gp)
    /* 9A674 800AA674 00000000 */  nop
    /* 9A678 800AA678 01004224 */  addiu      $v0, $v0, 0x1
    /* 9A67C 800AA67C A80A82A3 */  sb         $v0, %gp_rel(Qfromoptions)($gp)
    /* 9A680 800AA680 73AA020C */  jal        ToggleOptions__Fv
    /* 9A684 800AA684 00000000 */   nop
    /* 9A688 800AA688 D00A848F */  lw         $a0, %gp_rel(options_pad)($gp)
    /* 9A68C 800AA68C 9188020C */  jal        pad_func_SplBook__Fi
    /* 9A690 800AA690 00000000 */   nop
    /* 9A694 800AA694 BDA90208 */  j          .L800AA6F4
    /* 9A698 800AA698 00000000 */   nop
  jlabel .L800AA69C
    /* 9A69C 800AA69C D00A828F */  lw         $v0, %gp_rel(options_pad)($gp)
    /* 9A6A0 800AA6A0 00000000 */  nop
    /* 9A6A4 800AA6A4 01004224 */  addiu      $v0, $v0, 0x1
    /* 9A6A8 800AA6A8 A80A82A3 */  sb         $v0, %gp_rel(Qfromoptions)($gp)
    /* 9A6AC 800AA6AC 73AA020C */  jal        ToggleOptions__Fv
    /* 9A6B0 800AA6B0 00000000 */   nop
    /* 9A6B4 800AA6B4 50A3010C */  jal        StartQuestlog__Fv
    /* 9A6B8 800AA6B8 00000000 */   nop
    /* 9A6BC 800AA6BC BDA90208 */  j          .L800AA6F4
    /* 9A6C0 800AA6C0 00000000 */   nop
  jlabel .L800AA6C4
    /* 9A6C4 800AA6C4 73AA020C */  jal        ToggleOptions__Fv
    /* 9A6C8 800AA6C8 00000000 */   nop
    /* 9A6CC 800AA6CC F40A828F */  lw         $v0, %gp_rel(old_pad)($gp)
    /* 9A6D0 800AA6D0 1280013C */  lui        $at, %hi(invflag)
    /* 9A6D4 800AA6D4 2CC330A0 */  sb         $s0, %lo(invflag)($at)
    /* 9A6D8 800AA6D8 BEA90208 */  j          .L800AA6F8
    /* 9A6DC 800AA6DC 00000000 */   nop
  jlabel .L800AA6E0
    /* 9A6E0 800AA6E0 73AA020C */  jal        ToggleOptions__Fv
    /* 9A6E4 800AA6E4 00000000 */   nop
    /* 9A6E8 800AA6E8 D00A848F */  lw         $a0, %gp_rel(options_pad)($gp)
    /* 9A6EC 800AA6EC F887020C */  jal        pad_func_Chr__Fi
    /* 9A6F0 800AA6F0 00000000 */   nop
  .L800AA6F4:
    /* 9A6F4 800AA6F4 F40A828F */  lw         $v0, %gp_rel(old_pad)($gp)
  .L800AA6F8:
    /* 9A6F8 800AA6F8 B00A91AF */  sw         $s1, %gp_rel(D_8011B230)($gp)
    /* 9A6FC 800AA6FC D00A82AF */  sw         $v0, %gp_rel(options_pad)($gp)
    /* 9A700 800AA700 C7A90208 */  j          .L800AA71C
    /* 9A704 800AA704 00000000 */   nop
  jlabel .L800AA708
    /* 9A708 800AA708 6AA8020C */  jal        GameSpeedPad__Fv
    /* 9A70C 800AA70C 00000000 */   nop
  .L800AA710:
    /* 9A710 800AA710 BC0A848F */  lw         $a0, %gp_rel(cmenu)($gp)
    /* 9A714 800AA714 BD9C020C */  jal        DrawMenu__Fi
    /* 9A718 800AA718 00000000 */   nop
  jlabel .L800AA71C
    /* 9A71C 800AA71C A80A8293 */  lbu        $v0, %gp_rel(Qfromoptions)($gp)
    /* 9A720 800AA720 00000000 */  nop
    /* 9A724 800AA724 06004010 */  beqz       $v0, .L800AA740
    /* 9A728 800AA728 00000000 */   nop
    /* 9A72C 800AA72C B00A828F */  lw         $v0, %gp_rel(D_8011B230)($gp)
    /* 9A730 800AA730 00000000 */  nop
    /* 9A734 800AA734 02005114 */  bne        $v0, $s1, .L800AA740
    /* 9A738 800AA738 00000000 */   nop
    /* 9A73C 800AA73C EC0A90AF */  sw         $s0, %gp_rel(D_8011B26C)($gp)
  .L800AA740:
    /* 9A740 800AA740 EE80000C */  jal        TSK_Sleep
    /* 9A744 800AA744 01000424 */   addiu     $a0, $zero, 0x1
    /* 9A748 800AA748 1280023C */  lui        $v0, %hi(FeFlag)
    /* 9A74C 800AA74C 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 9A750 800AA750 00000000 */  nop
    /* 9A754 800AA754 52004014 */  bnez       $v0, .L800AA8A0
    /* 9A758 800AA758 00000000 */   nop
    /* 9A75C 800AA75C 55AD020C */  jal        GetDown__C4CPad_800ab554
    /* 9A760 800AA760 21204002 */   addu      $a0, $s2, $zero
    /* 9A764 800AA764 20004230 */  andi       $v0, $v0, 0x20
    /* 9A768 800AA768 43004010 */  beqz       $v0, .L800AA878
    /* 9A76C 800AA76C 00000000 */   nop
    /* 9A770 800AA770 1280023C */  lui        $v0, %hi(MemCardActive)
    /* 9A774 800AA774 60B1428C */  lw         $v0, %lo(MemCardActive)($v0)
    /* 9A778 800AA778 00000000 */  nop
    /* 9A77C 800AA77C 3E004014 */  bnez       $v0, .L800AA878
    /* 9A780 800AA780 00000000 */   nop
    /* 9A784 800AA784 BC0A838F */  lw         $v1, %gp_rel(cmenu)($gp)
    /* 9A788 800AA788 00000000 */  nop
    /* 9A78C 800AA78C 1A007014 */  bne        $v1, $s0, .L800AA7F8
    /* 9A790 800AA790 00000000 */   nop
    /* 9A794 800AA794 E00A828F */  lw         $v0, %gp_rel(PadFrig)($gp)
    /* 9A798 800AA798 00000000 */  nop
    /* 9A79C 800AA79C 13004014 */  bnez       $v0, .L800AA7EC
    /* 9A7A0 800AA7A0 00000000 */   nop
    /* 9A7A4 800AA7A4 1280023C */  lui        $v0, %hi(ctrlflag)
    /* 9A7A8 800AA7A8 20B04290 */  lbu        $v0, %lo(ctrlflag)($v0)
    /* 9A7AC 800AA7AC 00000000 */  nop
    /* 9A7B0 800AA7B0 02004014 */  bnez       $v0, .L800AA7BC
    /* 9A7B4 800AA7B4 D3030424 */   addiu     $a0, $zero, 0x3D3
    /* 9A7B8 800AA7B8 33000424 */  addiu      $a0, $zero, 0x33
  .L800AA7BC:
    /* 9A7BC 800AA7BC C6F5000C */  jal        PlaySFX__Fi
    /* 9A7C0 800AA7C0 00000000 */   nop
    /* 9A7C4 800AA7C4 73AA020C */  jal        ToggleOptions__Fv
    /* 9A7C8 800AA7C8 00000000 */   nop
    /* 9A7CC 800AA7CC C80A828F */  lw         $v0, %gp_rel(optionsflag)($gp)
    /* 9A7D0 800AA7D0 00000000 */  nop
    /* 9A7D4 800AA7D4 28004014 */  bnez       $v0, .L800AA878
    /* 9A7D8 800AA7D8 00000000 */   nop
    /* 9A7DC 800AA7DC 1280013C */  lui        $at, %hi(ignore_buttons)
    /* 9A7E0 800AA7E0 D0BB30AC */  sw         $s0, %lo(ignore_buttons)($at)
    /* 9A7E4 800AA7E4 1EAA0208 */  j          .L800AA878
    /* 9A7E8 800AA7E8 00000000 */   nop
  .L800AA7EC:
    /* 9A7EC 800AA7EC E00A80AF */  sw         $zero, %gp_rel(PadFrig)($gp)
    /* 9A7F0 800AA7F0 1EAA0208 */  j          .L800AA878
    /* 9A7F4 800AA7F4 00000000 */   nop
  .L800AA7F8:
    /* 9A7F8 800AA7F8 1280023C */  lui        $v0, %hi(ctrlflag)
    /* 9A7FC 800AA7FC 20B04290 */  lbu        $v0, %lo(ctrlflag)($v0)
    /* 9A800 800AA800 00000000 */  nop
    /* 9A804 800AA804 0D004010 */  beqz       $v0, .L800AA83C
    /* 9A808 800AA808 00000000 */   nop
    /* 9A80C 800AA80C F171020C */  jal        RemoveCtrlScreen__Fv
    /* 9A810 800AA810 00000000 */   nop
    /* 9A814 800AA814 01004238 */  xori       $v0, $v0, 0x1
    /* 9A818 800AA818 15004014 */  bnez       $v0, .L800AA870
    /* 9A81C 800AA81C D3030424 */   addiu     $a0, $zero, 0x3D3
    /* 9A820 800AA820 C6F5000C */  jal        PlaySFX__Fi
    /* 9A824 800AA824 33000424 */   addiu     $a0, $zero, 0x33
    /* 9A828 800AA828 B40A828F */  lw         $v0, %gp_rel(D_8011B234)($gp)
    /* 9A82C 800AA82C BC0A90AF */  sw         $s0, %gp_rel(cmenu)($gp)
    /* 9A830 800AA830 B00A82AF */  sw         $v0, %gp_rel(D_8011B230)($gp)
    /* 9A834 800AA834 1EAA0208 */  j          .L800AA878
    /* 9A838 800AA838 00000000 */   nop
  .L800AA83C:
    /* 9A83C 800AA83C 1280023C */  lui        $v0, %hi(deathflag)
    /* 9A840 800AA840 0CBA4290 */  lbu        $v0, %lo(deathflag)($v0)
    /* 9A844 800AA844 00000000 */  nop
    /* 9A848 800AA848 0B004014 */  bnez       $v0, .L800AA878
    /* 9A84C 800AA84C 01006324 */   addiu     $v1, $v1, 0x1
    /* 9A850 800AA850 08000224 */  addiu      $v0, $zero, 0x8
    /* 9A854 800AA854 02006210 */  beq        $v1, $v0, .L800AA860
    /* 9A858 800AA858 05000224 */   addiu     $v0, $zero, 0x5
    /* 9A85C 800AA85C B40A828F */  lw         $v0, %gp_rel(D_8011B234)($gp)
  .L800AA860:
    /* 9A860 800AA860 00000000 */  nop
    /* 9A864 800AA864 B00A82AF */  sw         $v0, %gp_rel(D_8011B230)($gp)
    /* 9A868 800AA868 BC0A90AF */  sw         $s0, %gp_rel(cmenu)($gp)
    /* 9A86C 800AA86C 33000424 */  addiu      $a0, $zero, 0x33
  .L800AA870:
    /* 9A870 800AA870 C6F5000C */  jal        PlaySFX__Fi
    /* 9A874 800AA874 00000000 */   nop
  .L800AA878:
    /* 9A878 800AA878 1280023C */  lui        $v0, %hi(FeFlag)
    /* 9A87C 800AA87C 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 9A880 800AA880 00000000 */  nop
    /* 9A884 800AA884 06004014 */  bnez       $v0, .L800AA8A0
    /* 9A888 800AA888 00000000 */   nop
    /* 9A88C 800AA88C C16E020C */  jal        GLUE_Finished__Fv
    /* 9A890 800AA890 00000000 */   nop
    /* 9A894 800AA894 02004010 */  beqz       $v0, .L800AA8A0
    /* 9A898 800AA898 00000000 */   nop
    /* 9A89C 800AA89C C80A80AF */  sw         $zero, %gp_rel(optionsflag)($gp)
  .L800AA8A0:
    /* 9A8A0 800AA8A0 C80A828F */  lw         $v0, %gp_rel(optionsflag)($gp)
    /* 9A8A4 800AA8A4 00000000 */  nop
    /* 9A8A8 800AA8A8 FBFE4014 */  bnez       $v0, .L800AA498
    /* 9A8AC 800AA8AC 00000000 */   nop
  .L800AA8B0:
    /* 9A8B0 800AA8B0 1280023C */  lui        $v0, %hi(MemCardActive)
    /* 9A8B4 800AA8B4 60B1428C */  lw         $v0, %lo(MemCardActive)($v0)
    /* 9A8B8 800AA8B8 801F80A3 */  sb         $zero, %gp_rel(D_8011C700)($gp)
    /* 9A8BC 800AA8BC 03004010 */  beqz       $v0, .L800AA8CC
    /* 9A8C0 800AA8C0 00000000 */   nop
    /* 9A8C4 800AA8C4 5695020C */  jal        MemcardOFF__Fv
    /* 9A8C8 800AA8C8 00000000 */   nop
  .L800AA8CC:
    /* 9A8CC 800AA8CC 1280023C */  lui        $v0, %hi(MemcardOverlay)
    /* 9A8D0 800AA8D0 64B1428C */  lw         $v0, %lo(MemcardOverlay)($v0)
    /* 9A8D4 800AA8D4 00000000 */  nop
    /* 9A8D8 800AA8D8 0D004010 */  beqz       $v0, .L800AA910
    /* 9A8DC 800AA8DC 00000000 */   nop
    /* 9A8E0 800AA8E0 1280023C */  lui        $v0, %hi(FeFlag)
    /* 9A8E4 800AA8E4 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 9A8E8 800AA8E8 1280013C */  lui        $at, %hi(MemcardOverlay)
    /* 9A8EC 800AA8EC 64B120AC */  sw         $zero, %lo(MemcardOverlay)($at)
    /* 9A8F0 800AA8F0 03004014 */  bnez       $v0, .L800AA900
    /* 9A8F4 800AA8F4 00000000 */   nop
    /* 9A8F8 800AA8F8 1D55020C */  jal        OVR_LoadGame__Fv
    /* 9A8FC 800AA8FC 00000000 */   nop
  .L800AA900:
    /* 9A900 800AA900 1280043C */  lui        $a0, %hi(sgnMusicTrack)
    /* 9A904 800AA904 ACBB848C */  lw         $a0, %lo(sgnMusicTrack)($a0)
    /* 9A908 800AA908 B4DF010C */  jal        music_start__Fi
    /* 9A90C 800AA90C 00000000 */   nop
  .L800AA910:
    /* 9A910 800AA910 1280023C */  lui        $v0, %hi(initchr)
    /* 9A914 800AA914 6CB6428C */  lw         $v0, %lo(initchr)($v0)
    /* 9A918 800AA918 00000000 */  nop
    /* 9A91C 800AA91C 24004014 */  bnez       $v0, .L800AA9B0
    /* 9A920 800AA920 21200000 */   addu      $a0, $zero, $zero
    /* 9A924 800AA924 01800534 */  ori        $a1, $zero, 0x8001
    /* 9A928 800AA928 B681000C */  jal        TSK_Exist
    /* 9A92C 800AA92C FFFF0624 */   addiu     $a2, $zero, -0x1
    /* 9A930 800AA930 12004014 */  bnez       $v0, .L800AA97C
    /* 9A934 800AA934 00000000 */   nop
    /* 9A938 800AA938 A80A8293 */  lbu        $v0, %gp_rel(Qfromoptions)($gp)
    /* 9A93C 800AA93C 00000000 */  nop
    /* 9A940 800AA940 0E004014 */  bnez       $v0, .L800AA97C
    /* 9A944 800AA944 00000000 */   nop
    /* 9A948 800AA948 9E6E020C */  jal        GLUE_ResumeGame__Fv
    /* 9A94C 800AA94C 00000000 */   nop
    /* 9A950 800AA950 EC6E020C */  jal        GLUE_SetShowPanelFlag__Fb
    /* 9A954 800AA954 01000424 */   addiu     $a0, $zero, 0x1
    /* 9A958 800AA958 E86E020C */  jal        GLUE_SetHomingScrollFlag__Fb
    /* 9A95C 800AA95C 01000424 */   addiu     $a0, $zero, 0x1
    /* 9A960 800AA960 1280013C */  lui        $at, %hi(PauseMode)
    /* 9A964 800AA964 A4B720A0 */  sb         $zero, %lo(PauseMode)($at)
    /* 9A968 800AA968 05000424 */  addiu      $a0, $zero, 0x5
    /* 9A96C 800AA96C 21280000 */  addu       $a1, $zero, $zero
    /* 9A970 800AA970 21300000 */  addu       $a2, $zero, $zero
    /* 9A974 800AA974 53EB010C */  jal        PostGamePad__Fiiii
    /* 9A978 800AA978 21380000 */   addu      $a3, $zero, $zero
  .L800AA97C:
    /* 9A97C 800AA97C 1280023C */  lui        $v0, %hi(ctrlflag)
    /* 9A980 800AA980 20B04290 */  lbu        $v0, %lo(ctrlflag)($v0)
    /* 9A984 800AA984 00000000 */  nop
    /* 9A988 800AA988 03004010 */  beqz       $v0, .L800AA998
    /* 9A98C 800AA98C 00000000 */   nop
    /* 9A990 800AA990 F171020C */  jal        RemoveCtrlScreen__Fv
    /* 9A994 800AA994 00000000 */   nop
  .L800AA998:
    /* 9A998 800AA998 A80A8293 */  lbu        $v0, %gp_rel(Qfromoptions)($gp)
    /* 9A99C 800AA99C 00000000 */  nop
    /* 9A9A0 800AA9A0 03004014 */  bnez       $v0, .L800AA9B0
    /* 9A9A4 800AA9A4 00000000 */   nop
    /* 9A9A8 800AA9A8 E16E020C */  jal        GLUE_SetShowGameScreenFlag__Fb
    /* 9A9AC 800AA9AC 01000424 */   addiu     $a0, $zero, 0x1
  .L800AA9B0:
    /* 9A9B0 800AA9B0 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 9A9B4 800AA9B4 1800B28F */  lw         $s2, 0x18($sp)
    /* 9A9B8 800AA9B8 1400B18F */  lw         $s1, 0x14($sp)
    /* 9A9BC 800AA9BC 1000B08F */  lw         $s0, 0x10($sp)
    /* 9A9C0 800AA9C0 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 9A9C4 800AA9C4 0800E003 */  jr         $ra
    /* 9A9C8 800AA9C8 00000000 */   nop
endlabel DrawOptions__FP4TASK
