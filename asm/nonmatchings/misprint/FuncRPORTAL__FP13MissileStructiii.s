.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FuncRPORTAL__FP13MissileStructiii, 0x11C

glabel FuncRPORTAL__FP13MissileStructiii
    /* 6C1BC 8007C1BC A0FFBD27 */  addiu      $sp, $sp, -0x60
    /* 6C1C0 8007C1C0 4000B0AF */  sw         $s0, 0x40($sp)
    /* 6C1C4 8007C1C4 21808000 */  addu       $s0, $a0, $zero
    /* 6C1C8 8007C1C8 4C00B3AF */  sw         $s3, 0x4C($sp)
    /* 6C1CC 8007C1CC 2198A000 */  addu       $s3, $a1, $zero
    /* 6C1D0 8007C1D0 5000B4AF */  sw         $s4, 0x50($sp)
    /* 6C1D4 8007C1D4 21A0C000 */  addu       $s4, $a2, $zero
    /* 6C1D8 8007C1D8 5400B5AF */  sw         $s5, 0x54($sp)
    /* 6C1DC 8007C1DC 21A8E000 */  addu       $s5, $a3, $zero
    /* 6C1E0 8007C1E0 09000524 */  addiu      $a1, $zero, 0x9
    /* 6C1E4 8007C1E4 21300000 */  addu       $a2, $zero, $zero
    /* 6C1E8 8007C1E8 4800B2AF */  sw         $s2, 0x48($sp)
    /* 6C1EC 8007C1EC A814928F */  lw         $s2, %gp_rel(MissDat)($gp)
    /* 6C1F0 8007C1F0 21380000 */  addu       $a3, $zero, $zero
    /* 6C1F4 8007C1F4 5800BFAF */  sw         $ra, 0x58($sp)
    /* 6C1F8 8007C1F8 4400B1AF */  sw         $s1, 0x44($sp)
    /* 6C1FC 8007C1FC 1000A0AF */  sw         $zero, 0x10($sp)
    /* 6C200 8007C200 A64F020C */  jal        GetFrNum__7TextDatiiii
    /* 6C204 8007C204 21204002 */   addu      $a0, $s2, $zero
    /* 6C208 8007C208 3F000382 */  lb         $v1, 0x3F($s0)
    /* 6C20C 8007C20C 00000000 */  nop
    /* 6C210 8007C210 03006018 */  blez       $v1, .L8007C220
    /* 6C214 8007C214 FFFF5130 */   andi      $s1, $v0, 0xFFFF
    /* 6C218 8007C218 89F00108 */  j          .L8007C224
    /* 6C21C 8007C21C 11001024 */   addiu     $s0, $zero, 0x11
  .L8007C220:
    /* 6C220 8007C220 47001082 */  lb         $s0, 0x47($s0)
  .L8007C224:
    /* 6C224 8007C224 39F5010C */  jal        PRIM_GetPrim__FPP8POLY_FT4_8007d4e4
    /* 6C228 8007C228 3800A427 */   addiu     $a0, $sp, 0x38
    /* 6C22C 8007C22C 21204002 */  addu       $a0, $s2, $zero
    /* 6C230 8007C230 21302002 */  addu       $a2, $s1, $zero
    /* 6C234 8007C234 1000B4AF */  sw         $s4, 0x10($sp)
    /* 6C238 8007C238 1400A0AF */  sw         $zero, 0x14($sp)
    /* 6C23C 8007C23C 1800A0AF */  sw         $zero, 0x18($sp)
    /* 6C240 8007C240 3800A58F */  lw         $a1, 0x38($sp)
    /* 6C244 8007C244 A04A020C */  jal        PrepareFt4__7TextDatP8POLY_FT4iiiii
    /* 6C248 8007C248 21386002 */   addu      $a3, $s3, $zero
    /* 6C24C 8007C24C 1000022A */  slti       $v0, $s0, 0x10
    /* 6C250 8007C250 08004014 */  bnez       $v0, .L8007C274
    /* 6C254 8007C254 21206002 */   addu      $a0, $s3, $zero
    /* 6C258 8007C258 FF000524 */  addiu      $a1, $zero, 0xFF
    /* 6C25C 8007C25C 21300000 */  addu       $a2, $zero, $zero
    /* 6C260 8007C260 1000B5AF */  sw         $s5, 0x10($sp)
    /* 6C264 8007C264 3800A48F */  lw         $a0, 0x38($sp)
    /* 6C268 8007C268 31EE010C */  jal        DoPortalFX__FP8POLY_FT4iiii
    /* 6C26C 8007C26C 21380000 */   addu      $a3, $zero, $zero
    /* 6C270 8007C270 21206002 */  addu       $a0, $s3, $zero
  .L8007C274:
    /* 6C274 8007C274 21288002 */  addu       $a1, $s4, $zero
    /* 6C278 8007C278 2130A002 */  addu       $a2, $s5, $zero
    /* 6C27C 8007C27C 09000724 */  addiu      $a3, $zero, 0x9
    /* 6C280 8007C280 F0000224 */  addiu      $v0, $zero, 0xF0
    /* 6C284 8007C284 1000A0AF */  sw         $zero, 0x10($sp)
    /* 6C288 8007C288 1400A0AF */  sw         $zero, 0x14($sp)
    /* 6C28C 8007C28C 1800A0AF */  sw         $zero, 0x18($sp)
    /* 6C290 8007C290 1C00B0AF */  sw         $s0, 0x1C($sp)
    /* 6C294 8007C294 2000A0AF */  sw         $zero, 0x20($sp)
    /* 6C298 8007C298 2400A0AF */  sw         $zero, 0x24($sp)
    /* 6C29C 8007C29C 2800A2AF */  sw         $v0, 0x28($sp)
    /* 6C2A0 8007C2A0 2C00A0AF */  sw         $zero, 0x2C($sp)
    /* 6C2A4 8007C2A4 3000A0AF */  sw         $zero, 0x30($sp)
    /* 6C2A8 8007C2A8 0DEF010C */  jal        TempPrintMissile__FiiiiiiiiccUcUcUcc
    /* 6C2AC 8007C2AC 3400A0AF */   sw        $zero, 0x34($sp)
    /* 6C2B0 8007C2B0 5800BF8F */  lw         $ra, 0x58($sp)
    /* 6C2B4 8007C2B4 5400B58F */  lw         $s5, 0x54($sp)
    /* 6C2B8 8007C2B8 5000B48F */  lw         $s4, 0x50($sp)
    /* 6C2BC 8007C2BC 4C00B38F */  lw         $s3, 0x4C($sp)
    /* 6C2C0 8007C2C0 4800B28F */  lw         $s2, 0x48($sp)
    /* 6C2C4 8007C2C4 4400B18F */  lw         $s1, 0x44($sp)
    /* 6C2C8 8007C2C8 4000B08F */  lw         $s0, 0x40($sp)
    /* 6C2CC 8007C2CC 6000BD27 */  addiu      $sp, $sp, 0x60
    /* 6C2D0 8007C2D0 0800E003 */  jr         $ra
    /* 6C2D4 8007C2D4 00000000 */   nop
endlabel FuncRPORTAL__FP13MissileStructiii
