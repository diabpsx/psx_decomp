.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching reservememadr, 0x30

glabel reservememadr
    /* 1A5D0 8002A5D0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1A5D4 8002A5D4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1A5D8 8002A5D8 98A9000C */  jal        reservememblocka
    /* 1A5DC 8002A5DC 01000724 */   addiu     $a3, $zero, 0x1
    /* 1A5E0 8002A5E0 21184000 */  addu       $v1, $v0, $zero
    /* 1A5E4 8002A5E4 02006010 */  beqz       $v1, .L8002A5F0
    /* 1A5E8 8002A5E8 21100000 */   addu      $v0, $zero, $zero
    /* 1A5EC 8002A5EC 0000628C */  lw         $v0, 0x0($v1)
  .L8002A5F0:
    /* 1A5F0 8002A5F0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1A5F4 8002A5F4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1A5F8 8002A5F8 0800E003 */  jr         $ra
    /* 1A5FC 8002A5FC 00000000 */   nop
endlabel reservememadr
