.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FindThisTd__FP7TextDat, 0x38

glabel FindThisTd__FP7TextDat
    /* 944B4 800A44B4 21180000 */  addu       $v1, $zero, $zero
    /* 944B8 800A44B8 1280053C */  lui        $a1, %hi(D_8011D050)
    /* 944BC 800A44BC 50D0A524 */  addiu      $a1, $a1, %lo(D_8011D050)
  .L800A44C0:
    /* 944C0 800A44C0 0000A28C */  lw         $v0, 0x0($a1)
    /* 944C4 800A44C4 00000000 */  nop
    /* 944C8 800A44C8 06004410 */  beq        $v0, $a0, .L800A44E4
    /* 944CC 800A44CC 21106000 */   addu      $v0, $v1, $zero
    /* 944D0 800A44D0 01006324 */  addiu      $v1, $v1, 0x1
    /* 944D4 800A44D4 0A006228 */  slti       $v0, $v1, 0xA
    /* 944D8 800A44D8 F9FF4014 */  bnez       $v0, .L800A44C0
    /* 944DC 800A44DC 0400A524 */   addiu     $a1, $a1, 0x4
    /* 944E0 800A44E0 FFFF0224 */  addiu      $v0, $zero, -0x1
  .L800A44E4:
    /* 944E4 800A44E4 0800E003 */  jr         $ra
    /* 944E8 800A44E8 00000000 */   nop
endlabel FindThisTd__FP7TextDat
