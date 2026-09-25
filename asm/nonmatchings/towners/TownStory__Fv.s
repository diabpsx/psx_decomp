.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TownStory__Fv, 0x28

glabel TownStory__Fv
    /* 2B428 8003B428 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2B42C 8003B42C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 2B430 8003B430 E2E7000C */  jal        GetActiveTowner__Fi
    /* 2B434 8003B434 04000424 */   addiu     $a0, $zero, 0x4
    /* 2B438 8003B438 42EC000C */  jal        TownCtrlMsg__Fi
    /* 2B43C 8003B43C 21204000 */   addu      $a0, $v0, $zero
    /* 2B440 8003B440 1000BF8F */  lw         $ra, 0x10($sp)
    /* 2B444 8003B444 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2B448 8003B448 0800E003 */  jr         $ra
    /* 2B44C 8003B44C 00000000 */   nop
endlabel TownStory__Fv
