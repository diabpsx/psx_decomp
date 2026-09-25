.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PROF_Restart__Fv, 0x20

glabel PROF_Restart__Fv
    /* 86B3C 80096B3C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 86B40 80096B40 1000BFAF */  sw         $ra, 0x10($sp)
    /* 86B44 80096B44 C583000C */  jal        GTIMSYS_ResetTimer
    /* 86B48 80096B48 00000000 */   nop
    /* 86B4C 80096B4C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 86B50 80096B50 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 86B54 80096B54 0800E003 */  jr         $ra
    /* 86B58 80096B58 00000000 */   nop
endlabel PROF_Restart__Fv
