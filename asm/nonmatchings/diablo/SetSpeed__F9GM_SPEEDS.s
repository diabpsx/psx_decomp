.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetSpeed__F9GM_SPEEDS, 0x14

glabel SetSpeed__F9GM_SPEEDS
    /* 29BA8 80039BA8 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 29BAC 80039BAC 581082AF */  sw         $v0, %gp_rel(LastFrCount)($gp)
    /* 29BB0 80039BB0 5C1084AF */  sw         $a0, %gp_rel(GameSpeed)($gp)
    /* 29BB4 80039BB4 0800E003 */  jr         $ra
    /* 29BB8 80039BB8 00000000 */   nop
endlabel SetSpeed__F9GM_SPEEDS
