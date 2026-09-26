.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PRIM_GetPrim__FPP7LINE_F2, 0x7C

glabel PRIM_GetPrim__FPP7LINE_F2
    /* 2A1A4 80163D9C 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 2A1A8 80163DA0 B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 2A1AC 80163DA4 1280033C */  lui        $v1, %hi(AddrToAvoid)
    /* 2A1B0 80163DA8 BCAA638C */  lw         $v1, %lo(AddrToAvoid)($v1)
    /* 2A1B4 80163DAC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2A1B8 80163DB0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 2A1BC 80163DB4 21808000 */  addu       $s0, $a0, $zero
    /* 2A1C0 80163DB8 A0004224 */  addiu      $v0, $v0, 0xA0
    /* 2A1C4 80163DBC 2B104300 */  sltu       $v0, $v0, $v1
    /* 2A1C8 80163DC0 06004014 */  bnez       $v0, .L80163DDC
    /* 2A1CC 80163DC4 1400BFAF */   sw        $ra, 0x14($sp)
    /* 2A1D0 80163DC8 21200000 */  addu       $a0, $zero, $zero
    /* 2A1D4 80163DCC 1280053C */  lui        $a1, %hi(D_8011A748)
    /* 2A1D8 80163DD0 48A7A524 */  addiu      $a1, $a1, %lo(D_8011A748)
    /* 2A1DC 80163DD4 A583000C */  jal        DBG_Error
    /* 2A1E0 80163DD8 44000624 */   addiu     $a2, $zero, 0x44
  .L80163DDC:
    /* 2A1E4 80163DDC 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 2A1E8 80163DE0 B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 2A1EC 80163DE4 00000000 */  nop
    /* 2A1F0 80163DE8 000002AE */  sw         $v0, 0x0($s0)
    /* 2A1F4 80163DEC 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 2A1F8 80163DF0 B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 2A1FC 80163DF4 00000000 */  nop
    /* 2A200 80163DF8 10004224 */  addiu      $v0, $v0, 0x10
    /* 2A204 80163DFC 1280013C */  lui        $at, %hi(ThisPrimAddr)
    /* 2A208 80163E00 B8AA22AC */  sw         $v0, %lo(ThisPrimAddr)($at)
    /* 2A20C 80163E04 1400BF8F */  lw         $ra, 0x14($sp)
    /* 2A210 80163E08 1000B08F */  lw         $s0, 0x10($sp)
    /* 2A214 80163E0C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2A218 80163E10 0800E003 */  jr         $ra
    /* 2A21C 80163E14 00000000 */   nop
endlabel PRIM_GetPrim__FPP7LINE_F2
