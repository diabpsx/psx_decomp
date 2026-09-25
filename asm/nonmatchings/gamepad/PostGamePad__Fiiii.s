.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PostGamePad__Fiiii, 0x104

glabel PostGamePad__Fiiii
    /* 6AD4C 8007AD4C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 6AD50 8007AD50 1380033C */  lui        $v1, %hi(D_8012FB68)
    /* 6AD54 8007AD54 68FB6324 */  addiu      $v1, $v1, %lo(D_8012FB68)
    /* 6AD58 8007AD58 1380083C */  lui        $t0, %hi(D_8012FC48)
    /* 6AD5C 8007AD5C 48FC0825 */  addiu      $t0, $t0, %lo(D_8012FC48)
    /* 6AD60 8007AD60 FEFF8424 */  addiu      $a0, $a0, -0x2
    /* 6AD64 8007AD64 0A00822C */  sltiu      $v0, $a0, 0xA
    /* 6AD68 8007AD68 35004010 */  beqz       $v0, .L8007AE40
    /* 6AD6C 8007AD6C 1000BFAF */   sw        $ra, 0x10($sp)
    /* 6AD70 8007AD70 80100400 */  sll        $v0, $a0, 2
    /* 6AD74 8007AD74 1280013C */  lui        $at, %hi(jtbl_80118AF0)
    /* 6AD78 8007AD78 21082200 */  addu       $at, $at, $v0
    /* 6AD7C 8007AD7C F08A228C */  lw         $v0, %lo(jtbl_80118AF0)($at)
    /* 6AD80 8007AD80 00000000 */  nop
    /* 6AD84 8007AD84 08004000 */  jr         $v0
    /* 6AD88 8007AD88 00000000 */   nop
  jlabel .L8007AD8C
    /* 6AD8C 8007AD8C 4D0060A0 */  sb         $zero, 0x4D($v1)
  jlabel .L8007AD90
    /* 6AD90 8007AD90 90EB0108 */  j          .L8007AE40
    /* 6AD94 8007AD94 4D0000A1 */   sb        $zero, 0x4D($t0)
  jlabel .L8007AD98
    /* 6AD98 8007AD98 90EB0108 */  j          .L8007AE40
    /* 6AD9C 8007AD9C 4D0060A0 */   sb        $zero, 0x4D($v1)
  jlabel .L8007ADA0
    /* 6ADA0 8007ADA0 01000224 */  addiu      $v0, $zero, 0x1
    /* 6ADA4 8007ADA4 4D0062A0 */  sb         $v0, 0x4D($v1)
  jlabel .L8007ADA8
    /* 6ADA8 8007ADA8 01000224 */  addiu      $v0, $zero, 0x1
    /* 6ADAC 8007ADAC 90EB0108 */  j          .L8007AE40
    /* 6ADB0 8007ADB0 4D0002A1 */   sb        $v0, 0x4D($t0)
  jlabel .L8007ADB4
    /* 6ADB4 8007ADB4 01000224 */  addiu      $v0, $zero, 0x1
    /* 6ADB8 8007ADB8 90EB0108 */  j          .L8007AE40
    /* 6ADBC 8007ADBC 4D0062A0 */   sb        $v0, 0x4D($v1)
  jlabel .L8007ADC0
    /* 6ADC0 8007ADC0 0500A010 */  beqz       $a1, .L8007ADD8
    /* 6ADC4 8007ADC4 01000224 */   addiu     $v0, $zero, 0x1
    /* 6ADC8 8007ADC8 0400A210 */  beq        $a1, $v0, .L8007ADDC
    /* 6ADCC 8007ADCC 21200001 */   addu      $a0, $t0, $zero
    /* 6ADD0 8007ADD0 90EB0108 */  j          .L8007AE40
    /* 6ADD4 8007ADD4 00000000 */   nop
  .L8007ADD8:
    /* 6ADD8 8007ADD8 21206000 */  addu       $a0, $v1, $zero
  .L8007ADDC:
    /* 6ADDC 8007ADDC B0E1010C */  jal        SetAllButtons__7GamePadP11KEY_ASSIGNS
    /* 6ADE0 8007ADE0 2128C000 */   addu      $a1, $a2, $zero
    /* 6ADE4 8007ADE4 90EB0108 */  j          .L8007AE40
    /* 6ADE8 8007ADE8 00000000 */   nop
  jlabel .L8007ADEC
    /* 6ADEC 8007ADEC 0500A010 */  beqz       $a1, .L8007AE04
    /* 6ADF0 8007ADF0 01000224 */   addiu     $v0, $zero, 0x1
    /* 6ADF4 8007ADF4 0400A210 */  beq        $a1, $v0, .L8007AE08
    /* 6ADF8 8007ADF8 21200001 */   addu      $a0, $t0, $zero
    /* 6ADFC 8007ADFC 90EB0108 */  j          .L8007AE40
    /* 6AE00 8007AE00 00000000 */   nop
  .L8007AE04:
    /* 6AE04 8007AE04 21206000 */  addu       $a0, $v1, $zero
  .L8007AE08:
    /* 6AE08 8007AE08 4AE2010C */  jal        GetAllButtons__7GamePadP11KEY_ASSIGNS
    /* 6AE0C 8007AE0C 2128C000 */   addu      $a1, $a2, $zero
    /* 6AE10 8007AE10 90EB0108 */  j          .L8007AE40
    /* 6AE14 8007AE14 00000000 */   nop
  jlabel .L8007AE18
    /* 6AE18 8007AE18 0500A010 */  beqz       $a1, .L8007AE30
    /* 6AE1C 8007AE1C 01000224 */   addiu     $v0, $zero, 0x1
    /* 6AE20 8007AE20 0400A210 */  beq        $a1, $v0, .L8007AE34
    /* 6AE24 8007AE24 21200001 */   addu      $a0, $t0, $zero
    /* 6AE28 8007AE28 90EB0108 */  j          .L8007AE40
    /* 6AE2C 8007AE2C 00000000 */   nop
  .L8007AE30:
    /* 6AE30 8007AE30 21206000 */  addu       $a0, $v1, $zero
  .L8007AE34:
    /* 6AE34 8007AE34 2128C000 */  addu       $a1, $a2, $zero
    /* 6AE38 8007AE38 CFE2010C */  jal        SetUpAction__7GamePadPFi_vT1
    /* 6AE3C 8007AE3C 2130E000 */   addu      $a2, $a3, $zero
  jlabel .L8007AE40
    /* 6AE40 8007AE40 1000BF8F */  lw         $ra, 0x10($sp)
    /* 6AE44 8007AE44 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 6AE48 8007AE48 0800E003 */  jr         $ra
    /* 6AE4C 8007AE4C 00000000 */   nop
endlabel PostGamePad__Fiiii
