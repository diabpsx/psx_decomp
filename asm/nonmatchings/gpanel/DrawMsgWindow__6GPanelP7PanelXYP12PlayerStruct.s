.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawMsgWindow__6GPanelP7PanelXYP12PlayerStruct, 0x50

glabel DrawMsgWindow__6GPanelP7PanelXYP12PlayerStruct
    /* 883E8 800983E8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 883EC 800983EC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 883F0 800983F0 2400A28C */  lw         $v0, 0x24($a1)
    /* 883F4 800983F4 00000000 */  nop
    /* 883F8 800983F8 0C0082A4 */  sh         $v0, 0xC($a0)
    /* 883FC 800983FC 2800A28C */  lw         $v0, 0x28($a1)
    /* 88400 80098400 00000000 */  nop
    /* 88404 80098404 0E0082A4 */  sh         $v0, 0xE($a0)
    /* 88408 80098408 2C00A28C */  lw         $v0, 0x2C($a1)
    /* 8840C 8009840C 00000000 */  nop
    /* 88410 80098410 100082A4 */  sh         $v0, 0x10($a0)
    /* 88414 80098414 3000A28C */  lw         $v0, 0x30($a1)
    /* 88418 80098418 00000000 */  nop
    /* 8841C 8009841C 120082A4 */  sh         $v0, 0x12($a0)
    /* 88420 80098420 E9CB000C */  jal        DrawInfoBox__FP4RECT
    /* 88424 80098424 0C008424 */   addiu     $a0, $a0, 0xC
    /* 88428 80098428 1000BF8F */  lw         $ra, 0x10($sp)
    /* 8842C 8009842C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 88430 80098430 0800E003 */  jr         $ra
    /* 88434 80098434 00000000 */   nop
endlabel DrawMsgWindow__6GPanelP7PanelXYP12PlayerStruct
