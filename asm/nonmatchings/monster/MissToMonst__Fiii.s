.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MissToMonst__Fiii, 0x4CC

glabel MissToMonst__Fiii
    /* 1C0EC 80155CE4 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 1C0F0 80155CE8 80180400 */  sll        $v1, $a0, 2
    /* 1C0F4 80155CEC 21186400 */  addu       $v1, $v1, $a0
    /* 1C0F8 80155CF0 80180300 */  sll        $v1, $v1, 2
    /* 1C0FC 80155CF4 23186400 */  subu       $v1, $v1, $a0
    /* 1C100 80155CF8 80180300 */  sll        $v1, $v1, 2
    /* 1C104 80155CFC 1080023C */  lui        $v0, %hi(missile)
    /* 1C108 80155D00 582C4224 */  addiu      $v0, $v0, %lo(missile)
    /* 1C10C 80155D04 21186200 */  addu       $v1, $v1, $v0
    /* 1C110 80155D08 C0200600 */  sll        $a0, $a2, 3
    /* 1C114 80155D0C C0100500 */  sll        $v0, $a1, 3
    /* 1C118 80155D10 23104500 */  subu       $v0, $v0, $a1
    /* 1C11C 80155D14 C0110200 */  sll        $v0, $v0, 7
    /* 1C120 80155D18 21208200 */  addu       $a0, $a0, $v0
    /* 1C124 80155D1C 3400BFAF */  sw         $ra, 0x34($sp)
    /* 1C128 80155D20 3000B6AF */  sw         $s6, 0x30($sp)
    /* 1C12C 80155D24 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 1C130 80155D28 2800B4AF */  sw         $s4, 0x28($sp)
    /* 1C134 80155D2C 2400B3AF */  sw         $s3, 0x24($sp)
    /* 1C138 80155D30 2000B2AF */  sw         $s2, 0x20($sp)
    /* 1C13C 80155D34 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 1C140 80155D38 1800B0AF */  sw         $s0, 0x18($sp)
    /* 1C144 80155D3C 2E007284 */  lh         $s2, 0x2E($v1)
    /* 1C148 80155D40 31007480 */  lb         $s4, 0x31($v1)
    /* 1C14C 80155D44 32007580 */  lb         $s5, 0x32($v1)
    /* 1C150 80155D48 01004226 */  addiu      $v0, $s2, 0x1
    /* 1C154 80155D4C 0E80013C */  lui        $at, %hi(dung_map)
    /* 1C158 80155D50 21082400 */  addu       $at, $at, $a0
    /* 1C15C 80155D54 287A22A4 */  sh         $v0, %lo(dung_map)($at)
    /* 1C160 80155D58 40101200 */  sll        $v0, $s2, 1
    /* 1C164 80155D5C 21105200 */  addu       $v0, $v0, $s2
    /* 1C168 80155D60 80100200 */  sll        $v0, $v0, 2
    /* 1C16C 80155D64 21105200 */  addu       $v0, $v0, $s2
    /* 1C170 80155D68 C0100200 */  sll        $v0, $v0, 3
    /* 1C174 80155D6C 1080043C */  lui        $a0, %hi(monster)
    /* 1C178 80155D70 94538424 */  addiu      $a0, $a0, %lo(monster)
    /* 1C17C 80155D74 3F006790 */  lbu        $a3, 0x3F($v1)
    /* 1C180 80155D78 21804400 */  addu       $s0, $v0, $a0
    /* 1C184 80155D7C 340005A2 */  sb         $a1, 0x34($s0)
    /* 1C188 80155D80 350006A2 */  sb         $a2, 0x35($s0)
    /* 1C18C 80155D84 3C0007A2 */  sb         $a3, 0x3C($s0)
    /* 1C190 80155D88 33006290 */  lbu        $v0, 0x33($v1)
    /* 1C194 80155D8C 3C000582 */  lb         $a1, 0x3C($s0)
    /* 1C198 80155D90 3A0002A2 */  sb         $v0, 0x3A($s0)
    /* 1C19C 80155D94 34006290 */  lbu        $v0, 0x34($v1)
    /* 1C1A0 80155D98 00000000 */  nop
    /* 1C1A4 80155D9C 3B0002A2 */  sb         $v0, 0x3B($s0)
    /* 1C1A8 80155DA0 47006290 */  lbu        $v0, 0x47($v1)
    /* 1C1AC 80155DA4 21204002 */  addu       $a0, $s2, $zero
    /* 1C1B0 80155DA8 9CFF010C */  jal        M_StartStand__Fii
    /* 1C1B4 80155DAC 410002A2 */   sb        $v0, 0x41($s0)
    /* 1C1B8 80155DB0 6000028E */  lw         $v0, 0x60($s0)
    /* 1C1BC 80155DB4 00000000 */  nop
    /* 1C1C0 80155DB8 12004290 */  lbu        $v0, 0x12($v0)
    /* 1C1C4 80155DBC 00000000 */  nop
    /* 1C1C8 80155DC0 B8FF4224 */  addiu      $v0, $v0, -0x48
    /* 1C1CC 80155DC4 0400422C */  sltiu      $v0, $v0, 0x4
    /* 1C1D0 80155DC8 06004010 */  beqz       $v0, .L80155DE4
    /* 1C1D4 80155DCC 21204002 */   addu      $a0, $s2, $zero
    /* 1C1D8 80155DD0 3C000582 */  lb         $a1, 0x3C($s0)
    /* 1C1DC 80155DD4 7C31050C */  jal        M_StartFadein__FiiUc
    /* 1C1E0 80155DD8 21300000 */   addu      $a2, $zero, $zero
    /* 1C1E4 80155DDC 85570508 */  j          .L80155E14
    /* 1C1E8 80155DE0 00000000 */   nop
  .L80155DE4:
    /* 1C1EC 80155DE4 2C000296 */  lhu        $v0, 0x2C($s0)
    /* 1C1F0 80155DE8 00000000 */  nop
    /* 1C1F4 80155DEC 10004230 */  andi       $v0, $v0, 0x10
    /* 1C1F8 80155DF0 06004014 */  bnez       $v0, .L80155E0C
    /* 1C1FC 80155DF4 FFFF0524 */   addiu     $a1, $zero, -0x1
    /* 1C200 80155DF8 21204002 */  addu       $a0, $s2, $zero
    /* 1C204 80155DFC B62C050C */  jal        M_StartHit__Fiii
    /* 1C208 80155E00 21300000 */   addu      $a2, $zero, $zero
    /* 1C20C 80155E04 85570508 */  j          .L80155E14
    /* 1C210 80155E08 00000000 */   nop
  .L80155E0C:
    /* 1C214 80155E0C 3A2E050C */  jal        M2MStartHit__Fiii
    /* 1C218 80155E10 21300000 */   addu      $a2, $zero, $zero
  .L80155E14:
    /* 1C21C 80155E14 2C000296 */  lhu        $v0, 0x2C($s0)
    /* 1C220 80155E18 00000000 */  nop
    /* 1C224 80155E1C 10004230 */  andi       $v0, $v0, 0x10
    /* 1C228 80155E20 80004014 */  bnez       $v0, .L80156024
    /* 1C22C 80155E24 C0181500 */   sll       $v1, $s5, 3
    /* 1C230 80155E28 21208002 */  addu       $a0, $s4, $zero
    /* 1C234 80155E2C 447F010C */  jal        IsDplayer__Fii
    /* 1C238 80155E30 2128A002 */   addu      $a1, $s5, $zero
    /* 1C23C 80155E34 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1C240 80155E38 FFFF5124 */  addiu      $s1, $v0, -0x1
    /* 1C244 80155E3C 21208002 */  addu       $a0, $s4, $zero
    /* 1C248 80155E40 447F010C */  jal        IsDplayer__Fii
    /* 1C24C 80155E44 2128A002 */   addu      $a1, $s5, $zero
    /* 1C250 80155E48 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1C254 80155E4C CD004010 */  beqz       $v0, .L80156184
    /* 1C258 80155E50 00000000 */   nop
    /* 1C25C 80155E54 6000028E */  lw         $v0, 0x60($s0)
    /* 1C260 80155E58 00000000 */  nop
    /* 1C264 80155E5C 12004490 */  lbu        $a0, 0x12($v0)
    /* 1C268 80155E60 28000224 */  addiu      $v0, $zero, 0x28
    /* 1C26C 80155E64 FF008330 */  andi       $v1, $a0, 0xFF
    /* 1C270 80155E68 C6006210 */  beq        $v1, $v0, .L80156184
    /* 1C274 80155E6C B8FF8224 */   addiu     $v0, $a0, -0x48
    /* 1C278 80155E70 0400422C */  sltiu      $v0, $v0, 0x4
    /* 1C27C 80155E74 C3004014 */  bnez       $v0, .L80156184
    /* 1C280 80155E78 21208002 */   addu      $a0, $s4, $zero
    /* 1C284 80155E7C 447F010C */  jal        IsDplayer__Fii
    /* 1C288 80155E80 2128A002 */   addu      $a1, $s5, $zero
    /* 1C28C 80155E84 21204002 */  addu       $a0, $s2, $zero
    /* 1C290 80155E88 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1C294 80155E8C FFFF4524 */  addiu      $a1, $v0, -0x1
    /* 1C298 80155E90 54000792 */  lbu        $a3, 0x54($s0)
    /* 1C29C 80155E94 55000292 */  lbu        $v0, 0x55($s0)
    /* 1C2A0 80155E98 F4010624 */  addiu      $a2, $zero, 0x1F4
    /* 1C2A4 80155E9C 0A35050C */  jal        M_TryH2HHit__Fiiiii
    /* 1C2A8 80155EA0 1000A2AF */   sw        $v0, 0x10($sp)
    /* 1C2AC 80155EA4 21208002 */  addu       $a0, $s4, $zero
    /* 1C2B0 80155EA8 447F010C */  jal        IsDplayer__Fii
    /* 1C2B4 80155EAC 2128A002 */   addu      $a1, $s5, $zero
    /* 1C2B8 80155EB0 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1C2BC 80155EB4 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 1C2C0 80155EB8 B2002216 */  bne        $s1, $v0, .L80156184
    /* 1C2C4 80155EBC 00000000 */   nop
    /* 1C2C8 80155EC0 6000028E */  lw         $v0, 0x60($s0)
    /* 1C2CC 80155EC4 00000000 */  nop
    /* 1C2D0 80155EC8 12004290 */  lbu        $v0, 0x12($v0)
    /* 1C2D4 80155ECC 00000000 */  nop
    /* 1C2D8 80155ED0 A7FF4224 */  addiu      $v0, $v0, -0x59
    /* 1C2DC 80155ED4 0400422C */  sltiu      $v0, $v0, 0x4
    /* 1C2E0 80155ED8 AA004014 */  bnez       $v0, .L80156184
    /* 1C2E4 80155EDC 40101100 */   sll       $v0, $s1, 1
    /* 1C2E8 80155EE0 21105100 */  addu       $v0, $v0, $s1
    /* 1C2EC 80155EE4 80100200 */  sll        $v0, $v0, 2
    /* 1C2F0 80155EE8 21105100 */  addu       $v0, $v0, $s1
    /* 1C2F4 80155EEC 00110200 */  sll        $v0, $v0, 4
    /* 1C2F8 80155EF0 23105100 */  subu       $v0, $v0, $s1
    /* 1C2FC 80155EF4 80100200 */  sll        $v0, $v0, 2
    /* 1C300 80155EF8 21105100 */  addu       $v0, $v0, $s1
    /* 1C304 80155EFC C0980200 */  sll        $s3, $v0, 3
    /* 1C308 80155F00 0E80013C */  lui        $at, %hi(plr)
    /* 1C30C 80155F04 21083300 */  addu       $at, $at, $s3
    /* 1C310 80155F08 38A5228C */  lw         $v0, %lo(plr)($at)
    /* 1C314 80155F0C 00000000 */  nop
    /* 1C318 80155F10 F9FF4224 */  addiu      $v0, $v0, -0x7
    /* 1C31C 80155F14 0200422C */  sltiu      $v0, $v0, 0x2
    /* 1C320 80155F18 05004014 */  bnez       $v0, .L80155F30
    /* 1C324 80155F1C 01001624 */   addiu     $s6, $zero, 0x1
    /* 1C328 80155F20 21202002 */  addu       $a0, $s1, $zero
    /* 1C32C 80155F24 21280000 */  addu       $a1, $zero, $zero
    /* 1C330 80155F28 D59B010C */  jal        StartPlrHit__FiiUc
    /* 1C334 80155F2C 01000624 */   addiu     $a2, $zero, 0x1
  .L80155F30:
    /* 1C338 80155F30 3C000382 */  lb         $v1, 0x3C($s0)
    /* 1C33C 80155F34 1280013C */  lui        $at, %hi(offset_x)
    /* 1C340 80155F38 21082300 */  addu       $at, $at, $v1
    /* 1C344 80155F3C A8C22280 */  lb         $v0, %lo(offset_x)($at)
    /* 1C348 80155F40 00000000 */  nop
    /* 1C34C 80155F44 21808202 */  addu       $s0, $s4, $v0
    /* 1C350 80155F48 1280013C */  lui        $at, %hi(offset_y)
    /* 1C354 80155F4C 21082300 */  addu       $at, $at, $v1
    /* 1C358 80155F50 B0C22280 */  lb         $v0, %lo(offset_y)($at)
    /* 1C35C 80155F54 1280033C */  lui        $v1, %hi(FePlayerNo)
    /* 1C360 80155F58 78B3638C */  lw         $v1, %lo(FePlayerNo)($v1)
    /* 1C364 80155F5C 00000000 */  nop
    /* 1C368 80155F60 1E006010 */  beqz       $v1, .L80155FDC
    /* 1C36C 80155F64 2190A202 */   addu      $s2, $s5, $v0
    /* 1C370 80155F68 0E80043C */  lui        $a0, %hi(plr)
    /* 1C374 80155F6C 38A58424 */  addiu      $a0, $a0, %lo(plr)
    /* 1C378 80155F70 21286402 */  addu       $a1, $s3, $a0
    /* 1C37C 80155F74 0100233A */  xori       $v1, $s1, 0x1
    /* 1C380 80155F78 40100300 */  sll        $v0, $v1, 1
    /* 1C384 80155F7C 21104300 */  addu       $v0, $v0, $v1
    /* 1C388 80155F80 80100200 */  sll        $v0, $v0, 2
    /* 1C38C 80155F84 21104300 */  addu       $v0, $v0, $v1
    /* 1C390 80155F88 00110200 */  sll        $v0, $v0, 4
    /* 1C394 80155F8C 23104300 */  subu       $v0, $v0, $v1
    /* 1C398 80155F90 80100200 */  sll        $v0, $v0, 2
    /* 1C39C 80155F94 21104300 */  addu       $v0, $v0, $v1
    /* 1C3A0 80155F98 C0100200 */  sll        $v0, $v0, 3
    /* 1C3A4 80155F9C 1D00A390 */  lbu        $v1, 0x1D($a1)
    /* 1C3A8 80155FA0 00000000 */  nop
    /* 1C3AC 80155FA4 0D006010 */  beqz       $v1, .L80155FDC
    /* 1C3B0 80155FA8 21284400 */   addu      $a1, $v0, $a0
    /* 1C3B4 80155FAC 1D00A290 */  lbu        $v0, 0x1D($a1)
    /* 1C3B8 80155FB0 00000000 */  nop
    /* 1C3BC 80155FB4 09004010 */  beqz       $v0, .L80155FDC
    /* 1C3C0 80155FB8 C0201000 */   sll       $a0, $s0, 3
    /* 1C3C4 80155FBC 2800A68C */  lw         $a2, 0x28($a1)
    /* 1C3C8 80155FC0 2C00A78C */  lw         $a3, 0x2C($a1)
    /* 1C3CC 80155FC4 5A89010C */  jal        ChkPlrOffsets__Fiiii
    /* 1C3D0 80155FC8 C0281200 */   sll       $a1, $s2, 3
    /* 1C3D4 80155FCC FF004230 */  andi       $v0, $v0, 0xFF
    /* 1C3D8 80155FD0 02004014 */  bnez       $v0, .L80155FDC
    /* 1C3DC 80155FD4 00000000 */   nop
    /* 1C3E0 80155FD8 21B00000 */  addu       $s6, $zero, $zero
  .L80155FDC:
    /* 1C3E4 80155FDC 6900C012 */  beqz       $s6, .L80156184
    /* 1C3E8 80155FE0 21202002 */   addu      $a0, $s1, $zero
    /* 1C3EC 80155FE4 21280002 */  addu       $a1, $s0, $zero
    /* 1C3F0 80155FE8 DB9A010C */  jal        PosOkPlayer__Fiii
    /* 1C3F4 80155FEC 21304002 */   addu      $a2, $s2, $zero
    /* 1C3F8 80155FF0 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1C3FC 80155FF4 63004010 */  beqz       $v0, .L80156184
    /* 1C400 80155FF8 00000000 */   nop
    /* 1C404 80155FFC CE9C010C */  jal        SetPlayerOld__Fi
    /* 1C408 80156000 21202002 */   addu      $a0, $s1, $zero
    /* 1C40C 80156004 21202002 */  addu       $a0, $s1, $zero
    /* 1C410 80156008 C0281000 */  sll        $a1, $s0, 3
    /* 1C414 8015600C 0400A534 */  ori        $a1, $a1, 0x4
    /* 1C418 80156010 C0301200 */  sll        $a2, $s2, 3
    /* 1C41C 80156014 10E1010C */  jal        WorldToOffset__Fiii
    /* 1C420 80156018 0400C634 */   ori       $a2, $a2, 0x4
    /* 1C424 8015601C 61580508 */  j          .L80156184
    /* 1C428 80156020 00000000 */   nop
  .L80156024:
    /* 1C42C 80156024 C0101400 */  sll        $v0, $s4, 3
    /* 1C430 80156028 23105400 */  subu       $v0, $v0, $s4
    /* 1C434 8015602C C0110200 */  sll        $v0, $v0, 7
    /* 1C438 80156030 21986200 */  addu       $s3, $v1, $v0
    /* 1C43C 80156034 0E80013C */  lui        $at, %hi(dung_map)
    /* 1C440 80156038 21083300 */  addu       $at, $at, $s3
    /* 1C444 8015603C 287A2584 */  lh         $a1, %lo(dung_map)($at)
    /* 1C448 80156040 00000000 */  nop
    /* 1C44C 80156044 4F00A018 */  blez       $a1, .L80156184
    /* 1C450 80156048 00000000 */   nop
    /* 1C454 8015604C 6000028E */  lw         $v0, 0x60($s0)
    /* 1C458 80156050 00000000 */  nop
    /* 1C45C 80156054 12004490 */  lbu        $a0, 0x12($v0)
    /* 1C460 80156058 28000224 */  addiu      $v0, $zero, 0x28
    /* 1C464 8015605C FF008330 */  andi       $v1, $a0, 0xFF
    /* 1C468 80156060 48006210 */  beq        $v1, $v0, .L80156184
    /* 1C46C 80156064 B8FF8224 */   addiu     $v0, $a0, -0x48
    /* 1C470 80156068 0400422C */  sltiu      $v0, $v0, 0x4
    /* 1C474 8015606C 45004014 */  bnez       $v0, .L80156184
    /* 1C478 80156070 21204002 */   addu      $a0, $s2, $zero
    /* 1C47C 80156074 FFFFA524 */  addiu      $a1, $a1, -0x1
    /* 1C480 80156078 54000792 */  lbu        $a3, 0x54($s0)
    /* 1C484 8015607C 55000292 */  lbu        $v0, 0x55($s0)
    /* 1C488 80156080 F4010624 */  addiu      $a2, $zero, 0x1F4
    /* 1C48C 80156084 7C34050C */  jal        M_TryM2MHit__Fiiiii
    /* 1C490 80156088 1000A2AF */   sw        $v0, 0x10($sp)
    /* 1C494 8015608C 6000028E */  lw         $v0, 0x60($s0)
    /* 1C498 80156090 00000000 */  nop
    /* 1C49C 80156094 12004290 */  lbu        $v0, 0x12($v0)
    /* 1C4A0 80156098 00000000 */  nop
    /* 1C4A4 8015609C A7FF4224 */  addiu      $v0, $v0, -0x59
    /* 1C4A8 801560A0 0400422C */  sltiu      $v0, $v0, 0x4
    /* 1C4AC 801560A4 37004014 */  bnez       $v0, .L80156184
    /* 1C4B0 801560A8 00000000 */   nop
    /* 1C4B4 801560AC 0E80013C */  lui        $at, %hi(dung_map)
    /* 1C4B8 801560B0 21083300 */  addu       $at, $at, $s3
    /* 1C4BC 801560B4 287A2484 */  lh         $a0, %lo(dung_map)($at)
    /* 1C4C0 801560B8 3C000282 */  lb         $v0, 0x3C($s0)
    /* 1C4C4 801560BC FFFF8424 */  addiu      $a0, $a0, -0x1
    /* 1C4C8 801560C0 1280013C */  lui        $at, %hi(offset_x)
    /* 1C4CC 801560C4 21082200 */  addu       $at, $at, $v0
    /* 1C4D0 801560C8 A8C22380 */  lb         $v1, %lo(offset_x)($at)
    /* 1C4D4 801560CC 1280013C */  lui        $at, %hi(offset_y)
    /* 1C4D8 801560D0 21082200 */  addu       $at, $at, $v0
    /* 1C4DC 801560D4 B0C22280 */  lb         $v0, %lo(offset_y)($at)
    /* 1C4E0 801560D8 21808302 */  addu       $s0, $s4, $v1
    /* 1C4E4 801560DC 2190A202 */  addu       $s2, $s5, $v0
    /* 1C4E8 801560E0 21280002 */  addu       $a1, $s0, $zero
    /* 1C4EC 801560E4 1701020C */  jal        PosOkMonst__Fiii
    /* 1C4F0 801560E8 21304002 */   addu      $a2, $s2, $zero
    /* 1C4F4 801560EC FF004230 */  andi       $v0, $v0, 0xFF
    /* 1C4F8 801560F0 24004010 */  beqz       $v0, .L80156184
    /* 1C4FC 801560F4 C0181200 */   sll       $v1, $s2, 3
    /* 1C500 801560F8 0E80013C */  lui        $at, %hi(dung_map)
    /* 1C504 801560FC 21083300 */  addu       $at, $at, $s3
    /* 1C508 80156100 287A2494 */  lhu        $a0, %lo(dung_map)($at)
    /* 1C50C 80156104 00000000 */  nop
    /* 1C510 80156108 00140400 */  sll        $v0, $a0, 16
    /* 1C514 8015610C 038C0200 */  sra        $s1, $v0, 16
    /* 1C518 80156110 FFFF3126 */  addiu      $s1, $s1, -0x1
    /* 1C51C 80156114 C0101000 */  sll        $v0, $s0, 3
    /* 1C520 80156118 23105000 */  subu       $v0, $v0, $s0
    /* 1C524 8015611C C0110200 */  sll        $v0, $v0, 7
    /* 1C528 80156120 21186200 */  addu       $v1, $v1, $v0
    /* 1C52C 80156124 40101100 */  sll        $v0, $s1, 1
    /* 1C530 80156128 21105100 */  addu       $v0, $v0, $s1
    /* 1C534 8015612C 80100200 */  sll        $v0, $v0, 2
    /* 1C538 80156130 21105100 */  addu       $v0, $v0, $s1
    /* 1C53C 80156134 C0100200 */  sll        $v0, $v0, 3
    /* 1C540 80156138 0E80013C */  lui        $at, %hi(dung_map)
    /* 1C544 8015613C 21082300 */  addu       $at, $at, $v1
    /* 1C548 80156140 287A24A4 */  sh         $a0, %lo(dung_map)($at)
    /* 1C54C 80156144 1080033C */  lui        $v1, %hi(monster)
    /* 1C550 80156148 94536324 */  addiu      $v1, $v1, %lo(monster)
    /* 1C554 8015614C 21184300 */  addu       $v1, $v0, $v1
    /* 1C558 80156150 21200002 */  addu       $a0, $s0, $zero
    /* 1C55C 80156154 0E80013C */  lui        $at, %hi(dung_map)
    /* 1C560 80156158 21083300 */  addu       $at, $at, $s3
    /* 1C564 8015615C 287A20A4 */  sh         $zero, %lo(dung_map)($at)
    /* 1C568 80156160 340064A0 */  sb         $a0, 0x34($v1)
    /* 1C56C 80156164 1080013C */  lui        $at, %hi(monster + 0x36)
    /* 1C570 80156168 21082200 */  addu       $at, $at, $v0
    /* 1C574 8015616C CA5324A0 */  sb         $a0, %lo(monster + 0x36)($at)
    /* 1C578 80156170 21204002 */  addu       $a0, $s2, $zero
    /* 1C57C 80156174 350064A0 */  sb         $a0, 0x35($v1)
    /* 1C580 80156178 1080013C */  lui        $at, %hi(monster + 0x37)
    /* 1C584 8015617C 21082200 */  addu       $at, $at, $v0
    /* 1C588 80156180 CB5324A0 */  sb         $a0, %lo(monster + 0x37)($at)
  .L80156184:
    /* 1C58C 80156184 3400BF8F */  lw         $ra, 0x34($sp)
    /* 1C590 80156188 3000B68F */  lw         $s6, 0x30($sp)
    /* 1C594 8015618C 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 1C598 80156190 2800B48F */  lw         $s4, 0x28($sp)
    /* 1C59C 80156194 2400B38F */  lw         $s3, 0x24($sp)
    /* 1C5A0 80156198 2000B28F */  lw         $s2, 0x20($sp)
    /* 1C5A4 8015619C 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 1C5A8 801561A0 1800B08F */  lw         $s0, 0x18($sp)
    /* 1C5AC 801561A4 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 1C5B0 801561A8 0800E003 */  jr         $ra
    /* 1C5B4 801561AC 00000000 */   nop
endlabel MissToMonst__Fiii
