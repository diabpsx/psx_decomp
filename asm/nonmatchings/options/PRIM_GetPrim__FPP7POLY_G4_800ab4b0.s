.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PRIM_GetPrim__FPP7POLY_G4_800ab4b0, 0x7C

glabel PRIM_GetPrim__FPP7POLY_G4_800ab4b0
    /* 9B4B0 800AB4B0 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 9B4B4 800AB4B4 B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 9B4B8 800AB4B8 1280033C */  lui        $v1, %hi(AddrToAvoid)
    /* 9B4BC 800AB4BC BCAA638C */  lw         $v1, %lo(AddrToAvoid)($v1)
    /* 9B4C0 800AB4C0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 9B4C4 800AB4C4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 9B4C8 800AB4C8 21808000 */  addu       $s0, $a0, $zero
    /* 9B4CC 800AB4CC 68014224 */  addiu      $v0, $v0, 0x168
    /* 9B4D0 800AB4D0 2B104300 */  sltu       $v0, $v0, $v1
    /* 9B4D4 800AB4D4 06004014 */  bnez       $v0, .L800AB4F0
    /* 9B4D8 800AB4D8 1400BFAF */   sw        $ra, 0x14($sp)
    /* 9B4DC 800AB4DC 21200000 */  addu       $a0, $zero, $zero
    /* 9B4E0 800AB4E0 1180053C */  lui        $a1, %hi(D_80110D14)
    /* 9B4E4 800AB4E4 140DA524 */  addiu      $a1, $a1, %lo(D_80110D14)
    /* 9B4E8 800AB4E8 A583000C */  jal        DBG_Error
    /* 9B4EC 800AB4EC 44000624 */   addiu     $a2, $zero, 0x44
  .L800AB4F0:
    /* 9B4F0 800AB4F0 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 9B4F4 800AB4F4 B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 9B4F8 800AB4F8 00000000 */  nop
    /* 9B4FC 800AB4FC 000002AE */  sw         $v0, 0x0($s0)
    /* 9B500 800AB500 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 9B504 800AB504 B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 9B508 800AB508 00000000 */  nop
    /* 9B50C 800AB50C 24004224 */  addiu      $v0, $v0, 0x24
    /* 9B510 800AB510 1280013C */  lui        $at, %hi(ThisPrimAddr)
    /* 9B514 800AB514 B8AA22AC */  sw         $v0, %lo(ThisPrimAddr)($at)
    /* 9B518 800AB518 1400BF8F */  lw         $ra, 0x14($sp)
    /* 9B51C 800AB51C 1000B08F */  lw         $s0, 0x10($sp)
    /* 9B520 800AB520 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 9B524 800AB524 0800E003 */  jr         $ra
    /* 9B528 800AB528 00000000 */   nop
endlabel PRIM_GetPrim__FPP7POLY_G4_800ab4b0
