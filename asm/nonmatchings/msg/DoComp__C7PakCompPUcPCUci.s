.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DoComp__C7PakCompPUcPCUci, 0x28

glabel DoComp__C7PakCompPUcPCUci
    /* 42B18 80052B18 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 42B1C 80052B1C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 42B20 80052B20 2120A000 */  addu       $a0, $a1, $zero
    /* 42B24 80052B24 2128C000 */  addu       $a1, $a2, $zero
    /* 42B28 80052B28 21B8020C */  jal        PAK_DoPak__FPUcPCUci
    /* 42B2C 80052B2C 2130E000 */   addu      $a2, $a3, $zero
    /* 42B30 80052B30 1000BF8F */  lw         $ra, 0x10($sp)
    /* 42B34 80052B34 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 42B38 80052B38 0800E003 */  jr         $ra
    /* 42B3C 80052B3C 00000000 */   nop
endlabel DoComp__C7PakCompPUcPCUci
