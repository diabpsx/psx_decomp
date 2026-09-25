.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _GLOBAL__I_Pad0, 0x38

glabel _GLOBAL__I_Pad0
    /* 79BD0 80089BD0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 79BD4 80089BD4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 79BD8 80089BD8 0B80043C */  lui        $a0, %hi(Pad0)
    /* 79BDC 80089BDC 347D8424 */  addiu      $a0, $a0, %lo(Pad0)
    /* 79BE0 80089BE0 0B27020C */  jal        __4CPadi
    /* 79BE4 80089BE4 21280000 */   addu      $a1, $zero, $zero
    /* 79BE8 80089BE8 0B80043C */  lui        $a0, %hi(Pad1)
    /* 79BEC 80089BEC 207E8424 */  addiu      $a0, $a0, %lo(Pad1)
    /* 79BF0 80089BF0 0B27020C */  jal        __4CPadi
    /* 79BF4 80089BF4 01000524 */   addiu     $a1, $zero, 0x1
    /* 79BF8 80089BF8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 79BFC 80089BFC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 79C00 80089C00 0800E003 */  jr         $ra
    /* 79C04 80089C04 00000000 */   nop
endlabel _GLOBAL__I_Pad0
