.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ClearFont__5CFont, 0x24

glabel ClearFont__5CFont
    /* 7ACE4 8008ACE4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 7ACE8 8008ACE8 1000BFAF */  sw         $ra, 0x10($sp)
    /* 7ACEC 8008ACEC 1402848C */  lw         $a0, 0x214($a0)
    /* 7ACF0 8008ACF0 604F020C */  jal        GM_FinishedUsing__FP7TextDat
    /* 7ACF4 8008ACF4 00000000 */   nop
    /* 7ACF8 8008ACF8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 7ACFC 8008ACFC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 7AD00 8008AD00 0800E003 */  jr         $ra
    /* 7AD04 8008AD04 00000000 */   nop
endlabel ClearFont__5CFont
