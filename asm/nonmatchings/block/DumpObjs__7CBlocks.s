.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DumpObjs__7CBlocks, 0x24

glabel DumpObjs__7CBlocks
    /* 81C74 80091C74 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 81C78 80091C78 1000BFAF */  sw         $ra, 0x10($sp)
    /* 81C7C 80091C7C 74008524 */  addiu      $a1, $a0, 0x74
    /* 81C80 80091C80 C536020C */  jal        DumpGraphics__7CBlocksPP7TextDatPi
    /* 81C84 80091C84 8C008624 */   addiu     $a2, $a0, 0x8C
    /* 81C88 80091C88 1000BF8F */  lw         $ra, 0x10($sp)
    /* 81C8C 80091C8C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 81C90 80091C90 0800E003 */  jr         $ra
    /* 81C94 80091C94 00000000 */   nop
endlabel DumpObjs__7CBlocks
