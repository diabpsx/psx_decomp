.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetPadType__4CPadUc, 0x8

glabel SetPadType__4CPadUc
    /* 79C08 80089C08 0800E003 */  jr         $ra
    /* 79C0C 80089C0C 020085A0 */   sb        $a1, 0x2($a0)
endlabel SetPadType__4CPadUc
