.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching VID_IsDbuffer__Fv, 0xC

glabel VID_IsDbuffer__Fv
    /* 74184 80084184 4803828F */  lw         $v0, %gp_rel(AddrToAvoid + 0xC)($gp)
    /* 74188 80084188 0800E003 */  jr         $ra
    /* 7418C 8008418C 0100422C */   sltiu     $v0, $v0, 0x1
endlabel VID_IsDbuffer__Fv
