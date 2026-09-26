.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Sentfire__Fiii, 0x1E8

glabel Sentfire__Fiii
    /* 9298 80142E90 B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 929C 80142E94 3000B2AF */  sw         $s2, 0x30($sp)
    /* 92A0 80142E98 21908000 */  addu       $s2, $a0, $zero
    /* 92A4 80142E9C 3400B3AF */  sw         $s3, 0x34($sp)
    /* 92A8 80142EA0 2198A000 */  addu       $s3, $a1, $zero
    /* 92AC 80142EA4 3800B4AF */  sw         $s4, 0x38($sp)
    /* 92B0 80142EA8 21A0C000 */  addu       $s4, $a2, $zero
    /* 92B4 80142EAC 3C00B5AF */  sw         $s5, 0x3C($sp)
    /* 92B8 80142EB0 21A80000 */  addu       $s5, $zero, $zero
    /* 92BC 80142EB4 21306002 */  addu       $a2, $s3, $zero
    /* 92C0 80142EB8 80101200 */  sll        $v0, $s2, 2
    /* 92C4 80142EBC 21105200 */  addu       $v0, $v0, $s2
    /* 92C8 80142EC0 80100200 */  sll        $v0, $v0, 2
    /* 92CC 80142EC4 23105200 */  subu       $v0, $v0, $s2
    /* 92D0 80142EC8 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 92D4 80142ECC 80880200 */  sll        $s1, $v0, 2
    /* 92D8 80142ED0 4000BFAF */  sw         $ra, 0x40($sp)
    /* 92DC 80142ED4 2800B0AF */  sw         $s0, 0x28($sp)
    /* 92E0 80142ED8 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 92E4 80142EDC 21083100 */  addu       $at, $at, $s1
    /* 92E8 80142EE0 892C2480 */  lb         $a0, %lo(missile + 0x31)($at)
    /* 92EC 80142EE4 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 92F0 80142EE8 21083100 */  addu       $at, $at, $s1
    /* 92F4 80142EEC 8A2C2580 */  lb         $a1, %lo(missile + 0x32)($at)
    /* 92F8 80142EF0 1E55050C */  jal        LineClear__Fiiii
    /* 92FC 80142EF4 21388002 */   addu      $a3, $s4, $zero
    /* 9300 80142EF8 FF004230 */  andi       $v0, $v0, 0xFF
    /* 9304 80142EFC 44004010 */  beqz       $v0, .L80143010
    /* 9308 80142F00 C0181400 */   sll       $v1, $s4, 3
    /* 930C 80142F04 C0101300 */  sll        $v0, $s3, 3
    /* 9310 80142F08 23105300 */  subu       $v0, $v0, $s3
    /* 9314 80142F0C C0110200 */  sll        $v0, $v0, 7
    /* 9318 80142F10 21186200 */  addu       $v1, $v1, $v0
    /* 931C 80142F14 0E80013C */  lui        $at, %hi(dung_map)
    /* 9320 80142F18 21082300 */  addu       $at, $at, $v1
    /* 9324 80142F1C 287A2284 */  lh         $v0, %lo(dung_map)($at)
    /* 9328 80142F20 00000000 */  nop
    /* 932C 80142F24 3A004018 */  blez       $v0, .L80143010
    /* 9330 80142F28 FFFF4324 */   addiu     $v1, $v0, -0x1
    /* 9334 80142F2C 40100300 */  sll        $v0, $v1, 1
    /* 9338 80142F30 21104300 */  addu       $v0, $v0, $v1
    /* 933C 80142F34 80100200 */  sll        $v0, $v0, 2
    /* 9340 80142F38 21104300 */  addu       $v0, $v0, $v1
    /* 9344 80142F3C C0100200 */  sll        $v0, $v0, 3
    /* 9348 80142F40 1080013C */  lui        $at, %hi(monster + 0x10)
    /* 934C 80142F44 21082200 */  addu       $at, $at, $v0
    /* 9350 80142F48 A453228C */  lw         $v0, %lo(monster + 0x10)($at)
    /* 9354 80142F4C 00000000 */  nop
    /* 9358 80142F50 83110200 */  sra        $v0, $v0, 6
    /* 935C 80142F54 2E004018 */  blez       $v0, .L80143010
    /* 9360 80142F58 04006228 */   slti      $v0, $v1, 0x4
    /* 9364 80142F5C 2D004014 */  bnez       $v0, .L80143014
    /* 9368 80142F60 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 936C 80142F64 21306002 */  addu       $a2, $s3, $zero
    /* 9370 80142F68 21388002 */  addu       $a3, $s4, $zero
    /* 9374 80142F6C 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 9378 80142F70 21083100 */  addu       $at, $at, $s1
    /* 937C 80142F74 892C2480 */  lb         $a0, %lo(missile + 0x31)($at)
    /* 9380 80142F78 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 9384 80142F7C 21083100 */  addu       $at, $at, $s1
    /* 9388 80142F80 8A2C2580 */  lb         $a1, %lo(missile + 0x32)($at)
    /* 938C 80142F84 8AF6000C */  jal        GetDirection__Fiiii
    /* 9390 80142F88 FFFF1524 */   addiu     $s5, $zero, -0x1
    /* 9394 80142F8C 01000524 */  addiu      $a1, $zero, 0x1
    /* 9398 80142F90 1080013C */  lui        $at, %hi(missile + 0x2E)
    /* 939C 80142F94 21083100 */  addu       $at, $at, $s1
    /* 93A0 80142F98 862C2484 */  lh         $a0, %lo(missile + 0x2E)($at)
    /* 93A4 80142F9C 1080033C */  lui        $v1, %hi(missileavail)
    /* 93A8 80142FA0 5C2B6394 */  lhu        $v1, %lo(missileavail)($v1)
    /* 93AC 80142FA4 1080013C */  lui        $at, %hi(missile + 0x22)
    /* 93B0 80142FA8 21083100 */  addu       $at, $at, $s1
    /* 93B4 80142FAC 7A2C23A4 */  sh         $v1, %lo(missile + 0x22)($at)
    /* 93B8 80142FB0 0FE9040C */  jal        GetSpellLevel__Fii
    /* 93BC 80142FB4 21804000 */   addu      $s0, $v0, $zero
    /* 93C0 80142FB8 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 93C4 80142FBC 21083100 */  addu       $at, $at, $s1
    /* 93C8 80142FC0 892C2480 */  lb         $a0, %lo(missile + 0x31)($at)
    /* 93CC 80142FC4 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 93D0 80142FC8 21083100 */  addu       $at, $at, $s1
    /* 93D4 80142FCC 8A2C2580 */  lb         $a1, %lo(missile + 0x32)($at)
    /* 93D8 80142FD0 01000324 */  addiu      $v1, $zero, 0x1
    /* 93DC 80142FD4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 93E0 80142FD8 1400A3AF */  sw         $v1, 0x14($sp)
    /* 93E4 80142FDC 1800A0AF */  sw         $zero, 0x18($sp)
    /* 93E8 80142FE0 1080013C */  lui        $at, %hi(missile + 0x2E)
    /* 93EC 80142FE4 21083100 */  addu       $at, $at, $s1
    /* 93F0 80142FE8 862C2384 */  lh         $v1, %lo(missile + 0x2E)($at)
    /* 93F4 80142FEC 21306002 */  addu       $a2, $s3, $zero
    /* 93F8 80142FF0 1C00A3AF */  sw         $v1, 0x1C($sp)
    /* 93FC 80142FF4 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 9400 80142FF8 21083100 */  addu       $at, $at, $s1
    /* 9404 80142FFC 682C238C */  lw         $v1, %lo(missile + 0x10)($at)
    /* 9408 80143000 21388002 */  addu       $a3, $s4, $zero
    /* 940C 80143004 2400A2AF */  sw         $v0, 0x24($sp)
    /* 9410 80143008 810A050C */  jal        AddMissile__Fiiiiiiciii
    /* 9414 8014300C 2000A3AF */   sw        $v1, 0x20($sp)
  .L80143010:
    /* 9418 80143010 FFFF0224 */  addiu      $v0, $zero, -0x1
  .L80143014:
    /* 941C 80143014 0E00A216 */  bne        $s5, $v0, .L80143050
    /* 9420 80143018 2110A002 */   addu      $v0, $s5, $zero
    /* 9424 8014301C 21204002 */  addu       $a0, $s2, $zero
    /* 9428 80143020 09F5040C */  jal        SetMissDir__Fii
    /* 942C 80143024 02000524 */   addiu     $a1, $zero, 0x2
    /* 9430 80143028 80101200 */  sll        $v0, $s2, 2
    /* 9434 8014302C 21105200 */  addu       $v0, $v0, $s2
    /* 9438 80143030 80100200 */  sll        $v0, $v0, 2
    /* 943C 80143034 23105200 */  subu       $v0, $v0, $s2
    /* 9440 80143038 80100200 */  sll        $v0, $v0, 2
    /* 9444 8014303C 03000324 */  addiu      $v1, $zero, 0x3
    /* 9448 80143040 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 944C 80143044 21082200 */  addu       $at, $at, $v0
    /* 9450 80143048 782C23A4 */  sh         $v1, %lo(missile + 0x20)($at)
    /* 9454 8014304C 2110A002 */  addu       $v0, $s5, $zero
  .L80143050:
    /* 9458 80143050 4000BF8F */  lw         $ra, 0x40($sp)
    /* 945C 80143054 3C00B58F */  lw         $s5, 0x3C($sp)
    /* 9460 80143058 3800B48F */  lw         $s4, 0x38($sp)
    /* 9464 8014305C 3400B38F */  lw         $s3, 0x34($sp)
    /* 9468 80143060 3000B28F */  lw         $s2, 0x30($sp)
    /* 946C 80143064 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 9470 80143068 2800B08F */  lw         $s0, 0x28($sp)
    /* 9474 8014306C 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 9478 80143070 0800E003 */  jr         $ra
    /* 947C 80143074 00000000 */   nop
endlabel Sentfire__Fiii
