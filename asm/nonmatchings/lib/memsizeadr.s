.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching memsizeadr, 0x24

glabel memsizeadr
    /* 1B780 8002B780 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1B784 8002B784 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1B788 8002B788 B1AB000C */  jal        findmemblock
    /* 1B78C 8002B78C 00000000 */   nop
    /* 1B790 8002B790 1400428C */  lw         $v0, 0x14($v0)
    /* 1B794 8002B794 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1B798 8002B798 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1B79C 8002B79C 0800E003 */  jr         $ra
    /* 1B7A0 8002B7A0 00000000 */   nop
endlabel memsizeadr
