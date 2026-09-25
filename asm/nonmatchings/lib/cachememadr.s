.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching cachememadr, 0x2C

glabel cachememadr
    /* 19B20 80029B20 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 19B24 80029B24 1000BFAF */  sw         $ra, 0x10($sp)
    /* 19B28 80029B28 B1AB000C */  jal        findmemblock
    /* 19B2C 80029B2C 00000000 */   nop
    /* 19B30 80029B30 21204000 */  addu       $a0, $v0, $zero
    /* 19B34 80029B34 E8A6000C */  jal        prioritycachememblock
    /* 19B38 80029B38 01000524 */   addiu     $a1, $zero, 0x1
    /* 19B3C 80029B3C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 19B40 80029B40 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 19B44 80029B44 0800E003 */  jr         $ra
    /* 19B48 80029B48 00000000 */   nop
endlabel cachememadr
