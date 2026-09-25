.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FreeKanji__Fv, 0xC

glabel FreeKanji__Fv
    /* 9D2C4 800AD2C4 4C0B80AF */  sw         $zero, %gp_rel(D_8011B2CC)($gp)
    /* 9D2C8 800AD2C8 0800E003 */  jr         $ra
    /* 9D2CC 800AD2CC 00000000 */   nop
endlabel FreeKanji__Fv
