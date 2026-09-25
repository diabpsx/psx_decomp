.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching prioritycachememadr, 0x34

glabel prioritycachememadr
    /* 19B6C 80029B6C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 19B70 80029B70 1000B0AF */  sw         $s0, 0x10($sp)
    /* 19B74 80029B74 1400BFAF */  sw         $ra, 0x14($sp)
    /* 19B78 80029B78 B1AB000C */  jal        findmemblock
    /* 19B7C 80029B7C 2180A000 */   addu      $s0, $a1, $zero
    /* 19B80 80029B80 21204000 */  addu       $a0, $v0, $zero
    /* 19B84 80029B84 E8A6000C */  jal        prioritycachememblock
    /* 19B88 80029B88 21280002 */   addu      $a1, $s0, $zero
    /* 19B8C 80029B8C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 19B90 80029B90 1000B08F */  lw         $s0, 0x10($sp)
    /* 19B94 80029B94 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 19B98 80029B98 0800E003 */  jr         $ra
    /* 19B9C 80029B9C 00000000 */   nop
endlabel prioritycachememadr
