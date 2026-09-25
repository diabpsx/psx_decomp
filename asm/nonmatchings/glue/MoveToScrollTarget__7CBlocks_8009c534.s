.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MoveToScrollTarget__7CBlocks_8009c534, 0x14

glabel MoveToScrollTarget__7CBlocks_8009c534
    /* 8C534 8009C534 C800828C */  lw         $v0, 0xC8($a0)
    /* 8C538 8009C538 CC00838C */  lw         $v1, 0xCC($a0)
    /* 8C53C 8009C53C D00082AC */  sw         $v0, 0xD0($a0)
    /* 8C540 8009C540 0800E003 */  jr         $ra
    /* 8C544 8009C544 D40083AC */   sw        $v1, 0xD4($a0)
endlabel MoveToScrollTarget__7CBlocks_8009c534
