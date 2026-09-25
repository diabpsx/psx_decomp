.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GAL_GetTimeStamp, 0x10

glabel GAL_GetTimeStamp
    /* 127D0 800227D0 1280023C */  lui        $v0, %hi(D_8011C9D8)
    /* 127D4 800227D4 D8C9428C */  lw         $v0, %lo(D_8011C9D8)($v0)
    /* 127D8 800227D8 0800E003 */  jr         $ra
    /* 127DC 800227DC 00000000 */   nop
endlabel GAL_GetTimeStamp
