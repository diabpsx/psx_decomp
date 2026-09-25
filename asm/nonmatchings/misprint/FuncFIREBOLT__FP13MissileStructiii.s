.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FuncFIREBOLT__FP13MissileStructiii, 0xA8

glabel FuncFIREBOLT__FP13MissileStructiii
    /* 6C2D8 8007C2D8 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 6C2DC 8007C2DC 21408000 */  addu       $t0, $a0, $zero
    /* 6C2E0 8007C2E0 2000BFAF */  sw         $ra, 0x20($sp)
    /* 6C2E4 8007C2E4 28000285 */  lh         $v0, 0x28($t0)
    /* 6C2E8 8007C2E8 2A000385 */  lh         $v1, 0x2A($t0)
    /* 6C2EC 8007C2EC 2128A200 */  addu       $a1, $a1, $v0
    /* 6C2F0 8007C2F0 2130C300 */  addu       $a2, $a2, $v1
    /* 6C2F4 8007C2F4 37000391 */  lbu        $v1, 0x37($t0)
    /* 6C2F8 8007C2F8 13000224 */  addiu      $v0, $zero, 0x13
    /* 6C2FC 8007C2FC 12006214 */  bne        $v1, $v0, .L8007C348
    /* 6C300 8007C300 2120A000 */   addu      $a0, $a1, $zero
    /* 6C304 8007C304 2128C000 */  addu       $a1, $a2, $zero
    /* 6C308 8007C308 47000391 */  lbu        $v1, 0x47($t0)
    /* 6C30C 8007C30C 00010224 */  addiu      $v0, $zero, 0x100
    /* 6C310 8007C310 1000A2AF */  sw         $v0, 0x10($sp)
    /* 6C314 8007C314 20000224 */  addiu      $v0, $zero, 0x20
    /* 6C318 8007C318 1800A2AF */  sw         $v0, 0x18($sp)
    /* 6C31C 8007C31C 60000224 */  addiu      $v0, $zero, 0x60
    /* 6C320 8007C320 1400A0AF */  sw         $zero, 0x14($sp)
    /* 6C324 8007C324 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 6C328 8007C328 001E0300 */  sll        $v1, $v1, 24
    /* 6C32C 8007C32C 03360300 */  sra        $a2, $v1, 24
    /* 6C330 8007C330 C21F0300 */  srl        $v1, $v1, 31
    /* 6C334 8007C334 2130C300 */  addu       $a2, $a2, $v1
    /* 6C338 8007C338 8E51010C */  jal        DrawExpl__Fiiiiiccc
    /* 6C33C 8007C33C 43300600 */   sra       $a2, $a2, 1
    /* 6C340 8007C340 DCF00108 */  j          .L8007C370
    /* 6C344 8007C344 00000000 */   nop
  .L8007C348:
    /* 6C348 8007C348 3F000381 */  lb         $v1, 0x3F($t0)
    /* 6C34C 8007C34C 00000000 */  nop
    /* 6C350 8007C350 05006228 */  slti       $v0, $v1, 0x5
    /* 6C354 8007C354 02004014 */  bnez       $v0, .L8007C360
    /* 6C358 8007C358 FFFF6224 */   addiu     $v0, $v1, -0x1
    /* 6C35C 8007C35C 07004338 */  xori       $v1, $v0, 0x7
  .L8007C360:
    /* 6C360 8007C360 1000A7AF */  sw         $a3, 0x10($sp)
    /* 6C364 8007C364 21200001 */  addu       $a0, $t0, $zero
    /* 6C368 8007C368 817E020C */  jal        ParticleMissile__FP13MissileStructiiii
    /* 6C36C 8007C36C FF00073C */   lui       $a3, (0xFF0000 >> 16)
  .L8007C370:
    /* 6C370 8007C370 2000BF8F */  lw         $ra, 0x20($sp)
    /* 6C374 8007C374 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 6C378 8007C378 0800E003 */  jr         $ra
    /* 6C37C 8007C37C 00000000 */   nop
endlabel FuncFIREBOLT__FP13MissileStructiii
