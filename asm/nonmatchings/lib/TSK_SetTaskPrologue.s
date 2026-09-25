.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TSK_SetTaskPrologue, 0x18

glabel TSK_SetTaskPrologue
    /* 10AB8 80020AB8 1280023C */  lui        $v0, %hi(D_8011C9AC)
    /* 10ABC 80020ABC ACC9428C */  lw         $v0, %lo(D_8011C9AC)($v0)
    /* 10AC0 80020AC0 1280013C */  lui        $at, %hi(D_8011C9AC)
    /* 10AC4 80020AC4 ACC924AC */  sw         $a0, %lo(D_8011C9AC)($at)
    /* 10AC8 80020AC8 0800E003 */  jr         $ra
    /* 10ACC 80020ACC 00000000 */   nop
endlabel TSK_SetTaskPrologue
