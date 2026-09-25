.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RecreateSmithItem__Fiiii, 0xB0

glabel RecreateSmithItem__Fiiii
    /* 3A258 8004A258 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 3A25C 8004A25C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 3A260 8004A260 21808000 */  addu       $s0, $a0, $zero
    /* 3A264 8004A264 1400B1AF */  sw         $s1, 0x14($sp)
    /* 3A268 8004A268 2188C000 */  addu       $s1, $a2, $zero
    /* 3A26C 8004A26C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 3A270 8004A270 2190E000 */  addu       $s2, $a3, $zero
    /* 3A274 8004A274 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 3A278 8004A278 B3F6000C */  jal        SetRndSeed__Fl
    /* 3A27C 8004A27C 21204002 */   addu      $a0, $s2, $zero
    /* 3A280 8004A280 9B25010C */  jal        RndSmithItem__Fi
    /* 3A284 8004A284 21202002 */   addu      $a0, $s1, $zero
    /* 3A288 8004A288 21200002 */  addu       $a0, $s0, $zero
    /* 3A28C 8004A28C FFFF4524 */  addiu      $a1, $v0, -0x1
    /* 3A290 8004A290 A704010C */  jal        GetItemAttrs__Fiii
    /* 3A294 8004A294 21302002 */   addu      $a2, $s1, $zero
    /* 3A298 8004A298 C0101000 */  sll        $v0, $s0, 3
    /* 3A29C 8004A29C 23105000 */  subu       $v0, $v0, $s0
    /* 3A2A0 8004A2A0 80100200 */  sll        $v0, $v0, 2
    /* 3A2A4 8004A2A4 23105000 */  subu       $v0, $v0, $s0
    /* 3A2A8 8004A2A8 80100200 */  sll        $v0, $v0, 2
    /* 3A2AC 8004A2AC 01000324 */  addiu      $v1, $zero, 0x1
    /* 3A2B0 8004A2B0 0D80013C */  lui        $at, %hi(item + 0x69)
    /* 3A2B4 8004A2B4 21082200 */  addu       $at, $at, $v0
    /* 3A2B8 8004A2B8 BD1D23A0 */  sb         $v1, %lo(item + 0x69)($at)
    /* 3A2BC 8004A2BC 1280033C */  lui        $v1, %hi(FePlayerNo)
    /* 3A2C0 8004A2C0 78B3638C */  lw         $v1, %lo(FePlayerNo)($v1)
    /* 3A2C4 8004A2C4 00043136 */  ori        $s1, $s1, 0x400
    /* 3A2C8 8004A2C8 0D80013C */  lui        $at, %hi(item + 0x10)
    /* 3A2CC 8004A2CC 21082200 */  addu       $at, $at, $v0
    /* 3A2D0 8004A2D0 641D32AC */  sw         $s2, %lo(item + 0x10)($at)
    /* 3A2D4 8004A2D4 0D80013C */  lui        $at, %hi(item + 0x24)
    /* 3A2D8 8004A2D8 21082200 */  addu       $at, $at, $v0
    /* 3A2DC 8004A2DC 781D31A4 */  sh         $s1, %lo(item + 0x24)($at)
    /* 3A2E0 8004A2E0 0D80013C */  lui        $at, %hi(item + 0x65)
    /* 3A2E4 8004A2E4 21082200 */  addu       $at, $at, $v0
    /* 3A2E8 8004A2E8 B91D23A0 */  sb         $v1, %lo(item + 0x65)($at)
    /* 3A2EC 8004A2EC 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 3A2F0 8004A2F0 1800B28F */  lw         $s2, 0x18($sp)
    /* 3A2F4 8004A2F4 1400B18F */  lw         $s1, 0x14($sp)
    /* 3A2F8 8004A2F8 1000B08F */  lw         $s0, 0x10($sp)
    /* 3A2FC 8004A2FC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 3A300 8004A300 0800E003 */  jr         $ra
    /* 3A304 8004A304 00000000 */   nop
endlabel RecreateSmithItem__Fiiii
