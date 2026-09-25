.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching reservememadra, 0x30

glabel reservememadra
    /* 1A630 8002A630 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1A634 8002A634 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1A638 8002A638 98A9000C */  jal        reservememblocka
    /* 1A63C 8002A63C 00000000 */   nop
    /* 1A640 8002A640 21184000 */  addu       $v1, $v0, $zero
    /* 1A644 8002A644 02006010 */  beqz       $v1, .L8002A650
    /* 1A648 8002A648 21100000 */   addu      $v0, $zero, $zero
    /* 1A64C 8002A64C 0000628C */  lw         $v0, 0x0($v1)
  .L8002A650:
    /* 1A650 8002A650 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1A654 8002A654 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1A658 8002A658 0800E003 */  jr         $ra
    /* 1A65C 8002A65C 00000000 */   nop
endlabel reservememadra
