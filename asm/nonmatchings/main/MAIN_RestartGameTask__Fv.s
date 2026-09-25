.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MAIN_RestartGameTask__Fv, 0x2C

glabel MAIN_RestartGameTask__Fv
    /* 73224 80083224 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 73228 80083228 841E848F */  lw         $a0, %gp_rel(D_8011C604)($gp)
    /* 7322C 8008322C 0880053C */  lui        $a1, %hi(GameTask__FP4TASK)
    /* 73230 80083230 5032A524 */  addiu      $a1, $a1, %lo(GameTask__FP4TASK)
    /* 73234 80083234 1000BFAF */  sw         $ra, 0x10($sp)
    /* 73238 80083238 9B81000C */  jal        TSK_RepointProc
    /* 7323C 8008323C 00000000 */   nop
    /* 73240 80083240 1000BF8F */  lw         $ra, 0x10($sp)
    /* 73244 80083244 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 73248 80083248 0800E003 */  jr         $ra
    /* 7324C 8008324C 00000000 */   nop
endlabel MAIN_RestartGameTask__Fv
