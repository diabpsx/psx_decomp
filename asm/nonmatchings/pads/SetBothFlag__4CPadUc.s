.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetBothFlag__4CPadUc, 0x8

glabel SetBothFlag__4CPadUc
    /* 79C24 80089C24 0800E003 */  jr         $ra
    /* 79C28 80089C28 000085A0 */   sb        $a1, 0x0($a0)
endlabel SetBothFlag__4CPadUc
