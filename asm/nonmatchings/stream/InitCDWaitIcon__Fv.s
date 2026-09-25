.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitCDWaitIcon__Fv, 0x34

glabel InitCDWaitIcon__Fv
    /* 88AC4 80098AC4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 88AC8 80098AC8 00800434 */  ori        $a0, $zero, 0x8000
    /* 88ACC 80098ACC 0A80053C */  lui        $a1, %hi(PrintCDWaitTask__FP4TASK)
    /* 88AD0 80098AD0 8889A524 */  addiu      $a1, $a1, %lo(PrintCDWaitTask__FP4TASK)
    /* 88AD4 80098AD4 00080624 */  addiu      $a2, $zero, 0x800
    /* 88AD8 80098AD8 1000BFAF */  sw         $ra, 0x10($sp)
    /* 88ADC 80098ADC 6C0680AF */  sw         $zero, %gp_rel(CDWAIT)($gp)
    /* 88AE0 80098AE0 0480000C */  jal        TSK_AddTask
    /* 88AE4 80098AE4 21380000 */   addu      $a3, $zero, $zero
    /* 88AE8 80098AE8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 88AEC 80098AEC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 88AF0 80098AF0 0800E003 */  jr         $ra
    /* 88AF4 80098AF4 00000000 */   nop
endlabel InitCDWaitIcon__Fv
