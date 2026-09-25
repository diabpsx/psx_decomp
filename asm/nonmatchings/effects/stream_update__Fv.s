.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching stream_update__Fv, 0x8

glabel stream_update__Fv
    /* 2D158 8003D158 0800E003 */  jr         $ra
    /* 2D15C 8003D15C 00000000 */   nop
endlabel stream_update__Fv
