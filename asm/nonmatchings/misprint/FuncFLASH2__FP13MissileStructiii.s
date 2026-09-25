.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FuncFLASH2__FP13MissileStructiii, 0x8

glabel FuncFLASH2__FP13MissileStructiii
    /* 6D40C 8007D40C 0800E003 */  jr         $ra
    /* 6D410 8007D410 00000000 */   nop
endlabel FuncFLASH2__FP13MissileStructiii
