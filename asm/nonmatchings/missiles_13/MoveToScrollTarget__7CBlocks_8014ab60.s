.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MoveToScrollTarget__7CBlocks_8014ab60, 0x14

glabel MoveToScrollTarget__7CBlocks_8014ab60
    /* 10F68 8014AB60 C800828C */  lw         $v0, 0xC8($a0)
    /* 10F6C 8014AB64 CC00838C */  lw         $v1, 0xCC($a0)
    /* 10F70 8014AB68 D00082AC */  sw         $v0, 0xD0($a0)
    /* 10F74 8014AB6C 0800E003 */  jr         $ra
    /* 10F78 8014AB70 D40083AC */   sw        $v1, 0xD4($a0)
endlabel MoveToScrollTarget__7CBlocks_8014ab60
