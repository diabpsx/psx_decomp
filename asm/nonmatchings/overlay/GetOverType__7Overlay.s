.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetOverType__7Overlay, 0xC

glabel GetOverType__7Overlay
    /* 85838 80095838 0C00828C */  lw         $v0, 0xC($a0)
    /* 8583C 8009583C 0800E003 */  jr         $ra
    /* 85840 80095840 00000000 */   nop
endlabel GetOverType__7Overlay
