.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching NoUiListChoose__FiUl, 0x8

glabel NoUiListChoose__FiUl
    /* 1BF8C 80155B84 0800E003 */  jr         $ra
    /* 1BF90 80155B88 21100000 */   addu      $v0, $zero, $zero
endlabel NoUiListChoose__FiUl
