.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FuncWEAPEXP__FP13MissileStructiii, 0x9C

glabel FuncWEAPEXP__FP13MissileStructiii
    /* 6D448 8007D448 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 6D44C 8007D44C 21408000 */  addu       $t0, $a0, $zero
    /* 6D450 8007D450 3800BFAF */  sw         $ra, 0x38($sp)
    /* 6D454 8007D454 28000285 */  lh         $v0, 0x28($t0)
    /* 6D458 8007D458 2A000385 */  lh         $v1, 0x2A($t0)
    /* 6D45C 8007D45C 2128A200 */  addu       $a1, $a1, $v0
    /* 6D460 8007D460 2130C300 */  addu       $a2, $a2, $v1
    /* 6D464 8007D464 20000385 */  lh         $v1, 0x20($t0)
    /* 6D468 8007D468 01000224 */  addiu      $v0, $zero, 0x1
    /* 6D46C 8007D46C 06006214 */  bne        $v1, $v0, .L8007D488
    /* 6D470 8007D470 0200E224 */   addiu     $v0, $a3, 0x2
    /* 6D474 8007D474 1000A2AF */  sw         $v0, 0x10($sp)
    /* 6D478 8007D478 FA7F020C */  jal        ParticleExp__FP13MissileStructiiii
    /* 6D47C 8007D47C FF00073C */   lui       $a3, (0xFF0000 >> 16)
    /* 6D480 8007D480 35F50108 */  j          .L8007D4D4
    /* 6D484 8007D484 00000000 */   nop
  .L8007D488:
    /* 6D488 8007D488 2120A000 */  addu       $a0, $a1, $zero
    /* 6D48C 8007D48C 2128C000 */  addu       $a1, $a2, $zero
    /* 6D490 8007D490 0200E624 */  addiu      $a2, $a3, 0x2
    /* 6D494 8007D494 47000281 */  lb         $v0, 0x47($t0)
    /* 6D498 8007D498 08000724 */  addiu      $a3, $zero, 0x8
    /* 6D49C 8007D49C 1000A2AF */  sw         $v0, 0x10($sp)
    /* 6D4A0 8007D4A0 3F000381 */  lb         $v1, 0x3F($t0)
    /* 6D4A4 8007D4A4 12000224 */  addiu      $v0, $zero, 0x12
    /* 6D4A8 8007D4A8 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 6D4AC 8007D4AC 80000224 */  addiu      $v0, $zero, 0x80
    /* 6D4B0 8007D4B0 1800A0AF */  sw         $zero, 0x18($sp)
    /* 6D4B4 8007D4B4 2000A0AF */  sw         $zero, 0x20($sp)
    /* 6D4B8 8007D4B8 2400A0AF */  sw         $zero, 0x24($sp)
    /* 6D4BC 8007D4BC 2800A2AF */  sw         $v0, 0x28($sp)
    /* 6D4C0 8007D4C0 2C00A2AF */  sw         $v0, 0x2C($sp)
    /* 6D4C4 8007D4C4 3000A2AF */  sw         $v0, 0x30($sp)
    /* 6D4C8 8007D4C8 3400A0AF */  sw         $zero, 0x34($sp)
    /* 6D4CC 8007D4CC 0DEF010C */  jal        TempPrintMissile__FiiiiiiiiccUcUcUcc
    /* 6D4D0 8007D4D0 1400A3AF */   sw        $v1, 0x14($sp)
  .L8007D4D4:
    /* 6D4D4 8007D4D4 3800BF8F */  lw         $ra, 0x38($sp)
    /* 6D4D8 8007D4D8 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 6D4DC 8007D4DC 0800E003 */  jr         $ra
    /* 6D4E0 8007D4E0 00000000 */   nop
endlabel FuncWEAPEXP__FP13MissileStructiii
