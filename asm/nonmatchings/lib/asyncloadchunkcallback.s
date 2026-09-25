.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching asyncloadchunkcallback, 0x154

glabel asyncloadchunkcallback
    /* 13E14 80023E14 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 13E18 80023E18 1000B0AF */  sw         $s0, 0x10($sp)
    /* 13E1C 80023E1C 21808000 */  addu       $s0, $a0, $zero
    /* 13E20 80023E20 1800B2AF */  sw         $s2, 0x18($sp)
    /* 13E24 80023E24 1380123C */  lui        $s2, %hi(D_8013504C)
    /* 13E28 80023E28 4C505226 */  addiu      $s2, $s2, %lo(D_8013504C)
    /* 13E2C 80023E2C 2800BFAF */  sw         $ra, 0x28($sp)
    /* 13E30 80023E30 2400B5AF */  sw         $s5, 0x24($sp)
    /* 13E34 80023E34 2000B4AF */  sw         $s4, 0x20($sp)
    /* 13E38 80023E38 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 13E3C 80023E3C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 13E40 80023E40 0000428E */  lw         $v0, 0x0($s2)
    /* 13E44 80023E44 21A0A000 */  addu       $s4, $a1, $zero
    /* 13E48 80023E48 2198C000 */  addu       $s3, $a2, $zero
    /* 13E4C 80023E4C 03004014 */  bnez       $v0, .L80023E5C
    /* 13E50 80023E50 21A8E000 */   addu      $s5, $a3, $zero
    /* 13E54 80023E54 D08F0008 */  j          .L80023F40
    /* 13E58 80023E58 FFFF0224 */   addiu     $v0, $zero, -0x1
  .L80023E5C:
    /* 13E5C 80023E5C 5294000C */  jal        getasyncblock
    /* 13E60 80023E60 00000000 */   nop
    /* 13E64 80023E64 21280002 */  addu       $a1, $s0, $zero
    /* 13E68 80023E68 04000624 */  addiu      $a2, $zero, 0x4
    /* 13E6C 80023E6C 21884000 */  addu       $s1, $v0, $zero
    /* 13E70 80023E70 40181100 */  sll        $v1, $s1, 1
    /* 13E74 80023E74 21187100 */  addu       $v1, $v1, $s1
    /* 13E78 80023E78 0000508E */  lw         $s0, 0x0($s2)
    /* 13E7C 80023E7C 00110300 */  sll        $v0, $v1, 4
    /* 13E80 80023E80 23104300 */  subu       $v0, $v0, $v1
    /* 13E84 80023E84 80100200 */  sll        $v0, $v0, 2
    /* 13E88 80023E88 21800202 */  addu       $s0, $s0, $v0
    /* 13E8C 80023E8C 8367000C */  jal        strncpy
    /* 13E90 80023E90 8F000426 */   addiu     $a0, $s0, 0x8F
    /* 13E94 80023E94 21200002 */  addu       $a0, $s0, $zero
    /* 13E98 80023E98 18004526 */  addiu      $a1, $s2, 0x18
    /* 13E9C 80023E9C 8F000624 */  addiu      $a2, $zero, 0x8F
    /* 13EA0 80023EA0 8367000C */  jal        strncpy
    /* 13EA4 80023EA4 930000A2 */   sb        $zero, 0x93($s0)
    /* 13EA8 80023EA8 01000224 */  addiu      $v0, $zero, 0x1
    /* 13EAC 80023EAC 980002AE */  sw         $v0, 0x98($s0)
    /* 13EB0 80023EB0 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 13EB4 80023EB4 9C0013AE */  sw         $s3, 0x9C($s0)
    /* 13EB8 80023EB8 940014AE */  sw         $s4, 0x94($s0)
    /* 13EBC 80023EBC A80000AE */  sw         $zero, 0xA8($s0)
    /* 13EC0 80023EC0 AC0002AE */  sw         $v0, 0xAC($s0)
    /* 13EC4 80023EC4 B00015AE */  sw         $s5, 0xB0($s0)
    /* 13EC8 80023EC8 1380023C */  lui        $v0, %hi(D_80135058)
    /* 13ECC 80023ECC 5850428C */  lw         $v0, %lo(D_80135058)($v0)
    /* 13ED0 80023ED0 00000000 */  nop
    /* 13ED4 80023ED4 13004004 */  bltz       $v0, .L80023F24
    /* 13ED8 80023ED8 40180200 */   sll       $v1, $v0, 1
    /* 13EDC 80023EDC 1380043C */  lui        $a0, %hi(D_8013504C)
    /* 13EE0 80023EE0 4C50848C */  lw         $a0, %lo(D_8013504C)($a0)
    /* 13EE4 80023EE4 21186200 */  addu       $v1, $v1, $v0
    /* 13EE8 80023EE8 00110300 */  sll        $v0, $v1, 4
    /* 13EEC 80023EEC 23104300 */  subu       $v0, $v0, $v1
    /* 13EF0 80023EF0 80100200 */  sll        $v0, $v0, 2
    /* 13EF4 80023EF4 21104400 */  addu       $v0, $v0, $a0
    /* 13EF8 80023EF8 AC0051AC */  sw         $s1, 0xAC($v0)
    /* 13EFC 80023EFC 1380023C */  lui        $v0, %hi(D_80135054)
    /* 13F00 80023F00 5450428C */  lw         $v0, %lo(D_80135054)($v0)
    /* 13F04 80023F04 1380013C */  lui        $at, %hi(D_80135058)
    /* 13F08 80023F08 585031AC */  sw         $s1, %lo(D_80135058)($at)
    /* 13F0C 80023F0C 0C004104 */  bgez       $v0, .L80023F40
    /* 13F10 80023F10 21102002 */   addu      $v0, $s1, $zero
    /* 13F14 80023F14 1380013C */  lui        $at, %hi(D_80135054)
    /* 13F18 80023F18 545031AC */  sw         $s1, %lo(D_80135054)($at)
    /* 13F1C 80023F1C D08F0008 */  j          .L80023F40
    /* 13F20 80023F20 00000000 */   nop
  .L80023F24:
    /* 13F24 80023F24 1380013C */  lui        $at, %hi(D_80135054)
    /* 13F28 80023F28 545031AC */  sw         $s1, %lo(D_80135054)($at)
    /* 13F2C 80023F2C 1380013C */  lui        $at, %hi(D_80135058)
    /* 13F30 80023F30 585031AC */  sw         $s1, %lo(D_80135058)($at)
    /* 13F34 80023F34 1380013C */  lui        $at, %hi(D_80135050)
    /* 13F38 80023F38 505031AC */  sw         $s1, %lo(D_80135050)($at)
    /* 13F3C 80023F3C 21102002 */  addu       $v0, $s1, $zero
  .L80023F40:
    /* 13F40 80023F40 2800BF8F */  lw         $ra, 0x28($sp)
    /* 13F44 80023F44 2400B58F */  lw         $s5, 0x24($sp)
    /* 13F48 80023F48 2000B48F */  lw         $s4, 0x20($sp)
    /* 13F4C 80023F4C 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 13F50 80023F50 1800B28F */  lw         $s2, 0x18($sp)
    /* 13F54 80023F54 1400B18F */  lw         $s1, 0x14($sp)
    /* 13F58 80023F58 1000B08F */  lw         $s0, 0x10($sp)
    /* 13F5C 80023F5C 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 13F60 80023F60 0800E003 */  jr         $ra
    /* 13F64 80023F64 00000000 */   nop
endlabel asyncloadchunkcallback
