.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_RESURRECT__FPC4TCmdi, 0x38

glabel On_RESURRECT__FPC4TCmdi
    /* 415D4 800515D4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 415D8 800515D8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 415DC 800515DC 2180A000 */  addu       $s0, $a1, $zero
    /* 415E0 800515E0 02008594 */  lhu        $a1, 0x2($a0)
    /* 415E4 800515E4 1400BFAF */  sw         $ra, 0x14($sp)
    /* 415E8 800515E8 14DE010C */  jal        DoResurrect__Fii
    /* 415EC 800515EC 21200002 */   addu      $a0, $s0, $zero
    /* 415F0 800515F0 DB3F010C */  jal        check_update_plr__Fi
    /* 415F4 800515F4 21200002 */   addu      $a0, $s0, $zero
    /* 415F8 800515F8 1400BF8F */  lw         $ra, 0x14($sp)
    /* 415FC 800515FC 1000B08F */  lw         $s0, 0x10($sp)
    /* 41600 80051600 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 41604 80051604 0800E003 */  jr         $ra
    /* 41608 80051608 00000000 */   nop
endlabel On_RESURRECT__FPC4TCmdi
