.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ClearFont__5CFont_8013e0b8, 0x24

glabel ClearFont__5CFont_8013e0b8
    /* 44C0 8013E0B8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 44C4 8013E0BC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 44C8 8013E0C0 1402848C */  lw         $a0, 0x214($a0)
    /* 44CC 8013E0C4 604F020C */  jal        GM_FinishedUsing__FP7TextDat
    /* 44D0 8013E0C8 00000000 */   nop
    /* 44D4 8013E0CC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 44D8 8013E0D0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 44DC 8013E0D4 0800E003 */  jr         $ra
    /* 44E0 8013E0D8 00000000 */   nop
endlabel ClearFont__5CFont_8013e0b8
