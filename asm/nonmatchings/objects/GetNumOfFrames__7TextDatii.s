.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetNumOfFrames__7TextDatii, 0x38

glabel GetNumOfFrames__7TextDatii
    /* 4FBCC 8005FBCC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 4FBD0 8005FBD0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 4FBD4 8005FBD4 1400BFAF */  sw         $ra, 0x14($sp)
    /* 4FBD8 8005FBD8 017F010C */  jal        GetCreature__7TextDati
    /* 4FBDC 8005FBDC 2180C000 */   addu      $s0, $a2, $zero
    /* 4FBE0 8005FBE0 21204000 */  addu       $a0, $v0, $zero
    /* 4FBE4 8005FBE4 BB50020C */  jal        GetAction__C12CCreatureHdri
    /* 4FBE8 8005FBE8 21280002 */   addu      $a1, $s0, $zero
    /* 4FBEC 8005FBEC 02004290 */  lbu        $v0, 0x2($v0)
    /* 4FBF0 8005FBF0 1400BF8F */  lw         $ra, 0x14($sp)
    /* 4FBF4 8005FBF4 1000B08F */  lw         $s0, 0x10($sp)
    /* 4FBF8 8005FBF8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 4FBFC 8005FBFC 0800E003 */  jr         $ra
    /* 4FC00 8005FC00 00000000 */   nop
endlabel GetNumOfFrames__7TextDatii
