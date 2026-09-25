.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PRIM_GetPrim__FPP8POLY_FT4_800adeb8, 0x7C

glabel PRIM_GetPrim__FPP8POLY_FT4_800adeb8
    /* 9DEB8 800ADEB8 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 9DEBC 800ADEBC B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 9DEC0 800ADEC0 1280033C */  lui        $v1, %hi(AddrToAvoid)
    /* 9DEC4 800ADEC4 BCAA638C */  lw         $v1, %lo(AddrToAvoid)($v1)
    /* 9DEC8 800ADEC8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 9DECC 800ADECC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 9DED0 800ADED0 21808000 */  addu       $s0, $a0, $zero
    /* 9DED4 800ADED4 90014224 */  addiu      $v0, $v0, 0x190
    /* 9DED8 800ADED8 2B104300 */  sltu       $v0, $v0, $v1
    /* 9DEDC 800ADEDC 06004014 */  bnez       $v0, .L800ADEF8
    /* 9DEE0 800ADEE0 1400BFAF */   sw        $ra, 0x14($sp)
    /* 9DEE4 800ADEE4 21200000 */  addu       $a0, $zero, $zero
    /* 9DEE8 800ADEE8 1180053C */  lui        $a1, %hi(D_80110F30)
    /* 9DEEC 800ADEEC 300FA524 */  addiu      $a1, $a1, %lo(D_80110F30)
    /* 9DEF0 800ADEF0 A583000C */  jal        DBG_Error
    /* 9DEF4 800ADEF4 44000624 */   addiu     $a2, $zero, 0x44
  .L800ADEF8:
    /* 9DEF8 800ADEF8 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 9DEFC 800ADEFC B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 9DF00 800ADF00 00000000 */  nop
    /* 9DF04 800ADF04 000002AE */  sw         $v0, 0x0($s0)
    /* 9DF08 800ADF08 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 9DF0C 800ADF0C B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 9DF10 800ADF10 00000000 */  nop
    /* 9DF14 800ADF14 28004224 */  addiu      $v0, $v0, 0x28
    /* 9DF18 800ADF18 1280013C */  lui        $at, %hi(ThisPrimAddr)
    /* 9DF1C 800ADF1C B8AA22AC */  sw         $v0, %lo(ThisPrimAddr)($at)
    /* 9DF20 800ADF20 1400BF8F */  lw         $ra, 0x14($sp)
    /* 9DF24 800ADF24 1000B08F */  lw         $s0, 0x10($sp)
    /* 9DF28 800ADF28 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 9DF2C 800ADF2C 0800E003 */  jr         $ra
    /* 9DF30 800ADF30 00000000 */   nop
endlabel PRIM_GetPrim__FPP8POLY_FT4_800adeb8
