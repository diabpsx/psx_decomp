.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RemoveHelp__Fv, 0x14

glabel RemoveHelp__Fv
    /* 9E38C 800AE38C 600B80AF */  sw         $zero, %gp_rel(D_8011B2E0)($gp)
    /* 9E390 800AE390 1280013C */  lui        $at, %hi(cmenu)
    /* 9E394 800AE394 3CB220AC */  sw         $zero, %lo(cmenu)($at)
    /* 9E398 800AE398 0800E003 */  jr         $ra
    /* 9E39C 800AE39C 00000000 */   nop
endlabel RemoveHelp__Fv
