.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FuncHBOLT__FP13MissileStructiii, 0xB8

glabel FuncHBOLT__FP13MissileStructiii
    /* 6C380 8007C380 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 6C384 8007C384 21408000 */  addu       $t0, $a0, $zero
    /* 6C388 8007C388 3800BFAF */  sw         $ra, 0x38($sp)
    /* 6C38C 8007C38C 28000285 */  lh         $v0, 0x28($t0)
    /* 6C390 8007C390 2A000385 */  lh         $v1, 0x2A($t0)
    /* 6C394 8007C394 2128A200 */  addu       $a1, $a1, $v0
    /* 6C398 8007C398 2130C300 */  addu       $a2, $a2, $v1
    /* 6C39C 8007C39C 37000391 */  lbu        $v1, 0x37($t0)
    /* 6C3A0 8007C3A0 1C000224 */  addiu      $v0, $zero, 0x1C
    /* 6C3A4 8007C3A4 16006214 */  bne        $v1, $v0, .L8007C400
    /* 6C3A8 8007C3A8 2120A000 */   addu      $a0, $a1, $zero
    /* 6C3AC 8007C3AC 2128C000 */  addu       $a1, $a2, $zero
    /* 6C3B0 8007C3B0 2130E000 */  addu       $a2, $a3, $zero
    /* 6C3B4 8007C3B4 0C000724 */  addiu      $a3, $zero, 0xC
    /* 6C3B8 8007C3B8 47000381 */  lb         $v1, 0x47($t0)
    /* 6C3BC 8007C3BC 80000224 */  addiu      $v0, $zero, 0x80
    /* 6C3C0 8007C3C0 2800A2AF */  sw         $v0, 0x28($sp)
    /* 6C3C4 8007C3C4 E0000224 */  addiu      $v0, $zero, 0xE0
    /* 6C3C8 8007C3C8 2C00A2AF */  sw         $v0, 0x2C($sp)
    /* 6C3CC 8007C3CC F0000224 */  addiu      $v0, $zero, 0xF0
    /* 6C3D0 8007C3D0 3000A2AF */  sw         $v0, 0x30($sp)
    /* 6C3D4 8007C3D4 01000224 */  addiu      $v0, $zero, 0x1
    /* 6C3D8 8007C3D8 1400A0AF */  sw         $zero, 0x14($sp)
    /* 6C3DC 8007C3DC 1800A0AF */  sw         $zero, 0x18($sp)
    /* 6C3E0 8007C3E0 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 6C3E4 8007C3E4 2000A0AF */  sw         $zero, 0x20($sp)
    /* 6C3E8 8007C3E8 2400A0AF */  sw         $zero, 0x24($sp)
    /* 6C3EC 8007C3EC 3400A2AF */  sw         $v0, 0x34($sp)
    /* 6C3F0 8007C3F0 0DEF010C */  jal        TempPrintMissile__FiiiiiiiiccUcUcUcc
    /* 6C3F4 8007C3F4 1000A3AF */   sw        $v1, 0x10($sp)
    /* 6C3F8 8007C3F8 0AF10108 */  j          .L8007C428
    /* 6C3FC 8007C3FC 00000000 */   nop
  .L8007C400:
    /* 6C400 8007C400 3F000381 */  lb         $v1, 0x3F($t0)
    /* 6C404 8007C404 00000000 */  nop
    /* 6C408 8007C408 05006228 */  slti       $v0, $v1, 0x5
    /* 6C40C 8007C40C 02004014 */  bnez       $v0, .L8007C418
    /* 6C410 8007C410 FFFF6224 */   addiu     $v0, $v1, -0x1
    /* 6C414 8007C414 07004338 */  xori       $v1, $v0, 0x7
  .L8007C418:
    /* 6C418 8007C418 1000A7AF */  sw         $a3, 0x10($sp)
    /* 6C41C 8007C41C 21200001 */  addu       $a0, $t0, $zero
    /* 6C420 8007C420 817E020C */  jal        ParticleMissile__FP13MissileStructiiii
    /* 6C424 8007C424 FF000724 */   addiu     $a3, $zero, 0xFF
  .L8007C428:
    /* 6C428 8007C428 3800BF8F */  lw         $ra, 0x38($sp)
    /* 6C42C 8007C42C 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 6C430 8007C430 0800E003 */  jr         $ra
    /* 6C434 8007C434 00000000 */   nop
endlabel FuncHBOLT__FP13MissileStructiii
