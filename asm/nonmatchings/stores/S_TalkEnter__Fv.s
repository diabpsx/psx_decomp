.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_TalkEnter__Fv, 0x200

glabel S_TalkEnter__Fv
    /* 63D08 80073D08 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 63D0C 80073D0C 0421838F */  lw         $v1, %gp_rel(D_8011C884)($gp)
    /* 63D10 80073D10 16000224 */  addiu      $v0, $zero, 0x16
    /* 63D14 80073D14 2800BFAF */  sw         $ra, 0x28($sp)
    /* 63D18 80073D18 2400B5AF */  sw         $s5, 0x24($sp)
    /* 63D1C 80073D1C 2000B4AF */  sw         $s4, 0x20($sp)
    /* 63D20 80073D20 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 63D24 80073D24 1800B2AF */  sw         $s2, 0x18($sp)
    /* 63D28 80073D28 1400B1AF */  sw         $s1, 0x14($sp)
    /* 63D2C 80073D2C 09006214 */  bne        $v1, $v0, .L80073D54
    /* 63D30 80073D30 1000B0AF */   sw        $s0, 0x10($sp)
    /* 63D34 80073D34 0C218483 */  lb         $a0, %gp_rel(D_8011C88C)($gp)
    /* 63D38 80073D38 5BBE010C */  jal        StartStore__Fc
    /* 63D3C 80073D3C 00000000 */   nop
    /* 63D40 80073D40 0821828F */  lw         $v0, %gp_rel(D_8011C888)($gp)
    /* 63D44 80073D44 00000000 */  nop
    /* 63D48 80073D48 042182AF */  sw         $v0, %gp_rel(D_8011C884)($gp)
    /* 63D4C 80073D4C B8CF0108 */  j          .L80073EE0
    /* 63D50 80073D50 00000000 */   nop
  .L80073D54:
    /* 63D54 80073D54 21280000 */  addu       $a1, $zero, $zero
    /* 63D58 80073D58 21800000 */  addu       $s0, $zero, $zero
    /* 63D5C 80073D5C 02000724 */  addiu      $a3, $zero, 0x2
    /* 63D60 80073D60 FFFF0624 */  addiu      $a2, $zero, -0x1
    /* 63D64 80073D64 21200000 */  addu       $a0, $zero, $zero
    /* 63D68 80073D68 4421828F */  lw         $v0, %gp_rel(D_8011C8C4)($gp)
    /* 63D6C 80073D6C 0D80033C */  lui        $v1, %hi(Qtalklist)
    /* 63D70 80073D70 C0FB6324 */  addiu      $v1, $v1, %lo(Qtalklist)
    /* 63D74 80073D74 80110200 */  sll        $v0, $v0, 6
    /* 63D78 80073D78 21184300 */  addu       $v1, $v0, $v1
  .L80073D7C:
    /* 63D7C 80073D7C 0E80013C */  lui        $at, %hi(quests + 0x2)
    /* 63D80 80073D80 21082400 */  addu       $at, $at, $a0
    /* 63D84 80073D84 42DA2290 */  lbu        $v0, %lo(quests + 0x2)($at)
    /* 63D88 80073D88 00000000 */  nop
    /* 63D8C 80073D8C 0C004714 */  bne        $v0, $a3, .L80073DC0
    /* 63D90 80073D90 00000000 */   nop
    /* 63D94 80073D94 0000628C */  lw         $v0, 0x0($v1)
    /* 63D98 80073D98 00000000 */  nop
    /* 63D9C 80073D9C 08004610 */  beq        $v0, $a2, .L80073DC0
    /* 63DA0 80073DA0 00000000 */   nop
    /* 63DA4 80073DA4 0E80013C */  lui        $at, %hi(quests + 0x11)
    /* 63DA8 80073DA8 21082400 */  addu       $at, $at, $a0
    /* 63DAC 80073DAC 51DA2290 */  lbu        $v0, %lo(quests + 0x11)($at)
    /* 63DB0 80073DB0 00000000 */  nop
    /* 63DB4 80073DB4 02004010 */  beqz       $v0, .L80073DC0
    /* 63DB8 80073DB8 00000000 */   nop
    /* 63DBC 80073DBC 0100A524 */  addiu      $a1, $a1, 0x1
  .L80073DC0:
    /* 63DC0 80073DC0 04006324 */  addiu      $v1, $v1, 0x4
    /* 63DC4 80073DC4 01001026 */  addiu      $s0, $s0, 0x1
    /* 63DC8 80073DC8 1000022A */  slti       $v0, $s0, 0x10
    /* 63DCC 80073DCC EBFF4014 */  bnez       $v0, .L80073D7C
    /* 63DD0 80073DD0 14008424 */   addiu     $a0, $a0, 0x14
    /* 63DD4 80073DD4 43180500 */  sra        $v1, $a1, 1
    /* 63DD8 80073DD8 0A000224 */  addiu      $v0, $zero, 0xA
    /* 63DDC 80073DDC 23904300 */  subu       $s2, $v0, $v1
    /* 63DE0 80073DE0 0421838F */  lw         $v1, %gp_rel(D_8011C884)($gp)
    /* 63DE4 80073DE4 FEFF4226 */  addiu      $v0, $s2, -0x2
    /* 63DE8 80073DE8 18006214 */  bne        $v1, $v0, .L80073E4C
    /* 63DEC 80073DEC 01001524 */   addiu     $s5, $zero, 0x1
    /* 63DF0 80073DF0 4421838F */  lw         $v1, %gp_rel(D_8011C8C4)($gp)
    /* 63DF4 80073DF4 00000000 */  nop
    /* 63DF8 80073DF8 40100300 */  sll        $v0, $v1, 1
    /* 63DFC 80073DFC 21104300 */  addu       $v0, $v0, $v1
    /* 63E00 80073E00 00110200 */  sll        $v0, $v0, 4
    /* 63E04 80073E04 21104300 */  addu       $v0, $v0, $v1
    /* 63E08 80073E08 80100200 */  sll        $v0, $v0, 2
    /* 63E0C 80073E0C 0D80013C */  lui        $at, %hi(towner + 0x84)
    /* 63E10 80073E10 21082200 */  addu       $at, $at, $v0
    /* 63E14 80073E14 04FF248C */  lw         $a0, %lo(towner + 0x84)($at)
    /* 63E18 80073E18 B3F6000C */  jal        SetRndSeed__Fl
    /* 63E1C 80073E1C 00000000 */   nop
    /* 63E20 80073E20 3021848F */  lw         $a0, %gp_rel(D_8011C8B0)($gp)
    /* 63E24 80073E24 2C21828F */  lw         $v0, %gp_rel(D_8011C8AC)($gp)
    /* 63E28 80073E28 00000000 */  nop
    /* 63E2C 80073E2C 23208200 */  subu       $a0, $a0, $v0
    /* 63E30 80073E30 C9F6000C */  jal        ENG_random__Fl
    /* 63E34 80073E34 01008424 */   addiu     $a0, $a0, 0x1
    /* 63E38 80073E38 2C21848F */  lw         $a0, %gp_rel(D_8011C8AC)($gp)
    /* 63E3C 80073E3C 1E37010C */  jal        InitQTextMsg__Fi
    /* 63E40 80073E40 21204400 */   addu      $a0, $v0, $a0
    /* 63E44 80073E44 B8CF0108 */  j          .L80073EE0
    /* 63E48 80073E48 00000000 */   nop
  .L80073E4C:
    /* 63E4C 80073E4C 21800000 */  addu       $s0, $zero, $zero
    /* 63E50 80073E50 02001424 */  addiu      $s4, $zero, 0x2
    /* 63E54 80073E54 0D80133C */  lui        $s3, %hi(Qtalklist)
    /* 63E58 80073E58 C0FB7326 */  addiu      $s3, $s3, %lo(Qtalklist)
    /* 63E5C 80073E5C 21880000 */  addu       $s1, $zero, $zero
  .L80073E60:
    /* 63E60 80073E60 0E80013C */  lui        $at, %hi(quests + 0x2)
    /* 63E64 80073E64 21083100 */  addu       $at, $at, $s1
    /* 63E68 80073E68 42DA2290 */  lbu        $v0, %lo(quests + 0x2)($at)
    /* 63E6C 80073E6C 00000000 */  nop
    /* 63E70 80073E70 17005414 */  bne        $v0, $s4, .L80073ED0
    /* 63E74 80073E74 80181000 */   sll       $v1, $s0, 2
    /* 63E78 80073E78 4421828F */  lw         $v0, %gp_rel(D_8011C8C4)($gp)
    /* 63E7C 80073E7C 00000000 */  nop
    /* 63E80 80073E80 80110200 */  sll        $v0, $v0, 6
    /* 63E84 80073E84 21105300 */  addu       $v0, $v0, $s3
    /* 63E88 80073E88 21106200 */  addu       $v0, $v1, $v0
    /* 63E8C 80073E8C 0000448C */  lw         $a0, 0x0($v0)
    /* 63E90 80073E90 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 63E94 80073E94 0E008210 */  beq        $a0, $v0, .L80073ED0
    /* 63E98 80073E98 00000000 */   nop
    /* 63E9C 80073E9C 0E80013C */  lui        $at, %hi(quests + 0x11)
    /* 63EA0 80073EA0 21083100 */  addu       $at, $at, $s1
    /* 63EA4 80073EA4 51DA2290 */  lbu        $v0, %lo(quests + 0x11)($at)
    /* 63EA8 80073EA8 00000000 */  nop
    /* 63EAC 80073EAC 08004010 */  beqz       $v0, .L80073ED0
    /* 63EB0 80073EB0 00000000 */   nop
    /* 63EB4 80073EB4 0421828F */  lw         $v0, %gp_rel(D_8011C884)($gp)
    /* 63EB8 80073EB8 00000000 */  nop
    /* 63EBC 80073EBC 03004216 */  bne        $s2, $v0, .L80073ECC
    /* 63EC0 80073EC0 00000000 */   nop
    /* 63EC4 80073EC4 1E37010C */  jal        InitQTextMsg__Fi
    /* 63EC8 80073EC8 00000000 */   nop
  .L80073ECC:
    /* 63ECC 80073ECC 21905502 */  addu       $s2, $s2, $s5
  .L80073ED0:
    /* 63ED0 80073ED0 01001026 */  addiu      $s0, $s0, 0x1
    /* 63ED4 80073ED4 1000022A */  slti       $v0, $s0, 0x10
    /* 63ED8 80073ED8 E1FF4014 */  bnez       $v0, .L80073E60
    /* 63EDC 80073EDC 14003126 */   addiu     $s1, $s1, 0x14
  .L80073EE0:
    /* 63EE0 80073EE0 2800BF8F */  lw         $ra, 0x28($sp)
    /* 63EE4 80073EE4 2400B58F */  lw         $s5, 0x24($sp)
    /* 63EE8 80073EE8 2000B48F */  lw         $s4, 0x20($sp)
    /* 63EEC 80073EEC 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 63EF0 80073EF0 1800B28F */  lw         $s2, 0x18($sp)
    /* 63EF4 80073EF4 1400B18F */  lw         $s1, 0x14($sp)
    /* 63EF8 80073EF8 1000B08F */  lw         $s0, 0x10($sp)
    /* 63EFC 80073EFC 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 63F00 80073F00 0800E003 */  jr         $ra
    /* 63F04 80073F04 00000000 */   nop
endlabel S_TalkEnter__Fv
