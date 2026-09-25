.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetXY__7CBlocksPiT1, 0x18

glabel GetXY__7CBlocksPiT1
    /* 7E284 8008E284 D000828C */  lw         $v0, 0xD0($a0)
    /* 7E288 8008E288 00000000 */  nop
    /* 7E28C 8008E28C 0000A2AC */  sw         $v0, 0x0($a1)
    /* 7E290 8008E290 D400828C */  lw         $v0, 0xD4($a0)
    /* 7E294 8008E294 0800E003 */  jr         $ra
    /* 7E298 8008E298 0000C2AC */   sw        $v0, 0x0($a2)
endlabel GetXY__7CBlocksPiT1
