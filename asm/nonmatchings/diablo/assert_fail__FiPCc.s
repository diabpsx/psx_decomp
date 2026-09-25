.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching assert_fail__FiPCc, 0x20

glabel assert_fail__FiPCc
    /* 29EE8 80039EE8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 29EEC 80039EEC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 29EF0 80039EF0 9983000C */  jal        DBG_Halt
    /* 29EF4 80039EF4 00000000 */   nop
    /* 29EF8 80039EF8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 29EFC 80039EFC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 29F00 80039F00 0800E003 */  jr         $ra
    /* 29F04 80039F04 00000000 */   nop
endlabel assert_fail__FiPCc
