.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PRIM_GetPrim__FPP8POLY_GT4_8009512c, 0x7C

glabel PRIM_GetPrim__FPP8POLY_GT4_8009512c
    /* 8512C 8009512C 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 85130 80095130 B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 85134 80095134 1280033C */  lui        $v1, %hi(AddrToAvoid)
    /* 85138 80095138 BCAA638C */  lw         $v1, %lo(AddrToAvoid)($v1)
    /* 8513C 8009513C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 85140 80095140 1000B0AF */  sw         $s0, 0x10($sp)
    /* 85144 80095144 21808000 */  addu       $s0, $a0, $zero
    /* 85148 80095148 08024224 */  addiu      $v0, $v0, 0x208
    /* 8514C 8009514C 2B104300 */  sltu       $v0, $v0, $v1
    /* 85150 80095150 06004014 */  bnez       $v0, .L8009516C
    /* 85154 80095154 1400BFAF */   sw        $ra, 0x14($sp)
    /* 85158 80095158 21200000 */  addu       $a0, $zero, $zero
    /* 8515C 8009515C 1180053C */  lui        $a1, %hi(D_801105A8)
    /* 85160 80095160 A805A524 */  addiu      $a1, $a1, %lo(D_801105A8)
    /* 85164 80095164 A583000C */  jal        DBG_Error
    /* 85168 80095168 44000624 */   addiu     $a2, $zero, 0x44
  .L8009516C:
    /* 8516C 8009516C 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 85170 80095170 B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 85174 80095174 00000000 */  nop
    /* 85178 80095178 000002AE */  sw         $v0, 0x0($s0)
    /* 8517C 8009517C 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 85180 80095180 B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 85184 80095184 00000000 */  nop
    /* 85188 80095188 34004224 */  addiu      $v0, $v0, 0x34
    /* 8518C 8009518C 1280013C */  lui        $at, %hi(ThisPrimAddr)
    /* 85190 80095190 B8AA22AC */  sw         $v0, %lo(ThisPrimAddr)($at)
    /* 85194 80095194 1400BF8F */  lw         $ra, 0x14($sp)
    /* 85198 80095198 1000B08F */  lw         $s0, 0x10($sp)
    /* 8519C 8009519C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 851A0 800951A0 0800E003 */  jr         $ra
    /* 851A4 800951A4 00000000 */   nop
endlabel PRIM_GetPrim__FPP8POLY_GT4_8009512c
