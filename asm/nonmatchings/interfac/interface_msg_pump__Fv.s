.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching interface_msg_pump__Fv, 0x8

glabel interface_msg_pump__Fv
    /* 2DE38 8003DE38 0800E003 */  jr         $ra
    /* 2DE3C 8003DE3C 00000000 */   nop
endlabel interface_msg_pump__Fv
