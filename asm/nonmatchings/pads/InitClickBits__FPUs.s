.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitClickBits__FPUs, 0x20

glabel InitClickBits__FPUs
    /* 79B24 80089B24 0F000224 */  addiu      $v0, $zero, 0xF
    /* 79B28 80089B28 1E008424 */  addiu      $a0, $a0, 0x1E
  .L80089B2C:
    /* 79B2C 80089B2C 000080A4 */  sh         $zero, 0x0($a0)
    /* 79B30 80089B30 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 79B34 80089B34 FDFF4104 */  bgez       $v0, .L80089B2C
    /* 79B38 80089B38 FEFF8424 */   addiu     $a0, $a0, -0x2
    /* 79B3C 80089B3C 0800E003 */  jr         $ra
    /* 79B40 80089B40 00000000 */   nop
endlabel InitClickBits__FPUs
