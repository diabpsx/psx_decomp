.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GPUQ_InitModule__Fv, 0xC

glabel GPUQ_InitModule__Fv
    /* 733E4 800833E4 240380AF */  sw         $zero, %gp_rel(ArgsSoFar)($gp)
    /* 733E8 800833E8 0800E003 */  jr         $ra
    /* 733EC 800833EC 01000224 */   addiu     $v0, $zero, 0x1
endlabel GPUQ_InitModule__Fv
