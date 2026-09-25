.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetupLocalPlayer__Fv, 0x10

glabel SetupLocalPlayer__Fv
    /* 4FD00 8005FD00 01000224 */  addiu      $v0, $zero, 0x1
    /* 4FD04 8005FD04 701282A3 */  sb         $v0, %gp_rel(gbValidSaveFile)($gp)
    /* 4FD08 8005FD08 0800E003 */  jr         $ra
    /* 4FD0C 8005FD0C 00000000 */   nop
endlabel SetupLocalPlayer__Fv
