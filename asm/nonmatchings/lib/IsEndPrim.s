.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching IsEndPrim, 0x1C

glabel IsEndPrim
    /* 312C 8001312C FF00033C */  lui        $v1, (0xFFFFFF >> 16)
    /* 3130 80013130 0000828C */  lw         $v0, 0x0($a0)
    /* 3134 80013134 FFFF6334 */  ori        $v1, $v1, (0xFFFFFF & 0xFFFF)
    /* 3138 80013138 24104300 */  and        $v0, $v0, $v1
    /* 313C 8001313C 26104300 */  xor        $v0, $v0, $v1
    /* 3140 80013140 0800E003 */  jr         $ra
    /* 3144 80013144 0100422C */   sltiu     $v0, $v0, 0x1
endlabel IsEndPrim
