.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintOBJ_TORCHL__FP12ObjectStructiiP7TextDati, 0x84

glabel PrintOBJ_TORCHL__FP12ObjectStructiiP7TextDati
    /* 6E398 8007E398 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 6E39C 8007E39C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 6E3A0 8007E3A0 2188A000 */  addu       $s1, $a1, $zero
    /* 6E3A4 8007E3A4 1800B2AF */  sw         $s2, 0x18($sp)
    /* 6E3A8 8007E3A8 2190C000 */  addu       $s2, $a2, $zero
    /* 6E3AC 8007E3AC 21202002 */  addu       $a0, $s1, $zero
    /* 6E3B0 8007E3B0 07000290 */  lbu        $v0, 0x7($zero)
    /* 6E3B4 8007E3B4 21284002 */  addu       $a1, $s2, $zero
    /* 6E3B8 8007E3B8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 6E3BC 8007E3BC 3000B08F */  lw         $s0, 0x30($sp)
    /* 6E3C0 8007E3C0 03000624 */  addiu      $a2, $zero, 0x3
    /* 6E3C4 8007E3C4 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 6E3C8 8007E3C8 02004234 */  ori        $v0, $v0, 0x2
    /* 6E3CC 8007E3CC FE004230 */  andi       $v0, $v0, 0xFE
    /* 6E3D0 8007E3D0 070002A0 */  sb         $v0, 0x7($zero)
    /* 6E3D4 8007E3D4 C1F8010C */  jal        PrintTorchStick__Fiiii
    /* 6E3D8 8007E3D8 21380002 */   addu      $a3, $s0, $zero
    /* 6E3DC 8007E3DC FAFF2426 */  addiu      $a0, $s1, -0x6
    /* 6E3E0 8007E3E0 DEFF4526 */  addiu      $a1, $s2, -0x22
    /* 6E3E4 8007E3E4 74F7010C */  jal        PrintOBJ_FIRE__Fiii
    /* 6E3E8 8007E3E8 21300002 */   addu      $a2, $s0, $zero
    /* 6E3EC 8007E3EC FBFF2426 */  addiu      $a0, $s1, -0x5
    /* 6E3F0 8007E3F0 DBFF4526 */  addiu      $a1, $s2, -0x25
    /* 6E3F4 8007E3F4 71F8010C */  jal        DrawLightSpark__Fiii
    /* 6E3F8 8007E3F8 21300002 */   addu      $a2, $s0, $zero
    /* 6E3FC 8007E3FC 21100000 */  addu       $v0, $zero, $zero
    /* 6E400 8007E400 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 6E404 8007E404 1800B28F */  lw         $s2, 0x18($sp)
    /* 6E408 8007E408 1400B18F */  lw         $s1, 0x14($sp)
    /* 6E40C 8007E40C 1000B08F */  lw         $s0, 0x10($sp)
    /* 6E410 8007E410 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 6E414 8007E414 0800E003 */  jr         $ra
    /* 6E418 8007E418 00000000 */   nop
endlabel PrintOBJ_TORCHL__FP12ObjectStructiiP7TextDati
