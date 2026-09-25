.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintOBJ_L1LIGHT__FP12ObjectStructiiP7TextDati, 0x60

glabel PrintOBJ_L1LIGHT__FP12ObjectStructiiP7TextDati
    /* 6E2A4 8007E2A4 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 6E2A8 8007E2A8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 6E2AC 8007E2AC 2180A000 */  addu       $s0, $a1, $zero
    /* 6E2B0 8007E2B0 1800B2AF */  sw         $s2, 0x18($sp)
    /* 6E2B4 8007E2B4 2190C000 */  addu       $s2, $a2, $zero
    /* 6E2B8 8007E2B8 FEFF0426 */  addiu      $a0, $s0, -0x2
    /* 6E2BC 8007E2BC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 6E2C0 8007E2C0 3000B18F */  lw         $s1, 0x30($sp)
    /* 6E2C4 8007E2C4 D7FF4526 */  addiu      $a1, $s2, -0x29
    /* 6E2C8 8007E2C8 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 6E2CC 8007E2CC 74F7010C */  jal        PrintOBJ_FIRE__Fiii
    /* 6E2D0 8007E2D0 0A002626 */   addiu     $a2, $s1, 0xA
    /* 6E2D4 8007E2D4 FFFF0426 */  addiu      $a0, $s0, -0x1
    /* 6E2D8 8007E2D8 D8FF4526 */  addiu      $a1, $s2, -0x28
    /* 6E2DC 8007E2DC 71F8010C */  jal        DrawLightSpark__Fiii
    /* 6E2E0 8007E2E0 0C002626 */   addiu     $a2, $s1, 0xC
    /* 6E2E4 8007E2E4 21100000 */  addu       $v0, $zero, $zero
    /* 6E2E8 8007E2E8 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 6E2EC 8007E2EC 1800B28F */  lw         $s2, 0x18($sp)
    /* 6E2F0 8007E2F0 1400B18F */  lw         $s1, 0x14($sp)
    /* 6E2F4 8007E2F4 1000B08F */  lw         $s0, 0x10($sp)
    /* 6E2F8 8007E2F8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 6E2FC 8007E2FC 0800E003 */  jr         $ra
    /* 6E300 8007E300 00000000 */   nop
endlabel PrintOBJ_L1LIGHT__FP12ObjectStructiiP7TextDati
