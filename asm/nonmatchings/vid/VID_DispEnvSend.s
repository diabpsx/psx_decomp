.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching VID_DispEnvSend, 0x58

glabel VID_DispEnvSend
    /* 74104 80084104 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 74108 80084108 1400BFAF */  sw         $ra, 0x14($sp)
    /* 7410C 8008410C 7443000C */  jal        ReloadGP
    /* 74110 80084110 1000B0AF */   sw        $s0, 0x10($sp)
    /* 74114 80084114 B01E838F */  lw         $v1, %gp_rel(D_8011C630)($gp)
    /* 74118 80084118 00000000 */  nop
    /* 7411C 8008411C 01006324 */  addiu      $v1, $v1, 0x1
    /* 74120 80084120 B01E83AF */  sw         $v1, %gp_rel(D_8011C630)($gp)
    /* 74124 80084124 AC1E838F */  lw         $v1, %gp_rel(D_8011C62C)($gp)
    /* 74128 80084128 00000000 */  nop
    /* 7412C 8008412C 04006010 */  beqz       $v1, .L80084140
    /* 74130 80084130 21804000 */   addu      $s0, $v0, $zero
    /* 74134 80084134 09F86000 */  jalr       $v1
    /* 74138 80084138 00000000 */   nop
    /* 7413C 8008413C AC1E80AF */  sw         $zero, %gp_rel(D_8011C62C)($gp)
  .L80084140:
    /* 74140 80084140 7943000C */  jal        SetGP
    /* 74144 80084144 21200002 */   addu      $a0, $s0, $zero
    /* 74148 80084148 1400BF8F */  lw         $ra, 0x14($sp)
    /* 7414C 8008414C 1000B08F */  lw         $s0, 0x10($sp)
    /* 74150 80084150 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 74154 80084154 0800E003 */  jr         $ra
    /* 74158 80084158 00000000 */   nop
endlabel VID_DispEnvSend
