.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PRIM_GetPrim__FPP8POLY_GT4, 0x7C

glabel PRIM_GetPrim__FPP8POLY_GT4
    /* 81B40 80091B40 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 81B44 80091B44 B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 81B48 80091B48 1280033C */  lui        $v1, %hi(AddrToAvoid)
    /* 81B4C 80091B4C BCAA638C */  lw         $v1, %lo(AddrToAvoid)($v1)
    /* 81B50 80091B50 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 81B54 80091B54 1000B0AF */  sw         $s0, 0x10($sp)
    /* 81B58 80091B58 21808000 */  addu       $s0, $a0, $zero
    /* 81B5C 80091B5C 08024224 */  addiu      $v0, $v0, 0x208
    /* 81B60 80091B60 2B104300 */  sltu       $v0, $v0, $v1
    /* 81B64 80091B64 06004014 */  bnez       $v0, .L80091B80
    /* 81B68 80091B68 1400BFAF */   sw        $ra, 0x14($sp)
    /* 81B6C 80091B6C 21200000 */  addu       $a0, $zero, $zero
    /* 81B70 80091B70 1180053C */  lui        $a1, %hi(D_80110560)
    /* 81B74 80091B74 6005A524 */  addiu      $a1, $a1, %lo(D_80110560)
    /* 81B78 80091B78 A583000C */  jal        DBG_Error
    /* 81B7C 80091B7C 44000624 */   addiu     $a2, $zero, 0x44
  .L80091B80:
    /* 81B80 80091B80 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 81B84 80091B84 B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 81B88 80091B88 00000000 */  nop
    /* 81B8C 80091B8C 000002AE */  sw         $v0, 0x0($s0)
    /* 81B90 80091B90 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 81B94 80091B94 B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 81B98 80091B98 00000000 */  nop
    /* 81B9C 80091B9C 34004224 */  addiu      $v0, $v0, 0x34
    /* 81BA0 80091BA0 1280013C */  lui        $at, %hi(ThisPrimAddr)
    /* 81BA4 80091BA4 B8AA22AC */  sw         $v0, %lo(ThisPrimAddr)($at)
    /* 81BA8 80091BA8 1400BF8F */  lw         $ra, 0x14($sp)
    /* 81BAC 80091BAC 1000B08F */  lw         $s0, 0x10($sp)
    /* 81BB0 80091BB0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 81BB4 80091BB4 0800E003 */  jr         $ra
    /* 81BB8 80091BB8 00000000 */   nop
endlabel PRIM_GetPrim__FPP8POLY_GT4
