.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetOTpos__6Dialogi, 0x14

glabel SetOTpos__6Dialogi
    /* 7D228 8008D228 0C00828C */  lw         $v0, 0xC($a0)
    /* 7D22C 8008D22C 0C0085AC */  sw         $a1, 0xC($a0)
    /* 7D230 8008D230 F40485AF */  sw         $a1, %gp_rel(MY_DialogOTpos)($gp)
    /* 7D234 8008D234 0800E003 */  jr         $ra
    /* 7D238 8008D238 00000000 */   nop
endlabel SetOTpos__6Dialogi
