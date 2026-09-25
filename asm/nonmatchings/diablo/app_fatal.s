.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching app_fatal, 0x30

glabel app_fatal
    /* 29F08 80039F08 0000A4AF */  sw         $a0, 0x0($sp)
    /* 29F0C 80039F0C 0400A5AF */  sw         $a1, 0x4($sp)
    /* 29F10 80039F10 0800A6AF */  sw         $a2, 0x8($sp)
    /* 29F14 80039F14 0C00A7AF */  sw         $a3, 0xC($sp)
    /* 29F18 80039F18 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 29F1C 80039F1C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 29F20 80039F20 9983000C */  jal        DBG_Halt
    /* 29F24 80039F24 00000000 */   nop
    /* 29F28 80039F28 1000BF8F */  lw         $ra, 0x10($sp)
    /* 29F2C 80039F2C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 29F30 80039F30 0800E003 */  jr         $ra
    /* 29F34 80039F34 00000000 */   nop
endlabel app_fatal
