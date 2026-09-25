.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PROF_CpuEnd__Fv, 0x30

glabel PROF_CpuEnd__Fv
    /* 868A0 800968A0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 868A4 800968A4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 868A8 800968A8 BC83000C */  jal        GTIMSYS_GetTimer
    /* 868AC 800968AC 00000000 */   nop
    /* 868B0 800968B0 081F838F */  lw         $v1, %gp_rel(D_8011C688)($gp)
    /* 868B4 800968B4 00000000 */  nop
    /* 868B8 800968B8 23104300 */  subu       $v0, $v0, $v1
    /* 868BC 800968BC 0C1F82AF */  sw         $v0, %gp_rel(D_8011C68C)($gp)
    /* 868C0 800968C0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 868C4 800968C4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 868C8 800968C8 0800E003 */  jr         $ra
    /* 868CC 800968CC 00000000 */   nop
endlabel PROF_CpuEnd__Fv
