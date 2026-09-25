.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PhaseEnd__FP12PlayerStruct, 0x28

glabel PhaseEnd__FP12PlayerStruct
    /* 56A98 80066A98 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 56A9C 80066A9C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 56AA0 80066AA0 787F010C */  jal        plrind__FP12PlayerStruct
    /* 56AA4 80066AA4 00000000 */   nop
    /* 56AA8 80066AA8 1B81020C */  jal        PhaseEnd__Fi
    /* 56AAC 80066AAC 21204000 */   addu      $a0, $v0, $zero
    /* 56AB0 80066AB0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 56AB4 80066AB4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 56AB8 80066AB8 0800E003 */  jr         $ra
    /* 56ABC 80066ABC 00000000 */   nop
endlabel PhaseEnd__FP12PlayerStruct
