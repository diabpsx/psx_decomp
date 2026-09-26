.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PRIM_GetPrim__FPP8POLY_FT4_8013e03c, 0x7C

glabel PRIM_GetPrim__FPP8POLY_FT4_8013e03c
    /* 4444 8013E03C 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 4448 8013E040 B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 444C 8013E044 1280033C */  lui        $v1, %hi(AddrToAvoid)
    /* 4450 8013E048 BCAA638C */  lw         $v1, %lo(AddrToAvoid)($v1)
    /* 4454 8013E04C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 4458 8013E050 1000B0AF */  sw         $s0, 0x10($sp)
    /* 445C 8013E054 21808000 */  addu       $s0, $a0, $zero
    /* 4460 8013E058 90014224 */  addiu      $v0, $v0, 0x190
    /* 4464 8013E05C 2B104300 */  sltu       $v0, $v0, $v1
    /* 4468 8013E060 06004014 */  bnez       $v0, .L8013E07C
    /* 446C 8013E064 1400BFAF */   sw        $ra, 0x14($sp)
    /* 4470 8013E068 21200000 */  addu       $a0, $zero, $zero
    /* 4474 8013E06C 1480053C */  lui        $a1, %hi(D_8013D1A0)
    /* 4478 8013E070 A0D1A524 */  addiu      $a1, $a1, %lo(D_8013D1A0)
    /* 447C 8013E074 A583000C */  jal        DBG_Error
    /* 4480 8013E078 44000624 */   addiu     $a2, $zero, 0x44
  .L8013E07C:
    /* 4484 8013E07C 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 4488 8013E080 B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 448C 8013E084 00000000 */  nop
    /* 4490 8013E088 000002AE */  sw         $v0, 0x0($s0)
    /* 4494 8013E08C 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 4498 8013E090 B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 449C 8013E094 00000000 */  nop
    /* 44A0 8013E098 28004224 */  addiu      $v0, $v0, 0x28
    /* 44A4 8013E09C 1280013C */  lui        $at, %hi(ThisPrimAddr)
    /* 44A8 8013E0A0 B8AA22AC */  sw         $v0, %lo(ThisPrimAddr)($at)
    /* 44AC 8013E0A4 1400BF8F */  lw         $ra, 0x14($sp)
    /* 44B0 8013E0A8 1000B08F */  lw         $s0, 0x10($sp)
    /* 44B4 8013E0AC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 44B8 8013E0B0 0800E003 */  jr         $ra
    /* 44BC 8013E0B4 00000000 */   nop
endlabel PRIM_GetPrim__FPP8POLY_FT4_8013e03c
