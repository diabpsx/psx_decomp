.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __7TextDat, 0x34

glabel __7TextDat
    /* 81E54 80091E54 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 81E58 80091E58 1000B0AF */  sw         $s0, 0x10($sp)
    /* 81E5C 80091E5C 1400BFAF */  sw         $ra, 0x14($sp)
    /* 81E60 80091E60 A247020C */  jal        OnceOnlyInit__7TextDat
    /* 81E64 80091E64 21808000 */   addu      $s0, $a0, $zero
    /* 81E68 80091E68 954E020C */  jal        InitData__7TextDat
    /* 81E6C 80091E6C 21200002 */   addu      $a0, $s0, $zero
    /* 81E70 80091E70 21100002 */  addu       $v0, $s0, $zero
    /* 81E74 80091E74 1400BF8F */  lw         $ra, 0x14($sp)
    /* 81E78 80091E78 1000B08F */  lw         $s0, 0x10($sp)
    /* 81E7C 80091E7C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 81E80 80091E80 0800E003 */  jr         $ra
    /* 81E84 80091E84 00000000 */   nop
endlabel __7TextDat
