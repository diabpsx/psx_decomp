.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintInfo__Fv, 0x430

glabel PrintInfo__Fv
    /* 22B74 80032B74 470F8293 */  lbu        $v0, %gp_rel(talkflag)($gp)
    /* 22B78 80032B78 B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 22B7C 80032B7C 4400BFAF */  sw         $ra, 0x44($sp)
    /* 22B80 80032B80 4000B6AF */  sw         $s6, 0x40($sp)
    /* 22B84 80032B84 3C00B5AF */  sw         $s5, 0x3C($sp)
    /* 22B88 80032B88 3800B4AF */  sw         $s4, 0x38($sp)
    /* 22B8C 80032B8C 3400B3AF */  sw         $s3, 0x34($sp)
    /* 22B90 80032B90 3000B2AF */  sw         $s2, 0x30($sp)
    /* 22B94 80032B94 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 22B98 80032B98 F7004014 */  bnez       $v0, .L80032F78
    /* 22B9C 80032B9C 2800B0AF */   sw        $s0, 0x28($sp)
    /* 22BA0 80032BA0 21A00000 */  addu       $s4, $zero, $zero
    /* 22BA4 80032BA4 21900000 */  addu       $s2, $zero, $zero
    /* 22BA8 80032BA8 1280023C */  lui        $v0, %hi(invflag)
    /* 22BAC 80032BAC 2CC34290 */  lbu        $v0, %lo(invflag)($v0)
    /* 22BB0 80032BB0 700F868F */  lw         $a2, %gp_rel(InfoBoxRect)($gp)
    /* 22BB4 80032BB4 36004010 */  beqz       $v0, .L80032C90
    /* 22BB8 80032BB8 21980000 */   addu      $s3, $zero, $zero
    /* 22BBC 80032BBC 1280023C */  lui        $v0, %hi(sel_data)
    /* 22BC0 80032BC0 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 22BC4 80032BC4 00000000 */  nop
    /* 22BC8 80032BC8 001A0200 */  sll        $v1, $v0, 8
    /* 22BCC 80032BCC 0D80013C */  lui        $at, %hi(_infostr)
    /* 22BD0 80032BD0 21082300 */  addu       $at, $at, $v1
    /* 22BD4 80032BD4 10E82280 */  lb         $v0, %lo(_infostr)($at)
    /* 22BD8 80032BD8 00000000 */  nop
    /* 22BDC 80032BDC 08004010 */  beqz       $v0, .L80032C00
    /* 22BE0 80032BE0 00000000 */   nop
    /* 22BE4 80032BE4 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 22BE8 80032BE8 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 22BEC 80032BEC 0D80053C */  lui        $a1, %hi(_infostr)
    /* 22BF0 80032BF0 10E8A524 */  addiu      $a1, $a1, %lo(_infostr)
    /* 22BF4 80032BF4 B229020C */  jal        GetWrap__5CFontPcP4RECT
    /* 22BF8 80032BF8 21286500 */   addu      $a1, $v1, $a1
    /* 22BFC 80032BFC 21904000 */  addu       $s2, $v0, $zero
  .L80032C00:
    /* 22C00 80032C00 1280063C */  lui        $a2, %hi(sel_data)
    /* 22C04 80032C04 2CB7C68C */  lw         $a2, %lo(sel_data)($a2)
    /* 22C08 80032C08 00000000 */  nop
    /* 22C0C 80032C0C 80100600 */  sll        $v0, $a2, 2
    /* 22C10 80032C10 1280013C */  lui        $at, %hi(D_8011C764)
    /* 22C14 80032C14 21082200 */  addu       $at, $at, $v0
    /* 22C18 80032C18 64C7228C */  lw         $v0, %lo(D_8011C764)($at)
    /* 22C1C 80032C1C 1280033C */  lui        $v1, %hi(D_8011C764)
    /* 22C20 80032C20 64C76324 */  addiu      $v1, $v1, %lo(D_8011C764)
    /* 22C24 80032C24 2A108202 */  slt        $v0, $s4, $v0
    /* 22C28 80032C28 53004010 */  beqz       $v0, .L80032D78
    /* 22C2C 80032C2C 21880000 */   addu      $s1, $zero, $zero
    /* 22C30 80032C30 21A86000 */  addu       $s5, $v1, $zero
    /* 22C34 80032C34 1380103C */  lui        $s0, %hi(D_8012E538)
    /* 22C38 80032C38 38E51026 */  addiu      $s0, $s0, %lo(D_8012E538)
  .L80032C3C:
    /* 22C3C 80032C3C 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 22C40 80032C40 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 22C44 80032C44 80280600 */  sll        $a1, $a2, 2
    /* 22C48 80032C48 2128A600 */  addu       $a1, $a1, $a2
    /* 22C4C 80032C4C C0290500 */  sll        $a1, $a1, 7
    /* 22C50 80032C50 2128B000 */  addu       $a1, $a1, $s0
    /* 22C54 80032C54 700F868F */  lw         $a2, %gp_rel(InfoBoxRect)($gp)
    /* 22C58 80032C58 B229020C */  jal        GetWrap__5CFontPcP4RECT
    /* 22C5C 80032C5C 40001026 */   addiu     $s0, $s0, 0x40
    /* 22C60 80032C60 1280063C */  lui        $a2, %hi(sel_data)
    /* 22C64 80032C64 2CB7C68C */  lw         $a2, %lo(sel_data)($a2)
    /* 22C68 80032C68 01003126 */  addiu      $s1, $s1, 0x1
    /* 22C6C 80032C6C 80180600 */  sll        $v1, $a2, 2
    /* 22C70 80032C70 21187500 */  addu       $v1, $v1, $s5
    /* 22C74 80032C74 0000638C */  lw         $v1, 0x0($v1)
    /* 22C78 80032C78 00000000 */  nop
    /* 22C7C 80032C7C 2A182302 */  slt        $v1, $s1, $v1
    /* 22C80 80032C80 EEFF6014 */  bnez       $v1, .L80032C3C
    /* 22C84 80032C84 21904202 */   addu      $s2, $s2, $v0
    /* 22C88 80032C88 5ECB0008 */  j          .L80032D78
    /* 22C8C 80032C8C 00000000 */   nop
  .L80032C90:
    /* 22C90 80032C90 1280033C */  lui        $v1, %hi(gbActivePlayers)
    /* 22C94 80032C94 A3B96390 */  lbu        $v1, %lo(gbActivePlayers)($v1)
    /* 22C98 80032C98 01000224 */  addiu      $v0, $zero, 0x1
    /* 22C9C 80032C9C 36006214 */  bne        $v1, $v0, .L80032D78
    /* 22CA0 80032CA0 00000000 */   nop
    /* 22CA4 80032CA4 1280023C */  lui        $v0, %hi(sel_data)
    /* 22CA8 80032CA8 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 22CAC 80032CAC 00000000 */  nop
    /* 22CB0 80032CB0 001A0200 */  sll        $v1, $v0, 8
    /* 22CB4 80032CB4 0D80013C */  lui        $at, %hi(_infostr)
    /* 22CB8 80032CB8 21082300 */  addu       $at, $at, $v1
    /* 22CBC 80032CBC 10E82280 */  lb         $v0, %lo(_infostr)($at)
    /* 22CC0 80032CC0 00000000 */  nop
    /* 22CC4 80032CC4 08004010 */  beqz       $v0, .L80032CE8
    /* 22CC8 80032CC8 00000000 */   nop
    /* 22CCC 80032CCC 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 22CD0 80032CD0 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 22CD4 80032CD4 0D80053C */  lui        $a1, %hi(_infostr)
    /* 22CD8 80032CD8 10E8A524 */  addiu      $a1, $a1, %lo(_infostr)
    /* 22CDC 80032CDC B229020C */  jal        GetWrap__5CFontPcP4RECT
    /* 22CE0 80032CE0 21286500 */   addu      $a1, $v1, $a1
    /* 22CE4 80032CE4 21984000 */  addu       $s3, $v0, $zero
  .L80032CE8:
    /* 22CE8 80032CE8 1280063C */  lui        $a2, %hi(sel_data)
    /* 22CEC 80032CEC 2CB7C68C */  lw         $a2, %lo(sel_data)($a2)
    /* 22CF0 80032CF0 00000000 */  nop
    /* 22CF4 80032CF4 80100600 */  sll        $v0, $a2, 2
    /* 22CF8 80032CF8 1280013C */  lui        $at, %hi(D_8011C764)
    /* 22CFC 80032CFC 21082200 */  addu       $at, $at, $v0
    /* 22D00 80032D00 64C7228C */  lw         $v0, %lo(D_8011C764)($at)
    /* 22D04 80032D04 1280033C */  lui        $v1, %hi(D_8011C764)
    /* 22D08 80032D08 64C76324 */  addiu      $v1, $v1, %lo(D_8011C764)
    /* 22D0C 80032D0C 2A108202 */  slt        $v0, $s4, $v0
    /* 22D10 80032D10 17004010 */  beqz       $v0, .L80032D70
    /* 22D14 80032D14 21880000 */   addu      $s1, $zero, $zero
    /* 22D18 80032D18 21A86000 */  addu       $s5, $v1, $zero
    /* 22D1C 80032D1C 1380103C */  lui        $s0, %hi(D_8012E538)
    /* 22D20 80032D20 38E51026 */  addiu      $s0, $s0, %lo(D_8012E538)
  .L80032D24:
    /* 22D24 80032D24 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 22D28 80032D28 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 22D2C 80032D2C 80280600 */  sll        $a1, $a2, 2
    /* 22D30 80032D30 2128A600 */  addu       $a1, $a1, $a2
    /* 22D34 80032D34 C0290500 */  sll        $a1, $a1, 7
    /* 22D38 80032D38 2128B000 */  addu       $a1, $a1, $s0
    /* 22D3C 80032D3C 700F868F */  lw         $a2, %gp_rel(InfoBoxRect)($gp)
    /* 22D40 80032D40 B229020C */  jal        GetWrap__5CFontPcP4RECT
    /* 22D44 80032D44 40001026 */   addiu     $s0, $s0, 0x40
    /* 22D48 80032D48 1280063C */  lui        $a2, %hi(sel_data)
    /* 22D4C 80032D4C 2CB7C68C */  lw         $a2, %lo(sel_data)($a2)
    /* 22D50 80032D50 01003126 */  addiu      $s1, $s1, 0x1
    /* 22D54 80032D54 80180600 */  sll        $v1, $a2, 2
    /* 22D58 80032D58 21187500 */  addu       $v1, $v1, $s5
    /* 22D5C 80032D5C 0000638C */  lw         $v1, 0x0($v1)
    /* 22D60 80032D60 00000000 */  nop
    /* 22D64 80032D64 2A182302 */  slt        $v1, $s1, $v1
    /* 22D68 80032D68 EEFF6014 */  bnez       $v1, .L80032D24
    /* 22D6C 80032D6C 21986202 */   addu      $s3, $s3, $v0
  .L80032D70:
    /* 22D70 80032D70 04000224 */  addiu      $v0, $zero, 0x4
    /* 22D74 80032D74 23985300 */  subu       $s3, $v0, $s3
  .L80032D78:
    /* 22D78 80032D78 1280023C */  lui        $v0, %hi(invflag)
    /* 22D7C 80032D7C 2CC34290 */  lbu        $v0, %lo(invflag)($v0)
    /* 22D80 80032D80 1280013C */  lui        $at, %hi(InvPageFlag)
    /* 22D84 80032D84 3CC320AC */  sw         $zero, %lo(InvPageFlag)($at)
    /* 22D88 80032D88 10004010 */  beqz       $v0, .L80032DCC
    /* 22D8C 80032D8C 21B00000 */   addu      $s6, $zero, $zero
    /* 22D90 80032D90 0700422A */  slti       $v0, $s2, 0x7
    /* 22D94 80032D94 08004014 */  bnez       $v0, .L80032DB8
    /* 22D98 80032D98 01000224 */   addiu     $v0, $zero, 0x1
    /* 22D9C 80032D9C 1280033C */  lui        $v1, %hi(InvPageNo)
    /* 22DA0 80032DA0 38C3638C */  lw         $v1, %lo(InvPageNo)($v1)
    /* 22DA4 80032DA4 1280013C */  lui        $at, %hi(InvPageFlag)
    /* 22DA8 80032DA8 3CC322AC */  sw         $v0, %lo(InvPageFlag)($at)
    /* 22DAC 80032DAC 02006010 */  beqz       $v1, .L80032DB8
    /* 22DB0 80032DB0 00000000 */   nop
    /* 22DB4 80032DB4 FAFF5626 */  addiu      $s6, $s2, -0x6
  .L80032DB8:
    /* 22DB8 80032DB8 1280023C */  lui        $v0, %hi(invflag)
    /* 22DBC 80032DBC 2CC34290 */  lbu        $v0, %lo(invflag)($v0)
    /* 22DC0 80032DC0 00000000 */  nop
    /* 22DC4 80032DC4 1B004014 */  bnez       $v0, .L80032E34
    /* 22DC8 80032DC8 00000000 */   nop
  .L80032DCC:
    /* 22DCC 80032DCC 19006106 */  bgez       $s3, .L80032E34
    /* 22DD0 80032DD0 01000224 */   addiu     $v0, $zero, 0x1
    /* 22DD4 80032DD4 1280033C */  lui        $v1, %hi(gbActivePlayers)
    /* 22DD8 80032DD8 A3B96390 */  lbu        $v1, %lo(gbActivePlayers)($v1)
    /* 22DDC 80032DDC 00000000 */  nop
    /* 22DE0 80032DE0 0D006214 */  bne        $v1, $v0, .L80032E18
    /* 22DE4 80032DE4 40101300 */   sll       $v0, $s3, 1
    /* 22DE8 80032DE8 40201300 */  sll        $a0, $s3, 1
    /* 22DEC 80032DEC 21209300 */  addu       $a0, $a0, $s3
    /* 22DF0 80032DF0 21980000 */  addu       $s3, $zero, $zero
    /* 22DF4 80032DF4 700F858F */  lw         $a1, %gp_rel(InfoBoxRect)($gp)
    /* 22DF8 80032DF8 80200400 */  sll        $a0, $a0, 2
    /* 22DFC 80032DFC 0200A294 */  lhu        $v0, 0x2($a1)
    /* 22E00 80032E00 0600A394 */  lhu        $v1, 0x6($a1)
    /* 22E04 80032E04 21104400 */  addu       $v0, $v0, $a0
    /* 22E08 80032E08 23186400 */  subu       $v1, $v1, $a0
    /* 22E0C 80032E0C 0200A2A4 */  sh         $v0, 0x2($a1)
    /* 22E10 80032E10 8DCB0008 */  j          .L80032E34
    /* 22E14 80032E14 0600A3A4 */   sh        $v1, 0x6($a1)
  .L80032E18:
    /* 22E18 80032E18 21105300 */  addu       $v0, $v0, $s3
    /* 22E1C 80032E1C 700F848F */  lw         $a0, %gp_rel(InfoBoxRect)($gp)
    /* 22E20 80032E20 21980000 */  addu       $s3, $zero, $zero
    /* 22E24 80032E24 06008394 */  lhu        $v1, 0x6($a0)
    /* 22E28 80032E28 80100200 */  sll        $v0, $v0, 2
    /* 22E2C 80032E2C 23186200 */  subu       $v1, $v1, $v0
    /* 22E30 80032E30 060083A4 */  sh         $v1, 0x6($a0)
  .L80032E34:
    /* 22E34 80032E34 1280023C */  lui        $v0, %hi(sel_data)
    /* 22E38 80032E38 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 22E3C 80032E3C 00000000 */  nop
    /* 22E40 80032E40 001A0200 */  sll        $v1, $v0, 8
    /* 22E44 80032E44 0D80013C */  lui        $at, %hi(_infostr)
    /* 22E48 80032E48 21082300 */  addu       $at, $at, $v1
    /* 22E4C 80032E4C 10E82280 */  lb         $v0, %lo(_infostr)($at)
    /* 22E50 80032E50 00000000 */  nop
    /* 22E54 80032E54 0E004010 */  beqz       $v0, .L80032E90
    /* 22E58 80032E58 00000000 */   nop
    /* 22E5C 80032E5C 1280023C */  lui        $v0, %hi(invflag)
    /* 22E60 80032E60 2CC34290 */  lbu        $v0, %lo(invflag)($v0)
    /* 22E64 80032E64 00000000 */  nop
    /* 22E68 80032E68 02004010 */  beqz       $v0, .L80032E74
    /* 22E6C 80032E6C 21206002 */   addu      $a0, $s3, $zero
    /* 22E70 80032E70 23207602 */  subu       $a0, $s3, $s6
  .L80032E74:
    /* 22E74 80032E74 0D80053C */  lui        $a1, %hi(_infostr)
    /* 22E78 80032E78 10E8A524 */  addiu      $a1, $a1, %lo(_infostr)
    /* 22E7C 80032E7C 21286500 */  addu       $a1, $v1, $a1
    /* 22E80 80032E80 96CA000C */  jal        CPrintString__FiPci
    /* 22E84 80032E84 01000624 */   addiu     $a2, $zero, 0x1
    /* 22E88 80032E88 FFFF8326 */  addiu      $v1, $s4, -0x1
    /* 22E8C 80032E8C 21A06200 */  addu       $s4, $v1, $v0
  .L80032E90:
    /* 22E90 80032E90 1280033C */  lui        $v1, %hi(sel_data)
    /* 22E94 80032E94 2CB7638C */  lw         $v1, %lo(sel_data)($v1)
    /* 22E98 80032E98 00000000 */  nop
    /* 22E9C 80032E9C 80100300 */  sll        $v0, $v1, 2
    /* 22EA0 80032EA0 1280013C */  lui        $at, %hi(D_8011C764)
    /* 22EA4 80032EA4 21082200 */  addu       $at, $at, $v0
    /* 22EA8 80032EA8 64C7228C */  lw         $v0, %lo(D_8011C764)($at)
    /* 22EAC 80032EAC 00000000 */  nop
    /* 22EB0 80032EB0 31004018 */  blez       $v0, .L80032F78
    /* 22EB4 80032EB4 21800000 */   addu      $s0, $zero, $zero
    /* 22EB8 80032EB8 1380153C */  lui        $s5, %hi(D_8012EA38)
    /* 22EBC 80032EBC 38EAB526 */  addiu      $s5, $s5, %lo(D_8012EA38)
    /* 22EC0 80032EC0 21900000 */  addu       $s2, $zero, $zero
    /* 22EC4 80032EC4 1380113C */  lui        $s1, %hi(D_8012E538)
    /* 22EC8 80032EC8 38E53126 */  addiu      $s1, $s1, %lo(D_8012E538)
  .L80032ECC:
    /* 22ECC 80032ECC 1280023C */  lui        $v0, %hi(invflag)
    /* 22ED0 80032ED0 2CC34290 */  lbu        $v0, %lo(invflag)($v0)
    /* 22ED4 80032ED4 00000000 */  nop
    /* 22ED8 80032ED8 0C004010 */  beqz       $v0, .L80032F0C
    /* 22EDC 80032EDC 21201402 */   addu      $a0, $s0, $s4
    /* 22EE0 80032EE0 21209300 */  addu       $a0, $a0, $s3
    /* 22EE4 80032EE4 FFFFC226 */  addiu      $v0, $s6, -0x1
    /* 22EE8 80032EE8 23208200 */  subu       $a0, $a0, $v0
    /* 22EEC 80032EEC 80280300 */  sll        $a1, $v1, 2
    /* 22EF0 80032EF0 2128A300 */  addu       $a1, $a1, $v1
    /* 22EF4 80032EF4 C0100500 */  sll        $v0, $a1, 3
    /* 22EF8 80032EF8 21105500 */  addu       $v0, $v0, $s5
    /* 22EFC 80032EFC 21104202 */  addu       $v0, $s2, $v0
    /* 22F00 80032F00 0000468C */  lw         $a2, 0x0($v0)
    /* 22F04 80032F04 CECB0008 */  j          .L80032F38
    /* 22F08 80032F08 C0290500 */   sll       $a1, $a1, 7
  .L80032F0C:
    /* 22F0C 80032F0C 21209300 */  addu       $a0, $a0, $s3
    /* 22F10 80032F10 1280023C */  lui        $v0, %hi(sel_data)
    /* 22F14 80032F14 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 22F18 80032F18 01008424 */  addiu      $a0, $a0, 0x1
    /* 22F1C 80032F1C 80280200 */  sll        $a1, $v0, 2
    /* 22F20 80032F20 2128A200 */  addu       $a1, $a1, $v0
    /* 22F24 80032F24 C0100500 */  sll        $v0, $a1, 3
    /* 22F28 80032F28 21105500 */  addu       $v0, $v0, $s5
    /* 22F2C 80032F2C 21104202 */  addu       $v0, $s2, $v0
    /* 22F30 80032F30 C0290500 */  sll        $a1, $a1, 7
    /* 22F34 80032F34 0000468C */  lw         $a2, 0x0($v0)
  .L80032F38:
    /* 22F38 80032F38 96CA000C */  jal        CPrintString__FiPci
    /* 22F3C 80032F3C 2128B100 */   addu      $a1, $a1, $s1
    /* 22F40 80032F40 FFFF8326 */  addiu      $v1, $s4, -0x1
    /* 22F44 80032F44 21A06200 */  addu       $s4, $v1, $v0
    /* 22F48 80032F48 04005226 */  addiu      $s2, $s2, 0x4
    /* 22F4C 80032F4C 1280033C */  lui        $v1, %hi(sel_data)
    /* 22F50 80032F50 2CB7638C */  lw         $v1, %lo(sel_data)($v1)
    /* 22F54 80032F54 00000000 */  nop
    /* 22F58 80032F58 80100300 */  sll        $v0, $v1, 2
    /* 22F5C 80032F5C 1280013C */  lui        $at, %hi(D_8011C764)
    /* 22F60 80032F60 21082200 */  addu       $at, $at, $v0
    /* 22F64 80032F64 64C7228C */  lw         $v0, %lo(D_8011C764)($at)
    /* 22F68 80032F68 01001026 */  addiu      $s0, $s0, 0x1
    /* 22F6C 80032F6C 2A100202 */  slt        $v0, $s0, $v0
    /* 22F70 80032F70 D6FF4014 */  bnez       $v0, .L80032ECC
    /* 22F74 80032F74 40003126 */   addiu     $s1, $s1, 0x40
  .L80032F78:
    /* 22F78 80032F78 4400BF8F */  lw         $ra, 0x44($sp)
    /* 22F7C 80032F7C 4000B68F */  lw         $s6, 0x40($sp)
    /* 22F80 80032F80 3C00B58F */  lw         $s5, 0x3C($sp)
    /* 22F84 80032F84 3800B48F */  lw         $s4, 0x38($sp)
    /* 22F88 80032F88 3400B38F */  lw         $s3, 0x34($sp)
    /* 22F8C 80032F8C 3000B28F */  lw         $s2, 0x30($sp)
    /* 22F90 80032F90 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 22F94 80032F94 2800B08F */  lw         $s0, 0x28($sp)
    /* 22F98 80032F98 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 22F9C 80032F9C 0800E003 */  jr         $ra
    /* 22FA0 80032FA0 00000000 */   nop
endlabel PrintInfo__Fv
