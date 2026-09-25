.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PRIM_GetPrim__FPP7POLY_G4_800a4e38, 0x7C

glabel PRIM_GetPrim__FPP7POLY_G4_800a4e38
    /* 94E38 800A4E38 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 94E3C 800A4E3C B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 94E40 800A4E40 1280033C */  lui        $v1, %hi(AddrToAvoid)
    /* 94E44 800A4E44 BCAA638C */  lw         $v1, %lo(AddrToAvoid)($v1)
    /* 94E48 800A4E48 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 94E4C 800A4E4C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 94E50 800A4E50 21808000 */  addu       $s0, $a0, $zero
    /* 94E54 800A4E54 68014224 */  addiu      $v0, $v0, 0x168
    /* 94E58 800A4E58 2B104300 */  sltu       $v0, $v0, $v1
    /* 94E5C 800A4E5C 06004014 */  bnez       $v0, .L800A4E78
    /* 94E60 800A4E60 1400BFAF */   sw        $ra, 0x14($sp)
    /* 94E64 800A4E64 21200000 */  addu       $a0, $zero, $zero
    /* 94E68 800A4E68 1180053C */  lui        $a1, %hi(D_80110C94)
    /* 94E6C 800A4E6C 940CA524 */  addiu      $a1, $a1, %lo(D_80110C94)
    /* 94E70 800A4E70 A583000C */  jal        DBG_Error
    /* 94E74 800A4E74 44000624 */   addiu     $a2, $zero, 0x44
  .L800A4E78:
    /* 94E78 800A4E78 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 94E7C 800A4E7C B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 94E80 800A4E80 00000000 */  nop
    /* 94E84 800A4E84 000002AE */  sw         $v0, 0x0($s0)
    /* 94E88 800A4E88 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 94E8C 800A4E8C B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 94E90 800A4E90 00000000 */  nop
    /* 94E94 800A4E94 24004224 */  addiu      $v0, $v0, 0x24
    /* 94E98 800A4E98 1280013C */  lui        $at, %hi(ThisPrimAddr)
    /* 94E9C 800A4E9C B8AA22AC */  sw         $v0, %lo(ThisPrimAddr)($at)
    /* 94EA0 800A4EA0 1400BF8F */  lw         $ra, 0x14($sp)
    /* 94EA4 800A4EA4 1000B08F */  lw         $s0, 0x10($sp)
    /* 94EA8 800A4EA8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 94EAC 800A4EAC 0800E003 */  jr         $ra
    /* 94EB0 800A4EB0 00000000 */   nop
endlabel PRIM_GetPrim__FPP7POLY_G4_800a4e38
