.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DoDecomp__C6NoCompPUcPCUcii, 0x2C

glabel DoDecomp__C6NoCompPUcPCUcii
    /* 42B40 80052B40 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 42B44 80052B44 2120A000 */  addu       $a0, $a1, $zero
    /* 42B48 80052B48 2128C000 */  addu       $a1, $a2, $zero
    /* 42B4C 80052B4C 2800A68F */  lw         $a2, 0x28($sp)
    /* 42B50 80052B50 1000BFAF */  sw         $ra, 0x10($sp)
    /* 42B54 80052B54 8B67000C */  jal        memcpy
    /* 42B58 80052B58 00000000 */   nop
    /* 42B5C 80052B5C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 42B60 80052B60 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 42B64 80052B64 0800E003 */  jr         $ra
    /* 42B68 80052B68 00000000 */   nop
endlabel DoDecomp__C6NoCompPUcPCUcii
