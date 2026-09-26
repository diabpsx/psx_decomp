.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ___6Dialog_80161e80, 0x28

glabel ___6Dialog_80161e80
    /* 28288 80161E80 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2828C 80161E84 0100A530 */  andi       $a1, $a1, 0x1
    /* 28290 80161E88 0300A010 */  beqz       $a1, .L80161E98
    /* 28294 80161E8C 1000BFAF */   sw        $ra, 0x10($sp)
    /* 28298 80161E90 BE44000C */  jal        __builtin_delete
    /* 2829C 80161E94 00000000 */   nop
  .L80161E98:
    /* 282A0 80161E98 1000BF8F */  lw         $ra, 0x10($sp)
    /* 282A4 80161E9C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 282A8 80161EA0 0800E003 */  jr         $ra
    /* 282AC 80161EA4 00000000 */   nop
endlabel ___6Dialog_80161e80
