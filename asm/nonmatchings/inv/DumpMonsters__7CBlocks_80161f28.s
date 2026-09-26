.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DumpMonsters__7CBlocks_80161f28, 0x28

glabel DumpMonsters__7CBlocks_80161f28
    /* 28330 80161F28 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 28334 80161F2C 70008524 */  addiu      $a1, $a0, 0x70
    /* 28338 80161F30 84008624 */  addiu      $a2, $a0, 0x84
    /* 2833C 80161F34 1000BFAF */  sw         $ra, 0x10($sp)
    /* 28340 80161F38 C536020C */  jal        DumpGraphics__7CBlocksPP7TextDatPi
    /* 28344 80161F3C 780080AC */   sw        $zero, 0x78($a0)
    /* 28348 80161F40 1000BF8F */  lw         $ra, 0x10($sp)
    /* 2834C 80161F44 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 28350 80161F48 0800E003 */  jr         $ra
    /* 28354 80161F4C 00000000 */   nop
endlabel DumpMonsters__7CBlocks_80161f28
