.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GSYS_IsStackCorrupted, 0x18

glabel GSYS_IsStackCorrupted
    /* 111C8 800211C8 CDAB033C */  lui        $v1, (0xABCD0123 >> 16)
    /* 111CC 800211CC 0000828C */  lw         $v0, 0x0($a0)
    /* 111D0 800211D0 23016334 */  ori        $v1, $v1, (0xABCD0123 & 0xFFFF)
    /* 111D4 800211D4 26104300 */  xor        $v0, $v0, $v1
    /* 111D8 800211D8 0800E003 */  jr         $ra
    /* 111DC 800211DC 2B100200 */   sltu      $v0, $zero, $v0
endlabel GSYS_IsStackCorrupted
