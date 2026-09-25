.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TSK_GetCurrentTask, 0x10

glabel TSK_GetCurrentTask
    /* 106B0 800206B0 1280023C */  lui        $v0, %hi(D_8011C990)
    /* 106B4 800206B4 90C9428C */  lw         $v0, %lo(D_8011C990)($v0)
    /* 106B8 800206B8 0800E003 */  jr         $ra
    /* 106BC 800206BC 00000000 */   nop
endlabel TSK_GetCurrentTask
