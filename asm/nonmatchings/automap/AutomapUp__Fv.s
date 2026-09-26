.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AutomapUp__Fv, 0x20

glabel AutomapUp__Fv
    /* 28370 80161F68 081C838F */  lw         $v1, %gp_rel(AutoMapYOfs)($gp)
    /* 28374 80161F6C 00000000 */  nop
    /* 28378 80161F70 D9FF6228 */  slti       $v0, $v1, -0x27
    /* 2837C 80161F74 02004014 */  bnez       $v0, .L80161F80
    /* 28380 80161F78 FEFF6224 */   addiu     $v0, $v1, -0x2
    /* 28384 80161F7C 081C82AF */  sw         $v0, %gp_rel(AutoMapYOfs)($gp)
  .L80161F80:
    /* 28388 80161F80 0800E003 */  jr         $ra
    /* 2838C 80161F84 00000000 */   nop
endlabel AutomapUp__Fv
