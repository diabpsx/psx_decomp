.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TSK_SetEpiProFilter, 0x18

glabel TSK_SetEpiProFilter
    /* 10AE8 80020AE8 1280013C */  lui        $at, %hi(D_8011C9B0)
    /* 10AEC 80020AEC B0C924AC */  sw         $a0, %lo(D_8011C9B0)($at)
    /* 10AF0 80020AF0 1280013C */  lui        $at, %hi(D_8011C9B4)
    /* 10AF4 80020AF4 B4C924AC */  sw         $a0, %lo(D_8011C9B4)($at)
    /* 10AF8 80020AF8 0800E003 */  jr         $ra
    /* 10AFC 80020AFC 00000000 */   nop
endlabel TSK_SetEpiProFilter
