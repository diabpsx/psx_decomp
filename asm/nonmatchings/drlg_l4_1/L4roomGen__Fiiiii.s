.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching L4roomGen__Fiiiii, 0x2E8

glabel L4roomGen__Fiiiii
    /* 19198 80152D90 80FFBD27 */  addiu      $sp, $sp, -0x80
    /* 1919C 80152D94 5C00B1AF */  sw         $s1, 0x5C($sp)
    /* 191A0 80152D98 21888000 */  addu       $s1, $a0, $zero
    /* 191A4 80152D9C 6400B3AF */  sw         $s3, 0x64($sp)
    /* 191A8 80152DA0 2198C000 */  addu       $s3, $a2, $zero
    /* 191AC 80152DA4 5800B0AF */  sw         $s0, 0x58($sp)
    /* 191B0 80152DA8 9000B08F */  lw         $s0, 0x90($sp)
    /* 191B4 80152DAC 04000424 */  addiu      $a0, $zero, 0x4
    /* 191B8 80152DB0 7C00BFAF */  sw         $ra, 0x7C($sp)
    /* 191BC 80152DB4 7800BEAF */  sw         $fp, 0x78($sp)
    /* 191C0 80152DB8 7400B7AF */  sw         $s7, 0x74($sp)
    /* 191C4 80152DBC 7000B6AF */  sw         $s6, 0x70($sp)
    /* 191C8 80152DC0 6C00B5AF */  sw         $s5, 0x6C($sp)
    /* 191CC 80152DC4 6800B4AF */  sw         $s4, 0x68($sp)
    /* 191D0 80152DC8 6000B2AF */  sw         $s2, 0x60($sp)
    /* 191D4 80152DCC 1800A5AF */  sw         $a1, 0x18($sp)
    /* 191D8 80152DD0 C9F6000C */  jal        ENG_random__Fl
    /* 191DC 80152DD4 2000A7AF */   sw        $a3, 0x20($sp)
    /* 191E0 80152DD8 21184000 */  addu       $v1, $v0, $zero
    /* 191E4 80152DDC 01000224 */  addiu      $v0, $zero, 0x1
    /* 191E8 80152DE0 03000216 */  bne        $s0, $v0, .L80152DF0
    /* 191EC 80152DE4 00000000 */   nop
    /* 191F0 80152DE8 7D4B0508 */  j          .L80152DF4
    /* 191F4 80152DEC 2B180300 */   sltu      $v1, $zero, $v1
  .L80152DF0:
    /* 191F8 80152DF0 0100632C */  sltiu      $v1, $v1, 0x1
  .L80152DF4:
    /* 191FC 80152DF4 05006010 */  beqz       $v1, .L80152E0C
    /* 19200 80152DF8 01000224 */   addiu     $v0, $zero, 0x1
    /* 19204 80152DFC 4A006210 */  beq        $v1, $v0, .L80152F28
    /* 19208 80152E00 21B00000 */   addu      $s6, $zero, $zero
    /* 1920C 80152E04 114C0508 */  j          .L80153044
    /* 19210 80152E08 00000000 */   nop
  .L80152E0C:
    /* 19214 80152E0C 21B00000 */  addu       $s6, $zero, $zero
    /* 19218 80152E10 2000A88F */  lw         $t0, 0x20($sp)
    /* 1921C 80152E14 1800A98F */  lw         $t1, 0x18($sp)
    /* 19220 80152E18 C2170800 */  srl        $v0, $t0, 31
    /* 19224 80152E1C 21100201 */  addu       $v0, $t0, $v0
    /* 19228 80152E20 43100200 */  sra        $v0, $v0, 1
    /* 1922C 80152E24 21102201 */  addu       $v0, $t1, $v0
    /* 19230 80152E28 2800A2AF */  sw         $v0, 0x28($sp)
  .L80152E2C:
    /* 19234 80152E2C C9F6000C */  jal        ENG_random__Fl
    /* 19238 80152E30 05000424 */   addiu     $a0, $zero, 0x5
    /* 1923C 80152E34 02004224 */  addiu      $v0, $v0, 0x2
    /* 19240 80152E38 43100200 */  sra        $v0, $v0, 1
    /* 19244 80152E3C 40A00200 */  sll        $s4, $v0, 1
    /* 19248 80152E40 C9F6000C */  jal        ENG_random__Fl
    /* 1924C 80152E44 05000424 */   addiu     $a0, $zero, 0x5
    /* 19250 80152E48 02004224 */  addiu      $v0, $v0, 0x2
    /* 19254 80152E4C 43100200 */  sra        $v0, $v0, 1
    /* 19258 80152E50 40900200 */  sll        $s2, $v0, 1
    /* 1925C 80152E54 23B83402 */  subu       $s7, $s1, $s4
    /* 19260 80152E58 02005526 */  addiu      $s5, $s2, 0x2
    /* 19264 80152E5C FFFFE426 */  addiu      $a0, $s7, -0x1
    /* 19268 80152E60 2130A002 */  addu       $a2, $s5, $zero
    /* 1926C 80152E64 2800A88F */  lw         $t0, 0x28($sp)
    /* 19270 80152E68 01008736 */  ori        $a3, $s4, 0x1
    /* 19274 80152E6C 23F00201 */  subu       $fp, $t0, $v0
    /* 19278 80152E70 FFFFD027 */  addiu      $s0, $fp, -0x1
    /* 1927C 80152E74 3D4B050C */  jal        L4checkRoom__Fiiii
    /* 19280 80152E78 21280002 */   addu      $a1, $s0, $zero
    /* 19284 80152E7C 0100D626 */  addiu      $s6, $s6, 0x1
    /* 19288 80152E80 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1928C 80152E84 04004014 */  bnez       $v0, .L80152E98
    /* 19290 80152E88 4000A2AF */   sw        $v0, 0x40($sp)
    /* 19294 80152E8C 1400C22A */  slti       $v0, $s6, 0x14
    /* 19298 80152E90 E6FF4014 */  bnez       $v0, .L80152E2C
    /* 1929C 80152E94 00000000 */   nop
  .L80152E98:
    /* 192A0 80152E98 4000A98F */  lw         $t1, 0x40($sp)
    /* 192A4 80152E9C 01001624 */  addiu      $s6, $zero, 0x1
    /* 192A8 80152EA0 05003615 */  bne        $t1, $s6, .L80152EB8
    /* 192AC 80152EA4 2120E002 */   addu      $a0, $s7, $zero
    /* 192B0 80152EA8 2128C003 */  addu       $a1, $fp, $zero
    /* 192B4 80152EAC 21308002 */  addu       $a2, $s4, $zero
    /* 192B8 80152EB0 234B050C */  jal        L4drawRoom__Fiiii
    /* 192BC 80152EB4 21384002 */   addu      $a3, $s2, $zero
  .L80152EB8:
    /* 192C0 80152EB8 21983302 */  addu       $s3, $s1, $s3
    /* 192C4 80152EBC 2188A002 */  addu       $s1, $s5, $zero
    /* 192C8 80152EC0 21206002 */  addu       $a0, $s3, $zero
    /* 192CC 80152EC4 21280002 */  addu       $a1, $s0, $zero
    /* 192D0 80152EC8 01008636 */  ori        $a2, $s4, 0x1
    /* 192D4 80152ECC 3D4B050C */  jal        L4checkRoom__Fiiii
    /* 192D8 80152ED0 21382002 */   addu      $a3, $s1, $zero
    /* 192DC 80152ED4 FF005030 */  andi       $s0, $v0, 0xFF
    /* 192E0 80152ED8 05001616 */  bne        $s0, $s6, .L80152EF0
    /* 192E4 80152EDC 21206002 */   addu      $a0, $s3, $zero
    /* 192E8 80152EE0 2128C003 */  addu       $a1, $fp, $zero
    /* 192EC 80152EE4 21308002 */  addu       $a2, $s4, $zero
    /* 192F0 80152EE8 234B050C */  jal        L4drawRoom__Fiiii
    /* 192F4 80152EEC 21384002 */   addu      $a3, $s2, $zero
  .L80152EF0:
    /* 192F8 80152EF0 4000A88F */  lw         $t0, 0x40($sp)
    /* 192FC 80152EF4 00000000 */  nop
    /* 19300 80152EF8 06001615 */  bne        $t0, $s6, .L80152F14
    /* 19304 80152EFC 2120E002 */   addu      $a0, $s7, $zero
    /* 19308 80152F00 1000B6AF */  sw         $s6, 0x10($sp)
    /* 1930C 80152F04 2128C003 */  addu       $a1, $fp, $zero
    /* 19310 80152F08 21308002 */  addu       $a2, $s4, $zero
    /* 19314 80152F0C 644B050C */  jal        L4roomGen__Fiiiii
    /* 19318 80152F10 21384002 */   addu      $a3, $s2, $zero
  .L80152F14:
    /* 1931C 80152F14 4B001616 */  bne        $s0, $s6, .L80153044
    /* 19320 80152F18 21206002 */   addu      $a0, $s3, $zero
    /* 19324 80152F1C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 19328 80152F20 0E4C0508 */  j          .L80153038
    /* 1932C 80152F24 2128C003 */   addu      $a1, $fp, $zero
  .L80152F28:
    /* 19330 80152F28 C2171300 */  srl        $v0, $s3, 31
    /* 19334 80152F2C 21106202 */  addu       $v0, $s3, $v0
    /* 19338 80152F30 43100200 */  sra        $v0, $v0, 1
    /* 1933C 80152F34 21882202 */  addu       $s1, $s1, $v0
    /* 19340 80152F38 4800B1AF */  sw         $s1, 0x48($sp)
  .L80152F3C:
    /* 19344 80152F3C C9F6000C */  jal        ENG_random__Fl
    /* 19348 80152F40 05000424 */   addiu     $a0, $zero, 0x5
    /* 1934C 80152F44 02004224 */  addiu      $v0, $v0, 0x2
    /* 19350 80152F48 43100200 */  sra        $v0, $v0, 1
    /* 19354 80152F4C 40A00200 */  sll        $s4, $v0, 1
    /* 19358 80152F50 C9F6000C */  jal        ENG_random__Fl
    /* 1935C 80152F54 05000424 */   addiu     $a0, $zero, 0x5
    /* 19360 80152F58 02004224 */  addiu      $v0, $v0, 0x2
    /* 19364 80152F5C 43100200 */  sra        $v0, $v0, 1
    /* 19368 80152F60 40900200 */  sll        $s2, $v0, 1
    /* 1936C 80152F64 43101400 */  sra        $v0, $s4, 1
    /* 19370 80152F68 01005126 */  addiu      $s1, $s2, 0x1
    /* 19374 80152F6C 02009526 */  addiu      $s5, $s4, 0x2
    /* 19378 80152F70 2130A002 */  addu       $a2, $s5, $zero
    /* 1937C 80152F74 21382002 */  addu       $a3, $s1, $zero
    /* 19380 80152F78 4800A98F */  lw         $t1, 0x48($sp)
    /* 19384 80152F7C 1800A88F */  lw         $t0, 0x18($sp)
    /* 19388 80152F80 23B82201 */  subu       $s7, $t1, $v0
    /* 1938C 80152F84 23F01201 */  subu       $fp, $t0, $s2
    /* 19390 80152F88 FFFFF326 */  addiu      $s3, $s7, -0x1
    /* 19394 80152F8C 21206002 */  addu       $a0, $s3, $zero
    /* 19398 80152F90 3D4B050C */  jal        L4checkRoom__Fiiii
    /* 1939C 80152F94 FFFFC527 */   addiu     $a1, $fp, -0x1
    /* 193A0 80152F98 FF005030 */  andi       $s0, $v0, 0xFF
    /* 193A4 80152F9C 04000016 */  bnez       $s0, .L80152FB0
    /* 193A8 80152FA0 0100D626 */   addiu     $s6, $s6, 0x1
    /* 193AC 80152FA4 1400C22A */  slti       $v0, $s6, 0x14
    /* 193B0 80152FA8 E4FF4014 */  bnez       $v0, .L80152F3C
    /* 193B4 80152FAC 00000000 */   nop
  .L80152FB0:
    /* 193B8 80152FB0 01001624 */  addiu      $s6, $zero, 0x1
    /* 193BC 80152FB4 07001616 */  bne        $s0, $s6, .L80152FD4
    /* 193C0 80152FB8 21206002 */   addu      $a0, $s3, $zero
    /* 193C4 80152FBC 2120E002 */  addu       $a0, $s7, $zero
    /* 193C8 80152FC0 2128C003 */  addu       $a1, $fp, $zero
    /* 193CC 80152FC4 21308002 */  addu       $a2, $s4, $zero
    /* 193D0 80152FC8 234B050C */  jal        L4drawRoom__Fiiii
    /* 193D4 80152FCC 21384002 */   addu      $a3, $s2, $zero
    /* 193D8 80152FD0 21206002 */  addu       $a0, $s3, $zero
  .L80152FD4:
    /* 193DC 80152FD4 2130A002 */  addu       $a2, $s5, $zero
    /* 193E0 80152FD8 1800A98F */  lw         $t1, 0x18($sp)
    /* 193E4 80152FDC 2000A88F */  lw         $t0, 0x20($sp)
    /* 193E8 80152FE0 21382002 */  addu       $a3, $s1, $zero
    /* 193EC 80152FE4 21982801 */  addu       $s3, $t1, $t0
    /* 193F0 80152FE8 3D4B050C */  jal        L4checkRoom__Fiiii
    /* 193F4 80152FEC 21286002 */   addu      $a1, $s3, $zero
    /* 193F8 80152FF0 FF005130 */  andi       $s1, $v0, 0xFF
    /* 193FC 80152FF4 05003616 */  bne        $s1, $s6, .L8015300C
    /* 19400 80152FF8 2120E002 */   addu      $a0, $s7, $zero
    /* 19404 80152FFC 21286002 */  addu       $a1, $s3, $zero
    /* 19408 80153000 21308002 */  addu       $a2, $s4, $zero
    /* 1940C 80153004 234B050C */  jal        L4drawRoom__Fiiii
    /* 19410 80153008 21384002 */   addu      $a3, $s2, $zero
  .L8015300C:
    /* 19414 8015300C 06001616 */  bne        $s0, $s6, .L80153028
    /* 19418 80153010 2120E002 */   addu      $a0, $s7, $zero
    /* 1941C 80153014 1000A0AF */  sw         $zero, 0x10($sp)
    /* 19420 80153018 2128C003 */  addu       $a1, $fp, $zero
    /* 19424 8015301C 21308002 */  addu       $a2, $s4, $zero
    /* 19428 80153020 644B050C */  jal        L4roomGen__Fiiiii
    /* 1942C 80153024 21384002 */   addu      $a3, $s2, $zero
  .L80153028:
    /* 19430 80153028 06003616 */  bne        $s1, $s6, .L80153044
    /* 19434 8015302C 2120E002 */   addu      $a0, $s7, $zero
    /* 19438 80153030 1000A0AF */  sw         $zero, 0x10($sp)
    /* 1943C 80153034 21286002 */  addu       $a1, $s3, $zero
  .L80153038:
    /* 19440 80153038 21308002 */  addu       $a2, $s4, $zero
    /* 19444 8015303C 644B050C */  jal        L4roomGen__Fiiiii
    /* 19448 80153040 21384002 */   addu      $a3, $s2, $zero
  .L80153044:
    /* 1944C 80153044 7C00BF8F */  lw         $ra, 0x7C($sp)
    /* 19450 80153048 7800BE8F */  lw         $fp, 0x78($sp)
    /* 19454 8015304C 7400B78F */  lw         $s7, 0x74($sp)
    /* 19458 80153050 7000B68F */  lw         $s6, 0x70($sp)
    /* 1945C 80153054 6C00B58F */  lw         $s5, 0x6C($sp)
    /* 19460 80153058 6800B48F */  lw         $s4, 0x68($sp)
    /* 19464 8015305C 6400B38F */  lw         $s3, 0x64($sp)
    /* 19468 80153060 6000B28F */  lw         $s2, 0x60($sp)
    /* 1946C 80153064 5C00B18F */  lw         $s1, 0x5C($sp)
    /* 19470 80153068 5800B08F */  lw         $s0, 0x58($sp)
    /* 19474 8015306C 8000BD27 */  addiu      $sp, $sp, 0x80
    /* 19478 80153070 0800E003 */  jr         $ra
    /* 1947C 80153074 00000000 */   nop
endlabel L4roomGen__Fiiiii
