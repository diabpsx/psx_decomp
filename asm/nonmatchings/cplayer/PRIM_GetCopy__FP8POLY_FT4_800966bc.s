.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PRIM_GetCopy__FP8POLY_FT4_800966bc, 0x3C

glabel PRIM_GetCopy__FP8POLY_FT4_800966bc
    /* 866BC 800966BC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 866C0 800966C0 1800B0AF */  sw         $s0, 0x18($sp)
    /* 866C4 800966C4 21808000 */  addu       $s0, $a0, $zero
    /* 866C8 800966C8 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 866CC 800966CC 9059020C */  jal        PRIM_GetPrim__FPP8POLY_FT4_80096640
    /* 866D0 800966D0 1000A427 */   addiu     $a0, $sp, 0x10
    /* 866D4 800966D4 1000A48F */  lw         $a0, 0x10($sp)
    /* 866D8 800966D8 BE59020C */  jal        PRIM_CopyPrim__FP8POLY_FT4T0_800966f8
    /* 866DC 800966DC 21280002 */   addu      $a1, $s0, $zero
    /* 866E0 800966E0 1000A28F */  lw         $v0, 0x10($sp)
    /* 866E4 800966E4 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 866E8 800966E8 1800B08F */  lw         $s0, 0x18($sp)
    /* 866EC 800966EC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 866F0 800966F0 0800E003 */  jr         $ra
    /* 866F4 800966F4 00000000 */   nop
endlabel PRIM_GetCopy__FP8POLY_FT4_800966bc
