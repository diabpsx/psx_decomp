.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ShowAlertBox__Fv, 0x20C

glabel ShowAlertBox__Fv
    /* 207C4 8015A3BC 80FFBD27 */  addiu      $sp, $sp, -0x80
    /* 207C8 8015A3C0 2800A427 */  addiu      $a0, $sp, 0x28
    /* 207CC 8015A3C4 7C00BFAF */  sw         $ra, 0x7C($sp)
    /* 207D0 8015A3C8 7800BEAF */  sw         $fp, 0x78($sp)
    /* 207D4 8015A3CC 7400B7AF */  sw         $s7, 0x74($sp)
    /* 207D8 8015A3D0 7000B6AF */  sw         $s6, 0x70($sp)
    /* 207DC 8015A3D4 6C00B5AF */  sw         $s5, 0x6C($sp)
    /* 207E0 8015A3D8 6800B4AF */  sw         $s4, 0x68($sp)
    /* 207E4 8015A3DC 6400B3AF */  sw         $s3, 0x64($sp)
    /* 207E8 8015A3E0 6000B2AF */  sw         $s2, 0x60($sp)
    /* 207EC 8015A3E4 5C00B1AF */  sw         $s1, 0x5C($sp)
    /* 207F0 8015A3E8 346E050C */  jal        __6Dialog_8015b8d0
    /* 207F4 8015A3EC 5800B0AF */   sw        $s0, 0x58($sp)
    /* 207F8 8015A3F0 2E000224 */  addiu      $v0, $zero, 0x2E
    /* 207FC 8015A3F4 3800A2A7 */  sh         $v0, 0x38($sp)
    /* 20800 8015A3F8 5B000224 */  addiu      $v0, $zero, 0x5B
    /* 20804 8015A3FC E4001124 */  addiu      $s1, $zero, 0xE4
    /* 20808 8015A400 3A001E24 */  addiu      $fp, $zero, 0x3A
    /* 2080C 8015A404 3A00A2A7 */  sh         $v0, 0x3A($sp)
    /* 20810 8015A408 3C00B1A7 */  sh         $s1, 0x3C($sp)
    /* 20814 8015A40C 546E050C */  jal        GetOverlayOtBase__7CBlocks_8015b950
    /* 20818 8015A410 3E00BEA7 */   sh        $fp, 0x3E($sp)
    /* 2081C 8015A414 2800A427 */  addiu      $a0, $sp, 0x28
    /* 20820 8015A418 08005024 */  addiu      $s0, $v0, 0x8
    /* 20824 8015A41C 8A34020C */  jal        SetOTpos__6Dialogi
    /* 20828 8015A420 21280002 */   addu      $a1, $s0, $zero
    /* 2082C 8015A424 0C80173C */  lui        $s7, %hi(MediumFont)
    /* 20830 8015A428 D882F726 */  addiu      $s7, $s7, %lo(MediumFont)
    /* 20834 8015A42C 2120E002 */  addu       $a0, $s7, $zero
    /* 20838 8015A430 21280002 */  addu       $a1, $s0, $zero
    /* 2083C 8015A434 E82A020C */  jal        SetOTpos__5CFonti
    /* 20840 8015A438 4000A2AF */   sw        $v0, 0x40($sp)
    /* 20844 8015A43C 2800A427 */  addiu      $a0, $sp, 0x28
    /* 20848 8015A440 21280002 */  addu       $a1, $s0, $zero
    /* 2084C 8015A444 8A34020C */  jal        SetOTpos__6Dialogi
    /* 20850 8015A448 4800A2AF */   sw        $v0, 0x48($sp)
    /* 20854 8015A44C 2120E002 */  addu       $a0, $s7, $zero
    /* 20858 8015A450 E82A020C */  jal        SetOTpos__5CFonti
    /* 2085C 8015A454 21280002 */   addu      $a1, $s0, $zero
    /* 20860 8015A458 2800A427 */  addiu      $a0, $sp, 0x28
    /* 20864 8015A45C 286E050C */  jal        SetBorder__6Dialogi_8015b8a0
    /* 20868 8015A460 12000524 */   addiu     $a1, $zero, 0x12
    /* 2086C 8015A464 2800A427 */  addiu      $a0, $sp, 0x28
    /* 20870 8015A468 266E050C */  jal        SetBack__6Dialogi_8015b898
    /* 20874 8015A46C 05000524 */   addiu     $a1, $zero, 0x5
    /* 20878 8015A470 2800A427 */  addiu      $a0, $sp, 0x28
    /* 2087C 8015A474 50000524 */  addiu      $a1, $zero, 0x50
    /* 20880 8015A478 40000624 */  addiu      $a2, $zero, 0x40
    /* 20884 8015A47C 1E6E050C */  jal        SetRGB__6DialogUcUcUc_8015b878
    /* 20888 8015A480 40000724 */   addiu     $a3, $zero, 0x40
    /* 2088C 8015A484 2800A427 */  addiu      $a0, $sp, 0x28
    /* 20890 8015A488 2E000524 */  addiu      $a1, $zero, 0x2E
    /* 20894 8015A48C 5B000624 */  addiu      $a2, $zero, 0x5B
    /* 20898 8015A490 E4000724 */  addiu      $a3, $zero, 0xE4
    /* 2089C 8015A494 B82F020C */  jal        Back__6Dialogiiii
    /* 208A0 8015A498 1000BEAF */   sw        $fp, 0x10($sp)
    /* 208A4 8015A49C D80C848F */  lw         $a0, %gp_rel(AlertTxt)($gp)
    /* 208A8 8015A4A0 0C050224 */  addiu      $v0, $zero, 0x50C
    /* 208AC 8015A4A4 07008210 */  beq        $a0, $v0, .L8015A4C4
    /* 208B0 8015A4A8 00000000 */   nop
    /* 208B4 8015A4AC 4AED010C */  jal        GetStr__Fi
    /* 208B8 8015A4B0 00000000 */   nop
    /* 208BC 8015A4B4 1680043C */  lui        $a0, %hi(AlertStr)
    /* 208C0 8015A4B8 10958424 */  addiu      $a0, $a0, %lo(AlertStr)
    /* 208C4 8015A4BC F240000C */  jal        strcpy
    /* 208C8 8015A4C0 21284000 */   addu      $a1, $v0, $zero
  .L8015A4C4:
    /* 208CC 8015A4C4 2120E002 */  addu       $a0, $s7, $zero
    /* 208D0 8015A4C8 1680103C */  lui        $s0, %hi(AlertStr)
    /* 208D4 8015A4CC 10951026 */  addiu      $s0, $s0, %lo(AlertStr)
    /* 208D8 8015A4D0 A92A020C */  jal        GetStrWidth__5CFontPc
    /* 208DC 8015A4D4 21280002 */   addu      $a1, $s0, $zero
    /* 208E0 8015A4D8 1A005100 */  div        $zero, $v0, $s1
    /* 208E4 8015A4DC 12900000 */  mflo       $s2
    /* 208E8 8015A4E0 2120E002 */  addu       $a0, $s7, $zero
    /* 208EC 8015A4E4 21280000 */  addu       $a1, $zero, $zero
    /* 208F0 8015A4E8 21380002 */  addu       $a3, $s0, $zero
    /* 208F4 8015A4EC 01001524 */  addiu      $s5, $zero, 0x1
    /* 208F8 8015A4F0 1280163C */  lui        $s6, %hi(WHITER)
    /* 208FC 8015A4F4 D1ABD692 */  lbu        $s6, %lo(WHITER)($s6)
    /* 20900 8015A4F8 1280133C */  lui        $s3, %hi(WHITEG)
    /* 20904 8015A4FC D2AB7392 */  lbu        $s3, %lo(WHITEG)($s3)
    /* 20908 8015A500 3800B427 */  addiu      $s4, $sp, 0x38
    /* 2090C 8015A504 1000B5AF */  sw         $s5, 0x10($sp)
    /* 20910 8015A508 1400B4AF */  sw         $s4, 0x14($sp)
    /* 20914 8015A50C 1800B6AF */  sw         $s6, 0x18($sp)
    /* 20918 8015A510 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 2091C 8015A514 2000B3AF */  sw         $s3, 0x20($sp)
    /* 20920 8015A518 01005226 */  addiu      $s2, $s2, 0x1
    /* 20924 8015A51C 40881200 */  sll        $s1, $s2, 1
    /* 20928 8015A520 21883202 */  addu       $s1, $s1, $s2
    /* 2092C 8015A524 80881100 */  sll        $s1, $s1, 2
    /* 20930 8015A528 2380D103 */  subu       $s0, $fp, $s1
    /* 20934 8015A52C 43801000 */  sra        $s0, $s0, 1
    /* 20938 8015A530 03001026 */  addiu      $s0, $s0, 0x3
    /* 2093C 8015A534 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 20940 8015A538 21300002 */   addu      $a2, $s0, $zero
    /* 20944 8015A53C 4AED010C */  jal        GetStr__Fi
    /* 20948 8015A540 30030424 */   addiu     $a0, $zero, 0x330
    /* 2094C 8015A544 2120E002 */  addu       $a0, $s7, $zero
    /* 20950 8015A548 21280000 */  addu       $a1, $zero, $zero
    /* 20954 8015A54C 21883202 */  addu       $s1, $s1, $s2
    /* 20958 8015A550 21301102 */  addu       $a2, $s0, $s1
    /* 2095C 8015A554 21384000 */  addu       $a3, $v0, $zero
    /* 20960 8015A558 1000B5AF */  sw         $s5, 0x10($sp)
    /* 20964 8015A55C 1400B4AF */  sw         $s4, 0x14($sp)
    /* 20968 8015A560 1800B6AF */  sw         $s6, 0x18($sp)
    /* 2096C 8015A564 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 20970 8015A568 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 20974 8015A56C 2000B3AF */   sw        $s3, 0x20($sp)
    /* 20978 8015A570 4000A58F */  lw         $a1, 0x40($sp)
    /* 2097C 8015A574 8A34020C */  jal        SetOTpos__6Dialogi
    /* 20980 8015A578 2800A427 */   addiu     $a0, $sp, 0x28
    /* 20984 8015A57C 4800A58F */  lw         $a1, 0x48($sp)
    /* 20988 8015A580 E82A020C */  jal        SetOTpos__5CFonti
    /* 2098C 8015A584 2120E002 */   addu      $a0, $s7, $zero
    /* 20990 8015A588 2800A427 */  addiu      $a0, $sp, 0x28
    /* 20994 8015A58C 2A6E050C */  jal        ___6Dialog_8015b8a8
    /* 20998 8015A590 02000524 */   addiu     $a1, $zero, 0x2
    /* 2099C 8015A594 7C00BF8F */  lw         $ra, 0x7C($sp)
    /* 209A0 8015A598 7800BE8F */  lw         $fp, 0x78($sp)
    /* 209A4 8015A59C 7400B78F */  lw         $s7, 0x74($sp)
    /* 209A8 8015A5A0 7000B68F */  lw         $s6, 0x70($sp)
    /* 209AC 8015A5A4 6C00B58F */  lw         $s5, 0x6C($sp)
    /* 209B0 8015A5A8 6800B48F */  lw         $s4, 0x68($sp)
    /* 209B4 8015A5AC 6400B38F */  lw         $s3, 0x64($sp)
    /* 209B8 8015A5B0 6000B28F */  lw         $s2, 0x60($sp)
    /* 209BC 8015A5B4 5C00B18F */  lw         $s1, 0x5C($sp)
    /* 209C0 8015A5B8 5800B08F */  lw         $s0, 0x58($sp)
    /* 209C4 8015A5BC 8000BD27 */  addiu      $sp, $sp, 0x80
    /* 209C8 8015A5C0 0800E003 */  jr         $ra
    /* 209CC 8015A5C4 00000000 */   nop
endlabel ShowAlertBox__Fv
