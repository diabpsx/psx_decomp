.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintMonster__7TextDatiiiiiii, 0xAC

glabel PrintMonster__7TextDatiiiiiii
    /* 8262C 8009262C C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 82630 80092630 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 82634 80092634 21888000 */  addu       $s1, $a0, $zero
    /* 82638 80092638 1800B0AF */  sw         $s0, 0x18($sp)
    /* 8263C 8009263C 2180A000 */  addu       $s0, $a1, $zero
    /* 82640 80092640 2000B2AF */  sw         $s2, 0x20($sp)
    /* 82644 80092644 2190C000 */  addu       $s2, $a2, $zero
    /* 82648 80092648 2400B3AF */  sw         $s3, 0x24($sp)
    /* 8264C 8009264C 2198E000 */  addu       $s3, $a3, $zero
    /* 82650 80092650 4800A28F */  lw         $v0, 0x48($sp)
    /* 82654 80092654 2800B4AF */  sw         $s4, 0x28($sp)
    /* 82658 80092658 4C00B48F */  lw         $s4, 0x4C($sp)
    /* 8265C 8009265C 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 82660 80092660 5000B58F */  lw         $s5, 0x50($sp)
    /* 82664 80092664 3000B6AF */  sw         $s6, 0x30($sp)
    /* 82668 80092668 5400B68F */  lw         $s6, 0x54($sp)
    /* 8266C 8009266C 3400BFAF */  sw         $ra, 0x34($sp)
    /* 82670 80092670 A64F020C */  jal        GetFrNum__7TextDatiiii
    /* 82674 80092674 1000A2AF */   sw        $v0, 0x10($sp)
    /* 82678 80092678 21202002 */  addu       $a0, $s1, $zero
    /* 8267C 8009267C 21280002 */  addu       $a1, $s0, $zero
    /* 82680 80092680 21304002 */  addu       $a2, $s2, $zero
    /* 82684 80092684 21386002 */  addu       $a3, $s3, $zero
    /* 82688 80092688 BB4F020C */  jal        IsDirAliased__7TextDatiii
    /* 8268C 8009268C 21804000 */   addu      $s0, $v0, $zero
    /* 82690 80092690 21202002 */  addu       $a0, $s1, $zero
    /* 82694 80092694 21280002 */  addu       $a1, $s0, $zero
    /* 82698 80092698 21308002 */  addu       $a2, $s4, $zero
    /* 8269C 8009269C 2138A002 */  addu       $a3, $s5, $zero
    /* 826A0 800926A0 1000A2AF */  sw         $v0, 0x10($sp)
    /* 826A4 800926A4 B649020C */  jal        PrintMonsterA__7TextDatiiibi
    /* 826A8 800926A8 1400B6AF */   sw        $s6, 0x14($sp)
    /* 826AC 800926AC 3400BF8F */  lw         $ra, 0x34($sp)
    /* 826B0 800926B0 3000B68F */  lw         $s6, 0x30($sp)
    /* 826B4 800926B4 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 826B8 800926B8 2800B48F */  lw         $s4, 0x28($sp)
    /* 826BC 800926BC 2400B38F */  lw         $s3, 0x24($sp)
    /* 826C0 800926C0 2000B28F */  lw         $s2, 0x20($sp)
    /* 826C4 800926C4 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 826C8 800926C8 1800B08F */  lw         $s0, 0x18($sp)
    /* 826CC 800926CC 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 826D0 800926D0 0800E003 */  jr         $ra
    /* 826D4 800926D4 00000000 */   nop
endlabel PrintMonster__7TextDatiiiiiii
