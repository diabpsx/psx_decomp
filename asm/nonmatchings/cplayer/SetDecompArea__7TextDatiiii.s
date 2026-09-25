.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetDecompArea__7TextDatiiii, 0x18

glabel SetDecompArea__7TextDatiiii
    /* 8679C 8009679C 1000A28F */  lw         $v0, 0x10($sp)
    /* 867A0 800967A0 500085AC */  sw         $a1, 0x50($a0)
    /* 867A4 800967A4 540086AC */  sw         $a2, 0x54($a0)
    /* 867A8 800967A8 580087AC */  sw         $a3, 0x58($a0)
    /* 867AC 800967AC 0800E003 */  jr         $ra
    /* 867B0 800967B0 5C0082AC */   sw        $v0, 0x5C($a0)
endlabel SetDecompArea__7TextDatiiii
