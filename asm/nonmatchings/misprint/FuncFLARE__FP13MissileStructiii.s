.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FuncFLARE__FP13MissileStructiii, 0x18C

glabel FuncFLARE__FP13MissileStructiii
    /* 6CD30 8007CD30 A8FFBD27 */  addiu      $sp, $sp, -0x58
    /* 6CD34 8007CD34 4800B4AF */  sw         $s4, 0x48($sp)
    /* 6CD38 8007CD38 21A08000 */  addu       $s4, $a0, $zero
    /* 6CD3C 8007CD3C 4000B2AF */  sw         $s2, 0x40($sp)
    /* 6CD40 8007CD40 21900000 */  addu       $s2, $zero, $zero
    /* 6CD44 8007CD44 4400B3AF */  sw         $s3, 0x44($sp)
    /* 6CD48 8007CD48 21980000 */  addu       $s3, $zero, $zero
    /* 6CD4C 8007CD4C 4C00B5AF */  sw         $s5, 0x4C($sp)
    /* 6CD50 8007CD50 21A80000 */  addu       $s5, $zero, $zero
    /* 6CD54 8007CD54 5000B6AF */  sw         $s6, 0x50($sp)
    /* 6CD58 8007CD58 5400BFAF */  sw         $ra, 0x54($sp)
    /* 6CD5C 8007CD5C 3C00B1AF */  sw         $s1, 0x3C($sp)
    /* 6CD60 8007CD60 3800B0AF */  sw         $s0, 0x38($sp)
    /* 6CD64 8007CD64 28008286 */  lh         $v0, 0x28($s4)
    /* 6CD68 8007CD68 2A008386 */  lh         $v1, 0x2A($s4)
    /* 6CD6C 8007CD6C 2180A200 */  addu       $s0, $a1, $v0
    /* 6CD70 8007CD70 2188C300 */  addu       $s1, $a2, $v1
    /* 6CD74 8007CD74 37008392 */  lbu        $v1, 0x37($s4)
    /* 6CD78 8007CD78 28000224 */  addiu      $v0, $zero, 0x28
    /* 6CD7C 8007CD7C 11006210 */  beq        $v1, $v0, .L8007CDC4
    /* 6CD80 8007CD80 21B0E000 */   addu      $s6, $a3, $zero
    /* 6CD84 8007CD84 29006228 */  slti       $v0, $v1, 0x29
    /* 6CD88 8007CD88 05004010 */  beqz       $v0, .L8007CDA0
    /* 6CD8C 8007CD8C 16000224 */   addiu     $v0, $zero, 0x16
    /* 6CD90 8007CD90 08006210 */  beq        $v1, $v0, .L8007CDB4
    /* 6CD94 8007CD94 00000000 */   nop
    /* 6CD98 8007CD98 76F30108 */  j          .L8007CDD8
    /* 6CD9C 8007CD9C 00000000 */   nop
  .L8007CDA0:
    /* 6CDA0 8007CDA0 2A000224 */  addiu      $v0, $zero, 0x2A
    /* 6CDA4 8007CDA4 09006210 */  beq        $v1, $v0, .L8007CDCC
    /* 6CDA8 8007CDA8 2C000224 */   addiu     $v0, $zero, 0x2C
    /* 6CDAC 8007CDAC 0A006214 */  bne        $v1, $v0, .L8007CDD8
    /* 6CDB0 8007CDB0 00000000 */   nop
  .L8007CDB4:
    /* 6CDB4 8007CDB4 F0001224 */  addiu      $s2, $zero, 0xF0
    /* 6CDB8 8007CDB8 21980000 */  addu       $s3, $zero, $zero
    /* 6CDBC 8007CDBC 7EF30108 */  j          .L8007CDF8
    /* 6CDC0 8007CDC0 21A80000 */   addu      $s5, $zero, $zero
  .L8007CDC4:
    /* 6CDC4 8007CDC4 7EF30108 */  j          .L8007CDF8
    /* 6CDC8 8007CDC8 F0001524 */   addiu     $s5, $zero, 0xF0
  .L8007CDCC:
    /* 6CDCC 8007CDCC F0001224 */  addiu      $s2, $zero, 0xF0
    /* 6CDD0 8007CDD0 7EF30108 */  j          .L8007CDF8
    /* 6CDD4 8007CDD4 F0001324 */   addiu     $s3, $zero, 0xF0
  .L8007CDD8:
    /* 6CDD8 8007CDD8 1280023C */  lui        $v0, %hi(D_80118CBC)
    /* 6CDDC 8007CDDC BC8C4224 */  addiu      $v0, $v0, %lo(D_80118CBC)
    /* 6CDE0 8007CDE0 05004010 */  beqz       $v0, .L8007CDF8
    /* 6CDE4 8007CDE4 21200000 */   addu      $a0, $zero, $zero
    /* 6CDE8 8007CDE8 1280053C */  lui        $a1, %hi(D_80118CE0)
    /* 6CDEC 8007CDEC E08CA524 */  addiu      $a1, $a1, %lo(D_80118CE0)
    /* 6CDF0 8007CDF0 A583000C */  jal        DBG_Error
    /* 6CDF4 8007CDF4 00020624 */   addiu     $a2, $zero, 0x200
  .L8007CDF8:
    /* 6CDF8 8007CDF8 044F020C */  jal        GM_UseTexData__Fi
    /* 6CDFC 8007CDFC 21200000 */   addu      $a0, $zero, $zero
    /* 6CE00 8007CE00 21204000 */  addu       $a0, $v0, $zero
    /* 6CE04 8007CE04 D9000524 */  addiu      $a1, $zero, 0xD9
    /* 6CE08 8007CE08 03000626 */  addiu      $a2, $s0, 0x3
    /* 6CE0C 8007CE0C F0FF2726 */  addiu      $a3, $s1, -0x10
    /* 6CE10 8007CE10 1000A0AF */  sw         $zero, 0x10($sp)
    /* 6CE14 8007CE14 1400B6AF */  sw         $s6, 0x14($sp)
    /* 6CE18 8007CE18 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 6CE1C 8007CE1C 1800A0AF */   sw        $zero, 0x18($sp)
    /* 6CE20 8007CE20 21200002 */  addu       $a0, $s0, $zero
    /* 6CE24 8007CE24 F4FF2526 */  addiu      $a1, $s1, -0xC
    /* 6CE28 8007CE28 21304002 */  addu       $a2, $s2, $zero
    /* 6CE2C 8007CE2C 07004790 */  lbu        $a3, 0x7($v0)
    /* 6CE30 8007CE30 A0000324 */  addiu      $v1, $zero, 0xA0
    /* 6CE34 8007CE34 040043A0 */  sb         $v1, 0x4($v0)
    /* 6CE38 8007CE38 050043A0 */  sb         $v1, 0x5($v0)
    /* 6CE3C 8007CE3C 060043A0 */  sb         $v1, 0x6($v0)
    /* 6CE40 8007CE40 0200E734 */  ori        $a3, $a3, 0x2
    /* 6CE44 8007CE44 FE00E730 */  andi       $a3, $a3, 0xFE
    /* 6CE48 8007CE48 070047A0 */  sb         $a3, 0x7($v0)
    /* 6CE4C 8007CE4C 18000224 */  addiu      $v0, $zero, 0x18
    /* 6CE50 8007CE50 1400A2AF */  sw         $v0, 0x14($sp)
    /* 6CE54 8007CE54 48000224 */  addiu      $v0, $zero, 0x48
    /* 6CE58 8007CE58 21386002 */  addu       $a3, $s3, $zero
    /* 6CE5C 8007CE5C 1000B5AF */  sw         $s5, 0x10($sp)
    /* 6CE60 8007CE60 1800A2AF */  sw         $v0, 0x18($sp)
    /* 6CE64 8007CE64 47008382 */  lb         $v1, 0x47($s4)
    /* 6CE68 8007CE68 08000224 */  addiu      $v0, $zero, 0x8
    /* 6CE6C 8007CE6C 2000A0AF */  sw         $zero, 0x20($sp)
    /* 6CE70 8007CE70 2400B6AF */  sw         $s6, 0x24($sp)
    /* 6CE74 8007CE74 2800A0AF */  sw         $zero, 0x28($sp)
    /* 6CE78 8007CE78 2C00A0AF */  sw         $zero, 0x2C($sp)
    /* 6CE7C 8007CE7C 3000A2AF */  sw         $v0, 0x30($sp)
    /* 6CE80 8007CE80 40100300 */  sll        $v0, $v1, 1
    /* 6CE84 8007CE84 21104300 */  addu       $v0, $v0, $v1
    /* 6CE88 8007CE88 919A020C */  jal        DrawSpinner__FiiUcUcUciiibiT8T8Uc
    /* 6CE8C 8007CE8C 1C00A2AF */   sw        $v0, 0x1C($sp)
    /* 6CE90 8007CE90 5400BF8F */  lw         $ra, 0x54($sp)
    /* 6CE94 8007CE94 5000B68F */  lw         $s6, 0x50($sp)
    /* 6CE98 8007CE98 4C00B58F */  lw         $s5, 0x4C($sp)
    /* 6CE9C 8007CE9C 4800B48F */  lw         $s4, 0x48($sp)
    /* 6CEA0 8007CEA0 4400B38F */  lw         $s3, 0x44($sp)
    /* 6CEA4 8007CEA4 4000B28F */  lw         $s2, 0x40($sp)
    /* 6CEA8 8007CEA8 3C00B18F */  lw         $s1, 0x3C($sp)
    /* 6CEAC 8007CEAC 3800B08F */  lw         $s0, 0x38($sp)
    /* 6CEB0 8007CEB0 5800BD27 */  addiu      $sp, $sp, 0x58
    /* 6CEB4 8007CEB4 0800E003 */  jr         $ra
    /* 6CEB8 8007CEB8 00000000 */   nop
endlabel FuncFLARE__FP13MissileStructiii
