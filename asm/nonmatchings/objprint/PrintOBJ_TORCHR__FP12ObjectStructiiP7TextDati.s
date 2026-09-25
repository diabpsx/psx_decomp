.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintOBJ_TORCHR__FP12ObjectStructiiP7TextDati, 0x84

glabel PrintOBJ_TORCHR__FP12ObjectStructiiP7TextDati
    /* 6E41C 8007E41C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 6E420 8007E420 1400B1AF */  sw         $s1, 0x14($sp)
    /* 6E424 8007E424 2188A000 */  addu       $s1, $a1, $zero
    /* 6E428 8007E428 1800B2AF */  sw         $s2, 0x18($sp)
    /* 6E42C 8007E42C 2190C000 */  addu       $s2, $a2, $zero
    /* 6E430 8007E430 21202002 */  addu       $a0, $s1, $zero
    /* 6E434 8007E434 07000290 */  lbu        $v0, 0x7($zero)
    /* 6E438 8007E438 21284002 */  addu       $a1, $s2, $zero
    /* 6E43C 8007E43C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 6E440 8007E440 3000B08F */  lw         $s0, 0x30($sp)
    /* 6E444 8007E444 02000624 */  addiu      $a2, $zero, 0x2
    /* 6E448 8007E448 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 6E44C 8007E44C 02004234 */  ori        $v0, $v0, 0x2
    /* 6E450 8007E450 FE004230 */  andi       $v0, $v0, 0xFE
    /* 6E454 8007E454 070002A0 */  sb         $v0, 0x7($zero)
    /* 6E458 8007E458 C1F8010C */  jal        PrintTorchStick__Fiiii
    /* 6E45C 8007E45C 21380002 */   addu      $a3, $s0, $zero
    /* 6E460 8007E460 FFFF2426 */  addiu      $a0, $s1, -0x1
    /* 6E464 8007E464 DCFF4526 */  addiu      $a1, $s2, -0x24
    /* 6E468 8007E468 74F7010C */  jal        PrintOBJ_FIRE__Fiii
    /* 6E46C 8007E46C 21300002 */   addu      $a2, $s0, $zero
    /* 6E470 8007E470 21202002 */  addu       $a0, $s1, $zero
    /* 6E474 8007E474 DBFF4526 */  addiu      $a1, $s2, -0x25
    /* 6E478 8007E478 71F8010C */  jal        DrawLightSpark__Fiii
    /* 6E47C 8007E47C 21300002 */   addu      $a2, $s0, $zero
    /* 6E480 8007E480 21100000 */  addu       $v0, $zero, $zero
    /* 6E484 8007E484 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 6E488 8007E488 1800B28F */  lw         $s2, 0x18($sp)
    /* 6E48C 8007E48C 1400B18F */  lw         $s1, 0x14($sp)
    /* 6E490 8007E490 1000B08F */  lw         $s0, 0x10($sp)
    /* 6E494 8007E494 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 6E498 8007E498 0800E003 */  jr         $ra
    /* 6E49C 8007E49C 00000000 */   nop
endlabel PrintOBJ_TORCHR__FP12ObjectStructiiP7TextDati
