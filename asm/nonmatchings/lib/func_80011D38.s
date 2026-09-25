.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_80011D38, 0xE0

glabel func_80011D38
    /* 1D38 80011D38 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1D3C 80011D3C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1D40 80011D40 6346000C */  jal        EnterCriticalSection
    /* 1D44 80011D44 00000000 */   nop
    /* 1D48 80011D48 1380053C */  lui        $a1, %hi(D_8012FF90)
    /* 1D4C 80011D4C 90FFA524 */  addiu      $a1, $a1, %lo(D_8012FF90)
    /* 1D50 80011D50 9B47000C */  jal        SysDeqIntRP
    /* 1D54 80011D54 01000424 */   addiu     $a0, $zero, 0x1
    /* 1D58 80011D58 6746000C */  jal        ExitCriticalSection
    /* 1D5C 80011D5C 00000000 */   nop
    /* 1D60 80011D60 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1D64 80011D64 01000224 */  addiu      $v0, $zero, 0x1
    /* 1D68 80011D68 0800E003 */  jr         $ra
    /* 1D6C 80011D6C 1800BD27 */   addiu     $sp, $sp, 0x18
  alabel D_80011D70
    /* 1D70 80011D70 0B80023C */  lui        $v0, %hi(D_800B42C0)
    /* 1D74 80011D74 C042428C */  lw         $v0, %lo(D_800B42C0)($v0)
    /* 1D78 80011D78 F0FFBD27 */  addiu      $sp, $sp, -0x10
    /* 1D7C 80011D7C 0A0040A4 */  sh         $zero, 0xA($v0)
    /* 1D80 80011D80 0A000224 */  addiu      $v0, $zero, 0xA
    /* 1D84 80011D84 0000A2AF */  sw         $v0, 0x0($sp)
    /* 1D88 80011D88 0000A28F */  lw         $v0, 0x0($sp)
    /* 1D8C 80011D8C 00000000 */  nop
    /* 1D90 80011D90 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 1D94 80011D94 0000A2AF */  sw         $v0, 0x0($sp)
    /* 1D98 80011D98 0000A38F */  lw         $v1, 0x0($sp)
    /* 1D9C 80011D9C FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 1DA0 80011DA0 0A006210 */  beq        $v1, $v0, .L80011DCC
    /* 1DA4 80011DA4 21100000 */   addu      $v0, $zero, $zero
    /* 1DA8 80011DA8 FFFF0324 */  addiu      $v1, $zero, -0x1
  .L80011DAC:
    /* 1DAC 80011DAC 0000A28F */  lw         $v0, 0x0($sp)
    /* 1DB0 80011DB0 00000000 */  nop
    /* 1DB4 80011DB4 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 1DB8 80011DB8 0000A2AF */  sw         $v0, 0x0($sp)
    /* 1DBC 80011DBC 0000A28F */  lw         $v0, 0x0($sp)
    /* 1DC0 80011DC0 00000000 */  nop
    /* 1DC4 80011DC4 F9FF4314 */  bne        $v0, $v1, .L80011DAC
    /* 1DC8 80011DC8 21100000 */   addu      $v0, $zero, $zero
  .L80011DCC:
    /* 1DCC 80011DCC 1000BD27 */  addiu      $sp, $sp, 0x10
    /* 1DD0 80011DD0 0800E003 */  jr         $ra
    /* 1DD4 80011DD4 00000000 */   nop
  alabel D_80011DD8
    /* 1DD8 80011DD8 0B80033C */  lui        $v1, %hi(D_800B42C4)
    /* 1DDC 80011DDC C442638C */  lw         $v1, %lo(D_800B42C4)($v1)
    /* 1DE0 80011DE0 00000000 */  nop
    /* 1DE4 80011DE4 0400628C */  lw         $v0, 0x4($v1)
    /* 1DE8 80011DE8 00000000 */  nop
    /* 1DEC 80011DEC 01004230 */  andi       $v0, $v0, 0x1
    /* 1DF0 80011DF0 07004010 */  beqz       $v0, .L80011E10
    /* 1DF4 80011DF4 21100000 */   addu      $v0, $zero, $zero
    /* 1DF8 80011DF8 0000628C */  lw         $v0, 0x0($v1)
    /* 1DFC 80011DFC 00000000 */  nop
    /* 1E00 80011E00 01004230 */  andi       $v0, $v0, 0x1
    /* 1E04 80011E04 02004014 */  bnez       $v0, .L80011E10
    /* 1E08 80011E08 01000224 */   addiu     $v0, $zero, 0x1
    /* 1E0C 80011E0C 21100000 */  addu       $v0, $zero, $zero
  .L80011E10:
    /* 1E10 80011E10 0800E003 */  jr         $ra
    /* 1E14 80011E14 00000000 */   nop
endlabel func_80011D38
    /* 1E18 80011E18 00000000 */  nop
