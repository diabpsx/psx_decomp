.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StartAutomap__Fv, 0x10

glabel StartAutomap__Fv
    /* 28360 80161F58 01000224 */  addiu      $v0, $zero, 0x1
    /* 28364 80161F5C FB1B82A3 */  sb         $v0, %gp_rel(automapflag)($gp)
    /* 28368 80161F60 0800E003 */  jr         $ra
    /* 2836C 80161F64 00000000 */   nop
endlabel StartAutomap__Fv
