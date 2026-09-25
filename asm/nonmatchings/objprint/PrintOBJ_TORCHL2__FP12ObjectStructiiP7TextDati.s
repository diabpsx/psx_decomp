.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintOBJ_TORCHL2__FP12ObjectStructiiP7TextDati, 0x8C

glabel PrintOBJ_TORCHL2__FP12ObjectStructiiP7TextDati
    /* 6E4A0 8007E4A0 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 6E4A4 8007E4A4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 6E4A8 8007E4A8 2188A000 */  addu       $s1, $a1, $zero
    /* 6E4AC 8007E4AC 1800B2AF */  sw         $s2, 0x18($sp)
    /* 6E4B0 8007E4B0 2190C000 */  addu       $s2, $a2, $zero
    /* 6E4B4 8007E4B4 21202002 */  addu       $a0, $s1, $zero
    /* 6E4B8 8007E4B8 21284002 */  addu       $a1, $s2, $zero
    /* 6E4BC 8007E4BC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 6E4C0 8007E4C0 3000B08F */  lw         $s0, 0x30($sp)
    /* 6E4C4 8007E4C4 07000290 */  lbu        $v0, 0x7($zero)
    /* 6E4C8 8007E4C8 21300000 */  addu       $a2, $zero, $zero
    /* 6E4CC 8007E4CC 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 6E4D0 8007E4D0 07001026 */  addiu      $s0, $s0, 0x7
    /* 6E4D4 8007E4D4 02004234 */  ori        $v0, $v0, 0x2
    /* 6E4D8 8007E4D8 FE004230 */  andi       $v0, $v0, 0xFE
    /* 6E4DC 8007E4DC 070002A0 */  sb         $v0, 0x7($zero)
    /* 6E4E0 8007E4E0 C1F8010C */  jal        PrintTorchStick__Fiiii
    /* 6E4E4 8007E4E4 21380002 */   addu      $a3, $s0, $zero
    /* 6E4E8 8007E4E8 08003126 */  addiu      $s1, $s1, 0x8
    /* 6E4EC 8007E4EC 21202002 */  addu       $a0, $s1, $zero
    /* 6E4F0 8007E4F0 DEFF4526 */  addiu      $a1, $s2, -0x22
    /* 6E4F4 8007E4F4 74F7010C */  jal        PrintOBJ_FIRE__Fiii
    /* 6E4F8 8007E4F8 21300002 */   addu      $a2, $s0, $zero
    /* 6E4FC 8007E4FC 21202002 */  addu       $a0, $s1, $zero
    /* 6E500 8007E500 E2FF4526 */  addiu      $a1, $s2, -0x1E
    /* 6E504 8007E504 71F8010C */  jal        DrawLightSpark__Fiii
    /* 6E508 8007E508 21300002 */   addu      $a2, $s0, $zero
    /* 6E50C 8007E50C 21100000 */  addu       $v0, $zero, $zero
    /* 6E510 8007E510 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 6E514 8007E514 1800B28F */  lw         $s2, 0x18($sp)
    /* 6E518 8007E518 1400B18F */  lw         $s1, 0x14($sp)
    /* 6E51C 8007E51C 1000B08F */  lw         $s0, 0x10($sp)
    /* 6E520 8007E520 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 6E524 8007E524 0800E003 */  jr         $ra
    /* 6E528 8007E528 00000000 */   nop
endlabel PrintOBJ_TORCHL2__FP12ObjectStructiiP7TextDati
