.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _spu_t, 0x280

glabel _spu_t
    /* 6D80 80016D80 0000A4AF */  sw         $a0, 0x0($sp)
    /* 6D84 80016D84 0400A5AF */  sw         $a1, 0x4($sp)
    /* 6D88 80016D88 0800A6AF */  sw         $a2, 0x8($sp)
    /* 6D8C 80016D8C 0C00A7AF */  sw         $a3, 0xC($sp)
    /* 6D90 80016D90 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 6D94 80016D94 1000B0AF */  sw         $s0, 0x10($sp)
    /* 6D98 80016D98 1C00B027 */  addiu      $s0, $sp, 0x1C
    /* 6D9C 80016D9C 01000624 */  addiu      $a2, $zero, 0x1
    /* 6DA0 80016DA0 1400BFAF */  sw         $ra, 0x14($sp)
    /* 6DA4 80016DA4 19008610 */  beq        $a0, $a2, .L80016E0C
    /* 6DA8 80016DA8 1800A4AF */   sw        $a0, 0x18($sp)
    /* 6DAC 80016DAC 02008228 */  slti       $v0, $a0, 0x2
    /* 6DB0 80016DB0 05004010 */  beqz       $v0, .L80016DC8
    /* 6DB4 80016DB4 02000224 */   addiu     $v0, $zero, 0x2
    /* 6DB8 80016DB8 2F008010 */  beqz       $a0, .L80016E78
    /* 6DBC 80016DBC 21100000 */   addu      $v0, $zero, $zero
    /* 6DC0 80016DC0 FC5B0008 */  j          .L80016FF0
    /* 6DC4 80016DC4 00000000 */   nop
  .L80016DC8:
    /* 6DC8 80016DC8 05008210 */  beq        $a0, $v0, .L80016DE0
    /* 6DCC 80016DCC 03000224 */   addiu     $v0, $zero, 0x3
    /* 6DD0 80016DD0 43008210 */  beq        $a0, $v0, .L80016EE0
    /* 6DD4 80016DD4 21100000 */   addu      $v0, $zero, $zero
    /* 6DD8 80016DD8 FC5B0008 */  j          .L80016FF0
    /* 6DDC 80016DDC 00000000 */   nop
  .L80016DE0:
    /* 6DE0 80016DE0 1C00A48F */  lw         $a0, 0x1C($sp)
    /* 6DE4 80016DE4 0B80023C */  lui        $v0, %hi(_spu_mem_mode_plus)
    /* 6DE8 80016DE8 745A428C */  lw         $v0, %lo(_spu_mem_mode_plus)($v0)
    /* 6DEC 80016DEC 0B80033C */  lui        $v1, %hi(_spu_RXX)
    /* 6DF0 80016DF0 4C5A638C */  lw         $v1, %lo(_spu_RXX)($v1)
    /* 6DF4 80016DF4 06104400 */  srlv       $v0, $a0, $v0
    /* 6DF8 80016DF8 0B80013C */  lui        $at, %hi(_spu_tsa)
    /* 6DFC 80016DFC 645A22A4 */  sh         $v0, %lo(_spu_tsa)($at)
    /* 6E00 80016E00 A60162A4 */  sh         $v0, 0x1A6($v1)
    /* 6E04 80016E04 FC5B0008 */  j          .L80016FF0
    /* 6E08 80016E08 21100000 */   addu      $v0, $zero, $zero
  .L80016E0C:
    /* 6E0C 80016E0C 0B80053C */  lui        $a1, %hi(_spu_RXX)
    /* 6E10 80016E10 4C5AA58C */  lw         $a1, %lo(_spu_RXX)($a1)
    /* 6E14 80016E14 0B80043C */  lui        $a0, %hi(_spu_tsa)
    /* 6E18 80016E18 645A8494 */  lhu        $a0, %lo(_spu_tsa)($a0)
    /* 6E1C 80016E1C A601A294 */  lhu        $v0, 0x1A6($a1)
    /* 6E20 80016E20 0B80013C */  lui        $at, %hi(D_800B5A9C)
    /* 6E24 80016E24 9C5A20AC */  sw         $zero, %lo(D_800B5A9C)($at)
    /* 6E28 80016E28 09004410 */  beq        $v0, $a0, .L80016E50
    /* 6E2C 80016E2C 21180000 */   addu      $v1, $zero, $zero
    /* 6E30 80016E30 01006324 */  addiu      $v1, $v1, 0x1
  .L80016E34:
    /* 6E34 80016E34 010F622C */  sltiu      $v0, $v1, 0xF01
    /* 6E38 80016E38 6D004010 */  beqz       $v0, .L80016FF0
    /* 6E3C 80016E3C FEFF0224 */   addiu     $v0, $zero, -0x2
    /* 6E40 80016E40 A601A294 */  lhu        $v0, 0x1A6($a1)
    /* 6E44 80016E44 00000000 */  nop
    /* 6E48 80016E48 FAFF4414 */  bne        $v0, $a0, .L80016E34
    /* 6E4C 80016E4C 01006324 */   addiu     $v1, $v1, 0x1
  .L80016E50:
    /* 6E50 80016E50 0B80033C */  lui        $v1, %hi(_spu_RXX)
    /* 6E54 80016E54 4C5A638C */  lw         $v1, %lo(_spu_RXX)($v1)
    /* 6E58 80016E58 00000000 */  nop
    /* 6E5C 80016E5C AA016294 */  lhu        $v0, 0x1AA($v1)
    /* 6E60 80016E60 00000000 */  nop
    /* 6E64 80016E64 CFFF4230 */  andi       $v0, $v0, 0xFFCF
    /* 6E68 80016E68 20004234 */  ori        $v0, $v0, 0x20
    /* 6E6C 80016E6C AA0162A4 */  sh         $v0, 0x1AA($v1)
    /* 6E70 80016E70 FC5B0008 */  j          .L80016FF0
    /* 6E74 80016E74 21100000 */   addu      $v0, $zero, $zero
  .L80016E78:
    /* 6E78 80016E78 0B80053C */  lui        $a1, %hi(_spu_RXX)
    /* 6E7C 80016E7C 4C5AA58C */  lw         $a1, %lo(_spu_RXX)($a1)
    /* 6E80 80016E80 0B80043C */  lui        $a0, %hi(_spu_tsa)
    /* 6E84 80016E84 645A8494 */  lhu        $a0, %lo(_spu_tsa)($a0)
    /* 6E88 80016E88 A601A294 */  lhu        $v0, 0x1A6($a1)
    /* 6E8C 80016E8C 0B80013C */  lui        $at, %hi(D_800B5A9C)
    /* 6E90 80016E90 9C5A26AC */  sw         $a2, %lo(D_800B5A9C)($at)
    /* 6E94 80016E94 09004410 */  beq        $v0, $a0, .L80016EBC
    /* 6E98 80016E98 21180000 */   addu      $v1, $zero, $zero
    /* 6E9C 80016E9C 01006324 */  addiu      $v1, $v1, 0x1
  .L80016EA0:
    /* 6EA0 80016EA0 010F622C */  sltiu      $v0, $v1, 0xF01
    /* 6EA4 80016EA4 52004010 */  beqz       $v0, .L80016FF0
    /* 6EA8 80016EA8 FEFF0224 */   addiu     $v0, $zero, -0x2
    /* 6EAC 80016EAC A601A294 */  lhu        $v0, 0x1A6($a1)
    /* 6EB0 80016EB0 00000000 */  nop
    /* 6EB4 80016EB4 FAFF4414 */  bne        $v0, $a0, .L80016EA0
    /* 6EB8 80016EB8 01006324 */   addiu     $v1, $v1, 0x1
  .L80016EBC:
    /* 6EBC 80016EBC 0B80033C */  lui        $v1, %hi(_spu_RXX)
    /* 6EC0 80016EC0 4C5A638C */  lw         $v1, %lo(_spu_RXX)($v1)
    /* 6EC4 80016EC4 00000000 */  nop
    /* 6EC8 80016EC8 AA016294 */  lhu        $v0, 0x1AA($v1)
    /* 6ECC 80016ECC 00000000 */  nop
    /* 6ED0 80016ED0 30004234 */  ori        $v0, $v0, 0x30
    /* 6ED4 80016ED4 AA0162A4 */  sh         $v0, 0x1AA($v1)
    /* 6ED8 80016ED8 FC5B0008 */  j          .L80016FF0
    /* 6EDC 80016EDC 21100000 */   addu      $v0, $zero, $zero
  .L80016EE0:
    /* 6EE0 80016EE0 0B80023C */  lui        $v0, %hi(D_800B5A9C)
    /* 6EE4 80016EE4 9C5A428C */  lw         $v0, %lo(D_800B5A9C)($v0)
    /* 6EE8 80016EE8 00000000 */  nop
    /* 6EEC 80016EEC 02004614 */  bne        $v0, $a2, .L80016EF8
    /* 6EF0 80016EF0 20000424 */   addiu     $a0, $zero, 0x20
    /* 6EF4 80016EF4 30000424 */  addiu      $a0, $zero, 0x30
  .L80016EF8:
    /* 6EF8 80016EF8 0B80053C */  lui        $a1, %hi(_spu_RXX)
    /* 6EFC 80016EFC 4C5AA58C */  lw         $a1, %lo(_spu_RXX)($a1)
    /* 6F00 80016F00 21180000 */  addu       $v1, $zero, $zero
    /* 6F04 80016F04 AA01A294 */  lhu        $v0, 0x1AA($a1)
    /* 6F08 80016F08 FFFF8430 */  andi       $a0, $a0, 0xFFFF
    /* 6F0C 80016F0C 30004230 */  andi       $v0, $v0, 0x30
    /* 6F10 80016F10 09004410 */  beq        $v0, $a0, .L80016F38
    /* 6F14 80016F14 01006324 */   addiu     $v1, $v1, 0x1
  .L80016F18:
    /* 6F18 80016F18 010F622C */  sltiu      $v0, $v1, 0xF01
    /* 6F1C 80016F1C 34004010 */  beqz       $v0, .L80016FF0
    /* 6F20 80016F20 FEFF0224 */   addiu     $v0, $zero, -0x2
    /* 6F24 80016F24 AA01A294 */  lhu        $v0, 0x1AA($a1)
    /* 6F28 80016F28 00000000 */  nop
    /* 6F2C 80016F2C 30004230 */  andi       $v0, $v0, 0x30
    /* 6F30 80016F30 F9FF4414 */  bne        $v0, $a0, .L80016F18
    /* 6F34 80016F34 01006324 */   addiu     $v1, $v1, 0x1
  .L80016F38:
    /* 6F38 80016F38 0B80033C */  lui        $v1, %hi(D_800B5A9C)
    /* 6F3C 80016F3C 9C5A638C */  lw         $v1, %lo(D_800B5A9C)($v1)
    /* 6F40 80016F40 01000224 */  addiu      $v0, $zero, 0x1
    /* 6F44 80016F44 05006214 */  bne        $v1, $v0, .L80016F5C
    /* 6F48 80016F48 00000000 */   nop
    /* 6F4C 80016F4C A35C000C */  jal        func_8001728C
    /* 6F50 80016F50 04001026 */   addiu     $s0, $s0, 0x4
    /* 6F54 80016F54 DA5B0008 */  j          .L80016F68
    /* 6F58 80016F58 0001063C */   lui       $a2, (0x1000201 >> 16)
  .L80016F5C:
    /* 6F5C 80016F5C 995C000C */  jal        func_80017264
    /* 6F60 80016F60 04001026 */   addiu     $s0, $s0, 0x4
    /* 6F64 80016F64 0001063C */  lui        $a2, (0x1000201 >> 16)
  .L80016F68:
    /* 6F68 80016F68 FCFF048E */  lw         $a0, -0x4($s0)
    /* 6F6C 80016F6C 0B80013C */  lui        $at, %hi(D_800B5AA0)
    /* 6F70 80016F70 A05A24AC */  sw         $a0, %lo(D_800B5AA0)($at)
    /* 6F74 80016F74 0000048E */  lw         $a0, 0x0($s0)
    /* 6F78 80016F78 0B80053C */  lui        $a1, %hi(D_800B5A50)
    /* 6F7C 80016F7C 505AA58C */  lw         $a1, %lo(D_800B5A50)($a1)
    /* 6F80 80016F80 82190400 */  srl        $v1, $a0, 6
    /* 6F84 80016F84 3F008230 */  andi       $v0, $a0, 0x3F
    /* 6F88 80016F88 2B100200 */  sltu       $v0, $zero, $v0
    /* 6F8C 80016F8C 0B80043C */  lui        $a0, %hi(D_800B5AA0)
    /* 6F90 80016F90 A05A848C */  lw         $a0, %lo(D_800B5AA0)($a0)
    /* 6F94 80016F94 21186200 */  addu       $v1, $v1, $v0
    /* 6F98 80016F98 0B80013C */  lui        $at, %hi(D_800B5AA4)
    /* 6F9C 80016F9C A45A23AC */  sw         $v1, %lo(D_800B5AA4)($at)
    /* 6FA0 80016FA0 0000A4AC */  sw         $a0, 0x0($a1)
    /* 6FA4 80016FA4 0B80023C */  lui        $v0, %hi(D_800B5AA4)
    /* 6FA8 80016FA8 A45A428C */  lw         $v0, %lo(D_800B5AA4)($v0)
    /* 6FAC 80016FAC 0B80033C */  lui        $v1, %hi(D_800B5A54)
    /* 6FB0 80016FB0 545A638C */  lw         $v1, %lo(D_800B5A54)($v1)
    /* 6FB4 80016FB4 00140200 */  sll        $v0, $v0, 16
    /* 6FB8 80016FB8 10004234 */  ori        $v0, $v0, 0x10
    /* 6FBC 80016FBC 000062AC */  sw         $v0, 0x0($v1)
    /* 6FC0 80016FC0 0B80033C */  lui        $v1, %hi(D_800B5A9C)
    /* 6FC4 80016FC4 9C5A638C */  lw         $v1, %lo(D_800B5A9C)($v1)
    /* 6FC8 80016FC8 01000224 */  addiu      $v0, $zero, 0x1
    /* 6FCC 80016FCC 03006214 */  bne        $v1, $v0, .L80016FDC
    /* 6FD0 80016FD0 0102C634 */   ori       $a2, $a2, (0x1000201 & 0xFFFF)
    /* 6FD4 80016FD4 0001063C */  lui        $a2, (0x1000200 >> 16)
    /* 6FD8 80016FD8 0002C634 */  ori        $a2, $a2, (0x1000200 & 0xFFFF)
  .L80016FDC:
    /* 6FDC 80016FDC 0B80023C */  lui        $v0, %hi(D_800B5A58)
    /* 6FE0 80016FE0 585A428C */  lw         $v0, %lo(D_800B5A58)($v0)
    /* 6FE4 80016FE4 00000000 */  nop
    /* 6FE8 80016FE8 000046AC */  sw         $a2, 0x0($v0)
    /* 6FEC 80016FEC 21100000 */  addu       $v0, $zero, $zero
  .L80016FF0:
    /* 6FF0 80016FF0 1400BF8F */  lw         $ra, 0x14($sp)
    /* 6FF4 80016FF4 1000B08F */  lw         $s0, 0x10($sp)
    /* 6FF8 80016FF8 0800E003 */  jr         $ra
    /* 6FFC 80016FFC 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel _spu_t
