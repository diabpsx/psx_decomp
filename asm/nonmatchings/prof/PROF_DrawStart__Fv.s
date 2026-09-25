.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PROF_DrawStart__Fv, 0x24

glabel PROF_DrawStart__Fv
    /* 868F4 800968F4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 868F8 800968F8 1000BFAF */  sw         $ra, 0x10($sp)
    /* 868FC 800968FC BC83000C */  jal        GTIMSYS_GetTimer
    /* 86900 80096900 00000000 */   nop
    /* 86904 80096904 141F82AF */  sw         $v0, %gp_rel(D_8011C694)($gp)
    /* 86908 80096908 1000BF8F */  lw         $ra, 0x10($sp)
    /* 8690C 8009690C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 86910 80096910 0800E003 */  jr         $ra
    /* 86914 80096914 00000000 */   nop
endlabel PROF_DrawStart__Fv
