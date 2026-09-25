.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetNumOfFrames__7TextDatii_80091d84, 0x38

glabel GetNumOfFrames__7TextDatii_80091d84
    /* 81D84 80091D84 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 81D88 80091D88 1000B0AF */  sw         $s0, 0x10($sp)
    /* 81D8C 80091D8C 1400BFAF */  sw         $ra, 0x14($sp)
    /* 81D90 80091D90 7847020C */  jal        GetCreature__7TextDati_80091de0
    /* 81D94 80091D94 2180C000 */   addu      $s0, $a2, $zero
    /* 81D98 80091D98 21204000 */  addu       $a0, $v0, $zero
    /* 81D9C 80091D9C BB50020C */  jal        GetAction__C12CCreatureHdri
    /* 81DA0 80091DA0 21280002 */   addu      $a1, $s0, $zero
    /* 81DA4 80091DA4 02004290 */  lbu        $v0, 0x2($v0)
    /* 81DA8 80091DA8 1400BF8F */  lw         $ra, 0x14($sp)
    /* 81DAC 80091DAC 1000B08F */  lw         $s0, 0x10($sp)
    /* 81DB0 80091DB0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 81DB4 80091DB4 0800E003 */  jr         $ra
    /* 81DB8 80091DB8 00000000 */   nop
endlabel GetNumOfFrames__7TextDatii_80091d84
