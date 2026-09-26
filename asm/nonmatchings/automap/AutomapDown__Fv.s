.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AutomapDown__Fv, 0x20

glabel AutomapDown__Fv
    /* 28390 80161F88 081C838F */  lw         $v1, %gp_rel(AutoMapYOfs)($gp)
    /* 28394 80161F8C 00000000 */  nop
    /* 28398 80161F90 28006228 */  slti       $v0, $v1, 0x28
    /* 2839C 80161F94 02004010 */  beqz       $v0, .L80161FA0
    /* 283A0 80161F98 02006224 */   addiu     $v0, $v1, 0x2
    /* 283A4 80161F9C 081C82AF */  sw         $v0, %gp_rel(AutoMapYOfs)($gp)
  .L80161FA0:
    /* 283A8 80161FA0 0800E003 */  jr         $ra
    /* 283AC 80161FA4 00000000 */   nop
endlabel AutomapDown__Fv
