.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PRIM_GetPrim__FPP8POLY_FT4_800a08ac, 0x7C

glabel PRIM_GetPrim__FPP8POLY_FT4_800a08ac
    /* 908AC 800A08AC 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 908B0 800A08B0 B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 908B4 800A08B4 1280033C */  lui        $v1, %hi(AddrToAvoid)
    /* 908B8 800A08B8 BCAA638C */  lw         $v1, %lo(AddrToAvoid)($v1)
    /* 908BC 800A08BC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 908C0 800A08C0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 908C4 800A08C4 21808000 */  addu       $s0, $a0, $zero
    /* 908C8 800A08C8 90014224 */  addiu      $v0, $v0, 0x190
    /* 908CC 800A08CC 2B104300 */  sltu       $v0, $v0, $v1
    /* 908D0 800A08D0 06004014 */  bnez       $v0, .L800A08EC
    /* 908D4 800A08D4 1400BFAF */   sw        $ra, 0x14($sp)
    /* 908D8 800A08D8 21200000 */  addu       $a0, $zero, $zero
    /* 908DC 800A08DC 1180053C */  lui        $a1, %hi(D_80110C00)
    /* 908E0 800A08E0 000CA524 */  addiu      $a1, $a1, %lo(D_80110C00)
    /* 908E4 800A08E4 A583000C */  jal        DBG_Error
    /* 908E8 800A08E8 44000624 */   addiu     $a2, $zero, 0x44
  .L800A08EC:
    /* 908EC 800A08EC 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 908F0 800A08F0 B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 908F4 800A08F4 00000000 */  nop
    /* 908F8 800A08F8 000002AE */  sw         $v0, 0x0($s0)
    /* 908FC 800A08FC 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 90900 800A0900 B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 90904 800A0904 00000000 */  nop
    /* 90908 800A0908 28004224 */  addiu      $v0, $v0, 0x28
    /* 9090C 800A090C 1280013C */  lui        $at, %hi(ThisPrimAddr)
    /* 90910 800A0910 B8AA22AC */  sw         $v0, %lo(ThisPrimAddr)($at)
    /* 90914 800A0914 1400BF8F */  lw         $ra, 0x14($sp)
    /* 90918 800A0918 1000B08F */  lw         $s0, 0x10($sp)
    /* 9091C 800A091C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 90920 800A0920 0800E003 */  jr         $ra
    /* 90924 800A0924 00000000 */   nop
endlabel PRIM_GetPrim__FPP8POLY_FT4_800a08ac
