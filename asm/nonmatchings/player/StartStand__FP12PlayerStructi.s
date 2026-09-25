.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StartStand__FP12PlayerStructi, 0x8C

glabel StartStand__FP12PlayerStructi
    /* 50E10 80060E10 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 50E14 80060E14 1000B0AF */  sw         $s0, 0x10($sp)
    /* 50E18 80060E18 21808000 */  addu       $s0, $a0, $zero
    /* 50E1C 80060E1C 1400BFAF */  sw         $ra, 0x14($sp)
    /* 50E20 80060E20 D3000292 */  lbu        $v0, 0xD3($s0)
    /* 50E24 80060E24 00000000 */  nop
    /* 50E28 80060E28 0D004010 */  beqz       $v0, .L80060E60
    /* 50E2C 80060E2C 420005A2 */   sb        $a1, 0x42($s0)
    /* 50E30 80060E30 1C01028E */  lw         $v0, 0x11C($s0)
    /* 50E34 80060E34 00000000 */  nop
    /* 50E38 80060E38 09004014 */  bnez       $v0, .L80060E60
    /* 50E3C 80060E3C 00000000 */   nop
    /* 50E40 80060E40 677F010C */  jal        ismyplr__FP12PlayerStruct
    /* 50E44 80060E44 00000000 */   nop
    /* 50E48 80060E48 05004010 */  beqz       $v0, .L80060E60
    /* 50E4C 80060E4C 21200002 */   addu      $a0, $s0, $zero
    /* 50E50 80060E50 1587010C */  jal        StartPlrKill__FP12PlayerStructi
    /* 50E54 80060E54 FFFF0524 */   addiu     $a1, $zero, -0x1
    /* 50E58 80060E58 A2830108 */  j          .L80060E88
    /* 50E5C 80060E5C 00000000 */   nop
  .L80060E60:
    /* 50E60 80060E60 21200002 */  addu       $a0, $s0, $zero
    /* 50E64 80060E64 21280000 */  addu       $a1, $zero, $zero
    /* 50E68 80060E68 9001068E */  lw         $a2, 0x190($s0)
    /* 50E6C 80060E6C 877F010C */  jal        NewPlrAnim__FP12PlayerStructiii
    /* 50E70 80060E70 03000724 */   addiu     $a3, $zero, 0x3
    /* 50E74 80060E74 21200002 */  addu       $a0, $s0, $zero
    /* 50E78 80060E78 01000224 */  addiu      $v0, $zero, 0x1
    /* 50E7C 80060E7C 000080AC */  sw         $zero, 0x0($a0)
    /* 50E80 80060E80 7F83010C */  jal        SetPlayerOld__FP12PlayerStruct
    /* 50E84 80060E84 5E0182A4 */   sh        $v0, 0x15E($a0)
  .L80060E88:
    /* 50E88 80060E88 1400BF8F */  lw         $ra, 0x14($sp)
    /* 50E8C 80060E8C 1000B08F */  lw         $s0, 0x10($sp)
    /* 50E90 80060E90 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 50E94 80060E94 0800E003 */  jr         $ra
    /* 50E98 80060E98 00000000 */   nop
endlabel StartStand__FP12PlayerStructi
