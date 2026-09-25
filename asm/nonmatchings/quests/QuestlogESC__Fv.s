.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching QuestlogESC__Fv, 0x28

glabel QuestlogESC__Fv
    /* 59144 80069144 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 59148 80069148 1000BFAF */  sw         $ra, 0x10($sp)
    /* 5914C 8006914C C6F5000C */  jal        PlaySFX__Fi
    /* 59150 80069150 33000424 */   addiu     $a0, $zero, 0x33
    /* 59154 80069154 F0A3010C */  jal        RemoveQLog__Fv
    /* 59158 80069158 00000000 */   nop
    /* 5915C 8006915C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 59160 80069160 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 59164 80069164 0800E003 */  jr         $ra
    /* 59168 80069168 00000000 */   nop
endlabel QuestlogESC__Fv
