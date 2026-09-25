.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DBG_SendMessage, 0x18

glabel DBG_SendMessage
    /* 10E6C 80020E6C 0000A4AF */  sw         $a0, 0x0($sp)
    /* 10E70 80020E70 0400A5AF */  sw         $a1, 0x4($sp)
    /* 10E74 80020E74 0800A6AF */  sw         $a2, 0x8($sp)
    /* 10E78 80020E78 0C00A7AF */  sw         $a3, 0xC($sp)
    /* 10E7C 80020E7C 0800E003 */  jr         $ra
    /* 10E80 80020E80 00000000 */   nop
endlabel DBG_SendMessage
