.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetTpX__FUs_80084468, 0xC

glabel GetTpX__FUs_80084468
    /* 74468 80084468 80110400 */  sll        $v0, $a0, 6
    /* 7446C 8008446C 0800E003 */  jr         $ra
    /* 74470 80084470 C0034230 */   andi      $v0, $v0, 0x3C0
endlabel GetTpX__FUs_80084468
