.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetGoldSeed__FP12PlayerStructP10ItemStruct, 0x34

glabel GetGoldSeed__FP12PlayerStructP10ItemStruct
    /* 57384 80067384 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 57388 80067388 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5738C 8006738C 1400BFAF */  sw         $ra, 0x14($sp)
    /* 57390 80067390 787F010C */  jal        plrind__FP12PlayerStruct
    /* 57394 80067394 2180A000 */   addu      $s0, $a1, $zero
    /* 57398 80067398 21204000 */  addu       $a0, $v0, $zero
    /* 5739C 8006739C 43FF000C */  jal        GetGoldSeed__FiP10ItemStruct
    /* 573A0 800673A0 21280002 */   addu      $a1, $s0, $zero
    /* 573A4 800673A4 1400BF8F */  lw         $ra, 0x14($sp)
    /* 573A8 800673A8 1000B08F */  lw         $s0, 0x10($sp)
    /* 573AC 800673AC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 573B0 800673B0 0800E003 */  jr         $ra
    /* 573B4 800673B4 00000000 */   nop
endlabel GetGoldSeed__FP12PlayerStructP10ItemStruct
