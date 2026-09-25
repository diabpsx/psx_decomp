.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching validatememz, 0x20

glabel validatememz
    /* 1C660 8002C660 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1C664 8002C664 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1C668 8002C668 3CB1000C */  jal        validatemema
    /* 1C66C 8002C66C 21200000 */   addu      $a0, $zero, $zero
    /* 1C670 8002C670 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1C674 8002C674 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1C678 8002C678 0800E003 */  jr         $ra
    /* 1C67C 8002C67C 00000000 */   nop
endlabel validatememz
