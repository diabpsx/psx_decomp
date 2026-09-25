.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching VID_NextSyncRoutHasExecuted__Fv, 0xC

glabel VID_NextSyncRoutHasExecuted__Fv
    /* 740EC 800840EC AC1E828F */  lw         $v0, %gp_rel(D_8011C62C)($gp)
    /* 740F0 800840F0 0800E003 */  jr         $ra
    /* 740F4 800840F4 0100422C */   sltiu     $v0, $v0, 0x1
endlabel VID_NextSyncRoutHasExecuted__Fv
