.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching VID_AfterDisplay__Fv, 0x28

glabel VID_AfterDisplay__Fv
    /* 74030 80084030 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 74034 80084034 1000BFAF */  sw         $ra, 0x10($sp)
    /* 74038 80084038 D70E020C */  jal        PRIM_Flush__Fv
    /* 7403C 8008403C 00000000 */   nop
    /* 74040 80084040 B4B4020C */  jal        ClearKanjiCount__Fv
    /* 74044 80084044 00000000 */   nop
    /* 74048 80084048 1000BF8F */  lw         $ra, 0x10($sp)
    /* 7404C 8008404C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 74050 80084050 0800E003 */  jr         $ra
    /* 74054 80084054 00000000 */   nop
endlabel VID_AfterDisplay__Fv
