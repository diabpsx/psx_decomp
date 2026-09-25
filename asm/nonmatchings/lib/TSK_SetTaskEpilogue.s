.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TSK_SetTaskEpilogue, 0x18

glabel TSK_SetTaskEpilogue
    /* 10AD0 80020AD0 1280023C */  lui        $v0, %hi(D_8011C9A8)
    /* 10AD4 80020AD4 A8C9428C */  lw         $v0, %lo(D_8011C9A8)($v0)
    /* 10AD8 80020AD8 1280013C */  lui        $at, %hi(D_8011C9A8)
    /* 10ADC 80020ADC A8C924AC */  sw         $a0, %lo(D_8011C9A8)($at)
    /* 10AE0 80020AE0 0800E003 */  jr         $ra
    /* 10AE4 80020AE4 00000000 */   nop
endlabel TSK_SetTaskEpilogue
