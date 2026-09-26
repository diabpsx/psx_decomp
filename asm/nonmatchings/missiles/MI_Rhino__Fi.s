.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MI_Rhino__Fi, 0x410

glabel MI_Rhino__Fi
    /* E04C 80147C44 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* E050 80147C48 1400B1AF */  sw         $s1, 0x14($sp)
    /* E054 80147C4C 21888000 */  addu       $s1, $a0, $zero
    /* E058 80147C50 2C00B7AF */  sw         $s7, 0x2C($sp)
    /* E05C 80147C54 21B80000 */  addu       $s7, $zero, $zero
    /* E060 80147C58 80101100 */  sll        $v0, $s1, 2
    /* E064 80147C5C 21105100 */  addu       $v0, $v0, $s1
    /* E068 80147C60 80100200 */  sll        $v0, $v0, 2
    /* E06C 80147C64 23105100 */  subu       $v0, $v0, $s1
    /* E070 80147C68 1000B0AF */  sw         $s0, 0x10($sp)
    /* E074 80147C6C 80800200 */  sll        $s0, $v0, 2
    /* E078 80147C70 3400BFAF */  sw         $ra, 0x34($sp)
    /* E07C 80147C74 3000BEAF */  sw         $fp, 0x30($sp)
    /* E080 80147C78 2800B6AF */  sw         $s6, 0x28($sp)
    /* E084 80147C7C 2400B5AF */  sw         $s5, 0x24($sp)
    /* E088 80147C80 2000B4AF */  sw         $s4, 0x20($sp)
    /* E08C 80147C84 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* E090 80147C88 1800B2AF */  sw         $s2, 0x18($sp)
    /* E094 80147C8C 1080013C */  lui        $at, %hi(missile + 0x2E)
    /* E098 80147C90 21083000 */  addu       $at, $at, $s0
    /* E09C 80147C94 862C3384 */  lh         $s3, %lo(missile + 0x2E)($at)
    /* E0A0 80147C98 00000000 */  nop
    /* E0A4 80147C9C 40101300 */  sll        $v0, $s3, 1
    /* E0A8 80147CA0 21105300 */  addu       $v0, $v0, $s3
    /* E0AC 80147CA4 80100200 */  sll        $v0, $v0, 2
    /* E0B0 80147CA8 21105300 */  addu       $v0, $v0, $s3
    /* E0B4 80147CAC C0900200 */  sll        $s2, $v0, 3
    /* E0B8 80147CB0 1080013C */  lui        $at, %hi(monster + 0x33)
    /* E0BC 80147CB4 21083200 */  addu       $at, $at, $s2
    /* E0C0 80147CB8 C7532380 */  lb         $v1, %lo(monster + 0x33)($at)
    /* E0C4 80147CBC 0E000224 */  addiu      $v0, $zero, 0xE
    /* E0C8 80147CC0 07006210 */  beq        $v1, $v0, .L80147CE0
    /* E0CC 80147CC4 21B00000 */   addu      $s6, $zero, $zero
    /* E0D0 80147CC8 01000224 */  addiu      $v0, $zero, 0x1
    /* E0D4 80147CCC 1080013C */  lui        $at, %hi(missile + 0x38)
    /* E0D8 80147CD0 21083000 */  addu       $at, $at, $s0
    /* E0DC 80147CD4 902C22A0 */  sb         $v0, %lo(missile + 0x38)($at)
    /* E0E0 80147CD8 08200508 */  j          .L80148020
    /* E0E4 80147CDC 00000000 */   nop
  .L80147CE0:
    /* E0E8 80147CE0 68EB040C */  jal        GetMissilePos__Fi
    /* E0EC 80147CE4 21202002 */   addu      $a0, $s1, $zero
    /* E0F0 80147CE8 1080013C */  lui        $at, %hi(missile + 0x32)
    /* E0F4 80147CEC 21083000 */  addu       $at, $at, $s0
    /* E0F8 80147CF0 8A2C3E80 */  lb         $fp, %lo(missile + 0x32)($at)
    /* E0FC 80147CF4 1080013C */  lui        $at, %hi(missile + 0x31)
    /* E100 80147CF8 21083000 */  addu       $at, $at, $s0
    /* E104 80147CFC 892C3480 */  lb         $s4, %lo(missile + 0x31)($at)
    /* E108 80147D00 C0181E00 */  sll        $v1, $fp, 3
    /* E10C 80147D04 C0101400 */  sll        $v0, $s4, 3
    /* E110 80147D08 23105400 */  subu       $v0, $v0, $s4
    /* E114 80147D0C C0110200 */  sll        $v0, $v0, 7
    /* E118 80147D10 21186200 */  addu       $v1, $v1, $v0
    /* E11C 80147D14 0E80013C */  lui        $at, %hi(dung_map)
    /* E120 80147D18 21082300 */  addu       $at, $at, $v1
    /* E124 80147D1C 287A20A4 */  sh         $zero, %lo(dung_map)($at)
    /* E128 80147D20 1080013C */  lui        $at, %hi(monster + 0x4C)
    /* E12C 80147D24 21083200 */  addu       $at, $at, $s2
    /* E130 80147D28 E0532390 */  lbu        $v1, %lo(monster + 0x4C)($at)
    /* E134 80147D2C 18000224 */  addiu      $v0, $zero, 0x18
    /* E138 80147D30 2E006214 */  bne        $v1, $v0, .L80147DEC
    /* E13C 80147D34 00000000 */   nop
    /* E140 80147D38 1080013C */  lui        $at, %hi(missile)
    /* E144 80147D3C 21083000 */  addu       $at, $at, $s0
    /* E148 80147D40 582C228C */  lw         $v0, %lo(missile)($at)
    /* E14C 80147D44 1080013C */  lui        $at, %hi(missile + 0x8)
    /* E150 80147D48 21083000 */  addu       $at, $at, $s0
    /* E154 80147D4C 602C238C */  lw         $v1, %lo(missile + 0x8)($at)
    /* E158 80147D50 40100200 */  sll        $v0, $v0, 1
    /* E15C 80147D54 21186200 */  addu       $v1, $v1, $v0
    /* E160 80147D58 1080013C */  lui        $at, %hi(missile + 0x4)
    /* E164 80147D5C 21083000 */  addu       $at, $at, $s0
    /* E168 80147D60 5C2C228C */  lw         $v0, %lo(missile + 0x4)($at)
    /* E16C 80147D64 1080013C */  lui        $at, %hi(missile + 0x8)
    /* E170 80147D68 21083000 */  addu       $at, $at, $s0
    /* E174 80147D6C 602C23AC */  sw         $v1, %lo(missile + 0x8)($at)
    /* E178 80147D70 1080013C */  lui        $at, %hi(missile + 0xC)
    /* E17C 80147D74 21083000 */  addu       $at, $at, $s0
    /* E180 80147D78 642C238C */  lw         $v1, %lo(missile + 0xC)($at)
    /* E184 80147D7C 40100200 */  sll        $v0, $v0, 1
    /* E188 80147D80 21186200 */  addu       $v1, $v1, $v0
    /* E18C 80147D84 1080013C */  lui        $at, %hi(missile + 0xC)
    /* E190 80147D88 21083000 */  addu       $at, $at, $s0
    /* E194 80147D8C 642C23AC */  sw         $v1, %lo(missile + 0xC)($at)
    /* E198 80147D90 68EB040C */  jal        GetMissilePos__Fi
    /* E19C 80147D94 21202002 */   addu      $a0, $s1, $zero
    /* E1A0 80147D98 1080013C */  lui        $at, %hi(missile + 0x31)
    /* E1A4 80147D9C 21083000 */  addu       $at, $at, $s0
    /* E1A8 80147DA0 892C3780 */  lb         $s7, %lo(missile + 0x31)($at)
    /* E1AC 80147DA4 1080013C */  lui        $at, %hi(missile + 0x32)
    /* E1B0 80147DA8 21083000 */  addu       $at, $at, $s0
    /* E1B4 80147DAC 8A2C3680 */  lb         $s6, %lo(missile + 0x32)($at)
    /* E1B8 80147DB0 1080013C */  lui        $at, %hi(missile + 0x8)
    /* E1BC 80147DB4 21083000 */  addu       $at, $at, $s0
    /* E1C0 80147DB8 602C228C */  lw         $v0, %lo(missile + 0x8)($at)
    /* E1C4 80147DBC 1080013C */  lui        $at, %hi(missile)
    /* E1C8 80147DC0 21083000 */  addu       $at, $at, $s0
    /* E1CC 80147DC4 582C248C */  lw         $a0, %lo(missile)($at)
    /* E1D0 80147DC8 1080013C */  lui        $at, %hi(missile + 0xC)
    /* E1D4 80147DCC 21083000 */  addu       $at, $at, $s0
    /* E1D8 80147DD0 642C238C */  lw         $v1, %lo(missile + 0xC)($at)
    /* E1DC 80147DD4 1080013C */  lui        $at, %hi(missile + 0x4)
    /* E1E0 80147DD8 21083000 */  addu       $at, $at, $s0
    /* E1E4 80147DDC 5C2C258C */  lw         $a1, %lo(missile + 0x4)($at)
    /* E1E8 80147DE0 23104400 */  subu       $v0, $v0, $a0
    /* E1EC 80147DE4 8F1F0508 */  j          .L80147E3C
    /* E1F0 80147DE8 23186500 */   subu      $v1, $v1, $a1
  .L80147DEC:
    /* E1F4 80147DEC 1080013C */  lui        $at, %hi(missile + 0x47)
    /* E1F8 80147DF0 21083000 */  addu       $at, $at, $s0
    /* E1FC 80147DF4 9F2C2290 */  lbu        $v0, %lo(missile + 0x47)($at)
    /* E200 80147DF8 1080013C */  lui        $at, %hi(monster + 0x41)
    /* E204 80147DFC 21083200 */  addu       $at, $at, $s2
    /* E208 80147E00 D55322A0 */  sb         $v0, %lo(monster + 0x41)($at)
    /* E20C 80147E04 1080013C */  lui        $at, %hi(missile + 0x8)
    /* E210 80147E08 21083000 */  addu       $at, $at, $s0
    /* E214 80147E0C 602C228C */  lw         $v0, %lo(missile + 0x8)($at)
    /* E218 80147E10 1080013C */  lui        $at, %hi(missile)
    /* E21C 80147E14 21083000 */  addu       $at, $at, $s0
    /* E220 80147E18 582C248C */  lw         $a0, %lo(missile)($at)
    /* E224 80147E1C 1080013C */  lui        $at, %hi(missile + 0xC)
    /* E228 80147E20 21083000 */  addu       $at, $at, $s0
    /* E22C 80147E24 642C238C */  lw         $v1, %lo(missile + 0xC)($at)
    /* E230 80147E28 1080013C */  lui        $at, %hi(missile + 0x4)
    /* E234 80147E2C 21083000 */  addu       $at, $at, $s0
    /* E238 80147E30 5C2C258C */  lw         $a1, %lo(missile + 0x4)($at)
    /* E23C 80147E34 21104400 */  addu       $v0, $v0, $a0
    /* E240 80147E38 21186500 */  addu       $v1, $v1, $a1
  .L80147E3C:
    /* E244 80147E3C 1080013C */  lui        $at, %hi(missile + 0x8)
    /* E248 80147E40 21083000 */  addu       $at, $at, $s0
    /* E24C 80147E44 602C22AC */  sw         $v0, %lo(missile + 0x8)($at)
    /* E250 80147E48 1080013C */  lui        $at, %hi(missile + 0xC)
    /* E254 80147E4C 21083000 */  addu       $at, $at, $s0
    /* E258 80147E50 642C23AC */  sw         $v1, %lo(missile + 0xC)($at)
    /* E25C 80147E54 68EB040C */  jal        GetMissilePos__Fi
    /* E260 80147E58 21202002 */   addu      $a0, $s1, $zero
    /* E264 80147E5C 21A80000 */  addu       $s5, $zero, $zero
    /* E268 80147E60 21206002 */  addu       $a0, $s3, $zero
    /* E26C 80147E64 80101100 */  sll        $v0, $s1, 2
    /* E270 80147E68 21105100 */  addu       $v0, $v0, $s1
    /* E274 80147E6C 80100200 */  sll        $v0, $v0, 2
    /* E278 80147E70 23105100 */  subu       $v0, $v0, $s1
    /* E27C 80147E74 80100200 */  sll        $v0, $v0, 2
    /* E280 80147E78 1080013C */  lui        $at, %hi(missile + 0x31)
    /* E284 80147E7C 21082200 */  addu       $at, $at, $v0
    /* E288 80147E80 892C3080 */  lb         $s0, %lo(missile + 0x31)($at)
    /* E28C 80147E84 1080013C */  lui        $at, %hi(missile + 0x32)
    /* E290 80147E88 21082200 */  addu       $at, $at, $v0
    /* E294 80147E8C 8A2C3280 */  lb         $s2, %lo(missile + 0x32)($at)
    /* E298 80147E90 21280002 */  addu       $a1, $s0, $zero
    /* E29C 80147E94 1701020C */  jal        PosOkMonst__Fiii
    /* E2A0 80147E98 21304002 */   addu      $a2, $s2, $zero
    /* E2A4 80147E9C FF004230 */  andi       $v0, $v0, 0xFF
    /* E2A8 80147EA0 12004010 */  beqz       $v0, .L80147EEC
    /* E2AC 80147EA4 40101300 */   sll       $v0, $s3, 1
    /* E2B0 80147EA8 21105300 */  addu       $v0, $v0, $s3
    /* E2B4 80147EAC 80100200 */  sll        $v0, $v0, 2
    /* E2B8 80147EB0 21105300 */  addu       $v0, $v0, $s3
    /* E2BC 80147EB4 C0100200 */  sll        $v0, $v0, 3
    /* E2C0 80147EB8 1080013C */  lui        $at, %hi(monster + 0x4C)
    /* E2C4 80147EBC 21082200 */  addu       $at, $at, $v0
    /* E2C8 80147EC0 E0532390 */  lbu        $v1, %lo(monster + 0x4C)($at)
    /* E2CC 80147EC4 18000224 */  addiu      $v0, $zero, 0x18
    /* E2D0 80147EC8 07006214 */  bne        $v1, $v0, .L80147EE8
    /* E2D4 80147ECC 21206002 */   addu      $a0, $s3, $zero
    /* E2D8 80147ED0 2128E002 */  addu       $a1, $s7, $zero
    /* E2DC 80147ED4 1701020C */  jal        PosOkMonst__Fiii
    /* E2E0 80147ED8 2130C002 */   addu      $a2, $s6, $zero
    /* E2E4 80147EDC FF004230 */  andi       $v0, $v0, 0xFF
    /* E2E8 80147EE0 02004010 */  beqz       $v0, .L80147EEC
    /* E2EC 80147EE4 00000000 */   nop
  .L80147EE8:
    /* E2F0 80147EE8 01001524 */  addiu      $s5, $zero, 0x1
  .L80147EEC:
    /* E2F4 80147EEC 3F00A012 */  beqz       $s5, .L80147FEC
    /* E2F8 80147EF0 C0181200 */   sll       $v1, $s2, 3
    /* E2FC 80147EF4 C0101000 */  sll        $v0, $s0, 3
    /* E300 80147EF8 23105000 */  subu       $v0, $v0, $s0
    /* E304 80147EFC C0110200 */  sll        $v0, $v0, 7
    /* E308 80147F00 21186200 */  addu       $v1, $v1, $v0
    /* E30C 80147F04 27101300 */  nor        $v0, $zero, $s3
    /* E310 80147F08 0E80013C */  lui        $at, %hi(dung_map)
    /* E314 80147F0C 21082300 */  addu       $at, $at, $v1
    /* E318 80147F10 287A22A4 */  sh         $v0, %lo(dung_map)($at)
    /* E31C 80147F14 40181300 */  sll        $v1, $s3, 1
    /* E320 80147F18 21187300 */  addu       $v1, $v1, $s3
    /* E324 80147F1C 80180300 */  sll        $v1, $v1, 2
    /* E328 80147F20 21187300 */  addu       $v1, $v1, $s3
    /* E32C 80147F24 C0180300 */  sll        $v1, $v1, 3
    /* E330 80147F28 1080043C */  lui        $a0, %hi(monster)
    /* E334 80147F2C 94538424 */  addiu      $a0, $a0, %lo(monster)
    /* E338 80147F30 21206400 */  addu       $a0, $v1, $a0
    /* E33C 80147F34 21100002 */  addu       $v0, $s0, $zero
    /* E340 80147F38 360082A0 */  sb         $v0, 0x36($a0)
    /* E344 80147F3C 380082A0 */  sb         $v0, 0x38($a0)
    /* E348 80147F40 1080013C */  lui        $at, %hi(monster + 0x34)
    /* E34C 80147F44 21082300 */  addu       $at, $at, $v1
    /* E350 80147F48 C85322A0 */  sb         $v0, %lo(monster + 0x34)($at)
    /* E354 80147F4C 21104002 */  addu       $v0, $s2, $zero
    /* E358 80147F50 370082A0 */  sb         $v0, 0x37($a0)
    /* E35C 80147F54 390082A0 */  sb         $v0, 0x39($a0)
    /* E360 80147F58 1080013C */  lui        $at, %hi(monster + 0x35)
    /* E364 80147F5C 21082300 */  addu       $at, $at, $v1
    /* E368 80147F60 C95322A0 */  sb         $v0, %lo(monster + 0x35)($at)
    /* E36C 80147F64 80101100 */  sll        $v0, $s1, 2
    /* E370 80147F68 21105100 */  addu       $v0, $v0, $s1
    /* E374 80147F6C 80100200 */  sll        $v0, $v0, 2
    /* E378 80147F70 23105100 */  subu       $v0, $v0, $s1
    /* E37C 80147F74 80280200 */  sll        $a1, $v0, 2
    /* E380 80147F78 1080013C */  lui        $at, %hi(missile + 0x33)
    /* E384 80147F7C 21082500 */  addu       $at, $at, $a1
    /* E388 80147F80 8B2C2290 */  lbu        $v0, %lo(missile + 0x33)($at)
    /* E38C 80147F84 1080013C */  lui        $at, %hi(monster + 0x4F)
    /* E390 80147F88 21082300 */  addu       $at, $at, $v1
    /* E394 80147F8C E3532490 */  lbu        $a0, %lo(monster + 0x4F)($at)
    /* E398 80147F90 1080013C */  lui        $at, %hi(monster + 0x3A)
    /* E39C 80147F94 21082300 */  addu       $at, $at, $v1
    /* E3A0 80147F98 CE5322A0 */  sb         $v0, %lo(monster + 0x3A)($at)
    /* E3A4 80147F9C 1080013C */  lui        $at, %hi(missile + 0x34)
    /* E3A8 80147FA0 21082500 */  addu       $at, $at, $a1
    /* E3AC 80147FA4 8C2C2290 */  lbu        $v0, %lo(missile + 0x34)($at)
    /* E3B0 80147FA8 1080013C */  lui        $at, %hi(monster + 0x3B)
    /* E3B4 80147FAC 21082300 */  addu       $at, $at, $v1
    /* E3B8 80147FB0 CF5322A0 */  sb         $v0, %lo(monster + 0x3B)($at)
    /* E3BC 80147FB4 07008010 */  beqz       $a0, .L80147FD4
    /* E3C0 80147FB8 00000000 */   nop
    /* E3C4 80147FBC 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* E3C8 80147FC0 21082500 */  addu       $at, $at, $a1
    /* E3CC 80147FC4 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* E3D0 80147FC8 21280002 */  addu       $a1, $s0, $zero
    /* E3D4 80147FCC E134010C */  jal        ChangeLightXY__Fiii
    /* E3D8 80147FD0 21304002 */   addu      $a2, $s2, $zero
  .L80147FD4:
    /* E3DC 80147FD4 B5EB040C */  jal        MoveMissilePos__Fi
    /* E3E0 80147FD8 21202002 */   addu      $a0, $s1, $zero
    /* E3E4 80147FDC D1EA040C */  jal        PutMissile__Fi
    /* E3E8 80147FE0 21202002 */   addu      $a0, $s1, $zero
    /* E3EC 80147FE4 08200508 */  j          .L80148020
    /* E3F0 80147FE8 00000000 */   nop
  .L80147FEC:
    /* E3F4 80147FEC 21202002 */  addu       $a0, $s1, $zero
    /* E3F8 80147FF0 21288002 */  addu       $a1, $s4, $zero
    /* E3FC 80147FF4 3957050C */  jal        MissToMonst__Fiii
    /* E400 80147FF8 2130C003 */   addu      $a2, $fp, $zero
    /* E404 80147FFC 80101100 */  sll        $v0, $s1, 2
    /* E408 80148000 21105100 */  addu       $v0, $v0, $s1
    /* E40C 80148004 80100200 */  sll        $v0, $v0, 2
    /* E410 80148008 23105100 */  subu       $v0, $v0, $s1
    /* E414 8014800C 80100200 */  sll        $v0, $v0, 2
    /* E418 80148010 01000324 */  addiu      $v1, $zero, 0x1
    /* E41C 80148014 1080013C */  lui        $at, %hi(missile + 0x38)
    /* E420 80148018 21082200 */  addu       $at, $at, $v0
    /* E424 8014801C 902C23A0 */  sb         $v1, %lo(missile + 0x38)($at)
  .L80148020:
    /* E428 80148020 3400BF8F */  lw         $ra, 0x34($sp)
    /* E42C 80148024 3000BE8F */  lw         $fp, 0x30($sp)
    /* E430 80148028 2C00B78F */  lw         $s7, 0x2C($sp)
    /* E434 8014802C 2800B68F */  lw         $s6, 0x28($sp)
    /* E438 80148030 2400B58F */  lw         $s5, 0x24($sp)
    /* E43C 80148034 2000B48F */  lw         $s4, 0x20($sp)
    /* E440 80148038 1C00B38F */  lw         $s3, 0x1C($sp)
    /* E444 8014803C 1800B28F */  lw         $s2, 0x18($sp)
    /* E448 80148040 1400B18F */  lw         $s1, 0x14($sp)
    /* E44C 80148044 1000B08F */  lw         $s0, 0x10($sp)
    /* E450 80148048 3800BD27 */  addiu      $sp, $sp, 0x38
    /* E454 8014804C 0800E003 */  jr         $ra
    /* E458 80148050 00000000 */   nop
endlabel MI_Rhino__Fi
