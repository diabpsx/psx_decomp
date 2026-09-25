.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitPanelStr__Fv, 0x20

glabel InitPanelStr__Fv
    /* 21F50 80031F50 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 21F54 80031F54 1000BFAF */  sw         $ra, 0x10($sp)
    /* 21F58 80031F58 C8C7000C */  jal        ClearPanel__Fv
    /* 21F5C 80031F5C 00000000 */   nop
    /* 21F60 80031F60 1000BF8F */  lw         $ra, 0x10($sp)
    /* 21F64 80031F64 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 21F68 80031F68 0800E003 */  jr         $ra
    /* 21F6C 80031F6C 00000000 */   nop
endlabel InitPanelStr__Fv
