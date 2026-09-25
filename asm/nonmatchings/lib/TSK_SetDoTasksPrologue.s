.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TSK_SetDoTasksPrologue, 0x18

glabel TSK_SetDoTasksPrologue
    /* 10A88 80020A88 1280023C */  lui        $v0, %hi(D_8011C9B8)
    /* 10A8C 80020A8C B8C9428C */  lw         $v0, %lo(D_8011C9B8)($v0)
    /* 10A90 80020A90 1280013C */  lui        $at, %hi(D_8011C9B8)
    /* 10A94 80020A94 B8C924AC */  sw         $a0, %lo(D_8011C9B8)($at)
    /* 10A98 80020A98 0800E003 */  jr         $ra
    /* 10A9C 80020A9C 00000000 */   nop
endlabel TSK_SetDoTasksPrologue
