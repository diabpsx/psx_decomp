.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GoWarpLevel__Fv, 0x2C

glabel GoWarpLevel__Fv
    /* 8708C 8009708C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 87090 80097090 1000BFAF */  sw         $ra, 0x10($sp)
    /* 87094 80097094 5F5D020C */  jal        LevelToLevelInit__Fv
    /* 87098 80097098 00000000 */   nop
    /* 8709C 8009709C FC05848F */  lw         $a0, %gp_rel(D_8011AD7C)($gp)
    /* 870A0 800970A0 D692020C */  jal        PutUpCutScreen__Fi
    /* 870A4 800970A4 00000000 */   nop
    /* 870A8 800970A8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 870AC 800970AC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 870B0 800970B0 0800E003 */  jr         $ra
    /* 870B4 800970B4 00000000 */   nop
endlabel GoWarpLevel__Fv
