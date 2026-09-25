.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PROF_DrawEnd__Fv, 0x30

glabel PROF_DrawEnd__Fv
    /* 86918 80096918 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8691C 8009691C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 86920 80096920 BC83000C */  jal        GTIMSYS_GetTimer
    /* 86924 80096924 00000000 */   nop
    /* 86928 80096928 141F838F */  lw         $v1, %gp_rel(D_8011C694)($gp)
    /* 8692C 8009692C 00000000 */  nop
    /* 86930 80096930 23104300 */  subu       $v0, $v0, $v1
    /* 86934 80096934 101F82AF */  sw         $v0, %gp_rel(D_8011C690)($gp)
    /* 86938 80096938 1000BF8F */  lw         $ra, 0x10($sp)
    /* 8693C 8009693C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 86940 80096940 0800E003 */  jr         $ra
    /* 86944 80096944 00000000 */   nop
endlabel PROF_DrawEnd__Fv
