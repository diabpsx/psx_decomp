.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TSK_SetStackFloodCallback, 0x18

glabel TSK_SetStackFloodCallback
    /* 10B44 80020B44 1280023C */  lui        $v0, %hi(D_8011C9C0)
    /* 10B48 80020B48 C0C9428C */  lw         $v0, %lo(D_8011C9C0)($v0)
    /* 10B4C 80020B4C 1280013C */  lui        $at, %hi(D_8011C9C0)
    /* 10B50 80020B50 C0C924AC */  sw         $a0, %lo(D_8011C9C0)($at)
    /* 10B54 80020B54 0800E003 */  jr         $ra
    /* 10B58 80020B58 00000000 */   nop
endlabel TSK_SetStackFloodCallback
