.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DumpItems__7CBlocks, 0x24

glabel DumpItems__7CBlocks
    /* 81C50 80091C50 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 81C54 80091C54 1000BFAF */  sw         $ra, 0x10($sp)
    /* 81C58 80091C58 94008524 */  addiu      $a1, $a0, 0x94
    /* 81C5C 80091C5C C536020C */  jal        DumpGraphics__7CBlocksPP7TextDatPi
    /* 81C60 80091C60 90008624 */   addiu     $a2, $a0, 0x90
    /* 81C64 80091C64 1000BF8F */  lw         $ra, 0x10($sp)
    /* 81C68 80091C68 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 81C6C 80091C6C 0800E003 */  jr         $ra
    /* 81C70 80091C70 00000000 */   nop
endlabel DumpItems__7CBlocks
