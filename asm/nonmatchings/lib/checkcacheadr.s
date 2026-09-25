.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching checkcacheadr, 0x34

glabel checkcacheadr
    /* 19F9C 80029F9C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 19FA0 80029FA0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 19FA4 80029FA4 F4A7000C */  jal        checkcacheblock
    /* 19FA8 80029FA8 00000000 */   nop
    /* 19FAC 80029FAC 03004014 */  bnez       $v0, .L80029FBC
    /* 19FB0 80029FB0 00000000 */   nop
    /* 19FB4 80029FB4 F0A70008 */  j          .L80029FC0
    /* 19FB8 80029FB8 21100000 */   addu      $v0, $zero, $zero
  .L80029FBC:
    /* 19FBC 80029FBC 0000428C */  lw         $v0, 0x0($v0)
  .L80029FC0:
    /* 19FC0 80029FC0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 19FC4 80029FC4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 19FC8 80029FC8 0800E003 */  jr         $ra
    /* 19FCC 80029FCC 00000000 */   nop
endlabel checkcacheadr
