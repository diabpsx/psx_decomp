.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TSK_SetExecFilter, 0x18

glabel TSK_SetExecFilter
    /* 10730 80020730 1280013C */  lui        $at, %hi(D_8011C99C)
    /* 10734 80020734 9CC924AC */  sw         $a0, %lo(D_8011C99C)($at)
    /* 10738 80020738 1280013C */  lui        $at, %hi(D_8011C9A0)
    /* 1073C 8002073C A0C925AC */  sw         $a1, %lo(D_8011C9A0)($at)
    /* 10740 80020740 0800E003 */  jr         $ra
    /* 10744 80020744 00000000 */   nop
endlabel TSK_SetExecFilter
