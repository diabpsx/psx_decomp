.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching cachememblock, 0x20

glabel cachememblock
    /* 19B4C 80029B4C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 19B50 80029B50 1000BFAF */  sw         $ra, 0x10($sp)
    /* 19B54 80029B54 E8A6000C */  jal        prioritycachememblock
    /* 19B58 80029B58 01000524 */   addiu     $a1, $zero, 0x1
    /* 19B5C 80029B5C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 19B60 80029B60 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 19B64 80029B64 0800E003 */  jr         $ra
    /* 19B68 80029B68 00000000 */   nop
endlabel cachememblock
