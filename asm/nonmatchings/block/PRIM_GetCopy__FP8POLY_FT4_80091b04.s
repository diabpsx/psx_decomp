.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PRIM_GetCopy__FP8POLY_FT4_80091b04, 0x3C

glabel PRIM_GetCopy__FP8POLY_FT4_80091b04
    /* 81B04 80091B04 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 81B08 80091B08 1800B0AF */  sw         $s0, 0x18($sp)
    /* 81B0C 80091B0C 21808000 */  addu       $s0, $a0, $zero
    /* 81B10 80091B10 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 81B14 80091B14 9046020C */  jal        PRIM_GetPrim__FPP8POLY_FT4_80091a40
    /* 81B18 80091B18 1000A427 */   addiu     $a0, $sp, 0x10
    /* 81B1C 80091B1C 1000A48F */  lw         $a0, 0x10($sp)
    /* 81B20 80091B20 EF46020C */  jal        PRIM_CopyPrim__FP8POLY_FT4T0_80091bbc
    /* 81B24 80091B24 21280002 */   addu      $a1, $s0, $zero
    /* 81B28 80091B28 1000A28F */  lw         $v0, 0x10($sp)
    /* 81B2C 80091B2C 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 81B30 80091B30 1800B08F */  lw         $s0, 0x18($sp)
    /* 81B34 80091B34 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 81B38 80091B38 0800E003 */  jr         $ra
    /* 81B3C 80091B3C 00000000 */   nop
endlabel PRIM_GetCopy__FP8POLY_FT4_80091b04
