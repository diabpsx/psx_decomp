.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching reserveioforasync, 0x10

glabel reserveioforasync
    /* 19050 80029050 01000224 */  addiu      $v0, $zero, 0x1
    /* 19054 80029054 D81C82AF */  sw         $v0, %gp_rel(relinquishio)($gp)
    /* 19058 80029058 0800E003 */  jr         $ra
    /* 1905C 8002905C 00000000 */   nop
endlabel reserveioforasync
