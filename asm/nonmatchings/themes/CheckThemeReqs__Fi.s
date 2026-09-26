.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckThemeReqs__Fi, 0xCC

glabel CheckThemeReqs__Fi
    /* 2281C 8015C414 FFFF8424 */  addiu      $a0, $a0, -0x1
    /* 22820 8015C418 1000822C */  sltiu      $v0, $a0, 0x10
    /* 22824 8015C41C 2E004010 */  beqz       $v0, .L8015C4D8
    /* 22828 8015C420 01000524 */   addiu     $a1, $zero, 0x1
    /* 2282C 8015C424 80100400 */  sll        $v0, $a0, 2
    /* 22830 8015C428 1280013C */  lui        $at, %hi(jtbl_80119A44)
    /* 22834 8015C42C 21082200 */  addu       $at, $at, $v0
    /* 22838 8015C430 449A228C */  lw         $v0, %lo(jtbl_80119A44)($at)
    /* 2283C 8015C434 00000000 */  nop
    /* 22840 8015C438 08004000 */  jr         $v0
    /* 22844 8015C43C 00000000 */   nop
    /* 22848 8015C440 1280023C */  lui        $v0, %hi(leveltype)
    /* 2284C 8015C444 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 22850 8015C448 00000000 */  nop
    /* 22854 8015C44C FDFF4224 */  addiu      $v0, $v0, -0x3
    /* 22858 8015C450 0200422C */  sltiu      $v0, $v0, 0x2
    /* 2285C 8015C454 20004010 */  beqz       $v0, .L8015C4D8
    /* 22860 8015C458 00000000 */   nop
    /* 22864 8015C45C 36710508 */  j          .L8015C4D8
    /* 22868 8015C460 21280000 */   addu      $a1, $zero, $zero
    /* 2286C 8015C464 241A8293 */  lbu        $v0, %gp_rel(bFountainFlag)($gp)
    /* 22870 8015C468 32710508 */  j          .L8015C4C8
    /* 22874 8015C46C 00000000 */   nop
    /* 22878 8015C470 271A8293 */  lbu        $v0, %gp_rel(pFountainFlag)($gp)
    /* 2287C 8015C474 32710508 */  j          .L8015C4C8
    /* 22880 8015C478 00000000 */   nop
    /* 22884 8015C47C 261A8293 */  lbu        $v0, %gp_rel(mFountainFlag)($gp)
    /* 22888 8015C480 32710508 */  j          .L8015C4C8
    /* 2288C 8015C484 00000000 */   nop
    /* 22890 8015C488 281A8293 */  lbu        $v0, %gp_rel(tFountainFlag)($gp)
    /* 22894 8015C48C 32710508 */  j          .L8015C4C8
    /* 22898 8015C490 00000000 */   nop
    /* 2289C 8015C494 1280033C */  lui        $v1, %hi(leveltype)
    /* 228A0 8015C498 0DC16390 */  lbu        $v1, %lo(leveltype)($v1)
    /* 228A4 8015C49C 01000224 */  addiu      $v0, $zero, 0x1
    /* 228A8 8015C4A0 0D006214 */  bne        $v1, $v0, .L8015C4D8
    /* 228AC 8015C4A4 00000000 */   nop
    /* 228B0 8015C4A8 36710508 */  j          .L8015C4D8
    /* 228B4 8015C4AC 21280000 */   addu      $a1, $zero, $zero
    /* 228B8 8015C4B0 1280033C */  lui        $v1, %hi(leveltype)
    /* 228BC 8015C4B4 0DC16390 */  lbu        $v1, %lo(leveltype)($v1)
    /* 228C0 8015C4B8 04000224 */  addiu      $v0, $zero, 0x4
    /* 228C4 8015C4BC 05006214 */  bne        $v1, $v0, .L8015C4D4
    /* 228C8 8015C4C0 00000000 */   nop
    /* 228CC 8015C4C4 251A8293 */  lbu        $v0, %gp_rel(cauldronFlag)($gp)
  .L8015C4C8:
    /* 228D0 8015C4C8 00000000 */  nop
    /* 228D4 8015C4CC 02004014 */  bnez       $v0, .L8015C4D8
    /* 228D8 8015C4D0 00000000 */   nop
  .L8015C4D4:
    /* 228DC 8015C4D4 21280000 */  addu       $a1, $zero, $zero
  .L8015C4D8:
    /* 228E0 8015C4D8 0800E003 */  jr         $ra
    /* 228E4 8015C4DC 2110A000 */   addu      $v0, $a1, $zero
endlabel CheckThemeReqs__Fi
