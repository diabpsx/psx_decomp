.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PRIM_GetPrim__FPP8POLY_FT4_800acea0, 0x7C

glabel PRIM_GetPrim__FPP8POLY_FT4_800acea0
    /* 9CEA0 800ACEA0 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 9CEA4 800ACEA4 B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 9CEA8 800ACEA8 1280033C */  lui        $v1, %hi(AddrToAvoid)
    /* 9CEAC 800ACEAC BCAA638C */  lw         $v1, %lo(AddrToAvoid)($v1)
    /* 9CEB0 800ACEB0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 9CEB4 800ACEB4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 9CEB8 800ACEB8 21808000 */  addu       $s0, $a0, $zero
    /* 9CEBC 800ACEBC 90014224 */  addiu      $v0, $v0, 0x190
    /* 9CEC0 800ACEC0 2B104300 */  sltu       $v0, $v0, $v1
    /* 9CEC4 800ACEC4 06004014 */  bnez       $v0, .L800ACEE0
    /* 9CEC8 800ACEC8 1400BFAF */   sw        $ra, 0x14($sp)
    /* 9CECC 800ACECC 21200000 */  addu       $a0, $zero, $zero
    /* 9CED0 800ACED0 1180053C */  lui        $a1, %hi(D_80110DE4)
    /* 9CED4 800ACED4 E40DA524 */  addiu      $a1, $a1, %lo(D_80110DE4)
    /* 9CED8 800ACED8 A583000C */  jal        DBG_Error
    /* 9CEDC 800ACEDC 44000624 */   addiu     $a2, $zero, 0x44
  .L800ACEE0:
    /* 9CEE0 800ACEE0 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 9CEE4 800ACEE4 B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 9CEE8 800ACEE8 00000000 */  nop
    /* 9CEEC 800ACEEC 000002AE */  sw         $v0, 0x0($s0)
    /* 9CEF0 800ACEF0 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 9CEF4 800ACEF4 B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 9CEF8 800ACEF8 00000000 */  nop
    /* 9CEFC 800ACEFC 28004224 */  addiu      $v0, $v0, 0x28
    /* 9CF00 800ACF00 1280013C */  lui        $at, %hi(ThisPrimAddr)
    /* 9CF04 800ACF04 B8AA22AC */  sw         $v0, %lo(ThisPrimAddr)($at)
    /* 9CF08 800ACF08 1400BF8F */  lw         $ra, 0x14($sp)
    /* 9CF0C 800ACF0C 1000B08F */  lw         $s0, 0x10($sp)
    /* 9CF10 800ACF10 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 9CF14 800ACF14 0800E003 */  jr         $ra
    /* 9CF18 800ACF18 00000000 */   nop
endlabel PRIM_GetPrim__FPP8POLY_FT4_800acea0
