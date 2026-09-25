.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckDirs__7GamePadi, 0x30

glabel CheckDirs__7GamePadi
    /* 69280 80079280 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 69284 80079284 1000BFAF */  sw         $ra, 0x10($sp)
    /* 69288 80079288 0000828C */  lw         $v0, 0x0($a0)
    /* 6928C 8007928C 00000000 */  nop
    /* 69290 80079290 2800468C */  lw         $a2, 0x28($v0)
    /* 69294 80079294 2C00478C */  lw         $a3, 0x2C($v0)
    /* 69298 80079298 ACE4010C */  jal        CheckDirs__7GamePadiii
    /* 6929C 8007929C 00000000 */   nop
    /* 692A0 800792A0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 692A4 800792A4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 692A8 800792A8 0800E003 */  jr         $ra
    /* 692AC 800792AC 00000000 */   nop
endlabel CheckDirs__7GamePadi
