.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitL4Triggers__Fv, 0x248

glabel InitL4Triggers__Fv
    /* 28DB8 801629B0 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 28DBC 801629B4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 28DC0 801629B8 21880000 */  addu       $s1, $zero, $zero
    /* 28DC4 801629BC 2000BFAF */  sw         $ra, 0x20($sp)
    /* 28DC8 801629C0 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 28DCC 801629C4 1800B2AF */  sw         $s2, 0x18($sp)
    /* 28DD0 801629C8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 28DD4 801629CC 1280013C */  lui        $at, %hi(numtrigs)
    /* 28DD8 801629D0 78BB20AC */  sw         $zero, %lo(numtrigs)($at)
    /* 28DDC 801629D4 21800000 */  addu       $s0, $zero, $zero
  .L801629D8:
    /* 28DE0 801629D8 21200002 */  addu       $a0, $s0, $zero
  .L801629DC:
    /* 28DE4 801629DC 910A020C */  jal        GetDPiece__Fii
    /* 28DE8 801629E0 21282002 */   addu      $a1, $s1, $zero
    /* 28DEC 801629E4 00140200 */  sll        $v0, $v0, 16
    /* 28DF0 801629E8 03140200 */  sra        $v0, $v0, 16
    /* 28DF4 801629EC 53000324 */  addiu      $v1, $zero, 0x53
    /* 28DF8 801629F0 12004314 */  bne        $v0, $v1, .L80162A3C
    /* 28DFC 801629F4 21200002 */   addu      $a0, $s0, $zero
    /* 28E00 801629F8 1280043C */  lui        $a0, %hi(numtrigs)
    /* 28E04 801629FC 78BB848C */  lw         $a0, %lo(numtrigs)($a0)
    /* 28E08 80162A00 43000224 */  addiu      $v0, $zero, 0x43
    /* 28E0C 80162A04 00190400 */  sll        $v1, $a0, 4
    /* 28E10 80162A08 01008424 */  addiu      $a0, $a0, 0x1
    /* 28E14 80162A0C 0E80013C */  lui        $at, %hi(trigs)
    /* 28E18 80162A10 21082300 */  addu       $at, $at, $v1
    /* 28E1C 80162A14 CC3330AC */  sw         $s0, %lo(trigs)($at)
    /* 28E20 80162A18 0E80013C */  lui        $at, %hi(trigs + 0x4)
    /* 28E24 80162A1C 21082300 */  addu       $at, $at, $v1
    /* 28E28 80162A20 D03331AC */  sw         $s1, %lo(trigs + 0x4)($at)
    /* 28E2C 80162A24 0E80013C */  lui        $at, %hi(trigs + 0x8)
    /* 28E30 80162A28 21082300 */  addu       $at, $at, $v1
    /* 28E34 80162A2C D43322AC */  sw         $v0, %lo(trigs + 0x8)($at)
    /* 28E38 80162A30 1280013C */  lui        $at, %hi(numtrigs)
    /* 28E3C 80162A34 78BB24AC */  sw         $a0, %lo(numtrigs)($at)
    /* 28E40 80162A38 21200002 */  addu       $a0, $s0, $zero
  .L80162A3C:
    /* 28E44 80162A3C 910A020C */  jal        GetDPiece__Fii
    /* 28E48 80162A40 21282002 */   addu      $a1, $s1, $zero
    /* 28E4C 80162A44 00140200 */  sll        $v0, $v0, 16
    /* 28E50 80162A48 03140200 */  sra        $v0, $v0, 16
    /* 28E54 80162A4C A6010324 */  addiu      $v1, $zero, 0x1A6
    /* 28E58 80162A50 15004314 */  bne        $v0, $v1, .L80162AA8
    /* 28E5C 80162A54 21200002 */   addu      $a0, $s0, $zero
    /* 28E60 80162A58 1280043C */  lui        $a0, %hi(numtrigs)
    /* 28E64 80162A5C 78BB848C */  lw         $a0, %lo(numtrigs)($a0)
    /* 28E68 80162A60 48000224 */  addiu      $v0, $zero, 0x48
    /* 28E6C 80162A64 00190400 */  sll        $v1, $a0, 4
    /* 28E70 80162A68 01008424 */  addiu      $a0, $a0, 0x1
    /* 28E74 80162A6C 0E80013C */  lui        $at, %hi(trigs)
    /* 28E78 80162A70 21082300 */  addu       $at, $at, $v1
    /* 28E7C 80162A74 CC3330AC */  sw         $s0, %lo(trigs)($at)
    /* 28E80 80162A78 0E80013C */  lui        $at, %hi(trigs + 0x4)
    /* 28E84 80162A7C 21082300 */  addu       $at, $at, $v1
    /* 28E88 80162A80 D03331AC */  sw         $s1, %lo(trigs + 0x4)($at)
    /* 28E8C 80162A84 0E80013C */  lui        $at, %hi(trigs + 0x8)
    /* 28E90 80162A88 21082300 */  addu       $at, $at, $v1
    /* 28E94 80162A8C D43322AC */  sw         $v0, %lo(trigs + 0x8)($at)
    /* 28E98 80162A90 0E80013C */  lui        $at, %hi(trigs + 0xC)
    /* 28E9C 80162A94 21082300 */  addu       $at, $at, $v1
    /* 28EA0 80162A98 D83320AC */  sw         $zero, %lo(trigs + 0xC)($at)
    /* 28EA4 80162A9C 1280013C */  lui        $at, %hi(numtrigs)
    /* 28EA8 80162AA0 78BB24AC */  sw         $a0, %lo(numtrigs)($at)
    /* 28EAC 80162AA4 21200002 */  addu       $a0, $s0, $zero
  .L80162AA8:
    /* 28EB0 80162AA8 910A020C */  jal        GetDPiece__Fii
    /* 28EB4 80162AAC 21282002 */   addu      $a1, $s1, $zero
    /* 28EB8 80162AB0 00140200 */  sll        $v0, $v0, 16
    /* 28EBC 80162AB4 03140200 */  sra        $v0, $v0, 16
    /* 28EC0 80162AB8 78000324 */  addiu      $v1, $zero, 0x78
    /* 28EC4 80162ABC 11004314 */  bne        $v0, $v1, .L80162B04
    /* 28EC8 80162AC0 42000224 */   addiu     $v0, $zero, 0x42
    /* 28ECC 80162AC4 1280043C */  lui        $a0, %hi(numtrigs)
    /* 28ED0 80162AC8 78BB848C */  lw         $a0, %lo(numtrigs)($a0)
    /* 28ED4 80162ACC 00000000 */  nop
    /* 28ED8 80162AD0 00190400 */  sll        $v1, $a0, 4
    /* 28EDC 80162AD4 01008424 */  addiu      $a0, $a0, 0x1
    /* 28EE0 80162AD8 0E80013C */  lui        $at, %hi(trigs)
    /* 28EE4 80162ADC 21082300 */  addu       $at, $at, $v1
    /* 28EE8 80162AE0 CC3330AC */  sw         $s0, %lo(trigs)($at)
    /* 28EEC 80162AE4 0E80013C */  lui        $at, %hi(trigs + 0x4)
    /* 28EF0 80162AE8 21082300 */  addu       $at, $at, $v1
    /* 28EF4 80162AEC D03331AC */  sw         $s1, %lo(trigs + 0x4)($at)
    /* 28EF8 80162AF0 0E80013C */  lui        $at, %hi(trigs + 0x8)
    /* 28EFC 80162AF4 21082300 */  addu       $at, $at, $v1
    /* 28F00 80162AF8 D43322AC */  sw         $v0, %lo(trigs + 0x8)($at)
    /* 28F04 80162AFC 1280013C */  lui        $at, %hi(numtrigs)
    /* 28F08 80162B00 78BB24AC */  sw         $a0, %lo(numtrigs)($at)
  .L80162B04:
    /* 28F0C 80162B04 01001026 */  addiu      $s0, $s0, 0x1
    /* 28F10 80162B08 6000022A */  slti       $v0, $s0, 0x60
    /* 28F14 80162B0C B3FF4014 */  bnez       $v0, .L801629DC
    /* 28F18 80162B10 21200002 */   addu      $a0, $s0, $zero
    /* 28F1C 80162B14 01003126 */  addiu      $s1, $s1, 0x1
    /* 28F20 80162B18 6000222A */  slti       $v0, $s1, 0x60
    /* 28F24 80162B1C AEFF4014 */  bnez       $v0, .L801629D8
    /* 28F28 80162B20 21800000 */   addu      $s0, $zero, $zero
    /* 28F2C 80162B24 21880000 */  addu       $s1, $zero, $zero
    /* 28F30 80162B28 72011324 */  addiu      $s3, $zero, 0x172
    /* 28F34 80162B2C 03001224 */  addiu      $s2, $zero, 0x3
  .L80162B30:
    /* 28F38 80162B30 21800000 */  addu       $s0, $zero, $zero
    /* 28F3C 80162B34 21200002 */  addu       $a0, $s0, $zero
  .L80162B38:
    /* 28F40 80162B38 910A020C */  jal        GetDPiece__Fii
    /* 28F44 80162B3C 21282002 */   addu      $a1, $s1, $zero
    /* 28F48 80162B40 00140200 */  sll        $v0, $v0, 16
    /* 28F4C 80162B44 03140200 */  sra        $v0, $v0, 16
    /* 28F50 80162B48 16005314 */  bne        $v0, $s3, .L80162BA4
    /* 28F54 80162B4C 00000000 */   nop
    /* 28F58 80162B50 0E80023C */  lui        $v0, %hi(quests + 0x12E)
    /* 28F5C 80162B54 6EDB4290 */  lbu        $v0, %lo(quests + 0x12E)($v0)
    /* 28F60 80162B58 00000000 */  nop
    /* 28F64 80162B5C 11005214 */  bne        $v0, $s2, .L80162BA4
    /* 28F68 80162B60 42000224 */   addiu     $v0, $zero, 0x42
    /* 28F6C 80162B64 1280043C */  lui        $a0, %hi(numtrigs)
    /* 28F70 80162B68 78BB848C */  lw         $a0, %lo(numtrigs)($a0)
    /* 28F74 80162B6C 00000000 */  nop
    /* 28F78 80162B70 00190400 */  sll        $v1, $a0, 4
    /* 28F7C 80162B74 01008424 */  addiu      $a0, $a0, 0x1
    /* 28F80 80162B78 0E80013C */  lui        $at, %hi(trigs)
    /* 28F84 80162B7C 21082300 */  addu       $at, $at, $v1
    /* 28F88 80162B80 CC3330AC */  sw         $s0, %lo(trigs)($at)
    /* 28F8C 80162B84 0E80013C */  lui        $at, %hi(trigs + 0x4)
    /* 28F90 80162B88 21082300 */  addu       $at, $at, $v1
    /* 28F94 80162B8C D03331AC */  sw         $s1, %lo(trigs + 0x4)($at)
    /* 28F98 80162B90 0E80013C */  lui        $at, %hi(trigs + 0x8)
    /* 28F9C 80162B94 21082300 */  addu       $at, $at, $v1
    /* 28FA0 80162B98 D43322AC */  sw         $v0, %lo(trigs + 0x8)($at)
    /* 28FA4 80162B9C 1280013C */  lui        $at, %hi(numtrigs)
    /* 28FA8 80162BA0 78BB24AC */  sw         $a0, %lo(numtrigs)($at)
  .L80162BA4:
    /* 28FAC 80162BA4 01001026 */  addiu      $s0, $s0, 0x1
    /* 28FB0 80162BA8 6000022A */  slti       $v0, $s0, 0x60
    /* 28FB4 80162BAC E2FF4014 */  bnez       $v0, .L80162B38
    /* 28FB8 80162BB0 21200002 */   addu      $a0, $s0, $zero
    /* 28FBC 80162BB4 01003126 */  addiu      $s1, $s1, 0x1
    /* 28FC0 80162BB8 6000222A */  slti       $v0, $s1, 0x60
    /* 28FC4 80162BBC DCFF4014 */  bnez       $v0, .L80162B30
    /* 28FC8 80162BC0 00000000 */   nop
    /* 28FCC 80162BC4 1280023C */  lui        $v0, %hi(sel_data)
    /* 28FD0 80162BC8 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 28FD4 80162BCC 1280013C */  lui        $at, %hi(_trigflag)
    /* 28FD8 80162BD0 21082200 */  addu       $at, $at, $v0
    /* 28FDC 80162BD4 74BB20A0 */  sb         $zero, %lo(_trigflag)($at)
    /* 28FE0 80162BD8 2000BF8F */  lw         $ra, 0x20($sp)
    /* 28FE4 80162BDC 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 28FE8 80162BE0 1800B28F */  lw         $s2, 0x18($sp)
    /* 28FEC 80162BE4 1400B18F */  lw         $s1, 0x14($sp)
    /* 28FF0 80162BE8 1000B08F */  lw         $s0, 0x10($sp)
    /* 28FF4 80162BEC 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 28FF8 80162BF0 0800E003 */  jr         $ra
    /* 28FFC 80162BF4 00000000 */   nop
endlabel InitL4Triggers__Fv
