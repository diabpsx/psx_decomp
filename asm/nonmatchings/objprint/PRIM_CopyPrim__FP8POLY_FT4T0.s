.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PRIM_CopyPrim__FP8POLY_FT4T0, 0x28

glabel PRIM_CopyPrim__FP8POLY_FT4T0
    /* 6ED50 8007ED50 21180000 */  addu       $v1, $zero, $zero
  .L8007ED54:
    /* 6ED54 8007ED54 0000A28C */  lw         $v0, 0x0($a1)
    /* 6ED58 8007ED58 0400A524 */  addiu      $a1, $a1, 0x4
    /* 6ED5C 8007ED5C 01006324 */  addiu      $v1, $v1, 0x1
    /* 6ED60 8007ED60 000082AC */  sw         $v0, 0x0($a0)
    /* 6ED64 8007ED64 0A00622C */  sltiu      $v0, $v1, 0xA
    /* 6ED68 8007ED68 FAFF4014 */  bnez       $v0, .L8007ED54
    /* 6ED6C 8007ED6C 04008424 */   addiu     $a0, $a0, 0x4
    /* 6ED70 8007ED70 0800E003 */  jr         $ra
    /* 6ED74 8007ED74 00000000 */   nop
endlabel PRIM_CopyPrim__FP8POLY_FT4T0
