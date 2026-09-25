.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GoNewGame__Fv, 0x24

glabel GoNewGame__Fv
    /* 87530 80097530 FC05848F */  lw         $a0, %gp_rel(D_8011AD7C)($gp)
    /* 87534 80097534 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 87538 80097538 1000BFAF */  sw         $ra, 0x10($sp)
    /* 8753C 8009753C D692020C */  jal        PutUpCutScreen__Fi
    /* 87540 80097540 00000000 */   nop
    /* 87544 80097544 1000BF8F */  lw         $ra, 0x10($sp)
    /* 87548 80097548 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 8754C 8009754C 0800E003 */  jr         $ra
    /* 87550 80097550 00000000 */   nop
endlabel GoNewGame__Fv
