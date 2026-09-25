.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DoComp__C10CrunchCompPUcPCUci, 0x28

glabel DoComp__C10CrunchCompPUcPCUci
    /* 42ACC 80052ACC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 42AD0 80052AD0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 42AD4 80052AD4 2120C000 */  addu       $a0, $a2, $zero
    /* 42AD8 80052AD8 2130E000 */  addu       $a2, $a3, $zero
    /* 42ADC 80052ADC 7541000C */  jal        crunch
    /* 42AE0 80052AE0 00080724 */   addiu     $a3, $zero, 0x800
    /* 42AE4 80052AE4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 42AE8 80052AE8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 42AEC 80052AEC 0800E003 */  jr         $ra
    /* 42AF0 80052AF0 00000000 */   nop
endlabel DoComp__C10CrunchCompPUcPCUci
