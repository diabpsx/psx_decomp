.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching remove_comboval__Fib, 0x48

glabel remove_comboval__Fib
    /* 8C918 8009C918 FFFF0724 */  addiu      $a3, $zero, -0x1
    /* 8C91C 8009C91C 21300000 */  addu       $a2, $zero, $zero
    /* 8C920 8009C920 0D80033C */  lui        $v1, %hi(txt_actions + 0xC)
    /* 8C924 8009C924 18C46324 */  addiu      $v1, $v1, %lo(txt_actions + 0xC)
  .L8009C928:
    /* 8C928 8009C928 0000628C */  lw         $v0, 0x0($v1)
    /* 8C92C 8009C92C 00000000 */  nop
    /* 8C930 8009C930 03004410 */  beq        $v0, $a0, .L8009C940
    /* 8C934 8009C934 00000000 */   nop
    /* 8C938 8009C938 0300A010 */  beqz       $a1, .L8009C948
    /* 8C93C 8009C93C 00000000 */   nop
  .L8009C940:
    /* 8C940 8009C940 000060AC */  sw         $zero, 0x0($v1)
    /* 8C944 8009C944 FFFF0724 */  addiu      $a3, $zero, -0x1
  .L8009C948:
    /* 8C948 8009C948 0100C624 */  addiu      $a2, $a2, 0x1
    /* 8C94C 8009C94C 1400C228 */  slti       $v0, $a2, 0x14
    /* 8C950 8009C950 F5FF4014 */  bnez       $v0, .L8009C928
    /* 8C954 8009C954 10006324 */   addiu     $v1, $v1, 0x10
    /* 8C958 8009C958 0800E003 */  jr         $ra
    /* 8C95C 8009C95C 2110E000 */   addu      $v0, $a3, $zero
endlabel remove_comboval__Fib
