.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching cacheonei, 0x17C

glabel cacheonei
    /* 19E20 80029E20 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 19E24 80029E24 000F8230 */  andi       $v0, $a0, 0xF00
    /* 19E28 80029E28 03120200 */  sra        $v0, $v0, 8
    /* 19E2C 80029E2C 40180200 */  sll        $v1, $v0, 1
    /* 19E30 80029E30 21186200 */  addu       $v1, $v1, $v0
    /* 19E34 80029E34 C0180300 */  sll        $v1, $v1, 3
    /* 19E38 80029E38 1380023C */  lui        $v0, %hi(memclass)
    /* 19E3C 80029E3C 307A4224 */  addiu      $v0, $v0, %lo(memclass)
    /* 19E40 80029E40 21186200 */  addu       $v1, $v1, $v0
    /* 19E44 80029E44 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 19E48 80029E48 2800B2AF */  sw         $s2, 0x28($sp)
    /* 19E4C 80029E4C 2400B1AF */  sw         $s1, 0x24($sp)
    /* 19E50 80029E50 2000B0AF */  sw         $s0, 0x20($sp)
    /* 19E54 80029E54 1000628C */  lw         $v0, 0x10($v1)
    /* 19E58 80029E58 00000000 */  nop
    /* 19E5C 80029E5C 05004014 */  bnez       $v0, .L80029E74
    /* 19E60 80029E60 21880000 */   addu      $s1, $zero, $zero
    /* 19E64 80029E64 62AC000C */  jal        purgeonei
    /* 19E68 80029E68 00000000 */   nop
    /* 19E6C 80029E6C E0A70008 */  j          .L80029F80
    /* 19E70 80029E70 00000000 */   nop
  .L80029E74:
    /* 19E74 80029E74 0000628C */  lw         $v0, 0x0($v1)
    /* 19E78 80029E78 07009230 */  andi       $s2, $a0, 0x7
    /* 19E7C 80029E7C 21280000 */  addu       $a1, $zero, $zero
    /* 19E80 80029E80 1280063C */  lui        $a2, %hi(sequence)
    /* 19E84 80029E84 B4C4C68C */  lw         $a2, %lo(sequence)($a2)
    /* 19E88 80029E88 2000508C */  lw         $s0, 0x20($v0)
  .L80029E8C:
    /* 19E8C 80029E8C 00000000 */  nop
    /* 19E90 80029E90 1800048E */  lw         $a0, 0x18($s0)
    /* 19E94 80029E94 00000000 */  nop
    /* 19E98 80029E98 08008230 */  andi       $v0, $a0, 0x8
    /* 19E9C 80029E9C 10004010 */  beqz       $v0, .L80029EE0
    /* 19EA0 80029EA0 07008430 */   andi      $a0, $a0, 0x7
    /* 19EA4 80029EA4 2B104402 */  sltu       $v0, $s2, $a0
    /* 19EA8 80029EA8 09004014 */  bnez       $v0, .L80029ED0
    /* 19EAC 80029EAC 00000000 */   nop
    /* 19EB0 80029EB0 0B009214 */  bne        $a0, $s2, .L80029EE0
    /* 19EB4 80029EB4 00000000 */   nop
    /* 19EB8 80029EB8 1C00028E */  lw         $v0, 0x1C($s0)
    /* 19EBC 80029EBC 00000000 */  nop
    /* 19EC0 80029EC0 2310C200 */  subu       $v0, $a2, $v0
    /* 19EC4 80029EC4 2B104500 */  sltu       $v0, $v0, $a1
    /* 19EC8 80029EC8 05004014 */  bnez       $v0, .L80029EE0
    /* 19ECC 80029ECC 00000000 */   nop
  .L80029ED0:
    /* 19ED0 80029ED0 21880002 */  addu       $s1, $s0, $zero
    /* 19ED4 80029ED4 1C00028E */  lw         $v0, 0x1C($s0)
    /* 19ED8 80029ED8 21908000 */  addu       $s2, $a0, $zero
    /* 19EDC 80029EDC 2328C200 */  subu       $a1, $a2, $v0
  .L80029EE0:
    /* 19EE0 80029EE0 2000108E */  lw         $s0, 0x20($s0)
    /* 19EE4 80029EE4 0400628C */  lw         $v0, 0x4($v1)
    /* 19EE8 80029EE8 00000000 */  nop
    /* 19EEC 80029EEC E7FF0216 */  bne        $s0, $v0, .L80029E8C
    /* 19EF0 80029EF0 00000000 */   nop
    /* 19EF4 80029EF4 21002012 */  beqz       $s1, .L80029F7C
    /* 19EF8 80029EF8 21180000 */   addu      $v1, $zero, $zero
    /* 19EFC 80029EFC 1000A427 */  addiu      $a0, $sp, 0x10
  .L80029F00:
    /* 19F00 80029F00 21100302 */  addu       $v0, $s0, $v1
    /* 19F04 80029F04 04004290 */  lbu        $v0, 0x4($v0)
    /* 19F08 80029F08 01006324 */  addiu      $v1, $v1, 0x1
    /* 19F0C 80029F0C 000082A0 */  sb         $v0, 0x0($a0)
    /* 19F10 80029F10 0C006228 */  slti       $v0, $v1, 0xC
    /* 19F14 80029F14 FAFF4014 */  bnez       $v0, .L80029F00
    /* 19F18 80029F18 01008424 */   addiu     $a0, $a0, 0x1
    /* 19F1C 80029F1C 1C00A0A3 */  sb         $zero, 0x1C($sp)
  .L80029F20:
    /* 19F20 80029F20 1800068E */  lw         $a2, 0x18($s0)
    /* 19F24 80029F24 1400258E */  lw         $a1, 0x14($s1)
    /* 19F28 80029F28 1000A427 */  addiu      $a0, $sp, 0x10
    /* 19F2C 80029F2C 21380000 */  addu       $a3, $zero, $zero
    /* 19F30 80029F30 BAA9000C */  jal        reservememblockai
    /* 19F34 80029F34 0800C634 */   ori       $a2, $a2, 0x8
    /* 19F38 80029F38 07004014 */  bnez       $v0, .L80029F58
    /* 19F3C 80029F3C 00000000 */   nop
    /* 19F40 80029F40 88A7000C */  jal        cacheonei
    /* 19F44 80029F44 21204002 */   addu      $a0, $s2, $zero
    /* 19F48 80029F48 F5FF4014 */  bnez       $v0, .L80029F20
    /* 19F4C 80029F4C 21100000 */   addu      $v0, $zero, $zero
    /* 19F50 80029F50 E0A70008 */  j          .L80029F80
    /* 19F54 80029F54 00000000 */   nop
  .L80029F58:
    /* 19F58 80029F58 0000248E */  lw         $a0, 0x0($s1)
    /* 19F5C 80029F5C 0000458C */  lw         $a1, 0x0($v0)
    /* 19F60 80029F60 1400268E */  lw         $a2, 0x14($s1)
    /* 19F64 80029F64 F1B1000C */  jal        blockmove
    /* 19F68 80029F68 00000000 */   nop
    /* 19F6C 80029F6C D4AB000C */  jal        purgememblocki
    /* 19F70 80029F70 21202002 */   addu      $a0, $s1, $zero
    /* 19F74 80029F74 E0A70008 */  j          .L80029F80
    /* 19F78 80029F78 01000224 */   addiu     $v0, $zero, 0x1
  .L80029F7C:
    /* 19F7C 80029F7C 21100000 */  addu       $v0, $zero, $zero
  .L80029F80:
    /* 19F80 80029F80 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 19F84 80029F84 2800B28F */  lw         $s2, 0x28($sp)
    /* 19F88 80029F88 2400B18F */  lw         $s1, 0x24($sp)
    /* 19F8C 80029F8C 2000B08F */  lw         $s0, 0x20($sp)
    /* 19F90 80029F90 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 19F94 80029F94 0800E003 */  jr         $ra
    /* 19F98 80029F98 00000000 */   nop
endlabel cacheonei
