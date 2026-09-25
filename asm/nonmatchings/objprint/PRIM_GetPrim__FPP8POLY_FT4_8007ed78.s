.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PRIM_GetPrim__FPP8POLY_FT4_8007ed78, 0x7C

glabel PRIM_GetPrim__FPP8POLY_FT4_8007ed78
    /* 6ED78 8007ED78 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 6ED7C 8007ED7C B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 6ED80 8007ED80 1280033C */  lui        $v1, %hi(AddrToAvoid)
    /* 6ED84 8007ED84 BCAA638C */  lw         $v1, %lo(AddrToAvoid)($v1)
    /* 6ED88 8007ED88 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 6ED8C 8007ED8C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 6ED90 8007ED90 21808000 */  addu       $s0, $a0, $zero
    /* 6ED94 8007ED94 90014224 */  addiu      $v0, $v0, 0x190
    /* 6ED98 8007ED98 2B104300 */  sltu       $v0, $v0, $v1
    /* 6ED9C 8007ED9C 06004014 */  bnez       $v0, .L8007EDB8
    /* 6EDA0 8007EDA0 1400BFAF */   sw        $ra, 0x14($sp)
    /* 6EDA4 8007EDA4 21200000 */  addu       $a0, $zero, $zero
    /* 6EDA8 8007EDA8 1280053C */  lui        $a1, %hi(D_80118D9C)
    /* 6EDAC 8007EDAC 9C8DA524 */  addiu      $a1, $a1, %lo(D_80118D9C)
    /* 6EDB0 8007EDB0 A583000C */  jal        DBG_Error
    /* 6EDB4 8007EDB4 44000624 */   addiu     $a2, $zero, 0x44
  .L8007EDB8:
    /* 6EDB8 8007EDB8 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 6EDBC 8007EDBC B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 6EDC0 8007EDC0 00000000 */  nop
    /* 6EDC4 8007EDC4 000002AE */  sw         $v0, 0x0($s0)
    /* 6EDC8 8007EDC8 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 6EDCC 8007EDCC B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 6EDD0 8007EDD0 00000000 */  nop
    /* 6EDD4 8007EDD4 28004224 */  addiu      $v0, $v0, 0x28
    /* 6EDD8 8007EDD8 1280013C */  lui        $at, %hi(ThisPrimAddr)
    /* 6EDDC 8007EDDC B8AA22AC */  sw         $v0, %lo(ThisPrimAddr)($at)
    /* 6EDE0 8007EDE0 1400BF8F */  lw         $ra, 0x14($sp)
    /* 6EDE4 8007EDE4 1000B08F */  lw         $s0, 0x10($sp)
    /* 6EDE8 8007EDE8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 6EDEC 8007EDEC 0800E003 */  jr         $ra
    /* 6EDF0 8007EDF0 00000000 */   nop
endlabel PRIM_GetPrim__FPP8POLY_FT4_8007ed78
