.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _GLOBAL__I_DrawHelp__Fv, 0x28

glabel _GLOBAL__I_DrawHelp__Fv
    /* 9EF88 800AEF88 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 9EF8C 800AEF8C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 9EF90 800AEF90 1280043C */  lui        $a0, %hi(D_80121C88)
    /* 9EF94 800AEF94 881C8424 */  addiu      $a0, $a0, %lo(D_80121C88)
    /* 9EF98 800AEF98 00BC020C */  jal        __6Dialog_800af000
    /* 9EF9C 800AEF9C 00000000 */   nop
    /* 9EFA0 800AEFA0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 9EFA4 800AEFA4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 9EFA8 800AEFA8 0800E003 */  jr         $ra
    /* 9EFAC 800AEFAC 00000000 */   nop
endlabel _GLOBAL__I_DrawHelp__Fv
