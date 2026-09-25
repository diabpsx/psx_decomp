.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SmearScreen__Fv, 0x8

glabel SmearScreen__Fv
    /* 6EFD4 8007EFD4 0800E003 */  jr         $ra
    /* 6EFD8 8007EFD8 00000000 */   nop
endlabel SmearScreen__Fv
