.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_DoSpStand__Fi, 0xAC

glabel M_DoSpStand__Fi
    /* 152D8 8014EED0 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 152DC 8014EED4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 152E0 8014EED8 21888000 */  addu       $s1, $a0, $zero
    /* 152E4 8014EEDC 40101100 */  sll        $v0, $s1, 1
    /* 152E8 8014EEE0 21105100 */  addu       $v0, $v0, $s1
    /* 152EC 8014EEE4 80100200 */  sll        $v0, $v0, 2
    /* 152F0 8014EEE8 21105100 */  addu       $v0, $v0, $s1
    /* 152F4 8014EEEC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 152F8 8014EEF0 C0800200 */  sll        $s0, $v0, 3
    /* 152FC 8014EEF4 1800BFAF */  sw         $ra, 0x18($sp)
    /* 15300 8014EEF8 1080013C */  lui        $at, %hi(monster + 0x64)
    /* 15304 8014EEFC 21083000 */  addu       $at, $at, $s0
    /* 15308 8014EF00 F853228C */  lw         $v0, %lo(monster + 0x64)($at)
    /* 1530C 8014EF04 1080013C */  lui        $at, %hi(monster + 0x41)
    /* 15310 8014EF08 21083000 */  addu       $at, $at, $s0
    /* 15314 8014EF0C D5532380 */  lb         $v1, %lo(monster + 0x41)($at)
    /* 15318 8014EF10 2A004290 */  lbu        $v0, 0x2A($v0)
    /* 1531C 8014EF14 00000000 */  nop
    /* 15320 8014EF18 06006214 */  bne        $v1, $v0, .L8014EF34
    /* 15324 8014EF1C 00000000 */   nop
    /* 15328 8014EF20 4AF5000C */  jal        PlayEffect__Fii
    /* 1532C 8014EF24 03000524 */   addiu     $a1, $zero, 0x3
    /* 15330 8014EF28 1080013C */  lui        $at, %hi(monster + 0x41)
    /* 15334 8014EF2C 21083000 */  addu       $at, $at, $s0
    /* 15338 8014EF30 D5532380 */  lb         $v1, %lo(monster + 0x41)($at)
  .L8014EF34:
    /* 1533C 8014EF34 1080013C */  lui        $at, %hi(monster + 0x40)
    /* 15340 8014EF38 21083000 */  addu       $at, $at, $s0
    /* 15344 8014EF3C D4532280 */  lb         $v0, %lo(monster + 0x40)($at)
    /* 15348 8014EF40 00000000 */  nop
    /* 1534C 8014EF44 07006214 */  bne        $v1, $v0, .L8014EF64
    /* 15350 8014EF48 21100000 */   addu      $v0, $zero, $zero
    /* 15354 8014EF4C 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 15358 8014EF50 21083000 */  addu       $at, $at, $s0
    /* 1535C 8014EF54 D0532580 */  lb         $a1, %lo(monster + 0x3C)($at)
    /* 15360 8014EF58 9CFF010C */  jal        M_StartStand__Fii
    /* 15364 8014EF5C 21202002 */   addu      $a0, $s1, $zero
    /* 15368 8014EF60 01000224 */  addiu      $v0, $zero, 0x1
  .L8014EF64:
    /* 1536C 8014EF64 1800BF8F */  lw         $ra, 0x18($sp)
    /* 15370 8014EF68 1400B18F */  lw         $s1, 0x14($sp)
    /* 15374 8014EF6C 1000B08F */  lw         $s0, 0x10($sp)
    /* 15378 8014EF70 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1537C 8014EF74 0800E003 */  jr         $ra
    /* 15380 8014EF78 00000000 */   nop
endlabel M_DoSpStand__Fi
