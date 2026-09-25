.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching psxcdromseek, 0x20

glabel psxcdromseek
    /* 173B8 800273B8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 173BC 800273BC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 173C0 800273C0 229D000C */  jal        psxcdromasyncseek
    /* 173C4 800273C4 00000000 */   nop
    /* 173C8 800273C8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 173CC 800273CC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 173D0 800273D0 0800E003 */  jr         $ra
    /* 173D4 800273D4 00000000 */   nop
endlabel psxcdromseek
