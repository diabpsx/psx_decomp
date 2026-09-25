.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DPIECE_ERROR__Fv, 0x8

glabel DPIECE_ERROR__Fv
    /* 727D8 800827D8 0800E003 */  jr         $ra
    /* 727DC 800827DC 00000000 */   nop
endlabel DPIECE_ERROR__Fv
