.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BL_AsyncLoadCallBack__Fi, 0x64

glabel BL_AsyncLoadCallBack__Fi
    /* 77E6C 80087E6C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 77E70 80087E70 1000B0AF */  sw         $s0, 0x10($sp)
    /* 77E74 80087E74 1400BFAF */  sw         $ra, 0x14($sp)
    /* 77E78 80087E78 7443000C */  jal        ReloadGP
    /* 77E7C 80087E7C 21808000 */   addu      $s0, $a0, $zero
    /* 77E80 80087E80 21200002 */  addu       $a0, $s0, $zero
    /* 77E84 80087E84 F0038393 */  lbu        $v1, %gp_rel(FileLoaded)($gp)
    /* 77E88 80087E88 21804000 */  addu       $s0, $v0, $zero
    /* 77E8C 80087E8C 01006324 */  addiu      $v1, $v1, 0x1
    /* 77E90 80087E90 F00383A3 */  sb         $v1, %gp_rel(FileLoaded)($gp)
    /* 77E94 80087E94 F2038393 */  lbu        $v1, %gp_rel(CurrAsync)($gp)
    /* 77E98 80087E98 F0038593 */  lbu        $a1, %gp_rel(FileLoaded)($gp)
    /* 77E9C 80087E9C 01006324 */  addiu      $v1, $v1, 0x1
    /* 77EA0 80087EA0 F20383A3 */  sb         $v1, %gp_rel(CurrAsync)($gp)
    /* 77EA4 80087EA4 9A90000C */  jal        cancelasyncload
    /* 77EA8 80087EA8 00000000 */   nop
    /* 77EAC 80087EAC 53BE000C */  jal        systemtask
    /* 77EB0 80087EB0 21200000 */   addu      $a0, $zero, $zero
    /* 77EB4 80087EB4 7943000C */  jal        SetGP
    /* 77EB8 80087EB8 21200002 */   addu      $a0, $s0, $zero
    /* 77EBC 80087EBC 1400BF8F */  lw         $ra, 0x14($sp)
    /* 77EC0 80087EC0 1000B08F */  lw         $s0, 0x10($sp)
    /* 77EC4 80087EC4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 77EC8 80087EC8 0800E003 */  jr         $ra
    /* 77ECC 80087ECC 00000000 */   nop
endlabel BL_AsyncLoadCallBack__Fi
