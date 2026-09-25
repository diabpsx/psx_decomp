.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetTpX__FUs_800ad20c, 0xC

glabel GetTpX__FUs_800ad20c
    /* 9D20C 800AD20C 80110400 */  sll        $v0, $a0, 6
    /* 9D210 800AD210 0800E003 */  jr         $ra
    /* 9D214 800AD214 C0034230 */   andi      $v0, $v0, 0x3C0
endlabel GetTpX__FUs_800ad20c
