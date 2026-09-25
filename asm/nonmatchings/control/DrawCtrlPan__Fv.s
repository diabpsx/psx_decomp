.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawCtrlPan__Fv, 0x2C

glabel DrawCtrlPan__Fv
    /* 2219C 8003219C 700F848F */  lw         $a0, %gp_rel(InfoBoxRect)($gp)
    /* 221A0 800321A0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 221A4 800321A4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 221A8 800321A8 1280013C */  lui        $at, %hi(sel_data)
    /* 221AC 800321AC 2CB720AC */  sw         $zero, %lo(sel_data)($at)
    /* 221B0 800321B0 E9CB000C */  jal        DrawInfoBox__FP4RECT
    /* 221B4 800321B4 00000000 */   nop
    /* 221B8 800321B8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 221BC 800321BC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 221C0 800321C0 0800E003 */  jr         $ra
    /* 221C4 800321C4 00000000 */   nop
endlabel DrawCtrlPan__Fv
