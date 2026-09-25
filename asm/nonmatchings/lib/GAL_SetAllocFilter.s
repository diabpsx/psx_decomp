.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GAL_SetAllocFilter, 0x18

glabel GAL_SetAllocFilter
    /* 1309C 8002309C 1280023C */  lui        $v0, %hi(D_8011C9F4)
    /* 130A0 800230A0 F4C9428C */  lw         $v0, %lo(D_8011C9F4)($v0)
    /* 130A4 800230A4 1280013C */  lui        $at, %hi(D_8011C9F4)
    /* 130A8 800230A8 F4C924AC */  sw         $a0, %lo(D_8011C9F4)($at)
    /* 130AC 800230AC 0800E003 */  jr         $ra
    /* 130B0 800230B0 00000000 */   nop
endlabel GAL_SetAllocFilter
