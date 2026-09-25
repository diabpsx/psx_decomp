.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PostNewGame__Fv, 0x28

glabel PostNewGame__Fv
    /* 87554 80097554 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 87558 80097558 1000BFAF */  sw         $ra, 0x10($sp)
    /* 8755C 8009755C 27000424 */  addiu      $a0, $zero, 0x27
    /* 87560 80097560 01000524 */  addiu      $a1, $zero, 0x1
    /* 87564 80097564 C76E020C */  jal        GLUE_StartBg__Fibi
    /* 87568 80097568 FFFF0624 */   addiu     $a2, $zero, -0x1
    /* 8756C 8009756C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 87570 80097570 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 87574 80097574 0800E003 */  jr         $ra
    /* 87578 80097578 00000000 */   nop
endlabel PostNewGame__Fv
