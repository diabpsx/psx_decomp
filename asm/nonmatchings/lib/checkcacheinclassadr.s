.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching checkcacheinclassadr, 0x34

glabel checkcacheinclassadr
    /* 1A110 8002A110 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1A114 8002A114 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1A118 8002A118 51A8000C */  jal        checkcacheinclassblock
    /* 1A11C 8002A11C 00000000 */   nop
    /* 1A120 8002A120 03004014 */  bnez       $v0, .L8002A130
    /* 1A124 8002A124 00000000 */   nop
    /* 1A128 8002A128 4DA80008 */  j          .L8002A134
    /* 1A12C 8002A12C 21100000 */   addu      $v0, $zero, $zero
  .L8002A130:
    /* 1A130 8002A130 0000428C */  lw         $v0, 0x0($v0)
  .L8002A134:
    /* 1A134 8002A134 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1A138 8002A138 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1A13C 8002A13C 0800E003 */  jr         $ra
    /* 1A140 8002A140 00000000 */   nop
endlabel checkcacheinclassadr
