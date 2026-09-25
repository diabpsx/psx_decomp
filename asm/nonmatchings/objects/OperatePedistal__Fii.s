.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching OperatePedistal__Fii, 0x544

glabel OperatePedistal__Fii
    /* 49D14 80059D14 1280023C */  lui        $v0, %hi(numitems)
    /* 49D18 80059D18 88B8428C */  lw         $v0, %lo(numitems)($v0)
    /* 49D1C 80059D1C C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 49D20 80059D20 2000B0AF */  sw         $s0, 0x20($sp)
    /* 49D24 80059D24 21808000 */  addu       $s0, $a0, $zero
    /* 49D28 80059D28 2800B2AF */  sw         $s2, 0x28($sp)
    /* 49D2C 80059D2C 2190A000 */  addu       $s2, $a1, $zero
    /* 49D30 80059D30 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 49D34 80059D34 21980000 */  addu       $s3, $zero, $zero
    /* 49D38 80059D38 3400BFAF */  sw         $ra, 0x34($sp)
    /* 49D3C 80059D3C 3000B4AF */  sw         $s4, 0x30($sp)
    /* 49D40 80059D40 7F004228 */  slti       $v0, $v0, 0x7F
    /* 49D44 80059D44 05004014 */  bnez       $v0, .L80059D5C
    /* 49D48 80059D48 2400B1AF */   sw        $s1, 0x24($sp)
    /* 49D4C 80059D4C C6F5000C */  jal        PlaySFX__Fi
    /* 49D50 80059D50 D3030424 */   addiu     $a0, $zero, 0x3D3
    /* 49D54 80059D54 8D680108 */  j          .L8005A234
    /* 49D58 80059D58 00000000 */   nop
  .L80059D5C:
    /* 49D5C 80059D5C 1280023C */  lui        $v0, %hi(deltaload)
    /* 49D60 80059D60 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 49D64 80059D64 00000000 */  nop
    /* 49D68 80059D68 BB004014 */  bnez       $v0, .L8005A058
    /* 49D6C 80059D6C 02000224 */   addiu     $v0, $zero, 0x2
    /* 49D70 80059D70 40101200 */  sll        $v0, $s2, 1
    /* 49D74 80059D74 21105200 */  addu       $v0, $v0, $s2
    /* 49D78 80059D78 80100200 */  sll        $v0, $v0, 2
    /* 49D7C 80059D7C 23105200 */  subu       $v0, $v0, $s2
    /* 49D80 80059D80 80880200 */  sll        $s1, $v0, 2
    /* 49D84 80059D84 0E80013C */  lui        $at, %hi(object + 0x18)
    /* 49D88 80059D88 21083100 */  addu       $at, $at, $s1
    /* 49D8C 80059D8C 648C2284 */  lh         $v0, %lo(object + 0x18)($at)
    /* 49D90 80059D90 03001424 */  addiu      $s4, $zero, 0x3
    /* 49D94 80059D94 27015410 */  beq        $v0, $s4, .L8005A234
    /* 49D98 80059D98 21200002 */   addu      $a0, $s0, $zero
    /* 49D9C 80059D9C 15000524 */  addiu      $a1, $zero, 0x15
    /* 49DA0 80059DA0 DAED000C */  jal        PlrHasItem__FiiRi
    /* 49DA4 80059DA4 1800A627 */   addiu     $a2, $sp, 0x18
    /* 49DA8 80059DA8 12004010 */  beqz       $v0, .L80059DF4
    /* 49DAC 80059DAC 00000000 */   nop
    /* 49DB0 80059DB0 1800A58F */  lw         $a1, 0x18($sp)
    /* 49DB4 80059DB4 BF75050C */  jal        func_8015D6FC
    /* 49DB8 80059DB8 21200002 */   addu      $a0, $s0, $zero
    /* 49DBC 80059DBC 0E80033C */  lui        $v1, %hi(object)
    /* 49DC0 80059DC0 4C8C6324 */  addiu      $v1, $v1, %lo(object)
    /* 49DC4 80059DC4 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 49DC8 80059DC8 21083100 */  addu       $at, $at, $s1
    /* 49DCC 80059DCC 6D8C2290 */  lbu        $v0, %lo(object + 0x21)($at)
    /* 49DD0 80059DD0 21182302 */  addu       $v1, $s1, $v1
    /* 49DD4 80059DD4 01004224 */  addiu      $v0, $v0, 0x1
    /* 49DD8 80059DD8 210062A0 */  sb         $v0, 0x21($v1)
    /* 49DDC 80059DDC 0E80013C */  lui        $at, %hi(object + 0x18)
    /* 49DE0 80059DE0 21083100 */  addu       $at, $at, $s1
    /* 49DE4 80059DE4 648C2294 */  lhu        $v0, %lo(object + 0x18)($at)
    /* 49DE8 80059DE8 01001324 */  addiu      $s3, $zero, 0x1
    /* 49DEC 80059DEC 01004224 */  addiu      $v0, $v0, 0x1
    /* 49DF0 80059DF0 180062A4 */  sh         $v0, 0x18($v1)
  .L80059DF4:
    /* 49DF4 80059DF4 0F016012 */  beqz       $s3, .L8005A234
    /* 49DF8 80059DF8 01001024 */   addiu     $s0, $zero, 0x1
    /* 49DFC 80059DFC 0E80013C */  lui        $at, %hi(object + 0x18)
    /* 49E00 80059E00 21083100 */  addu       $at, $at, $s1
    /* 49E04 80059E04 648C2284 */  lh         $v0, %lo(object + 0x18)($at)
    /* 49E08 80059E08 00000000 */  nop
    /* 49E0C 80059E0C 23005014 */  bne        $v0, $s0, .L80059E9C
    /* 49E10 80059E10 00000000 */   nop
    /* 49E14 80059E14 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 49E18 80059E18 21083100 */  addu       $at, $at, $s1
    /* 49E1C 80059E1C 6B8C2580 */  lb         $a1, %lo(object + 0x1F)($at)
    /* 49E20 80059E20 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 49E24 80059E24 21083100 */  addu       $at, $at, $s1
    /* 49E28 80059E28 6C8C2680 */  lb         $a2, %lo(object + 0x20)($at)
    /* 49E2C 80059E2C E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 49E30 80059E30 6A000424 */   addiu     $a0, $zero, 0x6A
    /* 49E34 80059E34 1280073C */  lui        $a3, %hi(setpc_y)
    /* 49E38 80059E38 E8C0E78C */  lw         $a3, %lo(setpc_y)($a3)
    /* 49E3C 80059E3C 1280043C */  lui        $a0, %hi(setpc_x)
    /* 49E40 80059E40 E4C0848C */  lw         $a0, %lo(setpc_x)($a0)
    /* 49E44 80059E44 0300E524 */  addiu      $a1, $a3, 0x3
    /* 49E48 80059E48 02008624 */  addiu      $a2, $a0, 0x2
    /* 49E4C 80059E4C C95D010C */  jal        ObjChangeMap__Fiiii
    /* 49E50 80059E50 0700E724 */   addiu     $a3, $a3, 0x7
    /* 49E54 80059E54 15000424 */  addiu      $a0, $zero, 0x15
    /* 49E58 80059E58 21380000 */  addu       $a3, $zero, $zero
    /* 49E5C 80059E5C 1280053C */  lui        $a1, %hi(setpc_x)
    /* 49E60 80059E60 E4C0A58C */  lw         $a1, %lo(setpc_x)($a1)
    /* 49E64 80059E64 1280063C */  lui        $a2, %hi(setpc_y)
    /* 49E68 80059E68 E8C0C68C */  lw         $a2, %lo(setpc_y)($a2)
    /* 49E6C 80059E6C 02000224 */  addiu      $v0, $zero, 0x2
    /* 49E70 80059E70 0E80013C */  lui        $at, %hi(quests + 0xC4)
    /* 49E74 80059E74 04DB22A0 */  sb         $v0, %lo(quests + 0xC4)($at)
    /* 49E78 80059E78 1000B0AF */  sw         $s0, 0x10($sp)
    /* 49E7C 80059E7C 40280500 */  sll        $a1, $a1, 1
    /* 49E80 80059E80 1300A524 */  addiu      $a1, $a1, 0x13
    /* 49E84 80059E84 40300600 */  sll        $a2, $a2, 1
    /* 49E88 80059E88 8214010C */  jal        SpawnQuestItem__Fiiiii
    /* 49E8C 80059E8C 1A00C624 */   addiu     $a2, $a2, 0x1A
    /* 49E90 80059E90 01000424 */  addiu      $a0, $zero, 0x1
    /* 49E94 80059E94 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 49E98 80059E98 09000524 */   addiu     $a1, $zero, 0x9
  .L80059E9C:
    /* 49E9C 80059E9C 0E80013C */  lui        $at, %hi(object + 0x18)
    /* 49EA0 80059EA0 21083100 */  addu       $at, $at, $s1
    /* 49EA4 80059EA4 648C2384 */  lh         $v1, %lo(object + 0x18)($at)
    /* 49EA8 80059EA8 02000224 */  addiu      $v0, $zero, 0x2
    /* 49EAC 80059EAC 26006214 */  bne        $v1, $v0, .L80059F48
    /* 49EB0 80059EB0 00000000 */   nop
    /* 49EB4 80059EB4 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 49EB8 80059EB8 21083100 */  addu       $at, $at, $s1
    /* 49EBC 80059EBC 6B8C2580 */  lb         $a1, %lo(object + 0x1F)($at)
    /* 49EC0 80059EC0 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 49EC4 80059EC4 21083100 */  addu       $at, $at, $s1
    /* 49EC8 80059EC8 6C8C2680 */  lb         $a2, %lo(object + 0x20)($at)
    /* 49ECC 80059ECC E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 49ED0 80059ED0 6A000424 */   addiu     $a0, $zero, 0x6A
    /* 49ED4 80059ED4 1280023C */  lui        $v0, %hi(setpc_x)
    /* 49ED8 80059ED8 E4C0428C */  lw         $v0, %lo(setpc_x)($v0)
    /* 49EDC 80059EDC 1280073C */  lui        $a3, %hi(setpc_y)
    /* 49EE0 80059EE0 E8C0E78C */  lw         $a3, %lo(setpc_y)($a3)
    /* 49EE4 80059EE4 1280063C */  lui        $a2, %hi(setpc_w)
    /* 49EE8 80059EE8 ECC0C68C */  lw         $a2, %lo(setpc_w)($a2)
    /* 49EEC 80059EEC 06004424 */  addiu      $a0, $v0, 0x6
    /* 49EF0 80059EF0 0300E524 */  addiu      $a1, $a3, 0x3
    /* 49EF4 80059EF4 21304600 */  addu       $a2, $v0, $a2
    /* 49EF8 80059EF8 C95D010C */  jal        ObjChangeMap__Fiiii
    /* 49EFC 80059EFC 0700E724 */   addiu     $a3, $a3, 0x7
    /* 49F00 80059F00 15000424 */  addiu      $a0, $zero, 0x15
    /* 49F04 80059F04 21380000 */  addu       $a3, $zero, $zero
    /* 49F08 80059F08 1280053C */  lui        $a1, %hi(setpc_x)
    /* 49F0C 80059F0C E4C0A58C */  lw         $a1, %lo(setpc_x)($a1)
    /* 49F10 80059F10 1280063C */  lui        $a2, %hi(setpc_y)
    /* 49F14 80059F14 E8C0C68C */  lw         $a2, %lo(setpc_y)($a2)
    /* 49F18 80059F18 03000224 */  addiu      $v0, $zero, 0x3
    /* 49F1C 80059F1C 0E80013C */  lui        $at, %hi(quests + 0xC4)
    /* 49F20 80059F20 04DB22A0 */  sb         $v0, %lo(quests + 0xC4)($at)
    /* 49F24 80059F24 1000B0AF */  sw         $s0, 0x10($sp)
    /* 49F28 80059F28 40280500 */  sll        $a1, $a1, 1
    /* 49F2C 80059F2C 1F00A524 */  addiu      $a1, $a1, 0x1F
    /* 49F30 80059F30 40300600 */  sll        $a2, $a2, 1
    /* 49F34 80059F34 8214010C */  jal        SpawnQuestItem__Fiiiii
    /* 49F38 80059F38 1A00C624 */   addiu     $a2, $a2, 0x1A
    /* 49F3C 80059F3C 01000424 */  addiu      $a0, $zero, 0x1
    /* 49F40 80059F40 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 49F44 80059F44 09000524 */   addiu     $a1, $zero, 0x9
  .L80059F48:
    /* 49F48 80059F48 0E80013C */  lui        $at, %hi(object + 0x18)
    /* 49F4C 80059F4C 21083100 */  addu       $at, $at, $s1
    /* 49F50 80059F50 648C2284 */  lh         $v0, %lo(object + 0x18)($at)
    /* 49F54 80059F54 00000000 */  nop
    /* 49F58 80059F58 3A005414 */  bne        $v0, $s4, .L8005A044
    /* 49F5C 80059F5C 21200000 */   addu      $a0, $zero, $zero
    /* 49F60 80059F60 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 49F64 80059F64 21083100 */  addu       $at, $at, $s1
    /* 49F68 80059F68 6B8C2580 */  lb         $a1, %lo(object + 0x1F)($at)
    /* 49F6C 80059F6C 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 49F70 80059F70 21083100 */  addu       $at, $at, $s1
    /* 49F74 80059F74 6C8C2680 */  lb         $a2, %lo(object + 0x20)($at)
    /* 49F78 80059F78 E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 49F7C 80059F7C 48000424 */   addiu     $a0, $zero, 0x48
    /* 49F80 80059F80 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 49F84 80059F84 21083100 */  addu       $at, $at, $s1
    /* 49F88 80059F88 5A8C2484 */  lh         $a0, %lo(object + 0xE)($at)
    /* 49F8C 80059F8C 0E80013C */  lui        $at, %hi(object + 0x10)
    /* 49F90 80059F90 21083100 */  addu       $at, $at, $s1
    /* 49F94 80059F94 5C8C2584 */  lh         $a1, %lo(object + 0x10)($at)
    /* 49F98 80059F98 0E80013C */  lui        $at, %hi(object + 0x12)
    /* 49F9C 80059F9C 21083100 */  addu       $at, $at, $s1
    /* 49FA0 80059FA0 5E8C2684 */  lh         $a2, %lo(object + 0x12)($at)
    /* 49FA4 80059FA4 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 49FA8 80059FA8 21083100 */  addu       $at, $at, $s1
    /* 49FAC 80059FAC 608C2784 */  lh         $a3, %lo(object + 0x14)($at)
    /* 49FB0 80059FB0 C95D010C */  jal        ObjChangeMap__Fiiii
    /* 49FB4 80059FB4 00000000 */   nop
    /* 49FB8 80059FB8 1180043C */  lui        $a0, %hi(D_80116B1C)
    /* 49FBC 80059FBC 1C6B8424 */  addiu      $a0, $a0, %lo(D_80116B1C)
    /* 49FC0 80059FC0 A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 49FC4 80059FC4 21280000 */   addu      $a1, $zero, $zero
    /* 49FC8 80059FC8 21804000 */  addu       $s0, $v0, $zero
    /* 49FCC 80059FCC 21200002 */  addu       $a0, $s0, $zero
    /* 49FD0 80059FD0 1280053C */  lui        $a1, %hi(setpc_x)
    /* 49FD4 80059FD4 E4C0A58C */  lw         $a1, %lo(setpc_x)($a1)
    /* 49FD8 80059FD8 1280063C */  lui        $a2, %hi(setpc_y)
    /* 49FDC 80059FDC E8C0C68C */  lw         $a2, %lo(setpc_y)($a2)
    /* 49FE0 80059FE0 40280500 */  sll        $a1, $a1, 1
    /* 49FE4 80059FE4 0367010C */  jal        LoadMapObjs__FPUcii
    /* 49FE8 80059FE8 40300600 */   sll       $a2, $a2, 1
    /* 49FEC 80059FEC F7F6000C */  jal        mem_free_dbg__FPv
    /* 49FF0 80059FF0 21200002 */   addu      $a0, $s0, $zero
    /* 49FF4 80059FF4 07000424 */  addiu      $a0, $zero, 0x7
    /* 49FF8 80059FF8 1280053C */  lui        $a1, %hi(setpc_x)
    /* 49FFC 80059FFC E4C0A58C */  lw         $a1, %lo(setpc_x)($a1)
    /* 4A000 8005A000 1280063C */  lui        $a2, %hi(setpc_y)
    /* 4A004 8005A004 E8C0C68C */  lw         $a2, %lo(setpc_y)($a2)
    /* 4A008 8005A008 40280500 */  sll        $a1, $a1, 1
    /* 4A00C 8005A00C 1900A524 */  addiu      $a1, $a1, 0x19
    /* 4A010 8005A010 40300600 */  sll        $a2, $a2, 1
    /* 4A014 8005A014 8812010C */  jal        CreateItem__Fiii
    /* 4A018 8005A018 1300C624 */   addiu     $a2, $a2, 0x13
    /* 4A01C 8005A01C 01000424 */  addiu      $a0, $zero, 0x1
    /* 4A020 8005A020 04000224 */  addiu      $v0, $zero, 0x4
    /* 4A024 8005A024 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 4A028 8005A028 21083100 */  addu       $at, $at, $s1
    /* 4A02C 8005A02C 6F8C20A0 */  sb         $zero, %lo(object + 0x23)($at)
    /* 4A030 8005A030 0E80013C */  lui        $at, %hi(quests + 0xC4)
    /* 4A034 8005A034 04DB22A0 */  sb         $v0, %lo(quests + 0xC4)($at)
    /* 4A038 8005A038 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 4A03C 8005A03C 09000524 */   addiu     $a1, $zero, 0x9
    /* 4A040 8005A040 21200000 */  addu       $a0, $zero, $zero
  .L8005A044:
    /* 4A044 8005A044 2D000524 */  addiu      $a1, $zero, 0x2D
    /* 4A048 8005A048 0D3E010C */  jal        NetSendCmdParam1__FUcUcUs
    /* 4A04C 8005A04C FFFF4632 */   andi      $a2, $s2, 0xFFFF
    /* 4A050 8005A050 8D680108 */  j          .L8005A234
    /* 4A054 8005A054 00000000 */   nop
  .L8005A058:
    /* 4A058 8005A058 0E80103C */  lui        $s0, %hi(quests + 0xC4)
    /* 4A05C 8005A05C 04DB1026 */  addiu      $s0, $s0, %lo(quests + 0xC4)
    /* 4A060 8005A060 00000392 */  lbu        $v1, 0x0($s0)
    /* 4A064 8005A064 00000000 */  nop
    /* 4A068 8005A068 14006214 */  bne        $v1, $v0, .L8005A0BC
    /* 4A06C 8005A06C 03000224 */   addiu     $v0, $zero, 0x3
    /* 4A070 8005A070 1280073C */  lui        $a3, %hi(setpc_y)
    /* 4A074 8005A074 E8C0E78C */  lw         $a3, %lo(setpc_y)($a3)
    /* 4A078 8005A078 1280043C */  lui        $a0, %hi(setpc_x)
    /* 4A07C 8005A07C E4C0848C */  lw         $a0, %lo(setpc_x)($a0)
    /* 4A080 8005A080 0300E524 */  addiu      $a1, $a3, 0x3
    /* 4A084 8005A084 02008624 */  addiu      $a2, $a0, 0x2
    /* 4A088 8005A088 C95D010C */  jal        ObjChangeMap__Fiiii
    /* 4A08C 8005A08C 0700E724 */   addiu     $a3, $a3, 0x7
    /* 4A090 8005A090 40101200 */  sll        $v0, $s2, 1
    /* 4A094 8005A094 21105200 */  addu       $v0, $v0, $s2
    /* 4A098 8005A098 80100200 */  sll        $v0, $v0, 2
    /* 4A09C 8005A09C 23105200 */  subu       $v0, $v0, $s2
    /* 4A0A0 8005A0A0 80100200 */  sll        $v0, $v0, 2
    /* 4A0A4 8005A0A4 02000324 */  addiu      $v1, $zero, 0x2
    /* 4A0A8 8005A0A8 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 4A0AC 8005A0AC 21082200 */  addu       $at, $at, $v0
    /* 4A0B0 8005A0B0 6D8C23A0 */  sb         $v1, %lo(object + 0x21)($at)
    /* 4A0B4 8005A0B4 00000392 */  lbu        $v1, 0x0($s0)
    /* 4A0B8 8005A0B8 03000224 */  addiu      $v0, $zero, 0x3
  .L8005A0BC:
    /* 4A0BC 8005A0BC 1D006214 */  bne        $v1, $v0, .L8005A134
    /* 4A0C0 8005A0C0 00000000 */   nop
    /* 4A0C4 8005A0C4 1280073C */  lui        $a3, %hi(setpc_y)
    /* 4A0C8 8005A0C8 E8C0E78C */  lw         $a3, %lo(setpc_y)($a3)
    /* 4A0CC 8005A0CC 1280043C */  lui        $a0, %hi(setpc_x)
    /* 4A0D0 8005A0D0 E4C0848C */  lw         $a0, %lo(setpc_x)($a0)
    /* 4A0D4 8005A0D4 0300E524 */  addiu      $a1, $a3, 0x3
    /* 4A0D8 8005A0D8 02008624 */  addiu      $a2, $a0, 0x2
    /* 4A0DC 8005A0DC C95D010C */  jal        ObjChangeMap__Fiiii
    /* 4A0E0 8005A0E0 0700E724 */   addiu     $a3, $a3, 0x7
    /* 4A0E4 8005A0E4 1280023C */  lui        $v0, %hi(setpc_x)
    /* 4A0E8 8005A0E8 E4C0428C */  lw         $v0, %lo(setpc_x)($v0)
    /* 4A0EC 8005A0EC 1280073C */  lui        $a3, %hi(setpc_y)
    /* 4A0F0 8005A0F0 E8C0E78C */  lw         $a3, %lo(setpc_y)($a3)
    /* 4A0F4 8005A0F4 1280063C */  lui        $a2, %hi(setpc_w)
    /* 4A0F8 8005A0F8 ECC0C68C */  lw         $a2, %lo(setpc_w)($a2)
    /* 4A0FC 8005A0FC 06004424 */  addiu      $a0, $v0, 0x6
    /* 4A100 8005A100 0300E524 */  addiu      $a1, $a3, 0x3
    /* 4A104 8005A104 21304600 */  addu       $a2, $v0, $a2
    /* 4A108 8005A108 C95D010C */  jal        ObjChangeMap__Fiiii
    /* 4A10C 8005A10C 0700E724 */   addiu     $a3, $a3, 0x7
    /* 4A110 8005A110 40101200 */  sll        $v0, $s2, 1
    /* 4A114 8005A114 21105200 */  addu       $v0, $v0, $s2
    /* 4A118 8005A118 80100200 */  sll        $v0, $v0, 2
    /* 4A11C 8005A11C 23105200 */  subu       $v0, $v0, $s2
    /* 4A120 8005A120 80100200 */  sll        $v0, $v0, 2
    /* 4A124 8005A124 03000324 */  addiu      $v1, $zero, 0x3
    /* 4A128 8005A128 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 4A12C 8005A12C 21082200 */  addu       $at, $at, $v0
    /* 4A130 8005A130 6D8C23A0 */  sb         $v1, %lo(object + 0x21)($at)
  .L8005A134:
    /* 4A134 8005A134 00000392 */  lbu        $v1, 0x0($s0)
    /* 4A138 8005A138 04000224 */  addiu      $v0, $zero, 0x4
    /* 4A13C 8005A13C 3D006214 */  bne        $v1, $v0, .L8005A234
    /* 4A140 8005A140 00000000 */   nop
    /* 4A144 8005A144 1280073C */  lui        $a3, %hi(setpc_y)
    /* 4A148 8005A148 E8C0E78C */  lw         $a3, %lo(setpc_y)($a3)
    /* 4A14C 8005A14C 1280043C */  lui        $a0, %hi(setpc_x)
    /* 4A150 8005A150 E4C0848C */  lw         $a0, %lo(setpc_x)($a0)
    /* 4A154 8005A154 0300E524 */  addiu      $a1, $a3, 0x3
    /* 4A158 8005A158 02008624 */  addiu      $a2, $a0, 0x2
    /* 4A15C 8005A15C C95D010C */  jal        ObjChangeMap__Fiiii
    /* 4A160 8005A160 0700E724 */   addiu     $a3, $a3, 0x7
    /* 4A164 8005A164 1280023C */  lui        $v0, %hi(setpc_x)
    /* 4A168 8005A168 E4C0428C */  lw         $v0, %lo(setpc_x)($v0)
    /* 4A16C 8005A16C 1280073C */  lui        $a3, %hi(setpc_y)
    /* 4A170 8005A170 E8C0E78C */  lw         $a3, %lo(setpc_y)($a3)
    /* 4A174 8005A174 1280063C */  lui        $a2, %hi(setpc_w)
    /* 4A178 8005A178 ECC0C68C */  lw         $a2, %lo(setpc_w)($a2)
    /* 4A17C 8005A17C 06004424 */  addiu      $a0, $v0, 0x6
    /* 4A180 8005A180 0300E524 */  addiu      $a1, $a3, 0x3
    /* 4A184 8005A184 21304600 */  addu       $a2, $v0, $a2
    /* 4A188 8005A188 C95D010C */  jal        ObjChangeMap__Fiiii
    /* 4A18C 8005A18C 0700E724 */   addiu     $a3, $a3, 0x7
    /* 4A190 8005A190 40801200 */  sll        $s0, $s2, 1
    /* 4A194 8005A194 21801202 */  addu       $s0, $s0, $s2
    /* 4A198 8005A198 80801000 */  sll        $s0, $s0, 2
    /* 4A19C 8005A19C 23801202 */  subu       $s0, $s0, $s2
    /* 4A1A0 8005A1A0 80801000 */  sll        $s0, $s0, 2
    /* 4A1A4 8005A1A4 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 4A1A8 8005A1A8 21083000 */  addu       $at, $at, $s0
    /* 4A1AC 8005A1AC 5A8C2484 */  lh         $a0, %lo(object + 0xE)($at)
    /* 4A1B0 8005A1B0 0E80013C */  lui        $at, %hi(object + 0x10)
    /* 4A1B4 8005A1B4 21083000 */  addu       $at, $at, $s0
    /* 4A1B8 8005A1B8 5C8C2584 */  lh         $a1, %lo(object + 0x10)($at)
    /* 4A1BC 8005A1BC 0E80013C */  lui        $at, %hi(object + 0x12)
    /* 4A1C0 8005A1C0 21083000 */  addu       $at, $at, $s0
    /* 4A1C4 8005A1C4 5E8C2684 */  lh         $a2, %lo(object + 0x12)($at)
    /* 4A1C8 8005A1C8 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 4A1CC 8005A1CC 21083000 */  addu       $at, $at, $s0
    /* 4A1D0 8005A1D0 608C2784 */  lh         $a3, %lo(object + 0x14)($at)
    /* 4A1D4 8005A1D4 C95D010C */  jal        ObjChangeMap__Fiiii
    /* 4A1D8 8005A1D8 00000000 */   nop
    /* 4A1DC 8005A1DC 1180043C */  lui        $a0, %hi(D_80116B1C)
    /* 4A1E0 8005A1E0 1C6B8424 */  addiu      $a0, $a0, %lo(D_80116B1C)
    /* 4A1E4 8005A1E4 A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 4A1E8 8005A1E8 21280000 */   addu      $a1, $zero, $zero
    /* 4A1EC 8005A1EC 21884000 */  addu       $s1, $v0, $zero
    /* 4A1F0 8005A1F0 21202002 */  addu       $a0, $s1, $zero
    /* 4A1F4 8005A1F4 1280053C */  lui        $a1, %hi(setpc_x)
    /* 4A1F8 8005A1F8 E4C0A58C */  lw         $a1, %lo(setpc_x)($a1)
    /* 4A1FC 8005A1FC 1280063C */  lui        $a2, %hi(setpc_y)
    /* 4A200 8005A200 E8C0C68C */  lw         $a2, %lo(setpc_y)($a2)
    /* 4A204 8005A204 40280500 */  sll        $a1, $a1, 1
    /* 4A208 8005A208 0367010C */  jal        LoadMapObjs__FPUcii
    /* 4A20C 8005A20C 40300600 */   sll       $a2, $a2, 1
    /* 4A210 8005A210 F7F6000C */  jal        mem_free_dbg__FPv
    /* 4A214 8005A214 21202002 */   addu      $a0, $s1, $zero
    /* 4A218 8005A218 04000224 */  addiu      $v0, $zero, 0x4
    /* 4A21C 8005A21C 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 4A220 8005A220 21083000 */  addu       $at, $at, $s0
    /* 4A224 8005A224 6F8C20A0 */  sb         $zero, %lo(object + 0x23)($at)
    /* 4A228 8005A228 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 4A22C 8005A22C 21083000 */  addu       $at, $at, $s0
    /* 4A230 8005A230 6D8C22A0 */  sb         $v0, %lo(object + 0x21)($at)
  .L8005A234:
    /* 4A234 8005A234 3400BF8F */  lw         $ra, 0x34($sp)
    /* 4A238 8005A238 3000B48F */  lw         $s4, 0x30($sp)
    /* 4A23C 8005A23C 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 4A240 8005A240 2800B28F */  lw         $s2, 0x28($sp)
    /* 4A244 8005A244 2400B18F */  lw         $s1, 0x24($sp)
    /* 4A248 8005A248 2000B08F */  lw         $s0, 0x20($sp)
    /* 4A24C 8005A24C 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 4A250 8005A250 0800E003 */  jr         $ra
    /* 4A254 8005A254 00000000 */   nop
endlabel OperatePedistal__Fii
