.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetListsAvailable__FiUlPUc, 0x124

glabel GetListsAvailable__FiUlPUc
    /* 1C294 80155E8C C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 1C298 80155E90 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 1C29C 80155E94 21888000 */  addu       $s1, $a0, $zero
    /* 1C2A0 80155E98 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 1C2A4 80155E9C 21A8A000 */  addu       $s5, $a1, $zero
    /* 1C2A8 80155EA0 2000B2AF */  sw         $s2, 0x20($sp)
    /* 1C2AC 80155EA4 2190C000 */  addu       $s2, $a2, $zero
    /* 1C2B0 80155EA8 3400BFAF */  sw         $ra, 0x34($sp)
    /* 1C2B4 80155EAC 3000B6AF */  sw         $s6, 0x30($sp)
    /* 1C2B8 80155EB0 2800B4AF */  sw         $s4, 0x28($sp)
    /* 1C2BC 80155EB4 2400B3AF */  sw         $s3, 0x24($sp)
    /* 1C2C0 80155EB8 07002006 */  bltz       $s1, .L80155ED8
    /* 1C2C4 80155EBC 1800B0AF */   sw        $s0, 0x18($sp)
    /* 1C2C8 80155EC0 1280023C */  lui        $v0, %hi(NumOfMonsterListLevels)
    /* 1C2CC 80155EC4 94AA428C */  lw         $v0, %lo(NumOfMonsterListLevels)($v0)
    /* 1C2D0 80155EC8 00000000 */  nop
    /* 1C2D4 80155ECC 2A102202 */  slt        $v0, $s1, $v0
    /* 1C2D8 80155ED0 07004014 */  bnez       $v0, .L80155EF0
    /* 1C2DC 80155ED4 21800000 */   addu      $s0, $zero, $zero
  .L80155ED8:
    /* 1C2E0 80155ED8 21200000 */  addu       $a0, $zero, $zero
    /* 1C2E4 80155EDC 1280053C */  lui        $a1, %hi(D_80119740)
    /* 1C2E8 80155EE0 4097A524 */  addiu      $a1, $a1, %lo(D_80119740)
    /* 1C2EC 80155EE4 A583000C */  jal        DBG_Error
    /* 1C2F0 80155EE8 23020624 */   addiu     $a2, $zero, 0x223
    /* 1C2F4 80155EEC 21800000 */  addu       $s0, $zero, $zero
  .L80155EF0:
    /* 1C2F8 80155EF0 C0181100 */  sll        $v1, $s1, 3
    /* 1C2FC 80155EF4 0B80023C */  lui        $v0, %hi(AllLevels)
    /* 1C300 80155EF8 58754224 */  addiu      $v0, $v0, %lo(AllLevels)
    /* 1C304 80155EFC 21A06200 */  addu       $s4, $v1, $v0
    /* 1C308 80155F00 0000938E */  lw         $s3, 0x0($s4)
    /* 1C30C 80155F04 00000000 */  nop
    /* 1C310 80155F08 1600601A */  blez       $s3, .L80155F64
    /* 1C314 80155F0C 21880000 */   addu      $s1, $zero, $zero
    /* 1C318 80155F10 32001624 */  addiu      $s6, $zero, 0x32
  .L80155F14:
    /* 1C31C 80155F14 0400828E */  lw         $v0, 0x4($s4)
    /* 1C320 80155F18 00191000 */  sll        $v1, $s0, 4
    /* 1C324 80155F1C 21186200 */  addu       $v1, $v1, $v0
    /* 1C328 80155F20 0C00628C */  lw         $v0, 0xC($v1)
    /* 1C32C 80155F24 00000000 */  nop
    /* 1C330 80155F28 0A005514 */  bne        $v0, $s5, .L80155F54
    /* 1C334 80155F2C 00000000 */   nop
    /* 1C338 80155F30 05003616 */  bne        $s1, $s6, .L80155F48
    /* 1C33C 80155F34 21200000 */   addu      $a0, $zero, $zero
    /* 1C340 80155F38 1280053C */  lui        $a1, %hi(D_80119740)
    /* 1C344 80155F3C 4097A524 */  addiu      $a1, $a1, %lo(D_80119740)
    /* 1C348 80155F40 A583000C */  jal        DBG_Error
    /* 1C34C 80155F44 2F020624 */   addiu     $a2, $zero, 0x22F
  .L80155F48:
    /* 1C350 80155F48 000050A2 */  sb         $s0, 0x0($s2)
    /* 1C354 80155F4C 01005226 */  addiu      $s2, $s2, 0x1
    /* 1C358 80155F50 01003126 */  addiu      $s1, $s1, 0x1
  .L80155F54:
    /* 1C35C 80155F54 01001026 */  addiu      $s0, $s0, 0x1
    /* 1C360 80155F58 2A101302 */  slt        $v0, $s0, $s3
    /* 1C364 80155F5C EDFF4014 */  bnez       $v0, .L80155F14
    /* 1C368 80155F60 00000000 */   nop
  .L80155F64:
    /* 1C36C 80155F64 07002016 */  bnez       $s1, .L80155F84
    /* 1C370 80155F68 21102002 */   addu      $v0, $s1, $zero
    /* 1C374 80155F6C 21200000 */  addu       $a0, $zero, $zero
    /* 1C378 80155F70 1280053C */  lui        $a1, %hi(D_80119740)
    /* 1C37C 80155F74 4097A524 */  addiu      $a1, $a1, %lo(D_80119740)
    /* 1C380 80155F78 A583000C */  jal        DBG_Error
    /* 1C384 80155F7C 36020624 */   addiu     $a2, $zero, 0x236
    /* 1C388 80155F80 21102002 */  addu       $v0, $s1, $zero
  .L80155F84:
    /* 1C38C 80155F84 3400BF8F */  lw         $ra, 0x34($sp)
    /* 1C390 80155F88 3000B68F */  lw         $s6, 0x30($sp)
    /* 1C394 80155F8C 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 1C398 80155F90 2800B48F */  lw         $s4, 0x28($sp)
    /* 1C39C 80155F94 2400B38F */  lw         $s3, 0x24($sp)
    /* 1C3A0 80155F98 2000B28F */  lw         $s2, 0x20($sp)
    /* 1C3A4 80155F9C 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 1C3A8 80155FA0 1800B08F */  lw         $s0, 0x18($sp)
    /* 1C3AC 80155FA4 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 1C3B0 80155FA8 0800E003 */  jr         $ra
    /* 1C3B4 80155FAC 00000000 */   nop
endlabel GetListsAvailable__FiUlPUc
