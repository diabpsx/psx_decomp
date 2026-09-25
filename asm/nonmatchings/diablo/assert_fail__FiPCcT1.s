.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching assert_fail__FiPCcT1, 0x20

glabel assert_fail__FiPCcT1
    /* 29EC8 80039EC8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 29ECC 80039ECC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 29ED0 80039ED0 9983000C */  jal        DBG_Halt
    /* 29ED4 80039ED4 00000000 */   nop
    /* 29ED8 80039ED8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 29EDC 80039EDC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 29EE0 80039EE0 0800E003 */  jr         $ra
    /* 29EE4 80039EE4 00000000 */   nop
endlabel assert_fail__FiPCcT1
