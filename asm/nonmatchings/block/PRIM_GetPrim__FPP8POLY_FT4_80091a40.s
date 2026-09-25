.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PRIM_GetPrim__FPP8POLY_FT4_80091a40, 0x7C

glabel PRIM_GetPrim__FPP8POLY_FT4_80091a40
    /* 81A40 80091A40 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 81A44 80091A44 B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 81A48 80091A48 1280033C */  lui        $v1, %hi(AddrToAvoid)
    /* 81A4C 80091A4C BCAA638C */  lw         $v1, %lo(AddrToAvoid)($v1)
    /* 81A50 80091A50 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 81A54 80091A54 1000B0AF */  sw         $s0, 0x10($sp)
    /* 81A58 80091A58 21808000 */  addu       $s0, $a0, $zero
    /* 81A5C 80091A5C 90014224 */  addiu      $v0, $v0, 0x190
    /* 81A60 80091A60 2B104300 */  sltu       $v0, $v0, $v1
    /* 81A64 80091A64 06004014 */  bnez       $v0, .L80091A80
    /* 81A68 80091A68 1400BFAF */   sw        $ra, 0x14($sp)
    /* 81A6C 80091A6C 21200000 */  addu       $a0, $zero, $zero
    /* 81A70 80091A70 1180053C */  lui        $a1, %hi(D_80110560)
    /* 81A74 80091A74 6005A524 */  addiu      $a1, $a1, %lo(D_80110560)
    /* 81A78 80091A78 A583000C */  jal        DBG_Error
    /* 81A7C 80091A7C 44000624 */   addiu     $a2, $zero, 0x44
  .L80091A80:
    /* 81A80 80091A80 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 81A84 80091A84 B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 81A88 80091A88 00000000 */  nop
    /* 81A8C 80091A8C 000002AE */  sw         $v0, 0x0($s0)
    /* 81A90 80091A90 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 81A94 80091A94 B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 81A98 80091A98 00000000 */  nop
    /* 81A9C 80091A9C 28004224 */  addiu      $v0, $v0, 0x28
    /* 81AA0 80091AA0 1280013C */  lui        $at, %hi(ThisPrimAddr)
    /* 81AA4 80091AA4 B8AA22AC */  sw         $v0, %lo(ThisPrimAddr)($at)
    /* 81AA8 80091AA8 1400BF8F */  lw         $ra, 0x14($sp)
    /* 81AAC 80091AAC 1000B08F */  lw         $s0, 0x10($sp)
    /* 81AB0 80091AB0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 81AB4 80091AB4 0800E003 */  jr         $ra
    /* 81AB8 80091AB8 00000000 */   nop
endlabel PRIM_GetPrim__FPP8POLY_FT4_80091a40
