.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DEC_AddAsDecRequestor__FP7TextDat, 0x7C

glabel DEC_AddAsDecRequestor__FP7TextDat
    /* 94384 800A4384 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 94388 800A4388 1800B2AF */  sw         $s2, 0x18($sp)
    /* 9438C 800A438C 21908000 */  addu       $s2, $a0, $zero
    /* 94390 800A4390 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 94394 800A4394 1400B1AF */  sw         $s1, 0x14($sp)
    /* 94398 800A4398 2D91020C */  jal        FindThisTd__FP7TextDat
    /* 9439C 800A439C 1000B0AF */   sw        $s0, 0x10($sp)
    /* 943A0 800A43A0 FFFF1124 */  addiu      $s1, $zero, -0x1
    /* 943A4 800A43A4 0F005114 */  bne        $v0, $s1, .L800A43E4
    /* 943A8 800A43A8 00000000 */   nop
    /* 943AC 800A43AC 3B91020C */  jal        FindEmptyIndex__Fv
    /* 943B0 800A43B0 00000000 */   nop
    /* 943B4 800A43B4 21804000 */  addu       $s0, $v0, $zero
    /* 943B8 800A43B8 07001116 */  bne        $s0, $s1, .L800A43D8
    /* 943BC 800A43BC 80101000 */   sll       $v0, $s0, 2
    /* 943C0 800A43C0 21200000 */  addu       $a0, $zero, $zero
    /* 943C4 800A43C4 1180053C */  lui        $a1, %hi(D_80110C48)
    /* 943C8 800A43C8 480CA524 */  addiu      $a1, $a1, %lo(D_80110C48)
    /* 943CC 800A43CC A583000C */  jal        DBG_Error
    /* 943D0 800A43D0 4F000624 */   addiu     $a2, $zero, 0x4F
    /* 943D4 800A43D4 80101000 */  sll        $v0, $s0, 2
  .L800A43D8:
    /* 943D8 800A43D8 1280013C */  lui        $at, %hi(D_8011D050)
    /* 943DC 800A43DC 21082200 */  addu       $at, $at, $v0
    /* 943E0 800A43E0 50D032AC */  sw         $s2, %lo(D_8011D050)($at)
  .L800A43E4:
    /* 943E4 800A43E4 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 943E8 800A43E8 1800B28F */  lw         $s2, 0x18($sp)
    /* 943EC 800A43EC 1400B18F */  lw         $s1, 0x14($sp)
    /* 943F0 800A43F0 1000B08F */  lw         $s0, 0x10($sp)
    /* 943F4 800A43F4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 943F8 800A43F8 0800E003 */  jr         $ra
    /* 943FC 800A43FC 00000000 */   nop
endlabel DEC_AddAsDecRequestor__FP7TextDat
