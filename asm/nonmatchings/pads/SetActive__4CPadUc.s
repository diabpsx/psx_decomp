.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetActive__4CPadUc, 0x8

glabel SetActive__4CPadUc
    /* 79C1C 80089C1C 0800E003 */  jr         $ra
    /* 79C20 80089C20 010085A0 */   sb        $a1, 0x1($a0)
endlabel SetActive__4CPadUc
