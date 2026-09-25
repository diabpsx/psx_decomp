.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PRIM_CopyPrim__FP8POLY_FT4T0_80091bbc, 0x28

glabel PRIM_CopyPrim__FP8POLY_FT4T0_80091bbc
    /* 81BBC 80091BBC 21180000 */  addu       $v1, $zero, $zero
  .L80091BC0:
    /* 81BC0 80091BC0 0000A28C */  lw         $v0, 0x0($a1)
    /* 81BC4 80091BC4 0400A524 */  addiu      $a1, $a1, 0x4
    /* 81BC8 80091BC8 01006324 */  addiu      $v1, $v1, 0x1
    /* 81BCC 80091BCC 000082AC */  sw         $v0, 0x0($a0)
    /* 81BD0 80091BD0 0A00622C */  sltiu      $v0, $v1, 0xA
    /* 81BD4 80091BD4 FAFF4014 */  bnez       $v0, .L80091BC0
    /* 81BD8 80091BD8 04008424 */   addiu     $a0, $a0, 0x4
    /* 81BDC 80091BDC 0800E003 */  jr         $ra
    /* 81BE0 80091BE0 00000000 */   nop
endlabel PRIM_CopyPrim__FP8POLY_FT4T0_80091bbc
