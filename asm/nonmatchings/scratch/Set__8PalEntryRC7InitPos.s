.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Set__8PalEntryRC7InitPos, 0x2C

glabel Set__8PalEntryRC7InitPos
    /* 8B240 8009B240 0000A294 */  lhu        $v0, 0x0($a1)
    /* 8B244 8009B244 0200A394 */  lhu        $v1, 0x2($a1)
    /* 8B248 8009B248 0A0082A4 */  sh         $v0, 0xA($a0)
    /* 8B24C 8009B24C 0A008294 */  lhu        $v0, 0xA($a0)
    /* 8B250 8009B250 0C0083A4 */  sh         $v1, 0xC($a0)
    /* 8B254 8009B254 80190300 */  sll        $v1, $v1, 6
    /* 8B258 8009B258 02110200 */  srl        $v0, $v0, 4
    /* 8B25C 8009B25C 3F004230 */  andi       $v0, $v0, 0x3F
    /* 8B260 8009B260 25186200 */  or         $v1, $v1, $v0
    /* 8B264 8009B264 0800E003 */  jr         $ra
    /* 8B268 8009B268 0E0083A4 */   sh        $v1, 0xE($a0)
endlabel Set__8PalEntryRC7InitPos
