.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SCR_Open__Fv, 0x38

glabel SCR_Open__Fv
    /* 8AC84 8009AC84 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8AC88 8009AC88 1000BFAF */  sw         $ra, 0x10($sp)
    /* 8AC8C 8009AC8C 0D80043C */  lui        $a0, %hi(ThePals)
    /* 8AC90 8009AC90 ACBD8424 */  addiu      $a0, $a0, %lo(ThePals)
    /* 8AC94 8009AC94 1180053C */  lui        $a1, %hi(D_80110A74)
    /* 8AC98 8009AC98 740AA524 */  addiu      $a1, $a1, %lo(D_80110A74)
    /* 8AC9C 8009AC9C 596B020C */  jal        Init__13PalCollectionPC7InitPos
    /* 8ACA0 8009ACA0 00000000 */   nop
    /* 8ACA4 8009ACA4 2F6B020C */  jal        SCR_DumpClut__Fv
    /* 8ACA8 8009ACA8 00000000 */   nop
    /* 8ACAC 8009ACAC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 8ACB0 8009ACB0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 8ACB4 8009ACB4 0800E003 */  jr         $ra
    /* 8ACB8 8009ACB8 00000000 */   nop
endlabel SCR_Open__Fv
