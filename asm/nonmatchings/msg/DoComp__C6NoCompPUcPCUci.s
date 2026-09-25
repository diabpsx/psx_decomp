.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DoComp__C6NoCompPUcPCUci, 0x38

glabel DoComp__C6NoCompPUcPCUci
    /* 42B6C 80052B6C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 42B70 80052B70 1000B0AF */  sw         $s0, 0x10($sp)
    /* 42B74 80052B74 2180E000 */  addu       $s0, $a3, $zero
    /* 42B78 80052B78 2120A000 */  addu       $a0, $a1, $zero
    /* 42B7C 80052B7C 2128C000 */  addu       $a1, $a2, $zero
    /* 42B80 80052B80 1400BFAF */  sw         $ra, 0x14($sp)
    /* 42B84 80052B84 8B67000C */  jal        memcpy
    /* 42B88 80052B88 21300002 */   addu      $a2, $s0, $zero
    /* 42B8C 80052B8C 21100002 */  addu       $v0, $s0, $zero
    /* 42B90 80052B90 1400BF8F */  lw         $ra, 0x14($sp)
    /* 42B94 80052B94 1000B08F */  lw         $s0, 0x10($sp)
    /* 42B98 80052B98 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 42B9C 80052B9C 0800E003 */  jr         $ra
    /* 42BA0 80052BA0 00000000 */   nop
endlabel DoComp__C6NoCompPUcPCUci
