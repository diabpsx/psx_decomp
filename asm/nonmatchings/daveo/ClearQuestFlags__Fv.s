.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ClearQuestFlags__Fv, 0x20

glabel ClearQuestFlags__Fv
    /* 757F8 800857F8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 757FC 800857FC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 75800 80085800 3415020C */  jal        EnableQuestItemsPleeeeeeeeeeeeeeeeeez__Fv
    /* 75804 80085804 00000000 */   nop
    /* 75808 80085808 1000BF8F */  lw         $ra, 0x10($sp)
    /* 7580C 8008580C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 75810 80085810 0800E003 */  jr         $ra
    /* 75814 80085814 00000000 */   nop
endlabel ClearQuestFlags__Fv
