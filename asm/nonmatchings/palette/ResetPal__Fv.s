.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ResetPal__Fv, 0x8

glabel ResetPal__Fv
    /* 6EE74 8007EE74 0800E003 */  jr         $ra
    /* 6EE78 8007EE78 00000000 */   nop
endlabel ResetPal__Fv
