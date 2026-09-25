.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetCharFrameNum__5CFontUc, 0x18

glabel GetCharFrameNum__5CFontUc
    /* 7AD28 8008AD28 FF00A530 */  andi       $a1, $a1, 0xFF
    /* 7AD2C 8008AD2C 40280500 */  sll        $a1, $a1, 1
    /* 7AD30 8008AD30 2128A400 */  addu       $a1, $a1, $a0
    /* 7AD34 8008AD34 0400A294 */  lhu        $v0, 0x4($a1)
    /* 7AD38 8008AD38 0800E003 */  jr         $ra
    /* 7AD3C 8008AD3C 00000000 */   nop
endlabel GetCharFrameNum__5CFontUc
