.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PROF_CpuStart__Fv, 0x24

glabel PROF_CpuStart__Fv
    /* 868D0 800968D0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 868D4 800968D4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 868D8 800968D8 BC83000C */  jal        GTIMSYS_GetTimer
    /* 868DC 800968DC 00000000 */   nop
    /* 868E0 800968E0 081F82AF */  sw         $v0, %gp_rel(D_8011C688)($gp)
    /* 868E4 800968E4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 868E8 800968E8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 868EC 800968EC 0800E003 */  jr         $ra
    /* 868F0 800968F0 00000000 */   nop
endlabel PROF_CpuStart__Fv
