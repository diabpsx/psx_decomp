.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching abortablewait, 0x68

glabel abortablewait
    /* 1FA70 8002FA70 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1FA74 8002FA74 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1FA78 8002FA78 21808000 */  addu       $s0, $a0, $zero
    /* 1FA7C 8002FA7C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1FA80 8002FA80 1800BFAF */  sw         $ra, 0x18($sp)
    /* 1FA84 8002FA84 08C0000C */  jal        gettick
    /* 1FA88 8002FA88 21880000 */   addu      $s1, $zero, $zero
    /* 1FA8C 8002FA8C 21805000 */  addu       $s0, $v0, $s0
  .L8002FA90:
    /* 1FA90 8002FA90 08C0000C */  jal        gettick
    /* 1FA94 8002FA94 00000000 */   nop
    /* 1FA98 8002FA98 2A105000 */  slt        $v0, $v0, $s0
    /* 1FA9C 8002FA9C 07004010 */  beqz       $v0, .L8002FABC
    /* 1FAA0 8002FAA0 00000000 */   nop
    /* 1FAA4 8002FAA4 06002016 */  bnez       $s1, .L8002FAC0
    /* 1FAA8 8002FAA8 21102002 */   addu      $v0, $s1, $zero
    /* 1FAAC 8002FAAC 53BE000C */  jal        systemtask
    /* 1FAB0 8002FAB0 21200000 */   addu      $a0, $zero, $zero
    /* 1FAB4 8002FAB4 A4BE0008 */  j          .L8002FA90
    /* 1FAB8 8002FAB8 21884000 */   addu      $s1, $v0, $zero
  .L8002FABC:
    /* 1FABC 8002FABC 21102002 */  addu       $v0, $s1, $zero
  .L8002FAC0:
    /* 1FAC0 8002FAC0 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1FAC4 8002FAC4 1400B18F */  lw         $s1, 0x14($sp)
    /* 1FAC8 8002FAC8 1000B08F */  lw         $s0, 0x10($sp)
    /* 1FACC 8002FACC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1FAD0 8002FAD0 0800E003 */  jr         $ra
    /* 1FAD4 8002FAD4 00000000 */   nop
endlabel abortablewait
