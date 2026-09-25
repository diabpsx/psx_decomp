.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DisableInputWndProc__FUlUilUl, 0x8

glabel DisableInputWndProc__FUlUilUl
    /* 28894 80038894 0800E003 */  jr         $ra
    /* 28898 80038898 21100000 */   addu      $v0, $zero, $zero
endlabel DisableInputWndProc__FUlUilUl
