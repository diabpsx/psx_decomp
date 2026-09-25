.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetXY__7CBlocksii, 0x28

glabel SetXY__7CBlocksii
    /* 7E25C 8008E25C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 7E260 8008E260 1000BFAF */  sw         $ra, 0x10($sp)
    /* 7E264 8008E264 D00085AC */  sw         $a1, 0xD0($a0)
    /* 7E268 8008E268 D000858C */  lw         $a1, 0xD0($a0)
    /* 7E26C 8008E26C 8345020C */  jal        SetScrollTarget__7CBlocksii
    /* 7E270 8008E270 D40086AC */   sw        $a2, 0xD4($a0)
    /* 7E274 8008E274 1000BF8F */  lw         $ra, 0x10($sp)
    /* 7E278 8008E278 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 7E27C 8008E27C 0800E003 */  jr         $ra
    /* 7E280 8008E280 00000000 */   nop
endlabel SetXY__7CBlocksii
