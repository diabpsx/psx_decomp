.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FuncGUARDIAN__FP13MissileStructiii, 0x124

glabel FuncGUARDIAN__FP13MissileStructiii
    /* 6C4A0 8007C4A0 B0FFBD27 */  addiu      $sp, $sp, -0x50
    /* 6C4A4 8007C4A4 3800B0AF */  sw         $s0, 0x38($sp)
    /* 6C4A8 8007C4A8 21808000 */  addu       $s0, $a0, $zero
    /* 6C4AC 8007C4AC 3C00B1AF */  sw         $s1, 0x3C($sp)
    /* 6C4B0 8007C4B0 2188A000 */  addu       $s1, $a1, $zero
    /* 6C4B4 8007C4B4 4000B2AF */  sw         $s2, 0x40($sp)
    /* 6C4B8 8007C4B8 2190C000 */  addu       $s2, $a2, $zero
    /* 6C4BC 8007C4BC 4800BFAF */  sw         $ra, 0x48($sp)
    /* 6C4C0 8007C4C0 4400B3AF */  sw         $s3, 0x44($sp)
    /* 6C4C4 8007C4C4 3F000282 */  lb         $v0, 0x3F($s0)
    /* 6C4C8 8007C4C8 00000000 */  nop
    /* 6C4CC 8007C4CC 07004014 */  bnez       $v0, .L8007C4EC
    /* 6C4D0 8007C4D0 2198E000 */   addu      $s3, $a3, $zero
    /* 6C4D4 8007C4D4 47000382 */  lb         $v1, 0x47($s0)
    /* 6C4D8 8007C4D8 0F000224 */  addiu      $v0, $zero, 0xF
    /* 6C4DC 8007C4DC 05006214 */  bne        $v1, $v0, .L8007C4F4
    /* 6C4E0 8007C4E0 02000224 */   addiu     $v0, $zero, 0x2
    /* 6C4E4 8007C4E4 0E000224 */  addiu      $v0, $zero, 0xE
    /* 6C4E8 8007C4E8 470002A2 */  sb         $v0, 0x47($s0)
  .L8007C4EC:
    /* 6C4EC 8007C4EC 47000382 */  lb         $v1, 0x47($s0)
    /* 6C4F0 8007C4F0 02000224 */  addiu      $v0, $zero, 0x2
  .L8007C4F4:
    /* 6C4F4 8007C4F4 1A006214 */  bne        $v1, $v0, .L8007C560
    /* 6C4F8 8007C4F8 21202002 */   addu      $a0, $s1, $zero
    /* 6C4FC 8007C4FC 3F000282 */  lb         $v0, 0x3F($s0)
    /* 6C500 8007C500 00000000 */  nop
    /* 6C504 8007C504 17004014 */  bnez       $v0, .L8007C564
    /* 6C508 8007C508 21284002 */   addu      $a1, $s2, $zero
    /* 6C50C 8007C50C FEFF2426 */  addiu      $a0, $s1, -0x2
    /* 6C510 8007C510 02004526 */  addiu      $a1, $s2, 0x2
    /* 6C514 8007C514 F0000624 */  addiu      $a2, $zero, 0xF0
    /* 6C518 8007C518 F0000724 */  addiu      $a3, $zero, 0xF0
    /* 6C51C 8007C51C F0000224 */  addiu      $v0, $zero, 0xF0
    /* 6C520 8007C520 1000A2AF */  sw         $v0, 0x10($sp)
    /* 6C524 8007C524 18000224 */  addiu      $v0, $zero, 0x18
    /* 6C528 8007C528 1400A2AF */  sw         $v0, 0x14($sp)
    /* 6C52C 8007C52C C0000224 */  addiu      $v0, $zero, 0xC0
    /* 6C530 8007C530 1800A2AF */  sw         $v0, 0x18($sp)
    /* 6C534 8007C534 10000224 */  addiu      $v0, $zero, 0x10
    /* 6C538 8007C538 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 6C53C 8007C53C 01000224 */  addiu      $v0, $zero, 0x1
    /* 6C540 8007C540 2000A2AF */  sw         $v0, 0x20($sp)
    /* 6C544 8007C544 2800A2AF */  sw         $v0, 0x28($sp)
    /* 6C548 8007C548 08000224 */  addiu      $v0, $zero, 0x8
    /* 6C54C 8007C54C 2400B3AF */  sw         $s3, 0x24($sp)
    /* 6C550 8007C550 2C00A0AF */  sw         $zero, 0x2C($sp)
    /* 6C554 8007C554 919A020C */  jal        DrawSpinner__FiiUcUcUciiibiT8T8Uc
    /* 6C558 8007C558 3000A2AF */   sw        $v0, 0x30($sp)
    /* 6C55C 8007C55C 21202002 */  addu       $a0, $s1, $zero
  .L8007C560:
    /* 6C560 8007C560 21284002 */  addu       $a1, $s2, $zero
  .L8007C564:
    /* 6C564 8007C564 21306002 */  addu       $a2, $s3, $zero
    /* 6C568 8007C568 47000282 */  lb         $v0, 0x47($s0)
    /* 6C56C 8007C56C 03000724 */  addiu      $a3, $zero, 0x3
    /* 6C570 8007C570 1400A0AF */  sw         $zero, 0x14($sp)
    /* 6C574 8007C574 1000A2AF */  sw         $v0, 0x10($sp)
    /* 6C578 8007C578 3F000382 */  lb         $v1, 0x3F($s0)
    /* 6C57C 8007C57C 80000224 */  addiu      $v0, $zero, 0x80
    /* 6C580 8007C580 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 6C584 8007C584 2000A0AF */  sw         $zero, 0x20($sp)
    /* 6C588 8007C588 2400A0AF */  sw         $zero, 0x24($sp)
    /* 6C58C 8007C58C 2800A2AF */  sw         $v0, 0x28($sp)
    /* 6C590 8007C590 2C00A2AF */  sw         $v0, 0x2C($sp)
    /* 6C594 8007C594 3000A2AF */  sw         $v0, 0x30($sp)
    /* 6C598 8007C598 3400A0AF */  sw         $zero, 0x34($sp)
    /* 6C59C 8007C59C 0DEF010C */  jal        TempPrintMissile__FiiiiiiiiccUcUcUcc
    /* 6C5A0 8007C5A0 1800A3AF */   sw        $v1, 0x18($sp)
    /* 6C5A4 8007C5A4 4800BF8F */  lw         $ra, 0x48($sp)
    /* 6C5A8 8007C5A8 4400B38F */  lw         $s3, 0x44($sp)
    /* 6C5AC 8007C5AC 4000B28F */  lw         $s2, 0x40($sp)
    /* 6C5B0 8007C5B0 3C00B18F */  lw         $s1, 0x3C($sp)
    /* 6C5B4 8007C5B4 3800B08F */  lw         $s0, 0x38($sp)
    /* 6C5B8 8007C5B8 5000BD27 */  addiu      $sp, $sp, 0x50
    /* 6C5BC 8007C5BC 0800E003 */  jr         $ra
    /* 6C5C0 8007C5C0 00000000 */   nop
endlabel FuncGUARDIAN__FP13MissileStructiii
