.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching purgememadr, 0x28

glabel purgememadr
    /* 1AEE4 8002AEE4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1AEE8 8002AEE8 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1AEEC 8002AEEC B1AB000C */  jal        findmemblock
    /* 1AEF0 8002AEF0 00000000 */   nop
    /* 1AEF4 8002AEF4 C3AB000C */  jal        purgememblock
    /* 1AEF8 8002AEF8 21204000 */   addu      $a0, $v0, $zero
    /* 1AEFC 8002AEFC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1AF00 8002AF00 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1AF04 8002AF04 0800E003 */  jr         $ra
    /* 1AF08 8002AF08 00000000 */   nop
endlabel purgememadr
