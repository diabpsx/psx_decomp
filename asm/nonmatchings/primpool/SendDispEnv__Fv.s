.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SendDispEnv__Fv, 0x24

glabel SendDispEnv__Fv
    /* 73E00 80083E00 A01E848F */  lw         $a0, %gp_rel(D_8011C620)($gp)
    /* 73E04 80083E04 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 73E08 80083E08 1000BFAF */  sw         $ra, 0x10($sp)
    /* 73E0C 80083E0C AA50000C */  jal        PutDispEnv
    /* 73E10 80083E10 00000000 */   nop
    /* 73E14 80083E14 1000BF8F */  lw         $ra, 0x10($sp)
    /* 73E18 80083E18 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 73E1C 80083E1C 0800E003 */  jr         $ra
    /* 73E20 80083E20 00000000 */   nop
endlabel SendDispEnv__Fv
