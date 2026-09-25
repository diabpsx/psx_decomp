.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GAL_SetVerbosity, 0x10

glabel GAL_SetVerbosity
    /* 12FF8 80022FF8 1280013C */  lui        $at, %hi(D_8011C9E8)
    /* 12FFC 80022FFC E8C924AC */  sw         $a0, %lo(D_8011C9E8)($at)
    /* 13000 80023000 0800E003 */  jr         $ra
    /* 13004 80023004 00000000 */   nop
endlabel GAL_SetVerbosity
