.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FuncMAGMABALL__FP13MissileStructiii, 0x9C

glabel FuncMAGMABALL__FP13MissileStructiii
    /* 6C9F8 8007C9F8 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 6C9FC 8007C9FC 21480000 */  addu       $t1, $zero, $zero
    /* 6CA00 8007CA00 21500000 */  addu       $t2, $zero, $zero
    /* 6CA04 8007CA04 3800BFAF */  sw         $ra, 0x38($sp)
    /* 6CA08 8007CA08 3F008880 */  lb         $t0, 0x3F($a0)
    /* 6CA0C 8007CA0C 28008284 */  lh         $v0, 0x28($a0)
    /* 6CA10 8007CA10 2A008384 */  lh         $v1, 0x2A($a0)
    /* 6CA14 8007CA14 2128A200 */  addu       $a1, $a1, $v0
    /* 6CA18 8007CA18 05000229 */  slti       $v0, $t0, 0x5
    /* 6CA1C 8007CA1C 04004014 */  bnez       $v0, .L8007CA30
    /* 6CA20 8007CA20 2130C300 */   addu      $a2, $a2, $v1
    /* 6CA24 8007CA24 01000924 */  addiu      $t1, $zero, 0x1
    /* 6CA28 8007CA28 FFFF0225 */  addiu      $v0, $t0, -0x1
    /* 6CA2C 8007CA2C 07004838 */  xori       $t0, $v0, 0x7
  .L8007CA30:
    /* 6CA30 8007CA30 03000229 */  slti       $v0, $t0, 0x3
    /* 6CA34 8007CA34 03004014 */  bnez       $v0, .L8007CA44
    /* 6CA38 8007CA38 80000224 */   addiu     $v0, $zero, 0x80
    /* 6CA3C 8007CA3C 01000A24 */  addiu      $t2, $zero, 0x1
    /* 6CA40 8007CA40 01000831 */  andi       $t0, $t0, 0x1
  .L8007CA44:
    /* 6CA44 8007CA44 47008380 */  lb         $v1, 0x47($a0)
    /* 6CA48 8007CA48 2120A000 */  addu       $a0, $a1, $zero
    /* 6CA4C 8007CA4C 2128C000 */  addu       $a1, $a2, $zero
    /* 6CA50 8007CA50 2130E000 */  addu       $a2, $a3, $zero
    /* 6CA54 8007CA54 0B000724 */  addiu      $a3, $zero, 0xB
    /* 6CA58 8007CA58 1400A0AF */  sw         $zero, 0x14($sp)
    /* 6CA5C 8007CA5C 1800A8AF */  sw         $t0, 0x18($sp)
    /* 6CA60 8007CA60 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 6CA64 8007CA64 2000A9AF */  sw         $t1, 0x20($sp)
    /* 6CA68 8007CA68 2400AAAF */  sw         $t2, 0x24($sp)
    /* 6CA6C 8007CA6C 2800A2AF */  sw         $v0, 0x28($sp)
    /* 6CA70 8007CA70 2C00A2AF */  sw         $v0, 0x2C($sp)
    /* 6CA74 8007CA74 3000A2AF */  sw         $v0, 0x30($sp)
    /* 6CA78 8007CA78 3400A0AF */  sw         $zero, 0x34($sp)
    /* 6CA7C 8007CA7C 0DEF010C */  jal        TempPrintMissile__FiiiiiiiiccUcUcUcc
    /* 6CA80 8007CA80 1000A3AF */   sw        $v1, 0x10($sp)
    /* 6CA84 8007CA84 3800BF8F */  lw         $ra, 0x38($sp)
    /* 6CA88 8007CA88 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 6CA8C 8007CA8C 0800E003 */  jr         $ra
    /* 6CA90 8007CA90 00000000 */   nop
endlabel FuncMAGMABALL__FP13MissileStructiii
