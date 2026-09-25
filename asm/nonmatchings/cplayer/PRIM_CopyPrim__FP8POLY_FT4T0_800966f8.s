.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PRIM_CopyPrim__FP8POLY_FT4T0_800966f8, 0x28

glabel PRIM_CopyPrim__FP8POLY_FT4T0_800966f8
    /* 866F8 800966F8 21180000 */  addu       $v1, $zero, $zero
  .L800966FC:
    /* 866FC 800966FC 0000A28C */  lw         $v0, 0x0($a1)
    /* 86700 80096700 0400A524 */  addiu      $a1, $a1, 0x4
    /* 86704 80096704 01006324 */  addiu      $v1, $v1, 0x1
    /* 86708 80096708 000082AC */  sw         $v0, 0x0($a0)
    /* 8670C 8009670C 0A00622C */  sltiu      $v0, $v1, 0xA
    /* 86710 80096710 FAFF4014 */  bnez       $v0, .L800966FC
    /* 86714 80096714 04008424 */   addiu     $a0, $a0, 0x4
    /* 86718 80096718 0800E003 */  jr         $ra
    /* 8671C 8009671C 00000000 */   nop
endlabel PRIM_CopyPrim__FP8POLY_FT4T0_800966f8
