.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FreeStoreMem__Fv, 0x8

glabel FreeStoreMem__Fv
    /* 595A4 800695A4 0800E003 */  jr         $ra
    /* 595A8 800695A8 00000000 */   nop
endlabel FreeStoreMem__Fv
