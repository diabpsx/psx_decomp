.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TSK_GetFirstActive, 0x10

glabel TSK_GetFirstActive
    /* 10598 80020598 1280023C */  lui        $v0, %hi(D_8011C98C)
    /* 1059C 8002059C 8CC9428C */  lw         $v0, %lo(D_8011C98C)($v0)
    /* 105A0 800205A0 0800E003 */  jr         $ra
    /* 105A4 800205A4 00000000 */   nop
endlabel TSK_GetFirstActive
