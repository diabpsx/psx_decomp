.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetTpX__FUs, 0xC

glabel GetTpX__FUs
    /* 7311C 8008311C 80110400 */  sll        $v0, $a0, 6
    /* 73120 80083120 0800E003 */  jr         $ra
    /* 73124 80083124 C0034230 */   andi      $v0, $v0, 0x3C0
endlabel GetTpX__FUs
