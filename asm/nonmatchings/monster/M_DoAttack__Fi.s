.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_DoAttack__Fi, 0x1AC

glabel M_DoAttack__Fi
    /* 13E44 8014DA3C C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 13E48 8014DA40 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 13E4C 8014DA44 21888000 */  addu       $s1, $a0, $zero
    /* 13E50 8014DA48 40101100 */  sll        $v0, $s1, 1
    /* 13E54 8014DA4C 21105100 */  addu       $v0, $v0, $s1
    /* 13E58 8014DA50 80100200 */  sll        $v0, $v0, 2
    /* 13E5C 8014DA54 21105100 */  addu       $v0, $v0, $s1
    /* 13E60 8014DA58 C0100200 */  sll        $v0, $v0, 3
    /* 13E64 8014DA5C 1080033C */  lui        $v1, %hi(monster)
    /* 13E68 8014DA60 94536324 */  addiu      $v1, $v1, %lo(monster)
    /* 13E6C 8014DA64 1800B0AF */  sw         $s0, 0x18($sp)
    /* 13E70 8014DA68 21804300 */  addu       $s0, $v0, $v1
    /* 13E74 8014DA6C 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 13E78 8014DA70 51001592 */  lbu        $s5, 0x51($s0)
    /* 13E7C 8014DA74 2400B3AF */  sw         $s3, 0x24($sp)
    /* 13E80 8014DA78 52001392 */  lbu        $s3, 0x52($s0)
    /* 13E84 8014DA7C 2800B4AF */  sw         $s4, 0x28($sp)
    /* 13E88 8014DA80 50001492 */  lbu        $s4, 0x50($s0)
    /* 13E8C 8014DA84 3000BFAF */  sw         $ra, 0x30($sp)
    /* 13E90 8014DA88 2000B2AF */  sw         $s2, 0x20($sp)
    /* 13E94 8014DA8C 6400028E */  lw         $v0, 0x64($s0)
    /* 13E98 8014DA90 41000382 */  lb         $v1, 0x41($s0)
    /* 13E9C 8014DA94 26004290 */  lbu        $v0, 0x26($v0)
    /* 13EA0 8014DA98 3D001292 */  lbu        $s2, 0x3D($s0)
    /* 13EA4 8014DA9C 0B006214 */  bne        $v1, $v0, .L8014DACC
    /* 13EA8 8014DAA0 21308002 */   addu      $a2, $s4, $zero
    /* 13EAC 8014DAA4 21284002 */  addu       $a1, $s2, $zero
    /* 13EB0 8014DAA8 2138A002 */  addu       $a3, $s5, $zero
    /* 13EB4 8014DAAC 0A35050C */  jal        M_TryH2HHit__Fiiiii
    /* 13EB8 8014DAB0 1000B3AF */   sw        $s3, 0x10($sp)
    /* 13EBC 8014DAB4 4C000392 */  lbu        $v1, 0x4C($s0)
    /* 13EC0 8014DAB8 18000224 */  addiu      $v0, $zero, 0x18
    /* 13EC4 8014DABC 03006210 */  beq        $v1, $v0, .L8014DACC
    /* 13EC8 8014DAC0 21202002 */   addu      $a0, $s1, $zero
    /* 13ECC 8014DAC4 4AF5000C */  jal        PlayEffect__Fii
    /* 13ED0 8014DAC8 21280000 */   addu      $a1, $zero, $zero
  .L8014DACC:
    /* 13ED4 8014DACC 6000028E */  lw         $v0, 0x60($s0)
    /* 13ED8 8014DAD0 00000000 */  nop
    /* 13EDC 8014DAD4 12004290 */  lbu        $v0, 0x12($v0)
    /* 13EE0 8014DAD8 00000000 */  nop
    /* 13EE4 8014DADC C4FF4224 */  addiu      $v0, $v0, -0x3C
    /* 13EE8 8014DAE0 0400422C */  sltiu      $v0, $v0, 0x4
    /* 13EEC 8014DAE4 0E004010 */  beqz       $v0, .L8014DB20
    /* 13EF0 8014DAE8 09000224 */   addiu     $v0, $zero, 0x9
    /* 13EF4 8014DAEC 41000382 */  lb         $v1, 0x41($s0)
    /* 13EF8 8014DAF0 00000000 */  nop
    /* 13EFC 8014DAF4 0A006214 */  bne        $v1, $v0, .L8014DB20
    /* 13F00 8014DAF8 FEFF6226 */   addiu     $v0, $s3, -0x2
    /* 13F04 8014DAFC 1000A2AF */  sw         $v0, 0x10($sp)
    /* 13F08 8014DB00 21202002 */  addu       $a0, $s1, $zero
    /* 13F0C 8014DB04 21284002 */  addu       $a1, $s2, $zero
    /* 13F10 8014DB08 0A008626 */  addiu      $a2, $s4, 0xA
    /* 13F14 8014DB0C 0A35050C */  jal        M_TryH2HHit__Fiiiii
    /* 13F18 8014DB10 FEFFA726 */   addiu     $a3, $s5, -0x2
    /* 13F1C 8014DB14 21202002 */  addu       $a0, $s1, $zero
    /* 13F20 8014DB18 4AF5000C */  jal        PlayEffect__Fii
    /* 13F24 8014DB1C 21280000 */   addu      $a1, $zero, $zero
  .L8014DB20:
    /* 13F28 8014DB20 6000028E */  lw         $v0, 0x60($s0)
    /* 13F2C 8014DB24 00000000 */  nop
    /* 13F30 8014DB28 12004290 */  lbu        $v0, 0x12($v0)
    /* 13F34 8014DB2C 00000000 */  nop
    /* 13F38 8014DB30 B4FF4224 */  addiu      $v0, $v0, -0x4C
    /* 13F3C 8014DB34 0400422C */  sltiu      $v0, $v0, 0x4
    /* 13F40 8014DB38 0E004010 */  beqz       $v0, .L8014DB74
    /* 13F44 8014DB3C 0D000224 */   addiu     $v0, $zero, 0xD
    /* 13F48 8014DB40 41000382 */  lb         $v1, 0x41($s0)
    /* 13F4C 8014DB44 00000000 */  nop
    /* 13F50 8014DB48 0A006214 */  bne        $v1, $v0, .L8014DB74
    /* 13F54 8014DB4C 04006226 */   addiu     $v0, $s3, 0x4
    /* 13F58 8014DB50 1000A2AF */  sw         $v0, 0x10($sp)
    /* 13F5C 8014DB54 21202002 */  addu       $a0, $s1, $zero
    /* 13F60 8014DB58 21284002 */  addu       $a1, $s2, $zero
    /* 13F64 8014DB5C ECFF8626 */  addiu      $a2, $s4, -0x14
    /* 13F68 8014DB60 0A35050C */  jal        M_TryH2HHit__Fiiiii
    /* 13F6C 8014DB64 0400A726 */   addiu     $a3, $s5, 0x4
    /* 13F70 8014DB68 21202002 */  addu       $a0, $s1, $zero
    /* 13F74 8014DB6C 4AF5000C */  jal        PlayEffect__Fii
    /* 13F78 8014DB70 21280000 */   addu      $a1, $zero, $zero
  .L8014DB74:
    /* 13F7C 8014DB74 4C000392 */  lbu        $v1, 0x4C($s0)
    /* 13F80 8014DB78 18000224 */  addiu      $v0, $zero, 0x18
    /* 13F84 8014DB7C 07006214 */  bne        $v1, $v0, .L8014DB9C
    /* 13F88 8014DB80 01000224 */   addiu     $v0, $zero, 0x1
    /* 13F8C 8014DB84 41000382 */  lb         $v1, 0x41($s0)
    /* 13F90 8014DB88 00000000 */  nop
    /* 13F94 8014DB8C 04006214 */  bne        $v1, $v0, .L8014DBA0
    /* 13F98 8014DB90 21202002 */   addu      $a0, $s1, $zero
    /* 13F9C 8014DB94 4AF5000C */  jal        PlayEffect__Fii
    /* 13FA0 8014DB98 21280000 */   addu      $a1, $zero, $zero
  .L8014DB9C:
    /* 13FA4 8014DB9C 41000382 */  lb         $v1, 0x41($s0)
  .L8014DBA0:
    /* 13FA8 8014DBA0 40000282 */  lb         $v0, 0x40($s0)
    /* 13FAC 8014DBA4 00000000 */  nop
    /* 13FB0 8014DBA8 05006214 */  bne        $v1, $v0, .L8014DBC0
    /* 13FB4 8014DBAC 21100000 */   addu      $v0, $zero, $zero
    /* 13FB8 8014DBB0 3C000582 */  lb         $a1, 0x3C($s0)
    /* 13FBC 8014DBB4 9CFF010C */  jal        M_StartStand__Fii
    /* 13FC0 8014DBB8 21202002 */   addu      $a0, $s1, $zero
    /* 13FC4 8014DBBC 01000224 */  addiu      $v0, $zero, 0x1
  .L8014DBC0:
    /* 13FC8 8014DBC0 3000BF8F */  lw         $ra, 0x30($sp)
    /* 13FCC 8014DBC4 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 13FD0 8014DBC8 2800B48F */  lw         $s4, 0x28($sp)
    /* 13FD4 8014DBCC 2400B38F */  lw         $s3, 0x24($sp)
    /* 13FD8 8014DBD0 2000B28F */  lw         $s2, 0x20($sp)
    /* 13FDC 8014DBD4 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 13FE0 8014DBD8 1800B08F */  lw         $s0, 0x18($sp)
    /* 13FE4 8014DBDC 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 13FE8 8014DBE0 0800E003 */  jr         $ra
    /* 13FEC 8014DBE4 00000000 */   nop
endlabel M_DoAttack__Fi
