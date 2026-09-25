.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetTown__7CBlocksb, 0x8

glabel SetTown__7CBlocksb
    /* 8C52C 8009C52C 0800E003 */  jr         $ra
    /* 8C530 8009C530 A80085AC */   sw        $a1, 0xA8($a0)
endlabel SetTown__7CBlocksb
