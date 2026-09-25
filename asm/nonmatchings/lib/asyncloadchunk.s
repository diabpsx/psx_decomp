.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching asyncloadchunk, 0x20

glabel asyncloadchunk
    /* 13F68 80023F68 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 13F6C 80023F6C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 13F70 80023F70 858F000C */  jal        asyncloadchunkcallback
    /* 13F74 80023F74 21380000 */   addu      $a3, $zero, $zero
    /* 13F78 80023F78 1000BF8F */  lw         $ra, 0x10($sp)
    /* 13F7C 80023F7C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 13F80 80023F80 0800E003 */  jr         $ra
    /* 13F84 80023F84 00000000 */   nop
endlabel asyncloadchunk
