.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetFrNum__C12CCreatureHdriii, 0x44

glabel GetFrNum__C12CCreatureHdriii
    /* 842A8 800942A8 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 842AC 800942AC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 842B0 800942B0 2180C000 */  addu       $s0, $a2, $zero
    /* 842B4 800942B4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 842B8 800942B8 1800BFAF */  sw         $ra, 0x18($sp)
    /* 842BC 800942BC BB50020C */  jal        GetAction__C12CCreatureHdri
    /* 842C0 800942C0 2188E000 */   addu      $s1, $a3, $zero
    /* 842C4 800942C4 21204000 */  addu       $a0, $v0, $zero
    /* 842C8 800942C8 21280002 */  addu       $a1, $s0, $zero
    /* 842CC 800942CC 6E50020C */  jal        GetFrNum__C15CCreatureActionii
    /* 842D0 800942D0 21302002 */   addu      $a2, $s1, $zero
    /* 842D4 800942D4 1800BF8F */  lw         $ra, 0x18($sp)
    /* 842D8 800942D8 1400B18F */  lw         $s1, 0x14($sp)
    /* 842DC 800942DC 1000B08F */  lw         $s0, 0x10($sp)
    /* 842E0 800942E0 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 842E4 800942E4 0800E003 */  jr         $ra
    /* 842E8 800942E8 00000000 */   nop
endlabel GetFrNum__C12CCreatureHdriii
