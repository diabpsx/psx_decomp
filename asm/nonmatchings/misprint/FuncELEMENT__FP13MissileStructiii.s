.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FuncELEMENT__FP13MissileStructiii, 0xD4

glabel FuncELEMENT__FP13MissileStructiii
    /* 6D104 8007D104 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 6D108 8007D108 21408000 */  addu       $t0, $a0, $zero
    /* 6D10C 8007D10C 3800BFAF */  sw         $ra, 0x38($sp)
    /* 6D110 8007D110 28000285 */  lh         $v0, 0x28($t0)
    /* 6D114 8007D114 2A000385 */  lh         $v1, 0x2A($t0)
    /* 6D118 8007D118 2120A200 */  addu       $a0, $a1, $v0
    /* 6D11C 8007D11C 2128C300 */  addu       $a1, $a2, $v1
    /* 6D120 8007D120 37000391 */  lbu        $v1, 0x37($t0)
    /* 6D124 8007D124 13000224 */  addiu      $v0, $zero, 0x13
    /* 6D128 8007D128 0F006214 */  bne        $v1, $v0, .L8007D168
    /* 6D12C 8007D12C 00020224 */   addiu     $v0, $zero, 0x200
    /* 6D130 8007D130 47000391 */  lbu        $v1, 0x47($t0)
    /* 6D134 8007D134 1000A2AF */  sw         $v0, 0x10($sp)
    /* 6D138 8007D138 60000224 */  addiu      $v0, $zero, 0x60
    /* 6D13C 8007D13C 1400A0AF */  sw         $zero, 0x14($sp)
    /* 6D140 8007D140 1800A0AF */  sw         $zero, 0x18($sp)
    /* 6D144 8007D144 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 6D148 8007D148 001E0300 */  sll        $v1, $v1, 24
    /* 6D14C 8007D14C 03360300 */  sra        $a2, $v1, 24
    /* 6D150 8007D150 C21F0300 */  srl        $v1, $v1, 31
    /* 6D154 8007D154 2130C300 */  addu       $a2, $a2, $v1
    /* 6D158 8007D158 8E51010C */  jal        DrawExpl__Fiiiiiccc
    /* 6D15C 8007D15C 43300600 */   sra       $a2, $a2, 1
    /* 6D160 8007D160 72F40108 */  j          .L8007D1C8
    /* 6D164 8007D164 00000000 */   nop
  .L8007D168:
    /* 6D168 8007D168 3F000381 */  lb         $v1, 0x3F($t0)
    /* 6D16C 8007D16C 00000000 */  nop
    /* 6D170 8007D170 05006228 */  slti       $v0, $v1, 0x5
    /* 6D174 8007D174 04004014 */  bnez       $v0, .L8007D188
    /* 6D178 8007D178 21480000 */   addu      $t1, $zero, $zero
    /* 6D17C 8007D17C 01000924 */  addiu      $t1, $zero, 0x1
    /* 6D180 8007D180 08000224 */  addiu      $v0, $zero, 0x8
    /* 6D184 8007D184 23184300 */  subu       $v1, $v0, $v1
  .L8007D188:
    /* 6D188 8007D188 2130E000 */  addu       $a2, $a3, $zero
    /* 6D18C 8007D18C 47000281 */  lb         $v0, 0x47($t0)
    /* 6D190 8007D190 0A000724 */  addiu      $a3, $zero, 0xA
    /* 6D194 8007D194 1800A3AF */  sw         $v1, 0x18($sp)
    /* 6D198 8007D198 80000324 */  addiu      $v1, $zero, 0x80
    /* 6D19C 8007D19C 2800A3AF */  sw         $v1, 0x28($sp)
    /* 6D1A0 8007D1A0 2C00A3AF */  sw         $v1, 0x2C($sp)
    /* 6D1A4 8007D1A4 3000A3AF */  sw         $v1, 0x30($sp)
    /* 6D1A8 8007D1A8 01000324 */  addiu      $v1, $zero, 0x1
    /* 6D1AC 8007D1AC 1400A0AF */  sw         $zero, 0x14($sp)
    /* 6D1B0 8007D1B0 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 6D1B4 8007D1B4 2000A9AF */  sw         $t1, 0x20($sp)
    /* 6D1B8 8007D1B8 2400A0AF */  sw         $zero, 0x24($sp)
    /* 6D1BC 8007D1BC 3400A3AF */  sw         $v1, 0x34($sp)
    /* 6D1C0 8007D1C0 0DEF010C */  jal        TempPrintMissile__FiiiiiiiiccUcUcUcc
    /* 6D1C4 8007D1C4 1000A2AF */   sw        $v0, 0x10($sp)
  .L8007D1C8:
    /* 6D1C8 8007D1C8 3800BF8F */  lw         $ra, 0x38($sp)
    /* 6D1CC 8007D1CC 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 6D1D0 8007D1D0 0800E003 */  jr         $ra
    /* 6D1D4 8007D1D4 00000000 */   nop
endlabel FuncELEMENT__FP13MissileStructiii
