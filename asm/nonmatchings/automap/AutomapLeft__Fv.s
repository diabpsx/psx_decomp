.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AutomapLeft__Fv, 0x20

glabel AutomapLeft__Fv
    /* 283B0 80161FA8 041C838F */  lw         $v1, %gp_rel(AutoMapXOfs)($gp)
    /* 283B4 80161FAC 00000000 */  nop
    /* 283B8 80161FB0 B1FF6228 */  slti       $v0, $v1, -0x4F
    /* 283BC 80161FB4 02004014 */  bnez       $v0, .L80161FC0
    /* 283C0 80161FB8 FEFF6224 */   addiu     $v0, $v1, -0x2
    /* 283C4 80161FBC 041C82AF */  sw         $v0, %gp_rel(AutoMapXOfs)($gp)
  .L80161FC0:
    /* 283C8 80161FC0 0800E003 */  jr         $ra
    /* 283CC 80161FC4 00000000 */   nop
endlabel AutomapLeft__Fv
