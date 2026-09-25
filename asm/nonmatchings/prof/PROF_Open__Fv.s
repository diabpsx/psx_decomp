.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PROF_Open__Fv, 0x40

glabel PROF_Open__Fv
    /* 86838 80096838 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8683C 8009683C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 86840 80096840 CE83000C */  jal        GTIMSYS_InitTimer
    /* 86844 80096844 00000000 */   nop
    /* 86848 80096848 041F82AF */  sw         $v0, %gp_rel(D_8011C684)($gp)
    /* 8684C 8009684C CF5A020C */  jal        PROF_Restart__Fv
    /* 86850 80096850 00000000 */   nop
    /* 86854 80096854 0C1F80AF */  sw         $zero, %gp_rel(D_8011C68C)($gp)
    /* 86858 80096858 081F80AF */  sw         $zero, %gp_rel(D_8011C688)($gp)
    /* 8685C 8009685C 101F80AF */  sw         $zero, %gp_rel(D_8011C690)($gp)
    /* 86860 80096860 141F80AF */  sw         $zero, %gp_rel(D_8011C694)($gp)
    /* 86864 80096864 E00580AF */  sw         $zero, %gp_rel(ProfOn)($gp)
    /* 86868 80096868 1000BF8F */  lw         $ra, 0x10($sp)
    /* 8686C 8009686C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 86870 80096870 0800E003 */  jr         $ra
    /* 86874 80096874 00000000 */   nop
endlabel PROF_Open__Fv
