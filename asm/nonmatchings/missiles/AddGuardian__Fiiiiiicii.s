.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddGuardian__Fiiiiiicii, 0x474

glabel AddGuardian__Fiiiiiicii
    /* 5E78 8013FA70 90FFBD27 */  addiu      $sp, $sp, -0x70
    /* 5E7C 8013FA74 6800BEAF */  sw         $fp, 0x68($sp)
    /* 5E80 8013FA78 8C00BE8F */  lw         $fp, 0x8C($sp)
    /* 5E84 8013FA7C 6400B7AF */  sw         $s7, 0x64($sp)
    /* 5E88 8013FA80 21B88000 */  addu       $s7, $a0, $zero
    /* 5E8C 8013FA84 6C00BFAF */  sw         $ra, 0x6C($sp)
    /* 5E90 8013FA88 6000B6AF */  sw         $s6, 0x60($sp)
    /* 5E94 8013FA8C 5C00B5AF */  sw         $s5, 0x5C($sp)
    /* 5E98 8013FA90 5800B4AF */  sw         $s4, 0x58($sp)
    /* 5E9C 8013FA94 5400B3AF */  sw         $s3, 0x54($sp)
    /* 5EA0 8013FA98 5000B2AF */  sw         $s2, 0x50($sp)
    /* 5EA4 8013FA9C 4C00B1AF */  sw         $s1, 0x4C($sp)
    /* 5EA8 8013FAA0 4800B0AF */  sw         $s0, 0x48($sp)
    /* 5EAC 8013FAA4 2800A5AF */  sw         $a1, 0x28($sp)
    /* 5EB0 8013FAA8 3000A6AF */  sw         $a2, 0x30($sp)
    /* 5EB4 8013FAAC 3800A7AF */  sw         $a3, 0x38($sp)
    /* 5EB8 8013FAB0 1280053C */  lui        $a1, %hi(D_8011A030)
    /* 5EBC 8013FAB4 30A0A524 */  addiu      $a1, $a1, %lo(D_8011A030)
    /* 5EC0 8013FAB8 0000A28C */  lw         $v0, 0x0($a1)
    /* 5EC4 8013FABC 0400A38C */  lw         $v1, 0x4($a1)
    /* 5EC8 8013FAC0 0800A48C */  lw         $a0, 0x8($a1)
    /* 5ECC 8013FAC4 1000A2AF */  sw         $v0, 0x10($sp)
    /* 5ED0 8013FAC8 1400A3AF */  sw         $v1, 0x14($sp)
    /* 5ED4 8013FACC 1800A4AF */  sw         $a0, 0x18($sp)
    /* 5ED8 8013FAD0 0C00A28C */  lw         $v0, 0xC($a1)
    /* 5EDC 8013FAD4 1000A38C */  lw         $v1, 0x10($a1)
    /* 5EE0 8013FAD8 1400A48C */  lw         $a0, 0x14($a1)
    /* 5EE4 8013FADC 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 5EE8 8013FAE0 2000A3AF */  sw         $v1, 0x20($sp)
    /* 5EEC 8013FAE4 2400A4AF */  sw         $a0, 0x24($sp)
    /* 5EF0 8013FAE8 C9F6000C */  jal        ENG_random__Fl
    /* 5EF4 8013FAEC 0A000424 */   addiu     $a0, $zero, 0xA
    /* 5EF8 8013FAF0 80181700 */  sll        $v1, $s7, 2
    /* 5EFC 8013FAF4 21187700 */  addu       $v1, $v1, $s7
    /* 5F00 8013FAF8 80180300 */  sll        $v1, $v1, 2
    /* 5F04 8013FAFC 23187700 */  subu       $v1, $v1, $s7
    /* 5F08 8013FB00 80200300 */  sll        $a0, $v1, 2
    /* 5F0C 8013FB04 40181E00 */  sll        $v1, $fp, 1
    /* 5F10 8013FB08 21187E00 */  addu       $v1, $v1, $fp
    /* 5F14 8013FB0C 80180300 */  sll        $v1, $v1, 2
    /* 5F18 8013FB10 21187E00 */  addu       $v1, $v1, $fp
    /* 5F1C 8013FB14 00190300 */  sll        $v1, $v1, 4
    /* 5F20 8013FB18 23187E00 */  subu       $v1, $v1, $fp
    /* 5F24 8013FB1C 80180300 */  sll        $v1, $v1, 2
    /* 5F28 8013FB20 21187E00 */  addu       $v1, $v1, $fp
    /* 5F2C 8013FB24 C0180300 */  sll        $v1, $v1, 3
    /* 5F30 8013FB28 0E80013C */  lui        $at, %hi(plr + 0x13C)
    /* 5F34 8013FB2C 21082300 */  addu       $at, $at, $v1
    /* 5F38 8013FB30 74A62390 */  lbu        $v1, %lo(plr + 0x13C)($at)
    /* 5F3C 8013FB34 1080013C */  lui        $at, %hi(missile + 0x40)
    /* 5F40 8013FB38 21082400 */  addu       $at, $at, $a0
    /* 5F44 8013FB3C 982C3380 */  lb         $s3, %lo(missile + 0x40)($at)
    /* 5F48 8013FB40 001E0300 */  sll        $v1, $v1, 24
    /* 5F4C 8013FB44 431E0300 */  sra        $v1, $v1, 25
    /* 5F50 8013FB48 01006324 */  addiu      $v1, $v1, 0x1
    /* 5F54 8013FB4C 21104300 */  addu       $v0, $v0, $v1
    /* 5F58 8013FB50 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 5F5C 8013FB54 21082400 */  addu       $at, $at, $a0
    /* 5F60 8013FB58 682C22AC */  sw         $v0, %lo(missile + 0x10)($at)
    /* 5F64 8013FB5C 0C00601A */  blez       $s3, .L8013FB90
    /* 5F68 8013FB60 80101700 */   sll       $v0, $s7, 2
  .L8013FB64:
    /* 5F6C 8013FB64 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 5F70 8013FB68 21082400 */  addu       $at, $at, $a0
    /* 5F74 8013FB6C 682C238C */  lw         $v1, %lo(missile + 0x10)($at)
    /* 5F78 8013FB70 FFFF7326 */  addiu      $s3, $s3, -0x1
    /* 5F7C 8013FB74 C3100300 */  sra        $v0, $v1, 3
    /* 5F80 8013FB78 21186200 */  addu       $v1, $v1, $v0
    /* 5F84 8013FB7C 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 5F88 8013FB80 21082400 */  addu       $at, $at, $a0
    /* 5F8C 8013FB84 682C23AC */  sw         $v1, %lo(missile + 0x10)($at)
    /* 5F90 8013FB88 F6FF601E */  bgtz       $s3, .L8013FB64
    /* 5F94 8013FB8C 80101700 */   sll       $v0, $s7, 2
  .L8013FB90:
    /* 5F98 8013FB90 21105700 */  addu       $v0, $v0, $s7
    /* 5F9C 8013FB94 80100200 */  sll        $v0, $v0, 2
    /* 5FA0 8013FB98 23105700 */  subu       $v0, $v0, $s7
    /* 5FA4 8013FB9C 80200200 */  sll        $a0, $v0, 2
    /* 5FA8 8013FBA0 01000324 */  addiu      $v1, $zero, 0x1
    /* 5FAC 8013FBA4 21B00000 */  addu       $s6, $zero, $zero
    /* 5FB0 8013FBA8 1080013C */  lui        $at, %hi(missile + 0x38)
    /* 5FB4 8013FBAC 21082400 */  addu       $at, $at, $a0
    /* 5FB8 8013FBB0 902C23A0 */  sb         $v1, %lo(missile + 0x38)($at)
    /* 5FBC 8013FBB4 4000A2AF */  sw         $v0, 0x40($sp)
    /* 5FC0 8013FBB8 80101600 */  sll        $v0, $s6, 2
  .L8013FBBC:
    /* 5FC4 8013FBBC 2110A203 */  addu       $v0, $sp, $v0
    /* 5FC8 8013FBC0 1000428C */  lw         $v0, 0x10($v0)
    /* 5FCC 8013FBC4 0D80013C */  lui        $at, %hi(CrawlTable)
    /* 5FD0 8013FBC8 21082200 */  addu       $at, $at, $v0
    /* 5FD4 8013FBCC 54553390 */  lbu        $s3, %lo(CrawlTable)($at)
    /* 5FD8 8013FBD0 00000000 */  nop
    /* 5FDC 8013FBD4 4E00601A */  blez       $s3, .L8013FD10
    /* 5FE0 8013FBD8 01005524 */   addiu     $s5, $v0, 0x1
    /* 5FE4 8013FBDC 4000A88F */  lw         $t0, 0x40($sp)
    /* 5FE8 8013FBE0 00000000 */  nop
    /* 5FEC 8013FBE4 80A00800 */  sll        $s4, $t0, 2
  .L8013FBE8:
    /* 5FF0 8013FBE8 0D80013C */  lui        $at, %hi(CrawlTable)
    /* 5FF4 8013FBEC 21083500 */  addu       $at, $at, $s5
    /* 5FF8 8013FBF0 54552280 */  lb         $v0, %lo(CrawlTable)($at)
    /* 5FFC 8013FBF4 3800A88F */  lw         $t0, 0x38($sp)
    /* 6000 8013FBF8 0D80013C */  lui        $at, %hi(CrawlTable + 0x1)
    /* 6004 8013FBFC 21083500 */  addu       $at, $at, $s5
    /* 6008 8013FC00 55552380 */  lb         $v1, %lo(CrawlTable + 0x1)($at)
    /* 600C 8013FC04 21880201 */  addu       $s1, $t0, $v0
    /* 6010 8013FC08 FFFF2226 */  addiu      $v0, $s1, -0x1
    /* 6014 8013FC0C 8000A88F */  lw         $t0, 0x80($sp)
    /* 6018 8013FC10 6F00422C */  sltiu      $v0, $v0, 0x6F
    /* 601C 8013FC14 3B004010 */  beqz       $v0, .L8013FD04
    /* 6020 8013FC18 21900301 */   addu      $s2, $t0, $v1
    /* 6024 8013FC1C FFFF4226 */  addiu      $v0, $s2, -0x1
    /* 6028 8013FC20 6F00422C */  sltiu      $v0, $v0, 0x6F
    /* 602C 8013FC24 37004010 */  beqz       $v0, .L8013FD04
    /* 6030 8013FC28 21800000 */   addu      $s0, $zero, $zero
    /* 6034 8013FC2C 21302002 */  addu       $a2, $s1, $zero
    /* 6038 8013FC30 2800A48F */  lw         $a0, 0x28($sp)
    /* 603C 8013FC34 3000A58F */  lw         $a1, 0x30($sp)
    /* 6040 8013FC38 1E55050C */  jal        LineClear__Fiiii
    /* 6044 8013FC3C 21384002 */   addu      $a3, $s2, $zero
    /* 6048 8013FC40 FF004230 */  andi       $v0, $v0, 0xFF
    /* 604C 8013FC44 1A004010 */  beqz       $v0, .L8013FCB0
    /* 6050 8013FC48 21202002 */   addu      $a0, $s1, $zero
    /* 6054 8013FC4C 380B020C */  jal        GetSOLID__Fii
    /* 6058 8013FC50 21284002 */   addu      $a1, $s2, $zero
    /* 605C 8013FC54 21202002 */  addu       $a0, $s1, $zero
    /* 6060 8013FC58 21284002 */  addu       $a1, $s2, $zero
    /* 6064 8013FC5C 900B020C */  jal        GetMISSILE__Fii
    /* 6068 8013FC60 21804000 */   addu      $s0, $v0, $zero
    /* 606C 8013FC64 C0201200 */  sll        $a0, $s2, 3
    /* 6070 8013FC68 C0181100 */  sll        $v1, $s1, 3
    /* 6074 8013FC6C 23187100 */  subu       $v1, $v1, $s1
    /* 6078 8013FC70 C0190300 */  sll        $v1, $v1, 7
    /* 607C 8013FC74 21208300 */  addu       $a0, $a0, $v1
    /* 6080 8013FC78 0E80013C */  lui        $at, %hi(dung_map)
    /* 6084 8013FC7C 21082400 */  addu       $at, $at, $a0
    /* 6088 8013FC80 287A2384 */  lh         $v1, %lo(dung_map)($at)
    /* 608C 8013FC84 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 6090 8013FC88 21082400 */  addu       $at, $at, $a0
    /* 6094 8013FC8C 2B7A2580 */  lb         $a1, %lo(dung_map + 0x3)($at)
    /* 6098 8013FC90 25800302 */  or         $s0, $s0, $v1
    /* 609C 8013FC94 25800502 */  or         $s0, $s0, $a1
    /* 60A0 8013FC98 0E80013C */  lui        $at, %hi(dung_map + 0x5)
    /* 60A4 8013FC9C 21082400 */  addu       $at, $at, $a0
    /* 60A8 8013FCA0 2D7A2380 */  lb         $v1, %lo(dung_map + 0x5)($at)
    /* 60AC 8013FCA4 25800202 */  or         $s0, $s0, $v0
    /* 60B0 8013FCA8 25800302 */  or         $s0, $s0, $v1
    /* 60B4 8013FCAC 0100102E */  sltiu      $s0, $s0, 0x1
  .L8013FCB0:
    /* 60B8 8013FCB0 14000012 */  beqz       $s0, .L8013FD04
    /* 60BC 8013FCB4 2120C003 */   addu      $a0, $fp, $zero
    /* 60C0 8013FCB8 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 60C4 8013FCBC 21083400 */  addu       $at, $at, $s4
    /* 60C8 8013FCC0 892C31A0 */  sb         $s1, %lo(missile + 0x31)($at)
    /* 60CC 8013FCC4 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 60D0 8013FCC8 21083400 */  addu       $at, $at, $s4
    /* 60D4 8013FCCC 8A2C32A0 */  sb         $s2, %lo(missile + 0x32)($at)
    /* 60D8 8013FCD0 1080013C */  lui        $at, %hi(missile + 0x35)
    /* 60DC 8013FCD4 21083400 */  addu       $at, $at, $s4
    /* 60E0 8013FCD8 8D2C31A0 */  sb         $s1, %lo(missile + 0x35)($at)
    /* 60E4 8013FCDC 1080013C */  lui        $at, %hi(missile + 0x36)
    /* 60E8 8013FCE0 21083400 */  addu       $at, $at, $s4
    /* 60EC 8013FCE4 8E2C32A0 */  sb         $s2, %lo(missile + 0x36)($at)
    /* 60F0 8013FCE8 1080013C */  lui        $at, %hi(missile + 0x38)
    /* 60F4 8013FCEC 21083400 */  addu       $at, $at, $s4
    /* 60F8 8013FCF0 902C20A0 */  sb         $zero, %lo(missile + 0x38)($at)
    /* 60FC 8013FCF4 C2DC010C */  jal        UseMana__Fii
    /* 6100 8013FCF8 0D000524 */   addiu     $a1, $zero, 0xD
    /* 6104 8013FCFC 44FF0408 */  j          .L8013FD10
    /* 6108 8013FD00 06001624 */   addiu     $s6, $zero, 0x6
  .L8013FD04:
    /* 610C 8013FD04 FFFF7326 */  addiu      $s3, $s3, -0x1
    /* 6110 8013FD08 B7FF601E */  bgtz       $s3, .L8013FBE8
    /* 6114 8013FD0C 0200B526 */   addiu     $s5, $s5, 0x2
  .L8013FD10:
    /* 6118 8013FD10 0100D626 */  addiu      $s6, $s6, 0x1
    /* 611C 8013FD14 0600C22A */  slti       $v0, $s6, 0x6
    /* 6120 8013FD18 A8FF4014 */  bnez       $v0, .L8013FBBC
    /* 6124 8013FD1C 80101600 */   sll       $v0, $s6, 2
    /* 6128 8013FD20 80101700 */  sll        $v0, $s7, 2
    /* 612C 8013FD24 21105700 */  addu       $v0, $v0, $s7
    /* 6130 8013FD28 80100200 */  sll        $v0, $v0, 2
    /* 6134 8013FD2C 23105700 */  subu       $v0, $v0, $s7
    /* 6138 8013FD30 80800200 */  sll        $s0, $v0, 2
    /* 613C 8013FD34 1080013C */  lui        $at, %hi(missile + 0x38)
    /* 6140 8013FD38 21083000 */  addu       $at, $at, $s0
    /* 6144 8013FD3C 902C2390 */  lbu        $v1, %lo(missile + 0x38)($at)
    /* 6148 8013FD40 01000224 */  addiu      $v0, $zero, 0x1
    /* 614C 8013FD44 5A006210 */  beq        $v1, $v0, .L8013FEB0
    /* 6150 8013FD48 00000000 */   nop
    /* 6154 8013FD4C 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 6158 8013FD50 21083000 */  addu       $at, $at, $s0
    /* 615C 8013FD54 892C2480 */  lb         $a0, %lo(missile + 0x31)($at)
    /* 6160 8013FD58 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 6164 8013FD5C 21083000 */  addu       $at, $at, $s0
    /* 6168 8013FD60 8A2C2580 */  lb         $a1, %lo(missile + 0x32)($at)
    /* 616C 8013FD64 1080013C */  lui        $at, %hi(missile + 0x2E)
    /* 6170 8013FD68 21083000 */  addu       $at, $at, $s0
    /* 6174 8013FD6C 862C3EA4 */  sh         $fp, %lo(missile + 0x2E)($at)
    /* 6178 8013FD70 BA34010C */  jal        AddLight__Fiii
    /* 617C 8013FD74 94000624 */   addiu     $a2, $zero, 0x94
    /* 6180 8013FD78 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* 6184 8013FD7C 21083000 */  addu       $at, $at, $s0
    /* 6188 8013FD80 962C22A0 */  sb         $v0, %lo(missile + 0x3E)($at)
    /* 618C 8013FD84 40101E00 */  sll        $v0, $fp, 1
    /* 6190 8013FD88 21105E00 */  addu       $v0, $v0, $fp
    /* 6194 8013FD8C 80100200 */  sll        $v0, $v0, 2
    /* 6198 8013FD90 21105E00 */  addu       $v0, $v0, $fp
    /* 619C 8013FD94 00110200 */  sll        $v0, $v0, 4
    /* 61A0 8013FD98 23105E00 */  subu       $v0, $v0, $fp
    /* 61A4 8013FD9C 80100200 */  sll        $v0, $v0, 2
    /* 61A8 8013FDA0 21105E00 */  addu       $v0, $v0, $fp
    /* 61AC 8013FDA4 C0100200 */  sll        $v0, $v0, 3
    /* 61B0 8013FDA8 0E80013C */  lui        $at, %hi(plr + 0x13C)
    /* 61B4 8013FDAC 21082200 */  addu       $at, $at, $v0
    /* 61B8 8013FDB0 74A62390 */  lbu        $v1, %lo(plr + 0x13C)($at)
    /* 61BC 8013FDB4 1080013C */  lui        $at, %hi(missile + 0x40)
    /* 61C0 8013FDB8 21083000 */  addu       $at, $at, $s0
    /* 61C4 8013FDBC 982C2490 */  lbu        $a0, %lo(missile + 0x40)($at)
    /* 61C8 8013FDC0 001E0300 */  sll        $v1, $v1, 24
    /* 61CC 8013FDC4 431E0300 */  sra        $v1, $v1, 25
    /* 61D0 8013FDC8 00260400 */  sll        $a0, $a0, 24
    /* 61D4 8013FDCC 03260400 */  sra        $a0, $a0, 24
    /* 61D8 8013FDD0 21186400 */  addu       $v1, $v1, $a0
    /* 61DC 8013FDD4 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 61E0 8013FDD8 21083000 */  addu       $at, $at, $s0
    /* 61E4 8013FDDC 702C23A4 */  sh         $v1, %lo(missile + 0x18)($at)
    /* 61E8 8013FDE0 0E80013C */  lui        $at, %hi(plr + 0x19C4)
    /* 61EC 8013FDE4 21082200 */  addu       $at, $at, $v0
    /* 61F0 8013FDE8 FCBE248C */  lw         $a0, %lo(plr + 0x19C4)($at)
    /* 61F4 8013FDEC FFFF6230 */  andi       $v0, $v1, 0xFFFF
    /* 61F8 8013FDF0 18008200 */  mult       $a0, $v0
    /* 61FC 8013FDF4 12400000 */  mflo       $t0
    /* 6200 8013FDF8 C3110800 */  sra        $v0, $t0, 7
    /* 6204 8013FDFC 21186200 */  addu       $v1, $v1, $v0
    /* 6208 8013FE00 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 620C 8013FE04 21083000 */  addu       $at, $at, $s0
    /* 6210 8013FE08 702C23A4 */  sh         $v1, %lo(missile + 0x18)($at)
    /* 6214 8013FE0C FFFF6330 */  andi       $v1, $v1, 0xFFFF
    /* 6218 8013FE10 1F00632C */  sltiu      $v1, $v1, 0x1F
    /* 621C 8013FE14 04006014 */  bnez       $v1, .L8013FE28
    /* 6220 8013FE18 1E000224 */   addiu     $v0, $zero, 0x1E
    /* 6224 8013FE1C 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 6228 8013FE20 21083000 */  addu       $at, $at, $s0
    /* 622C 8013FE24 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
  .L8013FE28:
    /* 6230 8013FE28 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 6234 8013FE2C 21083000 */  addu       $at, $at, $s0
    /* 6238 8013FE30 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* 623C 8013FE34 00000000 */  nop
    /* 6240 8013FE38 00110200 */  sll        $v0, $v0, 4
    /* 6244 8013FE3C 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 6248 8013FE40 21083000 */  addu       $at, $at, $s0
    /* 624C 8013FE44 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* 6250 8013FE48 F0FF4230 */  andi       $v0, $v0, 0xFFF0
    /* 6254 8013FE4C 1E00422C */  sltiu      $v0, $v0, 0x1E
    /* 6258 8013FE50 04004010 */  beqz       $v0, .L8013FE64
    /* 625C 8013FE54 1E000224 */   addiu     $v0, $zero, 0x1E
    /* 6260 8013FE58 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 6264 8013FE5C 21083000 */  addu       $at, $at, $s0
    /* 6268 8013FE60 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
  .L8013FE64:
    /* 626C 8013FE64 1080013C */  lui        $at, %hi(missile + 0x42)
    /* 6270 8013FE68 21083000 */  addu       $at, $at, $s0
    /* 6274 8013FE6C 9A2C2290 */  lbu        $v0, %lo(missile + 0x42)($at)
    /* 6278 8013FE70 01000324 */  addiu      $v1, $zero, 0x1
    /* 627C 8013FE74 1080013C */  lui        $at, %hi(missile + 0x22)
    /* 6280 8013FE78 21083000 */  addu       $at, $at, $s0
    /* 6284 8013FE7C 7A2C23A4 */  sh         $v1, %lo(missile + 0x22)($at)
    /* 6288 8013FE80 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 628C 8013FE84 21083000 */  addu       $at, $at, $s0
    /* 6290 8013FE88 702C2394 */  lhu        $v1, %lo(missile + 0x18)($at)
    /* 6294 8013FE8C 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 6298 8013FE90 21083000 */  addu       $at, $at, $s0
    /* 629C 8013FE94 782C20A4 */  sh         $zero, %lo(missile + 0x20)($at)
    /* 62A0 8013FE98 00160200 */  sll        $v0, $v0, 24
    /* 62A4 8013FE9C 03160200 */  sra        $v0, $v0, 24
    /* 62A8 8013FEA0 23186200 */  subu       $v1, $v1, $v0
    /* 62AC 8013FEA4 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 62B0 8013FEA8 21083000 */  addu       $at, $at, $s0
    /* 62B4 8013FEAC 762C23A4 */  sh         $v1, %lo(missile + 0x1E)($at)
  .L8013FEB0:
    /* 62B8 8013FEB0 6C00BF8F */  lw         $ra, 0x6C($sp)
    /* 62BC 8013FEB4 6800BE8F */  lw         $fp, 0x68($sp)
    /* 62C0 8013FEB8 6400B78F */  lw         $s7, 0x64($sp)
    /* 62C4 8013FEBC 6000B68F */  lw         $s6, 0x60($sp)
    /* 62C8 8013FEC0 5C00B58F */  lw         $s5, 0x5C($sp)
    /* 62CC 8013FEC4 5800B48F */  lw         $s4, 0x58($sp)
    /* 62D0 8013FEC8 5400B38F */  lw         $s3, 0x54($sp)
    /* 62D4 8013FECC 5000B28F */  lw         $s2, 0x50($sp)
    /* 62D8 8013FED0 4C00B18F */  lw         $s1, 0x4C($sp)
    /* 62DC 8013FED4 4800B08F */  lw         $s0, 0x48($sp)
    /* 62E0 8013FED8 7000BD27 */  addiu      $sp, $sp, 0x70
    /* 62E4 8013FEDC 0800E003 */  jr         $ra
    /* 62E8 8013FEE0 00000000 */   nop
endlabel AddGuardian__Fiiiiiicii
