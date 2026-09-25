.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching get_action_str__Fii, 0x78

glabel get_action_str__Fii
    /* 8C6B0 8009C6B0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8C6B4 8009C6B4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 8C6B8 8009C6B8 21388000 */  addu       $a3, $a0, $zero
    /* 8C6BC 8009C6BC 0D80043C */  lui        $a0, %hi(txt_actions)
    /* 8C6C0 8009C6C0 0CC48424 */  addiu      $a0, $a0, %lo(txt_actions)
    /* 8C6C4 8009C6C4 21300000 */  addu       $a2, $zero, $zero
    /* 8C6C8 8009C6C8 04008324 */  addiu      $v1, $a0, 0x4
  .L8009C6CC:
    /* 8C6CC 8009C6CC 0400A010 */  beqz       $a1, .L8009C6E0
    /* 8C6D0 8009C6D0 00000000 */   nop
    /* 8C6D4 8009C6D4 0800628C */  lw         $v0, 0x8($v1)
    /* 8C6D8 8009C6D8 B9710208 */  j          .L8009C6E4
    /* 8C6DC 8009C6DC 00000000 */   nop
  .L8009C6E0:
    /* 8C6E0 8009C6E0 0000628C */  lw         $v0, 0x0($v1)
  .L8009C6E4:
    /* 8C6E4 8009C6E4 00000000 */  nop
    /* 8C6E8 8009C6E8 06004714 */  bne        $v0, $a3, .L8009C704
    /* 8C6EC 8009C6EC 10006324 */   addiu     $v1, $v1, 0x10
    /* 8C6F0 8009C6F0 0000848C */  lw         $a0, 0x0($a0)
    /* 8C6F4 8009C6F4 4AED010C */  jal        GetStr__Fi
    /* 8C6F8 8009C6F8 00000000 */   nop
    /* 8C6FC 8009C6FC C6710208 */  j          .L8009C718
    /* 8C700 8009C700 00000000 */   nop
  .L8009C704:
    /* 8C704 8009C704 0100C624 */  addiu      $a2, $a2, 0x1
    /* 8C708 8009C708 1400C228 */  slti       $v0, $a2, 0x14
    /* 8C70C 8009C70C EFFF4014 */  bnez       $v0, .L8009C6CC
    /* 8C710 8009C710 10008424 */   addiu     $a0, $a0, 0x10
    /* 8C714 8009C714 21100000 */  addu       $v0, $zero, $zero
  .L8009C718:
    /* 8C718 8009C718 1000BF8F */  lw         $ra, 0x10($sp)
    /* 8C71C 8009C71C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 8C720 8009C720 0800E003 */  jr         $ra
    /* 8C724 8009C724 00000000 */   nop
endlabel get_action_str__Fii
