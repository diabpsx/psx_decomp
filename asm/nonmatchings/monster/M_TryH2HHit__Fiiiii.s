.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_TryH2HHit__Fiiiii, 0x614

glabel M_TryH2HHit__Fiiiii
    /* 13830 8014D428 B0FFBD27 */  addiu      $sp, $sp, -0x50
    /* 13834 8014D42C 3000B2AF */  sw         $s2, 0x30($sp)
    /* 13838 8014D430 21908000 */  addu       $s2, $a0, $zero
    /* 1383C 8014D434 3400B3AF */  sw         $s3, 0x34($sp)
    /* 13840 8014D438 2198A000 */  addu       $s3, $a1, $zero
    /* 13844 8014D43C 4000B6AF */  sw         $s6, 0x40($sp)
    /* 13848 8014D440 21B0C000 */  addu       $s6, $a2, $zero
    /* 1384C 8014D444 3C00B5AF */  sw         $s5, 0x3C($sp)
    /* 13850 8014D448 21A8E000 */  addu       $s5, $a3, $zero
    /* 13854 8014D44C 40181300 */  sll        $v1, $s3, 1
    /* 13858 8014D450 21187300 */  addu       $v1, $v1, $s3
    /* 1385C 8014D454 80180300 */  sll        $v1, $v1, 2
    /* 13860 8014D458 21187300 */  addu       $v1, $v1, $s3
    /* 13864 8014D45C 00190300 */  sll        $v1, $v1, 4
    /* 13868 8014D460 23187300 */  subu       $v1, $v1, $s3
    /* 1386C 8014D464 80180300 */  sll        $v1, $v1, 2
    /* 13870 8014D468 21187300 */  addu       $v1, $v1, $s3
    /* 13874 8014D46C C0180300 */  sll        $v1, $v1, 3
    /* 13878 8014D470 0E80043C */  lui        $a0, %hi(plr)
    /* 1387C 8014D474 38A58424 */  addiu      $a0, $a0, %lo(plr)
    /* 13880 8014D478 40101200 */  sll        $v0, $s2, 1
    /* 13884 8014D47C 21105200 */  addu       $v0, $v0, $s2
    /* 13888 8014D480 80100200 */  sll        $v0, $v0, 2
    /* 1388C 8014D484 21105200 */  addu       $v0, $v0, $s2
    /* 13890 8014D488 3800B4AF */  sw         $s4, 0x38($sp)
    /* 13894 8014D48C C0A00200 */  sll        $s4, $v0, 3
    /* 13898 8014D490 4C00BFAF */  sw         $ra, 0x4C($sp)
    /* 1389C 8014D494 4800BEAF */  sw         $fp, 0x48($sp)
    /* 138A0 8014D498 4400B7AF */  sw         $s7, 0x44($sp)
    /* 138A4 8014D49C 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 138A8 8014D4A0 2800B0AF */  sw         $s0, 0x28($sp)
    /* 138AC 8014D4A4 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 138B0 8014D4A8 21083400 */  addu       $at, $at, $s4
    /* 138B4 8014D4AC C0532294 */  lhu        $v0, %lo(monster + 0x2C)($at)
    /* 138B8 8014D4B0 00000000 */  nop
    /* 138BC 8014D4B4 10004230 */  andi       $v0, $v0, 0x10
    /* 138C0 8014D4B8 08004010 */  beqz       $v0, .L8014D4DC
    /* 138C4 8014D4BC 21886400 */   addu      $s1, $v1, $a0
    /* 138C8 8014D4C0 6000A88F */  lw         $t0, 0x60($sp)
    /* 138CC 8014D4C4 00000000 */  nop
    /* 138D0 8014D4C8 1000A8AF */  sw         $t0, 0x10($sp)
    /* 138D4 8014D4CC 7C34050C */  jal        M_TryM2MHit__Fiiiii
    /* 138D8 8014D4D0 21204002 */   addu      $a0, $s2, $zero
    /* 138DC 8014D4D4 82360508 */  j          .L8014DA08
    /* 138E0 8014D4D8 00000000 */   nop
  .L8014D4DC:
    /* 138E4 8014D4DC 1080023C */  lui        $v0, %hi(monster)
    /* 138E8 8014D4E0 94534224 */  addiu      $v0, $v0, %lo(monster)
    /* 138EC 8014D4E4 21108202 */  addu       $v0, $s4, $v0
    /* 138F0 8014D4E8 1C01238E */  lw         $v1, 0x11C($s1)
    /* 138F4 8014D4EC 34004880 */  lb         $t0, 0x34($v0)
    /* 138F8 8014D4F0 35004280 */  lb         $v0, 0x35($v0)
    /* 138FC 8014D4F4 83190300 */  sra        $v1, $v1, 6
    /* 13900 8014D4F8 1800A8AF */  sw         $t0, 0x18($sp)
    /* 13904 8014D4FC 2000A2AF */  sw         $v0, 0x20($sp)
    /* 13908 8014D500 30003786 */  lh         $s7, 0x30($s1)
    /* 1390C 8014D504 32003E86 */  lh         $fp, 0x32($s1)
    /* 13910 8014D508 3F016018 */  blez       $v1, .L8014DA08
    /* 13914 8014D50C 00000000 */   nop
    /* 13918 8014D510 D3002292 */  lbu        $v0, 0xD3($s1)
    /* 1391C 8014D514 00000000 */  nop
    /* 13920 8014D518 3B014014 */  bnez       $v0, .L8014DA08
    /* 13924 8014D51C 00000000 */   nop
    /* 13928 8014D520 D0002292 */  lbu        $v0, 0xD0($s1)
    /* 1392C 8014D524 00000000 */  nop
    /* 13930 8014D528 01004230 */  andi       $v0, $v0, 0x1
    /* 13934 8014D52C 36014014 */  bnez       $v0, .L8014DA08
    /* 13938 8014D530 00000000 */   nop
    /* 1393C 8014D534 6D41000C */  jal        abs
    /* 13940 8014D538 23201701 */   subu      $a0, $t0, $s7
    /* 13944 8014D53C 2000A88F */  lw         $t0, 0x20($sp)
    /* 13948 8014D540 21804000 */  addu       $s0, $v0, $zero
    /* 1394C 8014D544 6D41000C */  jal        abs
    /* 13950 8014D548 23201E01 */   subu      $a0, $t0, $fp
    /* 13954 8014D54C 0200102A */  slti       $s0, $s0, 0x2
    /* 13958 8014D550 2D010012 */  beqz       $s0, .L8014DA08
    /* 1395C 8014D554 02004228 */   slti      $v0, $v0, 0x2
    /* 13960 8014D558 2B014010 */  beqz       $v0, .L8014DA08
    /* 13964 8014D55C 00000000 */   nop
    /* 13968 8014D560 C9F6000C */  jal        ENG_random__Fl
    /* 1396C 8014D564 64000424 */   addiu     $a0, $zero, 0x64
    /* 13970 8014D568 6666043C */  lui        $a0, (0x66666667 >> 16)
    /* 13974 8014D56C 00012596 */  lhu        $a1, 0x100($s1)
    /* 13978 8014D570 67668434 */  ori        $a0, $a0, (0x66666667 & 0xFFFF)
    /* 1397C 8014D574 002C0500 */  sll        $a1, $a1, 16
    /* 13980 8014D578 031C0500 */  sra        $v1, $a1, 16
    /* 13984 8014D57C 18006400 */  mult       $v1, $a0
    /* 13988 8014D580 9819248E */  lw         $a0, 0x1998($s1)
    /* 1398C 8014D584 A419238E */  lw         $v1, 0x19A4($s1)
    /* 13990 8014D588 C32F0500 */  sra        $a1, $a1, 31
    /* 13994 8014D58C 21208300 */  addu       $a0, $a0, $v1
    /* 13998 8014D590 10400000 */  mfhi       $t0
    /* 1399C 8014D594 43180800 */  sra        $v1, $t0, 1
    /* 139A0 8014D598 23186500 */  subu       $v1, $v1, $a1
    /* 139A4 8014D59C 001C0300 */  sll        $v1, $v1, 16
    /* 139A8 8014D5A0 031C0300 */  sra        $v1, $v1, 16
    /* 139AC 8014D5A4 21208300 */  addu       $a0, $a0, $v1
    /* 139B0 8014D5A8 E2FF8424 */  addiu      $a0, $a0, -0x1E
    /* 139B4 8014D5AC 2320C402 */  subu       $a0, $s6, $a0
    /* 139B8 8014D5B0 1080013C */  lui        $at, %hi(monster + 0x47)
    /* 139BC 8014D5B4 21083400 */  addu       $at, $at, $s4
    /* 139C0 8014D5B8 DB532380 */  lb         $v1, %lo(monster + 0x47)($at)
    /* 139C4 8014D5BC 3C012582 */  lb         $a1, 0x13C($s1)
    /* 139C8 8014D5C0 21B04000 */  addu       $s6, $v0, $zero
    /* 139CC 8014D5C4 23186500 */  subu       $v1, $v1, $a1
    /* 139D0 8014D5C8 40180300 */  sll        $v1, $v1, 1
    /* 139D4 8014D5CC 21808300 */  addu       $s0, $a0, $v1
    /* 139D8 8014D5D0 0F00022A */  slti       $v0, $s0, 0xF
    /* 139DC 8014D5D4 02004010 */  beqz       $v0, .L8014D5E0
    /* 139E0 8014D5D8 00000000 */   nop
    /* 139E4 8014D5DC 0F001024 */  addiu      $s0, $zero, 0xF
  .L8014D5E0:
    /* 139E8 8014D5E0 1280033C */  lui        $v1, %hi(currlevel)
    /* 139EC 8014D5E4 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 139F0 8014D5E8 0E000224 */  addiu      $v0, $zero, 0xE
    /* 139F4 8014D5EC 07006214 */  bne        $v1, $v0, .L8014D60C
    /* 139F8 8014D5F0 0F000224 */   addiu     $v0, $zero, 0xF
    /* 139FC 8014D5F4 1400022A */  slti       $v0, $s0, 0x14
    /* 13A00 8014D5F8 04004010 */  beqz       $v0, .L8014D60C
    /* 13A04 8014D5FC 0F000224 */   addiu     $v0, $zero, 0xF
    /* 13A08 8014D600 14001024 */  addiu      $s0, $zero, 0x14
    /* 13A0C 8014D604 1280033C */  lui        $v1, %hi(currlevel)
    /* 13A10 8014D608 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
  .L8014D60C:
    /* 13A14 8014D60C 00000000 */  nop
    /* 13A18 8014D610 04006214 */  bne        $v1, $v0, .L8014D624
    /* 13A1C 8014D614 1900022A */   slti      $v0, $s0, 0x19
    /* 13A20 8014D618 02004010 */  beqz       $v0, .L8014D624
    /* 13A24 8014D61C 00000000 */   nop
    /* 13A28 8014D620 19001024 */  addiu      $s0, $zero, 0x19
  .L8014D624:
    /* 13A2C 8014D624 1280033C */  lui        $v1, %hi(currlevel)
    /* 13A30 8014D628 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 13A34 8014D62C 10000224 */  addiu      $v0, $zero, 0x10
    /* 13A38 8014D630 04006214 */  bne        $v1, $v0, .L8014D644
    /* 13A3C 8014D634 1E00022A */   slti      $v0, $s0, 0x1E
    /* 13A40 8014D638 02004010 */  beqz       $v0, .L8014D644
    /* 13A44 8014D63C 00000000 */   nop
    /* 13A48 8014D640 1E001024 */  addiu      $s0, $zero, 0x1E
  .L8014D644:
    /* 13A4C 8014D644 0000238E */  lw         $v1, 0x0($s1)
    /* 13A50 8014D648 00000000 */  nop
    /* 13A54 8014D64C 03006010 */  beqz       $v1, .L8014D65C
    /* 13A58 8014D650 04000224 */   addiu     $v0, $zero, 0x4
    /* 13A5C 8014D654 08006214 */  bne        $v1, $v0, .L8014D678
    /* 13A60 8014D658 64000624 */   addiu     $a2, $zero, 0x64
  .L8014D65C:
    /* 13A64 8014D65C D2002292 */  lbu        $v0, 0xD2($s1)
    /* 13A68 8014D660 00000000 */  nop
    /* 13A6C 8014D664 04004010 */  beqz       $v0, .L8014D678
    /* 13A70 8014D668 64000624 */   addiu     $a2, $zero, 0x64
    /* 13A74 8014D66C C9F6000C */  jal        ENG_random__Fl
    /* 13A78 8014D670 64000424 */   addiu     $a0, $zero, 0x64
    /* 13A7C 8014D674 21304000 */  addu       $a2, $v0, $zero
  .L8014D678:
    /* 13A80 8014D678 40101200 */  sll        $v0, $s2, 1
    /* 13A84 8014D67C 21105200 */  addu       $v0, $v0, $s2
    /* 13A88 8014D680 80100200 */  sll        $v0, $v0, 2
    /* 13A8C 8014D684 21105200 */  addu       $v0, $v0, $s2
    /* 13A90 8014D688 C0A00200 */  sll        $s4, $v0, 3
    /* 13A94 8014D68C 00012586 */  lh         $a1, 0x100($s1)
    /* 13A98 8014D690 1001238E */  lw         $v1, 0x110($s1)
    /* 13A9C 8014D694 1080013C */  lui        $at, %hi(monster + 0x47)
    /* 13AA0 8014D698 21083400 */  addu       $at, $at, $s4
    /* 13AA4 8014D69C DB532280 */  lb         $v0, %lo(monster + 0x47)($at)
    /* 13AA8 8014D6A0 3C012482 */  lb         $a0, 0x13C($s1)
    /* 13AAC 8014D6A4 21186500 */  addu       $v1, $v1, $a1
    /* 13AB0 8014D6A8 23104400 */  subu       $v0, $v0, $a0
    /* 13AB4 8014D6AC 40100200 */  sll        $v0, $v0, 1
    /* 13AB8 8014D6B0 23186200 */  subu       $v1, $v1, $v0
    /* 13ABC 8014D6B4 03006104 */  bgez       $v1, .L8014D6C4
    /* 13AC0 8014D6B8 65006228 */   slti      $v0, $v1, 0x65
    /* 13AC4 8014D6BC 21180000 */  addu       $v1, $zero, $zero
    /* 13AC8 8014D6C0 65006228 */  slti       $v0, $v1, 0x65
  .L8014D6C4:
    /* 13ACC 8014D6C4 02004014 */  bnez       $v0, .L8014D6D0
    /* 13AD0 8014D6C8 2A10D002 */   slt       $v0, $s6, $s0
    /* 13AD4 8014D6CC 64000324 */  addiu      $v1, $zero, 0x64
  .L8014D6D0:
    /* 13AD8 8014D6D0 CD004010 */  beqz       $v0, .L8014DA08
    /* 13ADC 8014D6D4 2A10C300 */   slt       $v0, $a2, $v1
    /* 13AE0 8014D6D8 0B004010 */  beqz       $v0, .L8014D708
    /* 13AE4 8014D6DC 00000000 */   nop
    /* 13AE8 8014D6E0 2120E002 */  addu       $a0, $s7, $zero
    /* 13AEC 8014D6E4 1800A68F */  lw         $a2, 0x18($sp)
    /* 13AF0 8014D6E8 2000A78F */  lw         $a3, 0x20($sp)
    /* 13AF4 8014D6EC 8AF6000C */  jal        GetDirection__Fiiii
    /* 13AF8 8014D6F0 2128C003 */   addu      $a1, $fp, $zero
    /* 13AFC 8014D6F4 21202002 */  addu       $a0, $s1, $zero
    /* 13B00 8014D6F8 2A84010C */  jal        StartPlrBlock__FP12PlayerStructi
    /* 13B04 8014D6FC 21284000 */   addu      $a1, $v0, $zero
    /* 13B08 8014D700 82360508 */  j          .L8014DA08
    /* 13B0C 8014D704 00000000 */   nop
  .L8014D708:
    /* 13B10 8014D708 6000A88F */  lw         $t0, 0x60($sp)
    /* 13B14 8014D70C 00000000 */  nop
    /* 13B18 8014D710 23201501 */  subu       $a0, $t0, $s5
    /* 13B1C 8014D714 01008424 */  addiu      $a0, $a0, 0x1
    /* 13B20 8014D718 C9F6000C */  jal        ENG_random__Fl
    /* 13B24 8014D71C 80210400 */   sll       $a0, $a0, 6
    /* 13B28 8014D720 80211500 */  sll        $a0, $s5, 6
    /* 13B2C 8014D724 BC19238E */  lw         $v1, 0x19BC($s1)
    /* 13B30 8014D728 21804400 */  addu       $s0, $v0, $a0
    /* 13B34 8014D72C 80190300 */  sll        $v1, $v1, 6
    /* 13B38 8014D730 21800302 */  addu       $s0, $s0, $v1
    /* 13B3C 8014D734 4000022A */  slti       $v0, $s0, 0x40
    /* 13B40 8014D738 02004010 */  beqz       $v0, .L8014D744
    /* 13B44 8014D73C 00000000 */   nop
    /* 13B48 8014D740 40001024 */  addiu      $s0, $zero, 0x40
  .L8014D744:
    /* 13B4C 8014D744 1C01228E */  lw         $v0, 0x11C($s1)
    /* 13B50 8014D748 1401238E */  lw         $v1, 0x114($s1)
    /* 13B54 8014D74C 23105000 */  subu       $v0, $v0, $s0
    /* 13B58 8014D750 1C0122AE */  sw         $v0, 0x11C($s1)
    /* 13B5C 8014D754 B819228E */  lw         $v0, 0x19B8($s1)
    /* 13B60 8014D758 23187000 */  subu       $v1, $v1, $s0
    /* 13B64 8014D75C 140123AE */  sw         $v1, 0x114($s1)
    /* 13B68 8014D760 0004033C */  lui        $v1, (0x4000000 >> 16)
    /* 13B6C 8014D764 24104300 */  and        $v0, $v0, $v1
    /* 13B70 8014D768 16004010 */  beqz       $v0, .L8014D7C4
    /* 13B74 8014D76C 40101200 */   sll       $v0, $s2, 1
    /* 13B78 8014D770 C9F6000C */  jal        ENG_random__Fl
    /* 13B7C 8014D774 03000424 */   addiu     $a0, $zero, 0x3
    /* 13B80 8014D778 01004224 */  addiu      $v0, $v0, 0x1
    /* 13B84 8014D77C 1080013C */  lui        $at, %hi(monster + 0x10)
    /* 13B88 8014D780 21083400 */  addu       $at, $at, $s4
    /* 13B8C 8014D784 A453238C */  lw         $v1, %lo(monster + 0x10)($at)
    /* 13B90 8014D788 80310200 */  sll        $a2, $v0, 6
    /* 13B94 8014D78C 23186600 */  subu       $v1, $v1, $a2
    /* 13B98 8014D790 1080013C */  lui        $at, %hi(monster + 0x10)
    /* 13B9C 8014D794 21083400 */  addu       $at, $at, $s4
    /* 13BA0 8014D798 A45323AC */  sw         $v1, %lo(monster + 0x10)($at)
    /* 13BA4 8014D79C 83190300 */  sra        $v1, $v1, 6
    /* 13BA8 8014D7A0 0500601C */  bgtz       $v1, .L8014D7B8
    /* 13BAC 8014D7A4 21204002 */   addu      $a0, $s2, $zero
    /* 13BB0 8014D7A8 F630050C */  jal        M_StartKill__Fii
    /* 13BB4 8014D7AC 21286002 */   addu      $a1, $s3, $zero
    /* 13BB8 8014D7B0 F1350508 */  j          .L8014D7C4
    /* 13BBC 8014D7B4 40101200 */   sll       $v0, $s2, 1
  .L8014D7B8:
    /* 13BC0 8014D7B8 B62C050C */  jal        M_StartHit__Fiii
    /* 13BC4 8014D7BC 21286002 */   addu      $a1, $s3, $zero
    /* 13BC8 8014D7C0 40101200 */  sll        $v0, $s2, 1
  .L8014D7C4:
    /* 13BCC 8014D7C4 21105200 */  addu       $v0, $v0, $s2
    /* 13BD0 8014D7C8 80100200 */  sll        $v0, $v0, 2
    /* 13BD4 8014D7CC 21105200 */  addu       $v0, $v0, $s2
    /* 13BD8 8014D7D0 C0200200 */  sll        $a0, $v0, 3
    /* 13BDC 8014D7D4 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 13BE0 8014D7D8 21082400 */  addu       $at, $at, $a0
    /* 13BE4 8014D7DC C0532294 */  lhu        $v0, %lo(monster + 0x2C)($at)
    /* 13BE8 8014D7E0 00000000 */  nop
    /* 13BEC 8014D7E4 00104230 */  andi       $v0, $v0, 0x1000
    /* 13BF0 8014D7E8 16004014 */  bnez       $v0, .L8014D844
    /* 13BF4 8014D7EC 00000000 */   nop
    /* 13BF8 8014D7F0 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 13BFC 8014D7F4 21082400 */  addu       $at, $at, $a0
    /* 13C00 8014D7F8 F453228C */  lw         $v0, %lo(monster + 0x60)($at)
    /* 13C04 8014D7FC 00000000 */  nop
    /* 13C08 8014D800 12004390 */  lbu        $v1, 0x12($v0)
    /* 13C0C 8014D804 32000224 */  addiu      $v0, $zero, 0x32
    /* 13C10 8014D808 0E006214 */  bne        $v1, $v0, .L8014D844
    /* 13C14 8014D80C 01000224 */   addiu     $v0, $zero, 0x1
    /* 13C18 8014D810 1280033C */  lui        $v1, %hi(gbMaxPlayers)
    /* 13C1C 8014D814 A2B96390 */  lbu        $v1, %lo(gbMaxPlayers)($v1)
    /* 13C20 8014D818 00000000 */  nop
    /* 13C24 8014D81C 09006210 */  beq        $v1, $v0, .L8014D844
    /* 13C28 8014D820 00000000 */   nop
    /* 13C2C 8014D824 1080013C */  lui        $at, %hi(monster + 0x10)
    /* 13C30 8014D828 21082400 */  addu       $at, $at, $a0
    /* 13C34 8014D82C A453228C */  lw         $v0, %lo(monster + 0x10)($at)
    /* 13C38 8014D830 00000000 */  nop
    /* 13C3C 8014D834 21105000 */  addu       $v0, $v0, $s0
    /* 13C40 8014D838 1080013C */  lui        $at, %hi(monster + 0x10)
    /* 13C44 8014D83C 21082400 */  addu       $at, $at, $a0
    /* 13C48 8014D840 A45322AC */  sw         $v0, %lo(monster + 0x10)($at)
  .L8014D844:
    /* 13C4C 8014D844 1C01228E */  lw         $v0, 0x11C($s1)
    /* 13C50 8014D848 2001238E */  lw         $v1, 0x120($s1)
    /* 13C54 8014D84C 00000000 */  nop
    /* 13C58 8014D850 2A106200 */  slt        $v0, $v1, $v0
    /* 13C5C 8014D854 04004010 */  beqz       $v0, .L8014D868
    /* 13C60 8014D858 00000000 */   nop
    /* 13C64 8014D85C 1801228E */  lw         $v0, 0x118($s1)
    /* 13C68 8014D860 1C0123AE */  sw         $v1, 0x11C($s1)
    /* 13C6C 8014D864 140122AE */  sw         $v0, 0x114($s1)
  .L8014D868:
    /* 13C70 8014D868 1C01228E */  lw         $v0, 0x11C($s1)
    /* 13C74 8014D86C 00000000 */  nop
    /* 13C78 8014D870 83110200 */  sra        $v0, $v0, 6
    /* 13C7C 8014D874 0500401C */  bgtz       $v0, .L8014D88C
    /* 13C80 8014D878 21202002 */   addu      $a0, $s1, $zero
    /* 13C84 8014D87C 1587010C */  jal        StartPlrKill__FP12PlayerStructi
    /* 13C88 8014D880 21280000 */   addu      $a1, $zero, $zero
    /* 13C8C 8014D884 82360508 */  j          .L8014DA08
    /* 13C90 8014D888 00000000 */   nop
  .L8014D88C:
    /* 13C94 8014D88C 21280002 */  addu       $a1, $s0, $zero
    /* 13C98 8014D890 BF84010C */  jal        StartPlrHit__FP12PlayerStructiUc
    /* 13C9C 8014D894 21300000 */   addu      $a2, $zero, $zero
    /* 13CA0 8014D898 40101200 */  sll        $v0, $s2, 1
    /* 13CA4 8014D89C 21105200 */  addu       $v0, $v0, $s2
    /* 13CA8 8014D8A0 80100200 */  sll        $v0, $v0, 2
    /* 13CAC 8014D8A4 21105200 */  addu       $v0, $v0, $s2
    /* 13CB0 8014D8A8 C0800200 */  sll        $s0, $v0, 3
    /* 13CB4 8014D8AC 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 13CB8 8014D8B0 21083000 */  addu       $at, $at, $s0
    /* 13CBC 8014D8B4 C0532294 */  lhu        $v0, %lo(monster + 0x2C)($at)
    /* 13CC0 8014D8B8 00000000 */  nop
    /* 13CC4 8014D8BC 80004230 */  andi       $v0, $v0, 0x80
    /* 13CC8 8014D8C0 51004010 */  beqz       $v0, .L8014DA08
    /* 13CCC 8014D8C4 40101300 */   sll       $v0, $s3, 1
    /* 13CD0 8014D8C8 21105300 */  addu       $v0, $v0, $s3
    /* 13CD4 8014D8CC 80100200 */  sll        $v0, $v0, 2
    /* 13CD8 8014D8D0 21105300 */  addu       $v0, $v0, $s3
    /* 13CDC 8014D8D4 00110200 */  sll        $v0, $v0, 4
    /* 13CE0 8014D8D8 23105300 */  subu       $v0, $v0, $s3
    /* 13CE4 8014D8DC 80100200 */  sll        $v0, $v0, 2
    /* 13CE8 8014D8E0 21105300 */  addu       $v0, $v0, $s3
    /* 13CEC 8014D8E4 C0100200 */  sll        $v0, $v0, 3
    /* 13CF0 8014D8E8 0E80013C */  lui        $at, %hi(plr)
    /* 13CF4 8014D8EC 21082200 */  addu       $at, $at, $v0
    /* 13CF8 8014D8F0 38A5238C */  lw         $v1, %lo(plr)($at)
    /* 13CFC 8014D8F4 07000224 */  addiu      $v0, $zero, 0x7
    /* 13D00 8014D8F8 05006210 */  beq        $v1, $v0, .L8014D910
    /* 13D04 8014D8FC 01001424 */   addiu     $s4, $zero, 0x1
    /* 13D08 8014D900 21206002 */  addu       $a0, $s3, $zero
    /* 13D0C 8014D904 21280000 */  addu       $a1, $zero, $zero
    /* 13D10 8014D908 D59B010C */  jal        StartPlrHit__FiiUc
    /* 13D14 8014D90C 01000624 */   addiu     $a2, $zero, 0x1
  .L8014D910:
    /* 13D18 8014D910 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 13D1C 8014D914 21083000 */  addu       $at, $at, $s0
    /* 13D20 8014D918 D0532380 */  lb         $v1, %lo(monster + 0x3C)($at)
    /* 13D24 8014D91C 1280013C */  lui        $at, %hi(offset_x)
    /* 13D28 8014D920 21082300 */  addu       $at, $at, $v1
    /* 13D2C 8014D924 A8C22280 */  lb         $v0, %lo(offset_x)($at)
    /* 13D30 8014D928 00000000 */  nop
    /* 13D34 8014D92C 2190E202 */  addu       $s2, $s7, $v0
    /* 13D38 8014D930 1280013C */  lui        $at, %hi(offset_y)
    /* 13D3C 8014D934 21082300 */  addu       $at, $at, $v1
    /* 13D40 8014D938 B0C22280 */  lb         $v0, %lo(offset_y)($at)
    /* 13D44 8014D93C 1280033C */  lui        $v1, %hi(FePlayerNo)
    /* 13D48 8014D940 78B3638C */  lw         $v1, %lo(FePlayerNo)($v1)
    /* 13D4C 8014D944 00000000 */  nop
    /* 13D50 8014D948 1D006010 */  beqz       $v1, .L8014D9C0
    /* 13D54 8014D94C 2180C203 */   addu      $s0, $fp, $v0
    /* 13D58 8014D950 0100633A */  xori       $v1, $s3, 0x1
    /* 13D5C 8014D954 40100300 */  sll        $v0, $v1, 1
    /* 13D60 8014D958 21104300 */  addu       $v0, $v0, $v1
    /* 13D64 8014D95C 80100200 */  sll        $v0, $v0, 2
    /* 13D68 8014D960 21104300 */  addu       $v0, $v0, $v1
    /* 13D6C 8014D964 00110200 */  sll        $v0, $v0, 4
    /* 13D70 8014D968 23104300 */  subu       $v0, $v0, $v1
    /* 13D74 8014D96C 80100200 */  sll        $v0, $v0, 2
    /* 13D78 8014D970 21104300 */  addu       $v0, $v0, $v1
    /* 13D7C 8014D974 C0100200 */  sll        $v0, $v0, 3
    /* 13D80 8014D978 0E80033C */  lui        $v1, %hi(plr)
    /* 13D84 8014D97C 38A56324 */  addiu      $v1, $v1, %lo(plr)
    /* 13D88 8014D980 1D002492 */  lbu        $a0, 0x1D($s1)
    /* 13D8C 8014D984 00000000 */  nop
    /* 13D90 8014D988 0D008010 */  beqz       $a0, .L8014D9C0
    /* 13D94 8014D98C 21184300 */   addu      $v1, $v0, $v1
    /* 13D98 8014D990 1D006290 */  lbu        $v0, 0x1D($v1)
    /* 13D9C 8014D994 00000000 */  nop
    /* 13DA0 8014D998 09004010 */  beqz       $v0, .L8014D9C0
    /* 13DA4 8014D99C C0201200 */   sll       $a0, $s2, 3
    /* 13DA8 8014D9A0 2800668C */  lw         $a2, 0x28($v1)
    /* 13DAC 8014D9A4 2C00678C */  lw         $a3, 0x2C($v1)
    /* 13DB0 8014D9A8 5A89010C */  jal        ChkPlrOffsets__Fiiii
    /* 13DB4 8014D9AC C0281000 */   sll       $a1, $s0, 3
    /* 13DB8 8014D9B0 FF004230 */  andi       $v0, $v0, 0xFF
    /* 13DBC 8014D9B4 02004014 */  bnez       $v0, .L8014D9C0
    /* 13DC0 8014D9B8 00000000 */   nop
    /* 13DC4 8014D9BC 21A00000 */  addu       $s4, $zero, $zero
  .L8014D9C0:
    /* 13DC8 8014D9C0 11008012 */  beqz       $s4, .L8014DA08
    /* 13DCC 8014D9C4 21202002 */   addu      $a0, $s1, $zero
    /* 13DD0 8014D9C8 21284002 */  addu       $a1, $s2, $zero
    /* 13DD4 8014D9CC 1D95010C */  jal        PosOkPlayer__FP12PlayerStructii
    /* 13DD8 8014D9D0 21300002 */   addu      $a2, $s0, $zero
    /* 13DDC 8014D9D4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 13DE0 8014D9D8 0B004010 */  beqz       $v0, .L8014DA08
    /* 13DE4 8014D9DC 00000000 */   nop
    /* 13DE8 8014D9E0 7F83010C */  jal        SetPlayerOld__FP12PlayerStruct
    /* 13DEC 8014D9E4 21202002 */   addu      $a0, $s1, $zero
    /* 13DF0 8014D9E8 787F010C */  jal        plrind__FP12PlayerStruct
    /* 13DF4 8014D9EC 21202002 */   addu      $a0, $s1, $zero
    /* 13DF8 8014D9F0 21204000 */  addu       $a0, $v0, $zero
    /* 13DFC 8014D9F4 C0281200 */  sll        $a1, $s2, 3
    /* 13E00 8014D9F8 0400A534 */  ori        $a1, $a1, 0x4
    /* 13E04 8014D9FC C0301000 */  sll        $a2, $s0, 3
    /* 13E08 8014DA00 10E1010C */  jal        WorldToOffset__Fiii
    /* 13E0C 8014DA04 0400C634 */   ori       $a2, $a2, 0x4
  .L8014DA08:
    /* 13E10 8014DA08 4C00BF8F */  lw         $ra, 0x4C($sp)
    /* 13E14 8014DA0C 4800BE8F */  lw         $fp, 0x48($sp)
    /* 13E18 8014DA10 4400B78F */  lw         $s7, 0x44($sp)
    /* 13E1C 8014DA14 4000B68F */  lw         $s6, 0x40($sp)
    /* 13E20 8014DA18 3C00B58F */  lw         $s5, 0x3C($sp)
    /* 13E24 8014DA1C 3800B48F */  lw         $s4, 0x38($sp)
    /* 13E28 8014DA20 3400B38F */  lw         $s3, 0x34($sp)
    /* 13E2C 8014DA24 3000B28F */  lw         $s2, 0x30($sp)
    /* 13E30 8014DA28 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 13E34 8014DA2C 2800B08F */  lw         $s0, 0x28($sp)
    /* 13E38 8014DA30 5000BD27 */  addiu      $sp, $sp, 0x50
    /* 13E3C 8014DA34 0800E003 */  jr         $ra
    /* 13E40 8014DA38 00000000 */   nop
endlabel M_TryH2HHit__Fiiiii
