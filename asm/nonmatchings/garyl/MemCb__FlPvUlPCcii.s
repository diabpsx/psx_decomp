.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MemCb__FlPvUlPCcii, 0x24

glabel MemCb__FlPvUlPCcii
    /* 745BC 800845BC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 745C0 800845C0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 745C4 800845C4 7C0385AF */  sw         $a1, %gp_rel(LastAddr)($gp)
    /* 745C8 800845C8 9983000C */  jal        DBG_Halt
    /* 745CC 800845CC 00000000 */   nop
    /* 745D0 800845D0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 745D4 800845D4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 745D8 800845D8 0800E003 */  jr         $ra
    /* 745DC 800845DC 00000000 */   nop
endlabel MemCb__FlPvUlPCcii
