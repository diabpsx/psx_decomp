.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TSK_SetDoTasksEpilogue, 0x18

glabel TSK_SetDoTasksEpilogue
    /* 10AA0 80020AA0 1280023C */  lui        $v0, %hi(D_8011C9BC)
    /* 10AA4 80020AA4 BCC9428C */  lw         $v0, %lo(D_8011C9BC)($v0)
    /* 10AA8 80020AA8 1280013C */  lui        $at, %hi(D_8011C9BC)
    /* 10AAC 80020AAC BCC924AC */  sw         $a0, %lo(D_8011C9BC)($at)
    /* 10AB0 80020AB0 0800E003 */  jr         $ra
    /* 10AB4 80020AB4 00000000 */   nop
endlabel TSK_SetDoTasksEpilogue
