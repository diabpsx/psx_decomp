.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DumpMonsters__7CBlocks, 0x28

glabel DumpMonsters__7CBlocks
    /* 81C98 80091C98 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 81C9C 80091C9C 70008524 */  addiu      $a1, $a0, 0x70
    /* 81CA0 80091CA0 84008624 */  addiu      $a2, $a0, 0x84
    /* 81CA4 80091CA4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 81CA8 80091CA8 C536020C */  jal        DumpGraphics__7CBlocksPP7TextDatPi
    /* 81CAC 80091CAC 780080AC */   sw        $zero, 0x78($a0)
    /* 81CB0 80091CB0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 81CB4 80091CB4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 81CB8 80091CB8 0800E003 */  jr         $ra
    /* 81CBC 80091CBC 00000000 */   nop
endlabel DumpMonsters__7CBlocks
