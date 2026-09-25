.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoadFileInMem__FPCcPUl, 0x8

glabel LoadFileInMem__FPCcPUl
    /* 2DC2C 8003DC2C 0800E003 */  jr         $ra
    /* 2DC30 8003DC30 21100000 */   addu      $v0, $zero, $zero
endlabel LoadFileInMem__FPCcPUl
