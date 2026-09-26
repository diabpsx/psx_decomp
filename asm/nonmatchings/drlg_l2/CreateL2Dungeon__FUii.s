.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CreateL2Dungeon__FUii, 0x158

glabel CreateL2Dungeon__FUii
    /* E954 8014854C D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* E958 80148550 1280023C */  lui        $v0, %hi(currlevel)
    /* E95C 80148554 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* E960 80148558 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* E964 8014855C 2198A000 */  addu       $s3, $a1, $zero
    /* E968 80148560 1400B1AF */  sw         $s1, 0x14($sp)
    /* E96C 80148564 1080113C */  lui        $s1, %hi(nSxy)
    /* E970 80148568 E8263126 */  addiu      $s1, $s1, %lo(nSxy)
    /* E974 8014856C 2400BFAF */  sw         $ra, 0x24($sp)
    /* E978 80148570 2000B4AF */  sw         $s4, 0x20($sp)
    /* E97C 80148574 1800B2AF */  sw         $s2, 0x18($sp)
    /* E980 80148578 1000B0AF */  sw         $s0, 0x10($sp)
    /* E984 8014857C FCFF4224 */  addiu      $v0, $v0, -0x4
    /* E988 80148580 00810200 */  sll        $s0, $v0, 4
    /* E98C 80148584 21901102 */  addu       $s2, $s0, $s1
    /* E990 80148588 0000458E */  lw         $a1, 0x0($s2)
    /* E994 8014858C FFFF1424 */  addiu      $s4, $zero, -0x1
    /* E998 80148590 0B00B410 */  beq        $a1, $s4, .L801485C0
    /* E99C 80148594 21308000 */   addu      $a2, $a0, $zero
    /* E9A0 80148598 21103002 */  addu       $v0, $s1, $s0
    /* E9A4 8014859C 21183002 */  addu       $v1, $s1, $s0
    /* E9A8 801485A0 21203002 */  addu       $a0, $s1, $s0
    /* E9AC 801485A4 0400428C */  lw         $v0, 0x4($v0)
    /* E9B0 801485A8 0800638C */  lw         $v1, 0x8($v1)
    /* E9B4 801485AC 0C00848C */  lw         $a0, 0xC($a0)
    /* E9B8 801485B0 501785AF */  sw         $a1, %gp_rel(nSx1)($gp)
    /* E9BC 801485B4 541782AF */  sw         $v0, %gp_rel(nSy1)($gp)
    /* E9C0 801485B8 581783AF */  sw         $v1, %gp_rel(nSx2)($gp)
    /* E9C4 801485BC 5C1784AF */  sw         $a0, %gp_rel(nSy2)($gp)
  .L801485C0:
    /* E9C8 801485C0 1280013C */  lui        $at, %hi(pSetPiece)
    /* E9CC 801485C4 DCC020AC */  sw         $zero, %lo(pSetPiece)($at)
    /* E9D0 801485C8 B3F6000C */  jal        SetRndSeed__Fl
    /* E9D4 801485CC 2120C000 */   addu      $a0, $a2, $zero
    /* E9D8 801485D0 10000224 */  addiu      $v0, $zero, 0x10
    /* E9DC 801485D4 1280013C */  lui        $at, %hi(dminx)
    /* E9E0 801485D8 F8C022AC */  sw         $v0, %lo(dminx)($at)
    /* E9E4 801485DC 1280013C */  lui        $at, %hi(dminy)
    /* E9E8 801485E0 FCC022AC */  sw         $v0, %lo(dminy)($at)
    /* E9EC 801485E4 50000224 */  addiu      $v0, $zero, 0x50
    /* E9F0 801485E8 1280013C */  lui        $at, %hi(dmaxx)
    /* E9F4 801485EC 00C122AC */  sw         $v0, %lo(dmaxx)($at)
    /* E9F8 801485F0 1280013C */  lui        $at, %hi(dmaxy)
    /* E9FC 801485F4 04C122AC */  sw         $v0, %lo(dmaxy)($at)
    /* EA00 801485F8 1C68050C */  jal        DRLG_InitTrans__Fv
    /* EA04 801485FC 00000000 */   nop
    /* EA08 80148600 A968050C */  jal        DRLG_InitSetPC__Fv
    /* EA0C 80148604 00000000 */   nop
    /* EA10 80148608 A30F050C */  jal        DRLG_LoadL2SP__Fv
    /* EA14 8014860C 00000000 */   nop
    /* EA18 80148610 B81D050C */  jal        DRLG_L2__Fi
    /* EA1C 80148614 21206002 */   addu      $a0, $s3, $zero
    /* EA20 80148618 7C19050C */  jal        DRLG_L2Pass3__Fv
    /* EA24 8014861C 00000000 */   nop
    /* EA28 80148620 CB0F050C */  jal        DRLG_FreeL2SP__Fv
    /* EA2C 80148624 00000000 */   nop
    /* EA30 80148628 4D20050C */  jal        DRLG_InitL2Vals__Fv
    /* EA34 8014862C 00000000 */   nop
    /* EA38 80148630 AF68050C */  jal        DRLG_SetPC__Fv
    /* EA3C 80148634 00000000 */   nop
    /* EA40 80148638 0000428E */  lw         $v0, 0x0($s2)
    /* EA44 8014863C 00000000 */  nop
    /* EA48 80148640 0F005414 */  bne        $v0, $s4, .L80148680
    /* EA4C 80148644 00000000 */   nop
    /* EA50 80148648 5017828F */  lw         $v0, %gp_rel(nSx1)($gp)
    /* EA54 8014864C 5417838F */  lw         $v1, %gp_rel(nSy1)($gp)
    /* EA58 80148650 000042AE */  sw         $v0, 0x0($s2)
    /* EA5C 80148654 04002226 */  addiu      $v0, $s1, 0x4
    /* EA60 80148658 21100202 */  addu       $v0, $s0, $v0
    /* EA64 8014865C 000043AC */  sw         $v1, 0x0($v0)
    /* EA68 80148660 08002226 */  addiu      $v0, $s1, 0x8
    /* EA6C 80148664 5817838F */  lw         $v1, %gp_rel(nSx2)($gp)
    /* EA70 80148668 21100202 */  addu       $v0, $s0, $v0
    /* EA74 8014866C 000043AC */  sw         $v1, 0x0($v0)
    /* EA78 80148670 0C002226 */  addiu      $v0, $s1, 0xC
    /* EA7C 80148674 5C17838F */  lw         $v1, %gp_rel(nSy2)($gp)
    /* EA80 80148678 21100202 */  addu       $v0, $s0, $v0
    /* EA84 8014867C 000043AC */  sw         $v1, 0x0($v0)
  .L80148680:
    /* EA88 80148680 2400BF8F */  lw         $ra, 0x24($sp)
    /* EA8C 80148684 2000B48F */  lw         $s4, 0x20($sp)
    /* EA90 80148688 1C00B38F */  lw         $s3, 0x1C($sp)
    /* EA94 8014868C 1800B28F */  lw         $s2, 0x18($sp)
    /* EA98 80148690 1400B18F */  lw         $s1, 0x14($sp)
    /* EA9C 80148694 1000B08F */  lw         $s0, 0x10($sp)
    /* EAA0 80148698 2800BD27 */  addiu      $sp, $sp, 0x28
    /* EAA4 8014869C 0800E003 */  jr         $ra
    /* EAA8 801486A0 00000000 */   nop
endlabel CreateL2Dungeon__FUii
