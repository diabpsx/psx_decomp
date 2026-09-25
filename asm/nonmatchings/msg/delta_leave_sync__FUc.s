.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching delta_leave_sync__FUc, 0x32C

glabel delta_leave_sync__FUc
    /* 3EC0C 8004EC0C 1280023C */  lui        $v0, %hi(currlevel)
    /* 3EC10 8004EC10 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 3EC14 8004EC14 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 3EC18 8004EC18 2400B5AF */  sw         $s5, 0x24($sp)
    /* 3EC1C 8004EC1C 21A88000 */  addu       $s5, $a0, $zero
    /* 3EC20 8004EC20 2800BFAF */  sw         $ra, 0x28($sp)
    /* 3EC24 8004EC24 2000B4AF */  sw         $s4, 0x20($sp)
    /* 3EC28 8004EC28 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 3EC2C 8004EC2C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 3EC30 8004EC30 1400B1AF */  sw         $s1, 0x14($sp)
    /* 3EC34 8004EC34 09004014 */  bnez       $v0, .L8004EC5C
    /* 3EC38 8004EC38 1000B0AF */   sw        $s0, 0x10($sp)
    /* 3EC3C 8004EC3C B7F6000C */  jal        GetRndSeed__Fv
    /* 3EC40 8004EC40 00000000 */   nop
    /* 3EC44 8004EC44 1280033C */  lui        $v1, %hi(currlevel)
    /* 3EC48 8004EC48 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 3EC4C 8004EC4C 0D80013C */  lui        $at, %hi(glSeedTbl)
    /* 3EC50 8004EC50 5CF722AC */  sw         $v0, %lo(glSeedTbl)($at)
    /* 3EC54 8004EC54 AE006010 */  beqz       $v1, .L8004EF10
    /* 3EC58 8004EC58 00000000 */   nop
  .L8004EC5C:
    /* 3EC5C 8004EC5C FF00A432 */  andi       $a0, $s5, 0xFF
    /* 3EC60 8004EC60 21980000 */  addu       $s3, $zero, $zero
    /* 3EC64 8004EC64 1280053C */  lui        $a1, %hi(setlevel)
    /* 3EC68 8004EC68 0EC1A590 */  lbu        $a1, %lo(setlevel)($a1)
    /* 3EC6C 8004EC6C 1180123C */  lui        $s2, %hi(monstactive)
    /* 3EC70 8004EC70 C4A05226 */  addiu      $s2, $s2, %lo(monstactive)
    /* 3EC74 8004EC74 224A010C */  jal        GetDLevel__Fib
    /* 3EC78 8004EC78 2B280500 */   sltu      $a1, $zero, $a1
    /* 3EC7C 8004EC7C 21A04000 */  addu       $s4, $v0, $zero
  .L8004EC80:
    /* 3EC80 8004EC80 1280023C */  lui        $v0, %hi(nummonsters)
    /* 3EC84 8004EC84 CCC2428C */  lw         $v0, %lo(nummonsters)($v0)
    /* 3EC88 8004EC88 00000000 */  nop
    /* 3EC8C 8004EC8C 2A106202 */  slt        $v0, $s3, $v0
    /* 3EC90 8004EC90 29004010 */  beqz       $v0, .L8004ED38
    /* 3EC94 8004EC94 00000000 */   nop
    /* 3EC98 8004EC98 00004486 */  lh         $a0, 0x0($s2)
    /* 3EC9C 8004EC9C 00000000 */  nop
    /* 3ECA0 8004ECA0 40100400 */  sll        $v0, $a0, 1
    /* 3ECA4 8004ECA4 21104400 */  addu       $v0, $v0, $a0
    /* 3ECA8 8004ECA8 80100200 */  sll        $v0, $v0, 2
    /* 3ECAC 8004ECAC 21104400 */  addu       $v0, $v0, $a0
    /* 3ECB0 8004ECB0 C0880200 */  sll        $s1, $v0, 3
    /* 3ECB4 8004ECB4 1080013C */  lui        $at, %hi(monster + 0x10)
    /* 3ECB8 8004ECB8 21083100 */  addu       $at, $at, $s1
    /* 3ECBC 8004ECBC A453228C */  lw         $v0, %lo(monster + 0x10)($at)
    /* 3ECC0 8004ECC0 00000000 */  nop
    /* 3ECC4 8004ECC4 19004010 */  beqz       $v0, .L8004ED2C
    /* 3ECC8 8004ECC8 01000224 */   addiu     $v0, $zero, 0x1
    /* 3ECCC 8004ECCC C0800400 */  sll        $s0, $a0, 3
    /* 3ECD0 8004ECD0 680C1026 */  addiu      $s0, $s0, 0xC68
    /* 3ECD4 8004ECD4 B52082A3 */  sb         $v0, %gp_rel(D_8011C835)($gp)
    /* 3ECD8 8004ECD8 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 3ECDC 8004ECDC 21083100 */  addu       $at, $at, $s1
    /* 3ECE0 8004ECE0 C8532290 */  lbu        $v0, %lo(monster + 0x34)($at)
    /* 3ECE4 8004ECE4 21809002 */  addu       $s0, $s4, $s0
    /* 3ECE8 8004ECE8 000002A2 */  sb         $v0, 0x0($s0)
    /* 3ECEC 8004ECEC 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 3ECF0 8004ECF0 21083100 */  addu       $at, $at, $s1
    /* 3ECF4 8004ECF4 C9532290 */  lbu        $v0, %lo(monster + 0x35)($at)
    /* 3ECF8 8004ECF8 00000000 */  nop
    /* 3ECFC 8004ECFC 010002A2 */  sb         $v0, 0x1($s0)
    /* 3ED00 8004ED00 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 3ED04 8004ED04 21083100 */  addu       $at, $at, $s1
    /* 3ED08 8004ED08 D0532290 */  lbu        $v0, %lo(monster + 0x3C)($at)
    /* 3ED0C 8004ED0C 5D02020C */  jal        encode_enemy__Fi
    /* 3ED10 8004ED10 020002A2 */   sb        $v0, 0x2($s0)
    /* 3ED14 8004ED14 030002A2 */  sb         $v0, 0x3($s0)
    /* 3ED18 8004ED18 1080013C */  lui        $at, %hi(monster + 0x10)
    /* 3ED1C 8004ED1C 21083100 */  addu       $at, $at, $s1
    /* 3ED20 8004ED20 A453228C */  lw         $v0, %lo(monster + 0x10)($at)
    /* 3ED24 8004ED24 00000000 */  nop
    /* 3ED28 8004ED28 040002AE */  sw         $v0, 0x4($s0)
  .L8004ED2C:
    /* 3ED2C 8004ED2C 02005226 */  addiu      $s2, $s2, 0x2
    /* 3ED30 8004ED30 203B0108 */  j          .L8004EC80
    /* 3ED34 8004ED34 01007326 */   addiu     $s3, $s3, 0x1
  .L8004ED38:
    /* 3ED38 8004ED38 344A010C */  jal        ReleaseDLevel__FP6DLevel
    /* 3ED3C 8004ED3C 21208002 */   addu      $a0, $s4, $zero
    /* 3ED40 8004ED40 1280023C */  lui        $v0, %hi(setlevel)
    /* 3ED44 8004ED44 0EC14290 */  lbu        $v0, %lo(setlevel)($v0)
    /* 3ED48 8004ED48 00000000 */  nop
    /* 3ED4C 8004ED4C 38004014 */  bnez       $v0, .L8004EE30
    /* 3ED50 8004ED50 FF00A332 */   andi      $v1, $s5, 0xFF
    /* 3ED54 8004ED54 0D80043C */  lui        $a0, %hi(sgLocals)
    /* 3ED58 8004ED58 BC718424 */  addiu      $a0, $a0, %lo(sgLocals)
    /* 3ED5C 8004ED5C 40100300 */  sll        $v0, $v1, 1
    /* 3ED60 8004ED60 21104300 */  addu       $v0, $v0, $v1
    /* 3ED64 8004ED64 C0100200 */  sll        $v0, $v0, 3
    /* 3ED68 8004ED68 21104300 */  addu       $v0, $v0, $v1
    /* 3ED6C 8004ED6C C0100200 */  sll        $v0, $v0, 3
    /* 3ED70 8004ED70 21384400 */  addu       $a3, $v0, $a0
    /* 3ED74 8004ED74 1180063C */  lui        $a2, %hi(automapview)
    /* 3ED78 8004ED78 E4D6C624 */  addiu      $a2, $a2, %lo(automapview)
    /* 3ED7C 8004ED7C 2510E600 */  or         $v0, $a3, $a2
    /* 3ED80 8004ED80 03004230 */  andi       $v0, $v0, 0x3
    /* 3ED84 8004ED84 16004010 */  beqz       $v0, .L8004EDE0
    /* 3ED88 8004ED88 C000C824 */   addiu     $t0, $a2, 0xC0
  .L8004ED8C:
    /* 3ED8C 8004ED8C 0300C288 */  lwl        $v0, 0x3($a2)
    /* 3ED90 8004ED90 0000C298 */  lwr        $v0, 0x0($a2)
    /* 3ED94 8004ED94 0700C388 */  lwl        $v1, 0x7($a2)
    /* 3ED98 8004ED98 0400C398 */  lwr        $v1, 0x4($a2)
    /* 3ED9C 8004ED9C 0B00C488 */  lwl        $a0, 0xB($a2)
    /* 3EDA0 8004EDA0 0800C498 */  lwr        $a0, 0x8($a2)
    /* 3EDA4 8004EDA4 0F00C588 */  lwl        $a1, 0xF($a2)
    /* 3EDA8 8004EDA8 0C00C598 */  lwr        $a1, 0xC($a2)
    /* 3EDAC 8004EDAC 0300E2A8 */  swl        $v0, 0x3($a3)
    /* 3EDB0 8004EDB0 0000E2B8 */  swr        $v0, 0x0($a3)
    /* 3EDB4 8004EDB4 0700E3A8 */  swl        $v1, 0x7($a3)
    /* 3EDB8 8004EDB8 0400E3B8 */  swr        $v1, 0x4($a3)
    /* 3EDBC 8004EDBC 0B00E4A8 */  swl        $a0, 0xB($a3)
    /* 3EDC0 8004EDC0 0800E4B8 */  swr        $a0, 0x8($a3)
    /* 3EDC4 8004EDC4 0F00E5A8 */  swl        $a1, 0xF($a3)
    /* 3EDC8 8004EDC8 0C00E5B8 */  swr        $a1, 0xC($a3)
    /* 3EDCC 8004EDCC 1000C624 */  addiu      $a2, $a2, 0x10
    /* 3EDD0 8004EDD0 EEFFC814 */  bne        $a2, $t0, .L8004ED8C
    /* 3EDD4 8004EDD4 1000E724 */   addiu     $a3, $a3, 0x10
    /* 3EDD8 8004EDD8 833B0108 */  j          .L8004EE0C
    /* 3EDDC 8004EDDC 00000000 */   nop
  .L8004EDE0:
    /* 3EDE0 8004EDE0 0000C28C */  lw         $v0, 0x0($a2)
    /* 3EDE4 8004EDE4 0400C38C */  lw         $v1, 0x4($a2)
    /* 3EDE8 8004EDE8 0800C48C */  lw         $a0, 0x8($a2)
    /* 3EDEC 8004EDEC 0C00C58C */  lw         $a1, 0xC($a2)
    /* 3EDF0 8004EDF0 0000E2AC */  sw         $v0, 0x0($a3)
    /* 3EDF4 8004EDF4 0400E3AC */  sw         $v1, 0x4($a3)
    /* 3EDF8 8004EDF8 0800E4AC */  sw         $a0, 0x8($a3)
    /* 3EDFC 8004EDFC 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 3EE00 8004EE00 1000C624 */  addiu      $a2, $a2, 0x10
    /* 3EE04 8004EE04 F6FFC814 */  bne        $a2, $t0, .L8004EDE0
    /* 3EE08 8004EE08 1000E724 */   addiu     $a3, $a3, 0x10
  .L8004EE0C:
    /* 3EE0C 8004EE0C 0300C288 */  lwl        $v0, 0x3($a2)
    /* 3EE10 8004EE10 0000C298 */  lwr        $v0, 0x0($a2)
    /* 3EE14 8004EE14 0700C388 */  lwl        $v1, 0x7($a2)
    /* 3EE18 8004EE18 0400C398 */  lwr        $v1, 0x4($a2)
    /* 3EE1C 8004EE1C 0300E2A8 */  swl        $v0, 0x3($a3)
    /* 3EE20 8004EE20 0000E2B8 */  swr        $v0, 0x0($a3)
    /* 3EE24 8004EE24 0700E3A8 */  swl        $v1, 0x7($a3)
    /* 3EE28 8004EE28 C43B0108 */  j          .L8004EF10
    /* 3EE2C 8004EE2C 0400E3B8 */   swr       $v1, 0x4($a3)
  .L8004EE30:
    /* 3EE30 8004EE30 1180073C */  lui        $a3, %hi(automapview)
    /* 3EE34 8004EE34 E4D6E724 */  addiu      $a3, $a3, %lo(automapview)
    /* 3EE38 8004EE38 1280033C */  lui        $v1, %hi(setlvlnum)
    /* 3EE3C 8004EE3C 0FC16390 */  lbu        $v1, %lo(setlvlnum)($v1)
    /* 3EE40 8004EE40 0D80043C */  lui        $a0, %hi(sgLocals + 0xC80)
    /* 3EE44 8004EE44 3C7E8424 */  addiu      $a0, $a0, %lo(sgLocals + 0xC80)
    /* 3EE48 8004EE48 40100300 */  sll        $v0, $v1, 1
    /* 3EE4C 8004EE4C 21104300 */  addu       $v0, $v0, $v1
    /* 3EE50 8004EE50 C0100200 */  sll        $v0, $v0, 3
    /* 3EE54 8004EE54 21104300 */  addu       $v0, $v0, $v1
    /* 3EE58 8004EE58 C0100200 */  sll        $v0, $v0, 3
    /* 3EE5C 8004EE5C 21304400 */  addu       $a2, $v0, $a0
    /* 3EE60 8004EE60 2510C700 */  or         $v0, $a2, $a3
    /* 3EE64 8004EE64 03004230 */  andi       $v0, $v0, 0x3
    /* 3EE68 8004EE68 16004010 */  beqz       $v0, .L8004EEC4
    /* 3EE6C 8004EE6C C000E824 */   addiu     $t0, $a3, 0xC0
  .L8004EE70:
    /* 3EE70 8004EE70 0300E288 */  lwl        $v0, 0x3($a3)
    /* 3EE74 8004EE74 0000E298 */  lwr        $v0, 0x0($a3)
    /* 3EE78 8004EE78 0700E388 */  lwl        $v1, 0x7($a3)
    /* 3EE7C 8004EE7C 0400E398 */  lwr        $v1, 0x4($a3)
    /* 3EE80 8004EE80 0B00E488 */  lwl        $a0, 0xB($a3)
    /* 3EE84 8004EE84 0800E498 */  lwr        $a0, 0x8($a3)
    /* 3EE88 8004EE88 0F00E588 */  lwl        $a1, 0xF($a3)
    /* 3EE8C 8004EE8C 0C00E598 */  lwr        $a1, 0xC($a3)
    /* 3EE90 8004EE90 0300C2A8 */  swl        $v0, 0x3($a2)
    /* 3EE94 8004EE94 0000C2B8 */  swr        $v0, 0x0($a2)
    /* 3EE98 8004EE98 0700C3A8 */  swl        $v1, 0x7($a2)
    /* 3EE9C 8004EE9C 0400C3B8 */  swr        $v1, 0x4($a2)
    /* 3EEA0 8004EEA0 0B00C4A8 */  swl        $a0, 0xB($a2)
    /* 3EEA4 8004EEA4 0800C4B8 */  swr        $a0, 0x8($a2)
    /* 3EEA8 8004EEA8 0F00C5A8 */  swl        $a1, 0xF($a2)
    /* 3EEAC 8004EEAC 0C00C5B8 */  swr        $a1, 0xC($a2)
    /* 3EEB0 8004EEB0 1000E724 */  addiu      $a3, $a3, 0x10
    /* 3EEB4 8004EEB4 EEFFE814 */  bne        $a3, $t0, .L8004EE70
    /* 3EEB8 8004EEB8 1000C624 */   addiu     $a2, $a2, 0x10
    /* 3EEBC 8004EEBC BC3B0108 */  j          .L8004EEF0
    /* 3EEC0 8004EEC0 00000000 */   nop
  .L8004EEC4:
    /* 3EEC4 8004EEC4 0000E28C */  lw         $v0, 0x0($a3)
    /* 3EEC8 8004EEC8 0400E38C */  lw         $v1, 0x4($a3)
    /* 3EECC 8004EECC 0800E48C */  lw         $a0, 0x8($a3)
    /* 3EED0 8004EED0 0C00E58C */  lw         $a1, 0xC($a3)
    /* 3EED4 8004EED4 0000C2AC */  sw         $v0, 0x0($a2)
    /* 3EED8 8004EED8 0400C3AC */  sw         $v1, 0x4($a2)
    /* 3EEDC 8004EEDC 0800C4AC */  sw         $a0, 0x8($a2)
    /* 3EEE0 8004EEE0 0C00C5AC */  sw         $a1, 0xC($a2)
    /* 3EEE4 8004EEE4 1000E724 */  addiu      $a3, $a3, 0x10
    /* 3EEE8 8004EEE8 F6FFE814 */  bne        $a3, $t0, .L8004EEC4
    /* 3EEEC 8004EEEC 1000C624 */   addiu     $a2, $a2, 0x10
  .L8004EEF0:
    /* 3EEF0 8004EEF0 0300E288 */  lwl        $v0, 0x3($a3)
    /* 3EEF4 8004EEF4 0000E298 */  lwr        $v0, 0x0($a3)
    /* 3EEF8 8004EEF8 0700E388 */  lwl        $v1, 0x7($a3)
    /* 3EEFC 8004EEFC 0400E398 */  lwr        $v1, 0x4($a3)
    /* 3EF00 8004EF00 0300C2A8 */  swl        $v0, 0x3($a2)
    /* 3EF04 8004EF04 0000C2B8 */  swr        $v0, 0x0($a2)
    /* 3EF08 8004EF08 0700C3A8 */  swl        $v1, 0x7($a2)
    /* 3EF0C 8004EF0C 0400C3B8 */  swr        $v1, 0x4($a2)
  .L8004EF10:
    /* 3EF10 8004EF10 2800BF8F */  lw         $ra, 0x28($sp)
    /* 3EF14 8004EF14 2400B58F */  lw         $s5, 0x24($sp)
    /* 3EF18 8004EF18 2000B48F */  lw         $s4, 0x20($sp)
    /* 3EF1C 8004EF1C 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 3EF20 8004EF20 1800B28F */  lw         $s2, 0x18($sp)
    /* 3EF24 8004EF24 1400B18F */  lw         $s1, 0x14($sp)
    /* 3EF28 8004EF28 1000B08F */  lw         $s0, 0x10($sp)
    /* 3EF2C 8004EF2C 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 3EF30 8004EF30 0800E003 */  jr         $ra
    /* 3EF34 8004EF34 00000000 */   nop
endlabel delta_leave_sync__FUc
