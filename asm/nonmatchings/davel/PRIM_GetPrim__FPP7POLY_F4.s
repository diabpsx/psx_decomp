.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PRIM_GetPrim__FPP7POLY_F4, 0x7C

glabel PRIM_GetPrim__FPP7POLY_F4
    /* 90830 800A0830 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 90834 800A0834 B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 90838 800A0838 1280033C */  lui        $v1, %hi(AddrToAvoid)
    /* 9083C 800A083C BCAA638C */  lw         $v1, %lo(AddrToAvoid)($v1)
    /* 90840 800A0840 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 90844 800A0844 1000B0AF */  sw         $s0, 0x10($sp)
    /* 90848 800A0848 21808000 */  addu       $s0, $a0, $zero
    /* 9084C 800A084C F0004224 */  addiu      $v0, $v0, 0xF0
    /* 90850 800A0850 2B104300 */  sltu       $v0, $v0, $v1
    /* 90854 800A0854 06004014 */  bnez       $v0, .L800A0870
    /* 90858 800A0858 1400BFAF */   sw        $ra, 0x14($sp)
    /* 9085C 800A085C 21200000 */  addu       $a0, $zero, $zero
    /* 90860 800A0860 1180053C */  lui        $a1, %hi(D_80110C00)
    /* 90864 800A0864 000CA524 */  addiu      $a1, $a1, %lo(D_80110C00)
    /* 90868 800A0868 A583000C */  jal        DBG_Error
    /* 9086C 800A086C 44000624 */   addiu     $a2, $zero, 0x44
  .L800A0870:
    /* 90870 800A0870 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 90874 800A0874 B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 90878 800A0878 00000000 */  nop
    /* 9087C 800A087C 000002AE */  sw         $v0, 0x0($s0)
    /* 90880 800A0880 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 90884 800A0884 B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 90888 800A0888 00000000 */  nop
    /* 9088C 800A088C 18004224 */  addiu      $v0, $v0, 0x18
    /* 90890 800A0890 1280013C */  lui        $at, %hi(ThisPrimAddr)
    /* 90894 800A0894 B8AA22AC */  sw         $v0, %lo(ThisPrimAddr)($at)
    /* 90898 800A0898 1400BF8F */  lw         $ra, 0x14($sp)
    /* 9089C 800A089C 1000B08F */  lw         $s0, 0x10($sp)
    /* 908A0 800A08A0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 908A4 800A08A4 0800E003 */  jr         $ra
    /* 908A8 800A08A8 00000000 */   nop
endlabel PRIM_GetPrim__FPP7POLY_F4
