.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching getdirectory, 0x28

glabel getdirectory
    /* 189F0 800289F0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 189F4 800289F4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 189F8 800289F8 0B80053C */  lui        $a1, %hi(currentdirectory)
    /* 189FC 800289FC 8469A524 */  addiu      $a1, $a1, %lo(currentdirectory)
    /* 18A00 80028A00 F240000C */  jal        strcpy
    /* 18A04 80028A04 00000000 */   nop
    /* 18A08 80028A08 1000BF8F */  lw         $ra, 0x10($sp)
    /* 18A0C 80028A0C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 18A10 80028A10 0800E003 */  jr         $ra
    /* 18A14 80028A14 00000000 */   nop
endlabel getdirectory
