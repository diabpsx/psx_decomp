.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetNumOfFrames__7TextDatii_800967b4, 0x38

glabel GetNumOfFrames__7TextDatii_800967b4
    /* 867B4 800967B4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 867B8 800967B8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 867BC 800967BC 1400BFAF */  sw         $ra, 0x14($sp)
    /* 867C0 800967C0 045A020C */  jal        GetCreature__7TextDati_80096810
    /* 867C4 800967C4 2180C000 */   addu      $s0, $a2, $zero
    /* 867C8 800967C8 21204000 */  addu       $a0, $v0, $zero
    /* 867CC 800967CC BB50020C */  jal        GetAction__C12CCreatureHdri
    /* 867D0 800967D0 21280002 */   addu      $a1, $s0, $zero
    /* 867D4 800967D4 02004290 */  lbu        $v0, 0x2($v0)
    /* 867D8 800967D8 1400BF8F */  lw         $ra, 0x14($sp)
    /* 867DC 800967DC 1000B08F */  lw         $s0, 0x10($sp)
    /* 867E0 800967E0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 867E4 800967E4 0800E003 */  jr         $ra
    /* 867E8 800967E8 00000000 */   nop
endlabel GetNumOfFrames__7TextDatii_800967b4
