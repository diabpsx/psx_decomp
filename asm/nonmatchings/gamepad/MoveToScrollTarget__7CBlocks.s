.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MoveToScrollTarget__7CBlocks, 0x14

glabel MoveToScrollTarget__7CBlocks
    /* 6B0E4 8007B0E4 C800828C */  lw         $v0, 0xC8($a0)
    /* 6B0E8 8007B0E8 CC00838C */  lw         $v1, 0xCC($a0)
    /* 6B0EC 8007B0EC D00082AC */  sw         $v0, 0xD0($a0)
    /* 6B0F0 8007B0F0 0800E003 */  jr         $ra
    /* 6B0F4 8007B0F4 D40083AC */   sw        $v1, 0xD4($a0)
endlabel MoveToScrollTarget__7CBlocks
