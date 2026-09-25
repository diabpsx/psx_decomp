.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GTIMSYS_ResetTimer, 0x24

glabel GTIMSYS_ResetTimer
    /* 10F14 80020F14 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 10F18 80020F18 1000BFAF */  sw         $ra, 0x10($sp)
    /* 10F1C 80020F1C 00F2043C */  lui        $a0, (0xF2000001 >> 16)
    /* 10F20 80020F20 4D84000C */  jal        ResetRCnt
    /* 10F24 80020F24 01008434 */   ori       $a0, $a0, (0xF2000001 & 0xFFFF)
    /* 10F28 80020F28 1000BF8F */  lw         $ra, 0x10($sp)
    /* 10F2C 80020F2C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 10F30 80020F30 0800E003 */  jr         $ra
    /* 10F34 80020F34 00000000 */   nop
endlabel GTIMSYS_ResetTimer
