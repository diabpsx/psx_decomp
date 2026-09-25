.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PRIM_GetPrim__FPP8POLY_FT4, 0x7C

glabel PRIM_GetPrim__FPP8POLY_FT4
    /* 573B8 800673B8 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 573BC 800673BC B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 573C0 800673C0 1280033C */  lui        $v1, %hi(AddrToAvoid)
    /* 573C4 800673C4 BCAA638C */  lw         $v1, %lo(AddrToAvoid)($v1)
    /* 573C8 800673C8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 573CC 800673CC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 573D0 800673D0 21808000 */  addu       $s0, $a0, $zero
    /* 573D4 800673D4 90014224 */  addiu      $v0, $v0, 0x190
    /* 573D8 800673D8 2B104300 */  sltu       $v0, $v0, $v1
    /* 573DC 800673DC 06004014 */  bnez       $v0, .L800673F8
    /* 573E0 800673E0 1400BFAF */   sw        $ra, 0x14($sp)
    /* 573E4 800673E4 21200000 */  addu       $a0, $zero, $zero
    /* 573E8 800673E8 1180053C */  lui        $a1, %hi(D_80117794)
    /* 573EC 800673EC 9477A524 */  addiu      $a1, $a1, %lo(D_80117794)
    /* 573F0 800673F0 A583000C */  jal        DBG_Error
    /* 573F4 800673F4 44000624 */   addiu     $a2, $zero, 0x44
  .L800673F8:
    /* 573F8 800673F8 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 573FC 800673FC B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 57400 80067400 00000000 */  nop
    /* 57404 80067404 000002AE */  sw         $v0, 0x0($s0)
    /* 57408 80067408 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 5740C 8006740C B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 57410 80067410 00000000 */  nop
    /* 57414 80067414 28004224 */  addiu      $v0, $v0, 0x28
    /* 57418 80067418 1280013C */  lui        $at, %hi(ThisPrimAddr)
    /* 5741C 8006741C B8AA22AC */  sw         $v0, %lo(ThisPrimAddr)($at)
    /* 57420 80067420 1400BF8F */  lw         $ra, 0x14($sp)
    /* 57424 80067424 1000B08F */  lw         $s0, 0x10($sp)
    /* 57428 80067428 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 5742C 8006742C 0800E003 */  jr         $ra
    /* 57430 80067430 00000000 */   nop
endlabel PRIM_GetPrim__FPP8POLY_FT4
