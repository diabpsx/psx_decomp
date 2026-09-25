.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PRIM_GetPrim__FPP8POLY_FT4_8007d4e4, 0x7C

glabel PRIM_GetPrim__FPP8POLY_FT4_8007d4e4
    /* 6D4E4 8007D4E4 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 6D4E8 8007D4E8 B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 6D4EC 8007D4EC 1280033C */  lui        $v1, %hi(AddrToAvoid)
    /* 6D4F0 8007D4F0 BCAA638C */  lw         $v1, %lo(AddrToAvoid)($v1)
    /* 6D4F4 8007D4F4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 6D4F8 8007D4F8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 6D4FC 8007D4FC 21808000 */  addu       $s0, $a0, $zero
    /* 6D500 8007D500 90014224 */  addiu      $v0, $v0, 0x190
    /* 6D504 8007D504 2B104300 */  sltu       $v0, $v0, $v1
    /* 6D508 8007D508 06004014 */  bnez       $v0, .L8007D524
    /* 6D50C 8007D50C 1400BFAF */   sw        $ra, 0x14($sp)
    /* 6D510 8007D510 21200000 */  addu       $a0, $zero, $zero
    /* 6D514 8007D514 1280053C */  lui        $a1, %hi(D_80118D54)
    /* 6D518 8007D518 548DA524 */  addiu      $a1, $a1, %lo(D_80118D54)
    /* 6D51C 8007D51C A583000C */  jal        DBG_Error
    /* 6D520 8007D520 44000624 */   addiu     $a2, $zero, 0x44
  .L8007D524:
    /* 6D524 8007D524 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 6D528 8007D528 B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 6D52C 8007D52C 00000000 */  nop
    /* 6D530 8007D530 000002AE */  sw         $v0, 0x0($s0)
    /* 6D534 8007D534 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 6D538 8007D538 B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 6D53C 8007D53C 00000000 */  nop
    /* 6D540 8007D540 28004224 */  addiu      $v0, $v0, 0x28
    /* 6D544 8007D544 1280013C */  lui        $at, %hi(ThisPrimAddr)
    /* 6D548 8007D548 B8AA22AC */  sw         $v0, %lo(ThisPrimAddr)($at)
    /* 6D54C 8007D54C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 6D550 8007D550 1000B08F */  lw         $s0, 0x10($sp)
    /* 6D554 8007D554 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 6D558 8007D558 0800E003 */  jr         $ra
    /* 6D55C 8007D55C 00000000 */   nop
endlabel PRIM_GetPrim__FPP8POLY_FT4_8007d4e4
