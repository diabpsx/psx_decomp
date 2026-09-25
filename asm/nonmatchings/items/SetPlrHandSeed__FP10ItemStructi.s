.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetPlrHandSeed__FP10ItemStructi, 0x8

glabel SetPlrHandSeed__FP10ItemStructi
    /* 2FE74 8003FE74 0800E003 */  jr         $ra
    /* 2FE78 8003FE78 100085AC */   sw        $a1, 0x10($a0)
endlabel SetPlrHandSeed__FP10ItemStructi
