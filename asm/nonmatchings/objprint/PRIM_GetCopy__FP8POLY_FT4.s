.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PRIM_GetCopy__FP8POLY_FT4, 0x3C

glabel PRIM_GetCopy__FP8POLY_FT4
    /* 6ED14 8007ED14 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 6ED18 8007ED18 1800B0AF */  sw         $s0, 0x18($sp)
    /* 6ED1C 8007ED1C 21808000 */  addu       $s0, $a0, $zero
    /* 6ED20 8007ED20 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 6ED24 8007ED24 5EFB010C */  jal        PRIM_GetPrim__FPP8POLY_FT4_8007ed78
    /* 6ED28 8007ED28 1000A427 */   addiu     $a0, $sp, 0x10
    /* 6ED2C 8007ED2C 1000A48F */  lw         $a0, 0x10($sp)
    /* 6ED30 8007ED30 54FB010C */  jal        PRIM_CopyPrim__FP8POLY_FT4T0
    /* 6ED34 8007ED34 21280002 */   addu      $a1, $s0, $zero
    /* 6ED38 8007ED38 1000A28F */  lw         $v0, 0x10($sp)
    /* 6ED3C 8007ED3C 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 6ED40 8007ED40 1800B08F */  lw         $s0, 0x18($sp)
    /* 6ED44 8007ED44 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 6ED48 8007ED48 0800E003 */  jr         $ra
    /* 6ED4C 8007ED4C 00000000 */   nop
endlabel PRIM_GetCopy__FP8POLY_FT4
