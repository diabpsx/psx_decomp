.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching savegp_ci, 0x14

glabel savegp_ci
    /* 20004 80030004 00009CAC */  sw         $gp, 0x0($a0)
    /* 20008 80030008 0B801C3C */  lui        $gp, (0x800B0000 >> 16)
    /* 2000C 8003000C 84709C8F */  lw         $gp, 0x7084($gp)
    /* 20010 80030010 0800E003 */  jr         $ra
    /* 20014 80030014 00000000 */   nop
endlabel savegp_ci
