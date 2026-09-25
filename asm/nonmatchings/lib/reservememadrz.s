.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching reservememadrz, 0x30

glabel reservememadrz
    /* 1A600 8002A600 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1A604 8002A604 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1A608 8002A608 98A9000C */  jal        reservememblocka
    /* 1A60C 8002A60C 21380000 */   addu      $a3, $zero, $zero
    /* 1A610 8002A610 21184000 */  addu       $v1, $v0, $zero
    /* 1A614 8002A614 02006010 */  beqz       $v1, .L8002A620
    /* 1A618 8002A618 21100000 */   addu      $v0, $zero, $zero
    /* 1A61C 8002A61C 0000628C */  lw         $v0, 0x0($v1)
  .L8002A620:
    /* 1A620 8002A620 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1A624 8002A624 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1A628 8002A628 0800E003 */  jr         $ra
    /* 1A62C 8002A62C 00000000 */   nop
endlabel reservememadrz
