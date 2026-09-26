.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SpecialThemeFit__Fii, 0x1DC

glabel SpecialThemeFit__Fii
    /* 228E8 8015C4E0 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 228EC 8015C4E4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 228F0 8015C4E8 21888000 */  addu       $s1, $a0, $zero
    /* 228F4 8015C4EC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 228F8 8015C4F0 2180A000 */  addu       $s0, $a1, $zero
    /* 228FC 8015C4F4 1800BFAF */  sw         $ra, 0x18($sp)
    /* 22900 8015C4F8 0571050C */  jal        CheckThemeReqs__Fi
    /* 22904 8015C4FC 21200002 */   addu      $a0, $s0, $zero
    /* 22908 8015C500 21184000 */  addu       $v1, $v0, $zero
    /* 2290C 8015C504 FFFF1026 */  addiu      $s0, $s0, -0x1
    /* 22910 8015C508 1000022E */  sltiu      $v0, $s0, 0x10
    /* 22914 8015C50C 64004010 */  beqz       $v0, .L8015C6A0
    /* 22918 8015C510 80101000 */   sll       $v0, $s0, 2
    /* 2291C 8015C514 1280013C */  lui        $at, %hi(jtbl_80119A84)
    /* 22920 8015C518 21082200 */  addu       $at, $at, $v0
    /* 22924 8015C51C 849A228C */  lw         $v0, %lo(jtbl_80119A84)($at)
    /* 22928 8015C520 00000000 */  nop
    /* 2292C 8015C524 08004000 */  jr         $v0
    /* 22930 8015C528 00000000 */   nop
    /* 22934 8015C52C FF006230 */  andi       $v0, $v1, 0xFF
    /* 22938 8015C530 5C004010 */  beqz       $v0, .L8015C6A4
    /* 2293C 8015C534 00000000 */   nop
    /* 22940 8015C538 036F050C */  jal        TFit_Shrine__Fi
    /* 22944 8015C53C 21202002 */   addu      $a0, $s1, $zero
    /* 22948 8015C540 A8710508 */  j          .L8015C6A0
    /* 2294C 8015C544 21184000 */   addu      $v1, $v0, $zero
    /* 22950 8015C548 FF006230 */  andi       $v0, $v1, 0xFF
    /* 22954 8015C54C 55004010 */  beqz       $v0, .L8015C6A4
    /* 22958 8015C550 00000000 */   nop
    /* 2295C 8015C554 3070050C */  jal        TFit_SkelRoom__Fi
    /* 22960 8015C558 21202002 */   addu      $a0, $s1, $zero
    /* 22964 8015C55C A8710508 */  j          .L8015C6A0
    /* 22968 8015C560 21184000 */   addu      $v1, $v0, $zero
    /* 2296C 8015C564 FF006230 */  andi       $v0, $v1, 0xFF
    /* 22970 8015C568 4E004010 */  beqz       $v0, .L8015C6A4
    /* 22974 8015C56C 00000000 */   nop
    /* 22978 8015C570 BF6F050C */  jal        TFit_Obj5__Fi
    /* 2297C 8015C574 21202002 */   addu      $a0, $s1, $zero
    /* 22980 8015C578 21184000 */  addu       $v1, $v0, $zero
    /* 22984 8015C57C FF006230 */  andi       $v0, $v1, 0xFF
    /* 22988 8015C580 48004010 */  beqz       $v0, .L8015C6A4
    /* 2298C 8015C584 00000000 */   nop
    /* 22990 8015C588 241A80A3 */  sb         $zero, %gp_rel(bFountainFlag)($gp)
    /* 22994 8015C58C A9710508 */  j          .L8015C6A4
    /* 22998 8015C590 00000000 */   nop
    /* 2299C 8015C594 FF006230 */  andi       $v0, $v1, 0xFF
    /* 229A0 8015C598 42004010 */  beqz       $v0, .L8015C6A4
    /* 229A4 8015C59C 00000000 */   nop
    /* 229A8 8015C5A0 BF6F050C */  jal        TFit_Obj5__Fi
    /* 229AC 8015C5A4 21202002 */   addu      $a0, $s1, $zero
    /* 229B0 8015C5A8 21184000 */  addu       $v1, $v0, $zero
    /* 229B4 8015C5AC FF006230 */  andi       $v0, $v1, 0xFF
    /* 229B8 8015C5B0 3C004010 */  beqz       $v0, .L8015C6A4
    /* 229BC 8015C5B4 00000000 */   nop
    /* 229C0 8015C5B8 271A80A3 */  sb         $zero, %gp_rel(pFountainFlag)($gp)
    /* 229C4 8015C5BC A9710508 */  j          .L8015C6A4
    /* 229C8 8015C5C0 00000000 */   nop
    /* 229CC 8015C5C4 FF006230 */  andi       $v0, $v1, 0xFF
    /* 229D0 8015C5C8 36004010 */  beqz       $v0, .L8015C6A4
    /* 229D4 8015C5CC 00000000 */   nop
    /* 229D8 8015C5D0 BF6F050C */  jal        TFit_Obj5__Fi
    /* 229DC 8015C5D4 21202002 */   addu      $a0, $s1, $zero
    /* 229E0 8015C5D8 21184000 */  addu       $v1, $v0, $zero
    /* 229E4 8015C5DC FF006230 */  andi       $v0, $v1, 0xFF
    /* 229E8 8015C5E0 30004010 */  beqz       $v0, .L8015C6A4
    /* 229EC 8015C5E4 00000000 */   nop
    /* 229F0 8015C5E8 261A80A3 */  sb         $zero, %gp_rel(mFountainFlag)($gp)
    /* 229F4 8015C5EC A9710508 */  j          .L8015C6A4
    /* 229F8 8015C5F0 00000000 */   nop
    /* 229FC 8015C5F4 FF006230 */  andi       $v0, $v1, 0xFF
    /* 22A00 8015C5F8 2A004010 */  beqz       $v0, .L8015C6A4
    /* 22A04 8015C5FC 00000000 */   nop
    /* 22A08 8015C600 BF6F050C */  jal        TFit_Obj5__Fi
    /* 22A0C 8015C604 21202002 */   addu      $a0, $s1, $zero
    /* 22A10 8015C608 21184000 */  addu       $v1, $v0, $zero
    /* 22A14 8015C60C FF006230 */  andi       $v0, $v1, 0xFF
    /* 22A18 8015C610 24004010 */  beqz       $v0, .L8015C6A4
    /* 22A1C 8015C614 00000000 */   nop
    /* 22A20 8015C618 281A80A3 */  sb         $zero, %gp_rel(tFountainFlag)($gp)
    /* 22A24 8015C61C A9710508 */  j          .L8015C6A4
    /* 22A28 8015C620 00000000 */   nop
    /* 22A2C 8015C624 FF006230 */  andi       $v0, $v1, 0xFF
    /* 22A30 8015C628 1E004010 */  beqz       $v0, .L8015C6A4
    /* 22A34 8015C62C 00000000 */   nop
    /* 22A38 8015C630 BF6F050C */  jal        TFit_Obj5__Fi
    /* 22A3C 8015C634 21202002 */   addu      $a0, $s1, $zero
    /* 22A40 8015C638 21184000 */  addu       $v1, $v0, $zero
    /* 22A44 8015C63C FF006230 */  andi       $v0, $v1, 0xFF
    /* 22A48 8015C640 18004010 */  beqz       $v0, .L8015C6A4
    /* 22A4C 8015C644 00000000 */   nop
    /* 22A50 8015C648 251A80A3 */  sb         $zero, %gp_rel(cauldronFlag)($gp)
    /* 22A54 8015C64C A9710508 */  j          .L8015C6A4
    /* 22A58 8015C650 00000000 */   nop
    /* 22A5C 8015C654 FF006230 */  andi       $v0, $v1, 0xFF
    /* 22A60 8015C658 12004010 */  beqz       $v0, .L8015C6A4
    /* 22A64 8015C65C 00000000 */   nop
    /* 22A68 8015C660 5C70050C */  jal        TFit_GoatShrine__Fi
    /* 22A6C 8015C664 21202002 */   addu      $a0, $s1, $zero
    /* 22A70 8015C668 A8710508 */  j          .L8015C6A0
    /* 22A74 8015C66C 21184000 */   addu      $v1, $v0, $zero
    /* 22A78 8015C670 FF006230 */  andi       $v0, $v1, 0xFF
    /* 22A7C 8015C674 0B004010 */  beqz       $v0, .L8015C6A4
    /* 22A80 8015C678 00000000 */   nop
    /* 22A84 8015C67C D570050C */  jal        TFit_Obj3__Fi
    /* 22A88 8015C680 21202002 */   addu      $a0, $s1, $zero
    /* 22A8C 8015C684 A8710508 */  j          .L8015C6A0
    /* 22A90 8015C688 21184000 */   addu      $v1, $v0, $zero
    /* 22A94 8015C68C 291A8393 */  lbu        $v1, %gp_rel(treasureFlag)($gp)
    /* 22A98 8015C690 00000000 */  nop
    /* 22A9C 8015C694 03006010 */  beqz       $v1, .L8015C6A4
    /* 22AA0 8015C698 FF006230 */   andi      $v0, $v1, 0xFF
    /* 22AA4 8015C69C 291A80A3 */  sb         $zero, %gp_rel(treasureFlag)($gp)
  .L8015C6A0:
    /* 22AA8 8015C6A0 FF006230 */  andi       $v0, $v1, 0xFF
  .L8015C6A4:
    /* 22AAC 8015C6A4 1800BF8F */  lw         $ra, 0x18($sp)
    /* 22AB0 8015C6A8 1400B18F */  lw         $s1, 0x14($sp)
    /* 22AB4 8015C6AC 1000B08F */  lw         $s0, 0x10($sp)
    /* 22AB8 8015C6B0 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 22ABC 8015C6B4 0800E003 */  jr         $ra
    /* 22AC0 8015C6B8 00000000 */   nop
endlabel SpecialThemeFit__Fii
