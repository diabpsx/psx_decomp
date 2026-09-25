.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetNumOfFrames__7TextDatii_8007edf4, 0x38

glabel GetNumOfFrames__7TextDatii_8007edf4
    /* 6EDF4 8007EDF4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 6EDF8 8007EDF8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 6EDFC 8007EDFC 1400BFAF */  sw         $ra, 0x14($sp)
    /* 6EE00 8007EE00 8BFB010C */  jal        GetCreature__7TextDati_8007ee2c
    /* 6EE04 8007EE04 2180C000 */   addu      $s0, $a2, $zero
    /* 6EE08 8007EE08 21204000 */  addu       $a0, $v0, $zero
    /* 6EE0C 8007EE0C BB50020C */  jal        GetAction__C12CCreatureHdri
    /* 6EE10 8007EE10 21280002 */   addu      $a1, $s0, $zero
    /* 6EE14 8007EE14 02004290 */  lbu        $v0, 0x2($v0)
    /* 6EE18 8007EE18 1400BF8F */  lw         $ra, 0x14($sp)
    /* 6EE1C 8007EE1C 1000B08F */  lw         $s0, 0x10($sp)
    /* 6EE20 8007EE20 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 6EE24 8007EE24 0800E003 */  jr         $ra
    /* 6EE28 8007EE28 00000000 */   nop
endlabel GetNumOfFrames__7TextDatii_8007edf4
