.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoadAllGFX__Fv, 0x20

glabel LoadAllGFX__Fv
    /* 28A78 80038A78 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 28A7C 80038A7C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 28A80 80038A80 494D010C */  jal        InitObjectGFX__Fv
    /* 28A84 80038A84 00000000 */   nop
    /* 28A88 80038A88 1000BF8F */  lw         $ra, 0x10($sp)
    /* 28A8C 80038A8C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 28A90 80038A90 0800E003 */  jr         $ra
    /* 28A94 80038A94 00000000 */   nop
endlabel LoadAllGFX__Fv
