.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetMoveStyle__7GamePadc, 0x8

glabel SetMoveStyle__7GamePadc
    /* 68630 80078630 0800E003 */  jr         $ra
    /* 68634 80078634 4E0085A0 */   sb        $a1, 0x4E($a0)
endlabel SetMoveStyle__7GamePadc
