.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DumpMonsters__7CBlocks_800adf34, 0x28

glabel DumpMonsters__7CBlocks_800adf34
    /* 9DF34 800ADF34 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 9DF38 800ADF38 70008524 */  addiu      $a1, $a0, 0x70
    /* 9DF3C 800ADF3C 84008624 */  addiu      $a2, $a0, 0x84
    /* 9DF40 800ADF40 1000BFAF */  sw         $ra, 0x10($sp)
    /* 9DF44 800ADF44 C536020C */  jal        DumpGraphics__7CBlocksPP7TextDatPi
    /* 9DF48 800ADF48 780080AC */   sw        $zero, 0x78($a0)
    /* 9DF4C 800ADF4C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 9DF50 800ADF50 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 9DF54 800ADF54 0800E003 */  jr         $ra
    /* 9DF58 800ADF58 00000000 */   nop
endlabel DumpMonsters__7CBlocks_800adf34
