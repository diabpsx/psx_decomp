.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CalcPlrInv__FP12PlayerStructUc, 0x34

glabel CalcPlrInv__FP12PlayerStructUc
    /* 56880 80066880 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 56884 80066884 1000B0AF */  sw         $s0, 0x10($sp)
    /* 56888 80066888 1400BFAF */  sw         $ra, 0x14($sp)
    /* 5688C 8006688C 787F010C */  jal        plrind__FP12PlayerStruct
    /* 56890 80066890 2180A000 */   addu      $s0, $a1, $zero
    /* 56894 80066894 21204000 */  addu       $a0, $v0, $zero
    /* 56898 80066898 C6FE000C */  jal        CalcPlrInv__FiUc
    /* 5689C 8006689C FF000532 */   andi      $a1, $s0, 0xFF
    /* 568A0 800668A0 1400BF8F */  lw         $ra, 0x14($sp)
    /* 568A4 800668A4 1000B08F */  lw         $s0, 0x10($sp)
    /* 568A8 800668A8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 568AC 800668AC 0800E003 */  jr         $ra
    /* 568B0 800668B0 00000000 */   nop
endlabel CalcPlrInv__FP12PlayerStructUc
