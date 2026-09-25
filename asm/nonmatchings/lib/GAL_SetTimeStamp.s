.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GAL_SetTimeStamp, 0x10

glabel GAL_SetTimeStamp
    /* 127A0 800227A0 1280013C */  lui        $at, %hi(D_8011C9D8)
    /* 127A4 800227A4 D8C924AC */  sw         $a0, %lo(D_8011C9D8)($at)
    /* 127A8 800227A8 0800E003 */  jr         $ra
    /* 127AC 800227AC 00000000 */   nop
endlabel GAL_SetTimeStamp
