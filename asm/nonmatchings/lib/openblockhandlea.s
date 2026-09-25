.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching openblockhandlea, 0x288

glabel openblockhandlea
    /* 15E2C 80025E2C C8FEBD27 */  addiu      $sp, $sp, -0x138
    /* 15E30 80025E30 3001B6AF */  sw         $s6, 0x130($sp)
    /* 15E34 80025E34 4801B68F */  lw         $s6, 0x148($sp)
    /* 15E38 80025E38 2801B4AF */  sw         $s4, 0x128($sp)
    /* 15E3C 80025E3C 4C01B48F */  lw         $s4, 0x14C($sp)
    /* 15E40 80025E40 1801B0AF */  sw         $s0, 0x118($sp)
    /* 15E44 80025E44 21808000 */  addu       $s0, $a0, $zero
    /* 15E48 80025E48 2C01B5AF */  sw         $s5, 0x12C($sp)
    /* 15E4C 80025E4C 21A8A000 */  addu       $s5, $a1, $zero
    /* 15E50 80025E50 2001B2AF */  sw         $s2, 0x120($sp)
    /* 15E54 80025E54 2190C000 */  addu       $s2, $a2, $zero
    /* 15E58 80025E58 2401B3AF */  sw         $s3, 0x124($sp)
    /* 15E5C 80025E5C 2198E000 */  addu       $s3, $a3, $zero
    /* 15E60 80025E60 1C01B1AF */  sw         $s1, 0x11C($sp)
    /* 15E64 80025E64 01001124 */  addiu      $s1, $zero, 0x1
    /* 15E68 80025E68 28000324 */  addiu      $v1, $zero, 0x28
    /* 15E6C 80025E6C 3401BFAF */  sw         $ra, 0x134($sp)
    /* 15E70 80025E70 0000A0AE */  sw         $zero, 0x0($s5)
    /* 15E74 80025E74 000040AE */  sw         $zero, 0x0($s2)
    /* 15E78 80025E78 000060AE */  sw         $zero, 0x0($s3)
  .L80025E7C:
    /* 15E7C 80025E7C 0B80013C */  lui        $at, %hi(D_800B6400)
    /* 15E80 80025E80 21082300 */  addu       $at, $at, $v1
    /* 15E84 80025E84 0064228C */  lw         $v0, %lo(D_800B6400)($at)
    /* 15E88 80025E88 00000000 */  nop
    /* 15E8C 80025E8C 06004010 */  beqz       $v0, .L80025EA8
    /* 15E90 80025E90 20000224 */   addiu     $v0, $zero, 0x20
    /* 15E94 80025E94 01003126 */  addiu      $s1, $s1, 0x1
    /* 15E98 80025E98 2000222A */  slti       $v0, $s1, 0x20
    /* 15E9C 80025E9C F7FF4014 */  bnez       $v0, .L80025E7C
    /* 15EA0 80025EA0 28006324 */   addiu     $v1, $v1, 0x28
    /* 15EA4 80025EA4 20000224 */  addiu      $v0, $zero, 0x20
  .L80025EA8:
    /* 15EA8 80025EA8 0B002216 */  bne        $s1, $v0, .L80025ED8
    /* 15EAC 80025EAC 00000000 */   nop
    /* 15EB0 80025EB0 2F008012 */  beqz       $s4, .L80025F70
    /* 15EB4 80025EB4 21280002 */   addu      $a1, $s0, $zero
    /* 15EB8 80025EB8 1180043C */  lui        $a0, %hi(D_8010ED68)
    /* 15EBC 80025EBC 68ED8424 */  addiu      $a0, $a0, %lo(D_8010ED68)
    /* 15EC0 80025EC0 1180023C */  lui        $v0, %hi(D_8010ED58)
    /* 15EC4 80025EC4 58ED4224 */  addiu      $v0, $v0, %lo(D_8010ED58)
    /* 15EC8 80025EC8 1280013C */  lui        $at, %hi(abortfile)
    /* 15ECC 80025ECC B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 15ED0 80025ED0 D8970008 */  j          .L80025F60
    /* 15ED4 80025ED4 E0000224 */   addiu     $v0, $zero, 0xE0
  .L80025ED8:
    /* 15ED8 80025ED8 7CA2000C */  jal        getdirectory
    /* 15EDC 80025EDC 1800A427 */   addiu     $a0, $sp, 0x18
    /* 15EE0 80025EE0 1800A427 */  addiu      $a0, $sp, 0x18
    /* 15EE4 80025EE4 FC40000C */  jal        strcat
    /* 15EE8 80025EE8 21280002 */   addu      $a1, $s0, $zero
    /* 15EEC 80025EEC 1800A427 */  addiu      $a0, $sp, 0x18
    /* 15EF0 80025EF0 1280053C */  lui        $a1, %hi(D_8011C3E0)
    /* 15EF4 80025EF4 E0C3A524 */  addiu      $a1, $a1, %lo(D_8011C3E0)
    /* 15EF8 80025EF8 4375000C */  jal        strncmp
    /* 15EFC 80025EFC 06000624 */   addiu     $a2, $zero, 0x6
    /* 15F00 80025F00 4B004014 */  bnez       $v0, .L80026030
    /* 15F04 80025F04 21200002 */   addu      $a0, $s0, $zero
    /* 15F08 80025F08 1E00A427 */  addiu      $a0, $sp, 0x1E
    /* 15F0C 80025F0C 80101100 */  sll        $v0, $s1, 2
    /* 15F10 80025F10 21105100 */  addu       $v0, $v0, $s1
    /* 15F14 80025F14 C0800200 */  sll        $s0, $v0, 3
    /* 15F18 80025F18 0B80053C */  lui        $a1, %hi(D_800B6414)
    /* 15F1C 80025F1C 1464A524 */  addiu      $a1, $a1, %lo(D_800B6414)
    /* 15F20 80025F20 21280502 */  addu       $a1, $s0, $a1
    /* 15F24 80025F24 F79F000C */  jal        cdromdirectoryentry
    /* 15F28 80025F28 21306002 */   addu      $a2, $s3, $zero
    /* 15F2C 80025F2C 0000628E */  lw         $v0, 0x0($s3)
    /* 15F30 80025F30 00000000 */  nop
    /* 15F34 80025F34 10004014 */  bnez       $v0, .L80025F78
    /* 15F38 80025F38 1800A527 */   addiu     $a1, $sp, 0x18
    /* 15F3C 80025F3C 0C008012 */  beqz       $s4, .L80025F70
    /* 15F40 80025F40 00000000 */   nop
    /* 15F44 80025F44 1180043C */  lui        $a0, %hi(D_8010ED90)
    /* 15F48 80025F48 90ED8424 */  addiu      $a0, $a0, %lo(D_8010ED90)
    /* 15F4C 80025F4C 1180023C */  lui        $v0, %hi(D_8010ED58)
    /* 15F50 80025F50 58ED4224 */  addiu      $v0, $v0, %lo(D_8010ED58)
    /* 15F54 80025F54 1280013C */  lui        $at, %hi(abortfile)
    /* 15F58 80025F58 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 15F5C 80025F5C EC000224 */  addiu      $v0, $zero, 0xEC
  .L80025F60:
    /* 15F60 80025F60 1280013C */  lui        $at, %hi(abortline)
    /* 15F64 80025F64 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 15F68 80025F68 0F95000C */  jal        abortmessage
    /* 15F6C 80025F6C 00000000 */   nop
  .L80025F70:
    /* 15F70 80025F70 22980008 */  j          .L80026088
    /* 15F74 80025F74 21100000 */   addu      $v0, $zero, $zero
  .L80025F78:
    /* 15F78 80025F78 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 15F7C 80025F7C 0B80013C */  lui        $at, %hi(D_800B640C)
    /* 15F80 80025F80 21083000 */  addu       $at, $at, $s0
    /* 15F84 80025F84 0C6420AC */  sw         $zero, %lo(D_800B640C)($at)
    /* 15F88 80025F88 0B80013C */  lui        $at, %hi(D_800B6410)
    /* 15F8C 80025F8C 21083000 */  addu       $at, $at, $s0
    /* 15F90 80025F90 106422AC */  sw         $v0, %lo(D_800B6410)($at)
    /* 15F94 80025F94 01000224 */  addiu      $v0, $zero, 0x1
    /* 15F98 80025F98 0B80013C */  lui        $at, %hi(D_800B6400)
    /* 15F9C 80025F9C 21083000 */  addu       $at, $at, $s0
    /* 15FA0 80025FA0 006422AC */  sw         $v0, %lo(D_800B6400)($at)
    /* 15FA4 80025FA4 00080224 */  addiu      $v0, $zero, 0x800
    /* 15FA8 80025FA8 0000C2AE */  sw         $v0, 0x0($s6)
    /* 15FAC 80025FAC 1800A293 */  lbu        $v0, 0x18($sp)
    /* 15FB0 80025FB0 00000000 */  nop
    /* 15FB4 80025FB4 0E004010 */  beqz       $v0, .L80025FF0
    /* 15FB8 80025FB8 1900A327 */   addiu     $v1, $sp, 0x19
    /* 15FBC 80025FBC 2F000624 */  addiu      $a2, $zero, 0x2F
    /* 15FC0 80025FC0 3A000424 */  addiu      $a0, $zero, 0x3A
  .L80025FC4:
    /* 15FC4 80025FC4 00006290 */  lbu        $v0, 0x0($v1)
    /* 15FC8 80025FC8 00000000 */  nop
    /* 15FCC 80025FCC 03004610 */  beq        $v0, $a2, .L80025FDC
    /* 15FD0 80025FD0 00000000 */   nop
    /* 15FD4 80025FD4 03004414 */  bne        $v0, $a0, .L80025FE4
    /* 15FD8 80025FD8 00000000 */   nop
  .L80025FDC:
    /* 15FDC 80025FDC 01006524 */  addiu      $a1, $v1, 0x1
    /* 15FE0 80025FE0 00006290 */  lbu        $v0, 0x0($v1)
  .L80025FE4:
    /* 15FE4 80025FE4 00000000 */  nop
    /* 15FE8 80025FE8 F6FF4014 */  bnez       $v0, .L80025FC4
    /* 15FEC 80025FEC 01006324 */   addiu     $v1, $v1, 0x1
  .L80025FF0:
    /* 15FF0 80025FF0 80801100 */  sll        $s0, $s1, 2
    /* 15FF4 80025FF4 21801102 */  addu       $s0, $s0, $s1
    /* 15FF8 80025FF8 C0801000 */  sll        $s0, $s0, 3
    /* 15FFC 80025FFC 0B80043C */  lui        $a0, %hi(libblockhandle)
    /* 16000 80026000 F4638424 */  addiu      $a0, $a0, %lo(libblockhandle)
    /* 16004 80026004 21200402 */  addu       $a0, $s0, $a0
    /* 16008 80026008 8367000C */  jal        strncpy
    /* 1600C 8002600C 0C000624 */   addiu     $a2, $zero, 0xC
    /* 16010 80026010 0B80013C */  lui        $at, %hi(D_800B640C)
    /* 16014 80026014 21083000 */  addu       $at, $at, $s0
    /* 16018 80026018 0C64258C */  lw         $a1, %lo(D_800B640C)($at)
    /* 1601C 8002601C 21202002 */  addu       $a0, $s1, $zero
    /* 16020 80026020 C59B000C */  jal        seekblockhandlea
    /* 16024 80026024 21308002 */   addu      $a2, $s4, $zero
    /* 16028 80026028 21980008 */  j          .L80026084
    /* 1602C 8002602C 0000B1AE */   sw        $s1, 0x0($s5)
  .L80026030:
    /* 16030 80026030 80801100 */  sll        $s0, $s1, 2
    /* 16034 80026034 21801102 */  addu       $s0, $s0, $s1
    /* 16038 80026038 C0801000 */  sll        $s0, $s0, 3
    /* 1603C 8002603C 0B80053C */  lui        $a1, %hi(D_800B6404)
    /* 16040 80026040 0464A524 */  addiu      $a1, $a1, %lo(D_800B6404)
    /* 16044 80026044 21280502 */  addu       $a1, $s0, $a1
    /* 16048 80026048 21304002 */  addu       $a2, $s2, $zero
    /* 1604C 8002604C 21386002 */  addu       $a3, $s3, $zero
    /* 16050 80026050 86A2000C */  jal        openhandlea
    /* 16054 80026054 1000B4AF */   sw        $s4, 0x10($sp)
    /* 16058 80026058 0000428E */  lw         $v0, 0x0($s2)
    /* 1605C 8002605C 0B80013C */  lui        $at, %hi(D_800B640C)
    /* 16060 80026060 21083000 */  addu       $at, $at, $s0
    /* 16064 80026064 0C6422AC */  sw         $v0, %lo(D_800B640C)($at)
    /* 16068 80026068 02000224 */  addiu      $v0, $zero, 0x2
    /* 1606C 8002606C 0B80013C */  lui        $at, %hi(D_800B6400)
    /* 16070 80026070 21083000 */  addu       $at, $at, $s0
    /* 16074 80026074 006422AC */  sw         $v0, %lo(D_800B6400)($at)
    /* 16078 80026078 01000224 */  addiu      $v0, $zero, 0x1
    /* 1607C 8002607C 0000C2AE */  sw         $v0, 0x0($s6)
    /* 16080 80026080 0000B1AE */  sw         $s1, 0x0($s5)
  .L80026084:
    /* 16084 80026084 21106002 */  addu       $v0, $s3, $zero
  .L80026088:
    /* 16088 80026088 3401BF8F */  lw         $ra, 0x134($sp)
    /* 1608C 8002608C 3001B68F */  lw         $s6, 0x130($sp)
    /* 16090 80026090 2C01B58F */  lw         $s5, 0x12C($sp)
    /* 16094 80026094 2801B48F */  lw         $s4, 0x128($sp)
    /* 16098 80026098 2401B38F */  lw         $s3, 0x124($sp)
    /* 1609C 8002609C 2001B28F */  lw         $s2, 0x120($sp)
    /* 160A0 800260A0 1C01B18F */  lw         $s1, 0x11C($sp)
    /* 160A4 800260A4 1801B08F */  lw         $s0, 0x118($sp)
    /* 160A8 800260A8 3801BD27 */  addiu      $sp, $sp, 0x138
    /* 160AC 800260AC 0800E003 */  jr         $ra
    /* 160B0 800260B0 00000000 */   nop
endlabel openblockhandlea
