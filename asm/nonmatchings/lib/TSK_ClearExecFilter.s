.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TSK_ClearExecFilter, 0x24

glabel TSK_ClearExecFilter
    /* 10748 80020748 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1074C 8002074C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 10750 80020750 21200000 */  addu       $a0, $zero, $zero
    /* 10754 80020754 CC81000C */  jal        TSK_SetExecFilter
    /* 10758 80020758 21280000 */   addu      $a1, $zero, $zero
    /* 1075C 8002075C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 10760 80020760 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 10764 80020764 0800E003 */  jr         $ra
    /* 10768 80020768 00000000 */   nop
endlabel TSK_ClearExecFilter
