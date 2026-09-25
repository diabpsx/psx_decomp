.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GTIMSYS_GetTimer, 0x24

glabel GTIMSYS_GetTimer
    /* 10EF0 80020EF0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 10EF4 80020EF4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 10EF8 80020EF8 00F2043C */  lui        $a0, (0xF2000001 >> 16)
    /* 10EFC 80020EFC 2684000C */  jal        GetRCnt
    /* 10F00 80020F00 01008434 */   ori       $a0, $a0, (0xF2000001 & 0xFFFF)
    /* 10F04 80020F04 1000BF8F */  lw         $ra, 0x10($sp)
    /* 10F08 80020F08 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 10F0C 80020F0C 0800E003 */  jr         $ra
    /* 10F10 80020F10 00000000 */   nop
endlabel GTIMSYS_GetTimer
