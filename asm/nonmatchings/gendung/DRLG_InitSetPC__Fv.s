.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_InitSetPC__Fv, 0x18

glabel DRLG_InitSetPC__Fv
    /* 206AC 8015A2A4 641980AF */  sw         $zero, %gp_rel(setpc_x)($gp)
    /* 206B0 8015A2A8 681980AF */  sw         $zero, %gp_rel(setpc_y)($gp)
    /* 206B4 8015A2AC 6C1980AF */  sw         $zero, %gp_rel(setpc_w)($gp)
    /* 206B8 8015A2B0 701980AF */  sw         $zero, %gp_rel(setpc_h)($gp)
    /* 206BC 8015A2B4 0800E003 */  jr         $ra
    /* 206C0 8015A2B8 00000000 */   nop
endlabel DRLG_InitSetPC__Fv
