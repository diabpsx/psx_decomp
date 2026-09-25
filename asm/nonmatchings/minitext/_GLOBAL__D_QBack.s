.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _GLOBAL__D_QBack, 0x28

glabel _GLOBAL__D_QBack
    /* 3E93C 8004E93C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 3E940 8004E940 1000BFAF */  sw         $ra, 0x10($sp)
    /* 3E944 8004E944 0D80043C */  lui        $a0, %hi(QBack)
    /* 3E948 8004E948 90678424 */  addiu      $a0, $a0, %lo(QBack)
    /* 3E94C 8004E94C 6D3A010C */  jal        ___6Dialog_8004e9b4
    /* 3E950 8004E950 02000524 */   addiu     $a1, $zero, 0x2
    /* 3E954 8004E954 1000BF8F */  lw         $ra, 0x10($sp)
    /* 3E958 8004E958 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 3E95C 8004E95C 0800E003 */  jr         $ra
    /* 3E960 8004E960 00000000 */   nop
endlabel _GLOBAL__D_QBack
