.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L5__Fi, 0x534

glabel DRLG_L5__Fi
    /* 6D38 80140930 B0FFBD27 */  addiu      $sp, $sp, -0x50
    /* 6D3C 80140934 3000B2AF */  sw         $s2, 0x30($sp)
    /* 6D40 80140938 21908000 */  addu       $s2, $a0, $zero
    /* 6D44 8014093C 3800B4AF */  sw         $s4, 0x38($sp)
    /* 6D48 80140940 21A00000 */  addu       $s4, $zero, $zero
    /* 6D4C 80140944 2800B0AF */  sw         $s0, 0x28($sp)
    /* 6D50 80140948 21800000 */  addu       $s0, $zero, $zero
    /* 6D54 8014094C 1280033C */  lui        $v1, %hi(currlevel)
    /* 6D58 80140950 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 6D5C 80140954 02000224 */  addiu      $v0, $zero, 0x2
    /* 6D60 80140958 4C00BFAF */  sw         $ra, 0x4C($sp)
    /* 6D64 8014095C 4800BEAF */  sw         $fp, 0x48($sp)
    /* 6D68 80140960 4400B7AF */  sw         $s7, 0x44($sp)
    /* 6D6C 80140964 4000B6AF */  sw         $s6, 0x40($sp)
    /* 6D70 80140968 3C00B5AF */  sw         $s5, 0x3C($sp)
    /* 6D74 8014096C 3400B3AF */  sw         $s3, 0x34($sp)
    /* 6D78 80140970 0F006210 */  beq        $v1, $v0, .L801409B0
    /* 6D7C 80140974 2C00B1AF */   sw        $s1, 0x2C($sp)
    /* 6D80 80140978 03006228 */  slti       $v0, $v1, 0x3
    /* 6D84 8014097C 05004010 */  beqz       $v0, .L80140994
    /* 6D88 80140980 01000224 */   addiu     $v0, $zero, 0x1
    /* 6D8C 80140984 08006210 */  beq        $v1, $v0, .L801409A8
    /* 6D90 80140988 FF000232 */   andi      $v0, $s0, 0xFF
    /* 6D94 8014098C 6E020508 */  j          .L801409B8
    /* 6D98 80140990 00000000 */   nop
  .L80140994:
    /* 6D9C 80140994 05006228 */  slti       $v0, $v1, 0x5
    /* 6DA0 80140998 07004010 */  beqz       $v0, .L801409B8
    /* 6DA4 8014099C FF000232 */   andi      $v0, $s0, 0xFF
    /* 6DA8 801409A0 6E020508 */  j          .L801409B8
    /* 6DAC 801409A4 F9021424 */   addiu     $s4, $zero, 0x2F9
  .L801409A8:
    /* 6DB0 801409A8 6D020508 */  j          .L801409B4
    /* 6DB4 801409AC 15021424 */   addiu     $s4, $zero, 0x215
  .L801409B0:
    /* 6DB8 801409B0 B5021424 */  addiu      $s4, $zero, 0x2B5
  .L801409B4:
    /* 6DBC 801409B4 FF000232 */  andi       $v0, $s0, 0xFF
  .L801409B8:
    /* 6DC0 801409B8 AD004014 */  bnez       $v0, .L80140C70
    /* 6DC4 801409BC 21980000 */   addu      $s3, $zero, $zero
    /* 6DC8 801409C0 01001324 */  addiu      $s3, $zero, 0x1
    /* 6DCC 801409C4 FFFF1124 */  addiu      $s1, $zero, -0x1
  .L801409C8:
    /* 6DD0 801409C8 5F91020C */  jal        UPDATEPROGRESS__Fi
    /* 6DD4 801409CC 01000424 */   addiu     $a0, $zero, 0x1
    /* 6DD8 801409D0 1C68050C */  jal        DRLG_InitTrans__Fv
    /* 6DDC 801409D4 00000000 */   nop
  .L801409D8:
    /* 6DE0 801409D8 BEF4040C */  jal        InitL5Dungeon__Fv
    /* 6DE4 801409DC 00000000 */   nop
    /* 6DE8 801409E0 FFF5040C */  jal        L5firstRoom__Fv
    /* 6DEC 801409E4 00000000 */   nop
    /* 6DF0 801409E8 E7F6040C */  jal        L5GetArea__Fv
    /* 6DF4 801409EC 00000000 */   nop
    /* 6DF8 801409F0 2A105400 */  slt        $v0, $v0, $s4
    /* 6DFC 801409F4 F8FF4014 */  bnez       $v0, .L801409D8
    /* 6E00 801409F8 00000000 */   nop
    /* 6E04 801409FC FFF6040C */  jal        L5makeDungeon__Fv
    /* 6E08 80140A00 01001024 */   addiu     $s0, $zero, 0x1
    /* 6E0C 80140A04 22F7040C */  jal        L5makeDmt__Fv
    /* 6E10 80140A08 00000000 */   nop
    /* 6E14 80140A0C 7EFD040C */  jal        L5FillChambers__Fv
    /* 6E18 80140A10 00000000 */   nop
    /* 6E1C 80140A14 8AFA040C */  jal        L5tileFix__Fv
    /* 6E20 80140A18 00000000 */   nop
    /* 6E24 80140A1C 16F9040C */  jal        L5AddWall__Fv
    /* 6E28 80140A20 00000000 */   nop
    /* 6E2C 80140A24 DFF4040C */  jal        L5ClearFlags__Fv
    /* 6E30 80140A28 00000000 */   nop
    /* 6E34 80140A2C 5B00050C */  jal        DRLG_L5FloodTVal__Fv
    /* 6E38 80140A30 00000000 */   nop
    /* 6E3C 80140A34 82F2040C */  jal        DRLG_SetWalls__Fv
    /* 6E40 80140A38 00000000 */   nop
    /* 6E44 80140A3C DC9E010C */  jal        QuestStatus__Fi
    /* 6E48 80140A40 0D000424 */   addiu     $a0, $zero, 0xD
    /* 6E4C 80140A44 FF004230 */  andi       $v0, $v0, 0xFF
    /* 6E50 80140A48 21004010 */  beqz       $v0, .L80140AD0
    /* 6E54 80140A4C 00000000 */   nop
    /* 6E58 80140A50 0D004016 */  bnez       $s2, .L80140A88
    /* 6E5C 80140A54 01000524 */   addiu     $a1, $zero, 0x1
    /* 6E60 80140A58 1480043C */  lui        $a0, %hi(PWATERIN)
    /* 6E64 80140A5C 64A38424 */  addiu      $a0, $a0, %lo(PWATERIN)
    /* 6E68 80140A60 01000624 */  addiu      $a2, $zero, 0x1
    /* 6E6C 80140A64 21380000 */  addu       $a3, $zero, $zero
    /* 6E70 80140A68 1000A0AF */  sw         $zero, 0x10($sp)
    /* 6E74 80140A6C 1400B3AF */  sw         $s3, 0x14($sp)
    /* 6E78 80140A70 1800B1AF */  sw         $s1, 0x18($sp)
    /* 6E7C 80140A74 68F1040C */  jal        DRLG_PlaceMiniSet__FPCUciiiiiii
    /* 6E80 80140A78 1C00A0AF */   sw        $zero, 0x1C($sp)
    /* 6E84 80140A7C 27100200 */  nor        $v0, $zero, $v0
    /* 6E88 80140A80 B4020508 */  j          .L80140AD0
    /* 6E8C 80140A84 C2870200 */   srl       $s0, $v0, 31
  .L80140A88:
    /* 6E90 80140A88 1480043C */  lui        $a0, %hi(PWATERIN)
    /* 6E94 80140A8C 64A38424 */  addiu      $a0, $a0, %lo(PWATERIN)
    /* 6E98 80140A90 01000624 */  addiu      $a2, $zero, 0x1
    /* 6E9C 80140A94 21380000 */  addu       $a3, $zero, $zero
    /* 6EA0 80140A98 1000A0AF */  sw         $zero, 0x10($sp)
    /* 6EA4 80140A9C 1400A0AF */  sw         $zero, 0x14($sp)
    /* 6EA8 80140AA0 1800B1AF */  sw         $s1, 0x18($sp)
    /* 6EAC 80140AA4 68F1040C */  jal        DRLG_PlaceMiniSet__FPCUciiiiiii
    /* 6EB0 80140AA8 1C00A0AF */   sw        $zero, 0x1C($sp)
    /* 6EB4 80140AAC 02004104 */  bgez       $v0, .L80140AB8
    /* 6EB8 80140AB0 00000000 */   nop
    /* 6EBC 80140AB4 21800000 */  addu       $s0, $zero, $zero
  .L80140AB8:
    /* 6EC0 80140AB8 1280023C */  lui        $v0, %hi(ViewY)
    /* 6EC4 80140ABC 18C1428C */  lw         $v0, %lo(ViewY)($v0)
    /* 6EC8 80140AC0 00000000 */  nop
    /* 6ECC 80140AC4 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 6ED0 80140AC8 1280013C */  lui        $at, %hi(ViewY)
    /* 6ED4 80140ACC 18C122AC */  sw         $v0, %lo(ViewY)($at)
  .L80140AD0:
    /* 6ED8 80140AD0 DC9E010C */  jal        QuestStatus__Fi
    /* 6EDC 80140AD4 07000424 */   addiu     $a0, $zero, 0x7
    /* 6EE0 80140AD8 FF004230 */  andi       $v0, $v0, 0xFF
    /* 6EE4 80140ADC 28004010 */  beqz       $v0, .L80140B80
    /* 6EE8 80140AE0 00000000 */   nop
    /* 6EEC 80140AE4 0A004016 */  bnez       $s2, .L80140B10
    /* 6EF0 80140AE8 01000524 */   addiu     $a1, $zero, 0x1
    /* 6EF4 80140AEC 1480043C */  lui        $a0, %hi(STAIRSUP)
    /* 6EF8 80140AF0 F4A28424 */  addiu      $a0, $a0, %lo(STAIRSUP)
    /* 6EFC 80140AF4 01000624 */  addiu      $a2, $zero, 0x1
    /* 6F00 80140AF8 21380000 */  addu       $a3, $zero, $zero
    /* 6F04 80140AFC 1000A0AF */  sw         $zero, 0x10($sp)
    /* 6F08 80140B00 1400B3AF */  sw         $s3, 0x14($sp)
    /* 6F0C 80140B04 1800B1AF */  sw         $s1, 0x18($sp)
    /* 6F10 80140B08 F5020508 */  j          .L80140BD4
    /* 6F14 80140B0C 1C00A0AF */   sw        $zero, 0x1C($sp)
  .L80140B10:
    /* 6F18 80140B10 1480043C */  lui        $a0, %hi(STAIRSUP)
    /* 6F1C 80140B14 F4A28424 */  addiu      $a0, $a0, %lo(STAIRSUP)
    /* 6F20 80140B18 01000624 */  addiu      $a2, $zero, 0x1
    /* 6F24 80140B1C 21380000 */  addu       $a3, $zero, $zero
    /* 6F28 80140B20 1000A0AF */  sw         $zero, 0x10($sp)
    /* 6F2C 80140B24 1400A0AF */  sw         $zero, 0x14($sp)
    /* 6F30 80140B28 1800B1AF */  sw         $s1, 0x18($sp)
    /* 6F34 80140B2C 68F1040C */  jal        DRLG_PlaceMiniSet__FPCUciiiiiii
    /* 6F38 80140B30 1C00A0AF */   sw        $zero, 0x1C($sp)
    /* 6F3C 80140B34 02004104 */  bgez       $v0, .L80140B40
    /* 6F40 80140B38 00000000 */   nop
    /* 6F44 80140B3C 21800000 */  addu       $s0, $zero, $zero
  .L80140B40:
    /* 6F48 80140B40 41005316 */  bne        $s2, $s3, .L80140C48
    /* 6F4C 80140B44 00000000 */   nop
    /* 6F50 80140B48 1280023C */  lui        $v0, %hi(setpc_x)
    /* 6F54 80140B4C E4C0428C */  lw         $v0, %lo(setpc_x)($v0)
    /* 6F58 80140B50 1280033C */  lui        $v1, %hi(setpc_y)
    /* 6F5C 80140B54 E8C0638C */  lw         $v1, %lo(setpc_y)($v1)
    /* 6F60 80140B58 40100200 */  sll        $v0, $v0, 1
    /* 6F64 80140B5C 14004224 */  addiu      $v0, $v0, 0x14
    /* 6F68 80140B60 40180300 */  sll        $v1, $v1, 1
    /* 6F6C 80140B64 1C006324 */  addiu      $v1, $v1, 0x1C
    /* 6F70 80140B68 1280013C */  lui        $at, %hi(ViewX)
    /* 6F74 80140B6C 14C122AC */  sw         $v0, %lo(ViewX)($at)
    /* 6F78 80140B70 1280013C */  lui        $at, %hi(ViewY)
    /* 6F7C 80140B74 18C123AC */  sw         $v1, %lo(ViewY)($at)
    /* 6F80 80140B78 19030508 */  j          .L80140C64
    /* 6F84 80140B7C FF000232 */   andi      $v0, $s0, 0xFF
  .L80140B80:
    /* 6F88 80140B80 1A004016 */  bnez       $s2, .L80140BEC
    /* 6F8C 80140B84 01000524 */   addiu     $a1, $zero, 0x1
    /* 6F90 80140B88 1480043C */  lui        $a0, %hi(L5STAIRSUP)
    /* 6F94 80140B8C 18A38424 */  addiu      $a0, $a0, %lo(L5STAIRSUP)
    /* 6F98 80140B90 01000624 */  addiu      $a2, $zero, 0x1
    /* 6F9C 80140B94 21380000 */  addu       $a3, $zero, $zero
    /* 6FA0 80140B98 1000A0AF */  sw         $zero, 0x10($sp)
    /* 6FA4 80140B9C 1400B3AF */  sw         $s3, 0x14($sp)
    /* 6FA8 80140BA0 1800B1AF */  sw         $s1, 0x18($sp)
    /* 6FAC 80140BA4 68F1040C */  jal        DRLG_PlaceMiniSet__FPCUciiiiiii
    /* 6FB0 80140BA8 1C00A0AF */   sw        $zero, 0x1C($sp)
    /* 6FB4 80140BAC 0D004004 */  bltz       $v0, .L80140BE4
    /* 6FB8 80140BB0 01000524 */   addiu     $a1, $zero, 0x1
    /* 6FBC 80140BB4 1480043C */  lui        $a0, %hi(STAIRSDOWN)
    /* 6FC0 80140BB8 3CA38424 */  addiu      $a0, $a0, %lo(STAIRSDOWN)
    /* 6FC4 80140BBC 01000624 */  addiu      $a2, $zero, 0x1
    /* 6FC8 80140BC0 21380000 */  addu       $a3, $zero, $zero
    /* 6FCC 80140BC4 1000A0AF */  sw         $zero, 0x10($sp)
    /* 6FD0 80140BC8 1400A0AF */  sw         $zero, 0x14($sp)
    /* 6FD4 80140BCC 1800B1AF */  sw         $s1, 0x18($sp)
    /* 6FD8 80140BD0 1C00B3AF */  sw         $s3, 0x1C($sp)
  .L80140BD4:
    /* 6FDC 80140BD4 68F1040C */  jal        DRLG_PlaceMiniSet__FPCUciiiiiii
    /* 6FE0 80140BD8 00000000 */   nop
    /* 6FE4 80140BDC 21004104 */  bgez       $v0, .L80140C64
    /* 6FE8 80140BE0 FF000232 */   andi      $v0, $s0, 0xFF
  .L80140BE4:
    /* 6FEC 80140BE4 18030508 */  j          .L80140C60
    /* 6FF0 80140BE8 21800000 */   addu      $s0, $zero, $zero
  .L80140BEC:
    /* 6FF4 80140BEC 1480043C */  lui        $a0, %hi(L5STAIRSUP)
    /* 6FF8 80140BF0 18A38424 */  addiu      $a0, $a0, %lo(L5STAIRSUP)
    /* 6FFC 80140BF4 01000624 */  addiu      $a2, $zero, 0x1
    /* 7000 80140BF8 21380000 */  addu       $a3, $zero, $zero
    /* 7004 80140BFC 1000A0AF */  sw         $zero, 0x10($sp)
    /* 7008 80140C00 1400A0AF */  sw         $zero, 0x14($sp)
    /* 700C 80140C04 1800B1AF */  sw         $s1, 0x18($sp)
    /* 7010 80140C08 68F1040C */  jal        DRLG_PlaceMiniSet__FPCUciiiiiii
    /* 7014 80140C0C 1C00A0AF */   sw        $zero, 0x1C($sp)
    /* 7018 80140C10 0C004004 */  bltz       $v0, .L80140C44
    /* 701C 80140C14 01000524 */   addiu     $a1, $zero, 0x1
    /* 7020 80140C18 1480043C */  lui        $a0, %hi(STAIRSDOWN)
    /* 7024 80140C1C 3CA38424 */  addiu      $a0, $a0, %lo(STAIRSDOWN)
    /* 7028 80140C20 01000624 */  addiu      $a2, $zero, 0x1
    /* 702C 80140C24 21380000 */  addu       $a3, $zero, $zero
    /* 7030 80140C28 1000A0AF */  sw         $zero, 0x10($sp)
    /* 7034 80140C2C 1400B3AF */  sw         $s3, 0x14($sp)
    /* 7038 80140C30 1800B1AF */  sw         $s1, 0x18($sp)
    /* 703C 80140C34 68F1040C */  jal        DRLG_PlaceMiniSet__FPCUciiiiiii
    /* 7040 80140C38 1C00B3AF */   sw        $s3, 0x1C($sp)
    /* 7044 80140C3C 02004104 */  bgez       $v0, .L80140C48
    /* 7048 80140C40 00000000 */   nop
  .L80140C44:
    /* 704C 80140C44 21800000 */  addu       $s0, $zero, $zero
  .L80140C48:
    /* 7050 80140C48 1280023C */  lui        $v0, %hi(ViewY)
    /* 7054 80140C4C 18C1428C */  lw         $v0, %lo(ViewY)($v0)
    /* 7058 80140C50 00000000 */  nop
    /* 705C 80140C54 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 7060 80140C58 1280013C */  lui        $at, %hi(ViewY)
    /* 7064 80140C5C 18C122AC */  sw         $v0, %lo(ViewY)($at)
  .L80140C60:
    /* 7068 80140C60 FF000232 */  andi       $v0, $s0, 0xFF
  .L80140C64:
    /* 706C 80140C64 58FF4010 */  beqz       $v0, .L801409C8
    /* 7070 80140C68 00000000 */   nop
    /* 7074 80140C6C 21980000 */  addu       $s3, $zero, $zero
  .L80140C70:
    /* 7078 80140C70 11001E24 */  addiu      $fp, $zero, 0x11
    /* 707C 80140C74 10001724 */  addiu      $s7, $zero, 0x10
  .L80140C78:
    /* 7080 80140C78 21800000 */  addu       $s0, $zero, $zero
    /* 7084 80140C7C 40481300 */  sll        $t1, $s3, 1
    /* 7088 80140C80 2000A9AF */  sw         $t1, 0x20($sp)
    /* 708C 80140C84 21B0E002 */  addu       $s6, $s7, $zero
    /* 7090 80140C88 21A8C003 */  addu       $s5, $fp, $zero
    /* 7094 80140C8C 11001224 */  addiu      $s2, $zero, 0x11
    /* 7098 80140C90 10001124 */  addiu      $s1, $zero, 0x10
    /* 709C 80140C94 0E80143C */  lui        $s4, %hi(dungeon)
    /* 70A0 80140C98 C4409426 */  addiu      $s4, $s4, %lo(dungeon)
  .L80140C9C:
    /* 70A4 80140C9C 2000A98F */  lw         $t1, 0x20($sp)
    /* 70A8 80140CA0 00000000 */  nop
    /* 70AC 80140CA4 21103401 */  addu       $v0, $t1, $s4
    /* 70B0 80140CA8 00004394 */  lhu        $v1, 0x0($v0)
    /* 70B4 80140CAC 40000224 */  addiu      $v0, $zero, 0x40
    /* 70B8 80140CB0 0A006214 */  bne        $v1, $v0, .L80140CDC
    /* 70BC 80140CB4 21202002 */   addu      $a0, $s1, $zero
    /* 70C0 80140CB8 2128A002 */  addu       $a1, $s5, $zero
    /* 70C4 80140CBC 21302002 */  addu       $a2, $s1, $zero
    /* 70C8 80140CC0 5668050C */  jal        DRLG_CopyTrans__Fiiii
    /* 70CC 80140CC4 2138C002 */   addu      $a3, $s6, $zero
    /* 70D0 80140CC8 21204002 */  addu       $a0, $s2, $zero
    /* 70D4 80140CCC 2128A002 */  addu       $a1, $s5, $zero
    /* 70D8 80140CD0 21304002 */  addu       $a2, $s2, $zero
    /* 70DC 80140CD4 5668050C */  jal        DRLG_CopyTrans__Fiiii
    /* 70E0 80140CD8 2138C002 */   addu      $a3, $s6, $zero
  .L80140CDC:
    /* 70E4 80140CDC 02005226 */  addiu      $s2, $s2, 0x2
    /* 70E8 80140CE0 02003126 */  addiu      $s1, $s1, 0x2
    /* 70EC 80140CE4 01001026 */  addiu      $s0, $s0, 0x1
    /* 70F0 80140CE8 2800022A */  slti       $v0, $s0, 0x28
    /* 70F4 80140CEC EBFF4014 */  bnez       $v0, .L80140C9C
    /* 70F8 80140CF0 60009426 */   addiu     $s4, $s4, 0x60
    /* 70FC 80140CF4 0200DE27 */  addiu      $fp, $fp, 0x2
    /* 7100 80140CF8 01007326 */  addiu      $s3, $s3, 0x1
    /* 7104 80140CFC 2800622A */  slti       $v0, $s3, 0x28
    /* 7108 80140D00 DDFF4014 */  bnez       $v0, .L80140C78
    /* 710C 80140D04 0200F726 */   addiu     $s7, $s7, 0x2
    /* 7110 80140D08 9900050C */  jal        DRLG_L5TransFix__Fv
    /* 7114 80140D0C 21980000 */   addu      $s3, $zero, $zero
    /* 7118 80140D10 AA01050C */  jal        DRLG_L5DirtFix__Fv
    /* 711C 80140D14 21900000 */   addu      $s2, $zero, $zero
    /* 7120 80140D18 0902050C */  jal        DRLG_L5CornerFix__Fv
    /* 7124 80140D1C 00000000 */   nop
  .L80140D20:
    /* 7128 80140D20 21800000 */  addu       $s0, $zero, $zero
    /* 712C 80140D24 21884002 */  addu       $s1, $s2, $zero
  .L80140D28:
    /* 7130 80140D28 1280023C */  lui        $v0, %hi(mydflags)
    /* 7134 80140D2C D8C0428C */  lw         $v0, %lo(mydflags)($v0)
    /* 7138 80140D30 21183002 */  addu       $v1, $s1, $s0
    /* 713C 80140D34 21104300 */  addu       $v0, $v0, $v1
    /* 7140 80140D38 00004290 */  lbu        $v0, 0x0($v0)
    /* 7144 80140D3C 00000000 */  nop
    /* 7148 80140D40 7F004230 */  andi       $v0, $v0, 0x7F
    /* 714C 80140D44 03004010 */  beqz       $v0, .L80140D54
    /* 7150 80140D48 21200002 */   addu      $a0, $s0, $zero
    /* 7154 80140D4C 2CEF040C */  jal        DRLG_PlaceDoor__Fii
    /* 7158 80140D50 21286002 */   addu      $a1, $s3, $zero
  .L80140D54:
    /* 715C 80140D54 01001026 */  addiu      $s0, $s0, 0x1
    /* 7160 80140D58 2800022A */  slti       $v0, $s0, 0x28
    /* 7164 80140D5C F2FF4014 */  bnez       $v0, .L80140D28
    /* 7168 80140D60 00000000 */   nop
    /* 716C 80140D64 01007326 */  addiu      $s3, $s3, 0x1
    /* 7170 80140D68 2800622A */  slti       $v0, $s3, 0x28
    /* 7174 80140D6C ECFF4014 */  bnez       $v0, .L80140D20
    /* 7178 80140D70 28005226 */   addiu     $s2, $s2, 0x28
    /* 717C 80140D74 BBFC040C */  jal        DRLG_L5Subs__Fv
    /* 7180 80140D78 21980000 */   addu      $s3, $zero, $zero
    /* 7184 80140D7C 64F0040C */  jal        DRLG_L1Shadows__Fv
    /* 7188 80140D80 00000000 */   nop
    /* 718C 80140D84 1480043C */  lui        $a0, %hi(LAMPS)
    /* 7190 80140D88 58A38424 */  addiu      $a0, $a0, %lo(LAMPS)
    /* 7194 80140D8C 05000524 */  addiu      $a1, $zero, 0x5
    /* 7198 80140D90 0A000624 */  addiu      $a2, $zero, 0xA
    /* 719C 80140D94 21380000 */  addu       $a3, $zero, $zero
    /* 71A0 80140D98 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 71A4 80140D9C 1800A2AF */  sw         $v0, 0x18($sp)
    /* 71A8 80140DA0 04000224 */  addiu      $v0, $zero, 0x4
    /* 71AC 80140DA4 1000A0AF */  sw         $zero, 0x10($sp)
    /* 71B0 80140DA8 1400A0AF */  sw         $zero, 0x14($sp)
    /* 71B4 80140DAC 68F1040C */  jal        DRLG_PlaceMiniSet__FPCUciiiiiii
    /* 71B8 80140DB0 1C00A2AF */   sw        $v0, 0x1C($sp)
    /* 71BC 80140DB4 B1F2040C */  jal        DRLG_L1Floor__Fv
    /* 71C0 80140DB8 00000000 */   nop
    /* 71C4 80140DBC 0E80083C */  lui        $t0, %hi(pdungeon)
    /* 71C8 80140DC0 C4520825 */  addiu      $t0, $t0, %lo(pdungeon)
    /* 71CC 80140DC4 0E80073C */  lui        $a3, %hi(dungeon)
    /* 71D0 80140DC8 C440E724 */  addiu      $a3, $a3, %lo(dungeon)
  .L80140DCC:
    /* 71D4 80140DCC 21800000 */  addu       $s0, $zero, $zero
    /* 71D8 80140DD0 40301300 */  sll        $a2, $s3, 1
    /* 71DC 80140DD4 2128E000 */  addu       $a1, $a3, $zero
    /* 71E0 80140DD8 21200001 */  addu       $a0, $t0, $zero
  .L80140DDC:
    /* 71E4 80140DDC 2110C500 */  addu       $v0, $a2, $a1
    /* 71E8 80140DE0 6000A524 */  addiu      $a1, $a1, 0x60
    /* 71EC 80140DE4 21189300 */  addu       $v1, $a0, $s3
    /* 71F0 80140DE8 00004294 */  lhu        $v0, 0x0($v0)
    /* 71F4 80140DEC 01001026 */  addiu      $s0, $s0, 0x1
    /* 71F8 80140DF0 000062A0 */  sb         $v0, 0x0($v1)
    /* 71FC 80140DF4 2800022A */  slti       $v0, $s0, 0x28
    /* 7200 80140DF8 F8FF4014 */  bnez       $v0, .L80140DDC
    /* 7204 80140DFC 28008424 */   addiu     $a0, $a0, 0x28
    /* 7208 80140E00 01007326 */  addiu      $s3, $s3, 0x1
    /* 720C 80140E04 2800622A */  slti       $v0, $s3, 0x28
    /* 7210 80140E08 F0FF4014 */  bnez       $v0, .L80140DCC
    /* 7214 80140E0C 00000000 */   nop
    /* 7218 80140E10 ABF3040C */  jal        DRLG_Init_Globals__Fv
    /* 721C 80140E14 00000000 */   nop
    /* 7220 80140E18 1280043C */  lui        $a0, %hi(setpc_x)
    /* 7224 80140E1C E4C0848C */  lw         $a0, %lo(setpc_x)($a0)
    /* 7228 80140E20 1280053C */  lui        $a1, %hi(setpc_y)
    /* 722C 80140E24 E8C0A58C */  lw         $a1, %lo(setpc_y)($a1)
    /* 7230 80140E28 CD7C050C */  jal        DRLG_CheckQuests__Fii
    /* 7234 80140E2C 00000000 */   nop
    /* 7238 80140E30 4C00BF8F */  lw         $ra, 0x4C($sp)
    /* 723C 80140E34 4800BE8F */  lw         $fp, 0x48($sp)
    /* 7240 80140E38 4400B78F */  lw         $s7, 0x44($sp)
    /* 7244 80140E3C 4000B68F */  lw         $s6, 0x40($sp)
    /* 7248 80140E40 3C00B58F */  lw         $s5, 0x3C($sp)
    /* 724C 80140E44 3800B48F */  lw         $s4, 0x38($sp)
    /* 7250 80140E48 3400B38F */  lw         $s3, 0x34($sp)
    /* 7254 80140E4C 3000B28F */  lw         $s2, 0x30($sp)
    /* 7258 80140E50 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 725C 80140E54 2800B08F */  lw         $s0, 0x28($sp)
    /* 7260 80140E58 5000BD27 */  addiu      $sp, $sp, 0x50
    /* 7264 80140E5C 0800E003 */  jr         $ra
    /* 7268 80140E60 00000000 */   nop
endlabel DRLG_L5__Fi
