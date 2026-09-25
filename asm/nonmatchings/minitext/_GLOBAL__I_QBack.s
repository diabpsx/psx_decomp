.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _GLOBAL__I_QBack, 0x28

glabel _GLOBAL__I_QBack
    /* 3E964 8004E964 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 3E968 8004E968 1000BFAF */  sw         $ra, 0x10($sp)
    /* 3E96C 8004E96C 0D80043C */  lui        $a0, %hi(QBack)
    /* 3E970 8004E970 90678424 */  addiu      $a0, $a0, %lo(QBack)
    /* 3E974 8004E974 773A010C */  jal        __6Dialog_8004e9dc
    /* 3E978 8004E978 00000000 */   nop
    /* 3E97C 8004E97C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 3E980 8004E980 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 3E984 8004E984 0800E003 */  jr         $ra
    /* 3E988 8004E988 00000000 */   nop
endlabel _GLOBAL__I_QBack
