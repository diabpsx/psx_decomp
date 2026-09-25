.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching IsDefined__5CFontUc, 0x20

glabel IsDefined__5CFontUc
    /* 7AD08 8008AD08 FF00A530 */  andi       $a1, $a1, 0xFF
    /* 7AD0C 8008AD0C 40280500 */  sll        $a1, $a1, 1
    /* 7AD10 8008AD10 2128A400 */  addu       $a1, $a1, $a0
    /* 7AD14 8008AD14 0400A294 */  lhu        $v0, 0x4($a1)
    /* 7AD18 8008AD18 00000000 */  nop
    /* 7AD1C 8008AD1C 39304238 */  xori       $v0, $v0, 0x3039
    /* 7AD20 8008AD20 0800E003 */  jr         $ra
    /* 7AD24 8008AD24 2B100200 */   sltu      $v0, $zero, $v0
endlabel IsDefined__5CFontUc
