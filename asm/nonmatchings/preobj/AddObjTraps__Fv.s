.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddObjTraps__Fv, 0x288

glabel AddObjTraps__Fv
    /* 1ECB4 801588AC 1280033C */  lui        $v1, %hi(currlevel)
    /* 1ECB8 801588B0 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 1ECBC 801588B4 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 1ECC0 801588B8 2800BFAF */  sw         $ra, 0x28($sp)
    /* 1ECC4 801588BC 2400B5AF */  sw         $s5, 0x24($sp)
    /* 1ECC8 801588C0 2000B4AF */  sw         $s4, 0x20($sp)
    /* 1ECCC 801588C4 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1ECD0 801588C8 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1ECD4 801588CC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1ECD8 801588D0 01006238 */  xori       $v0, $v1, 0x1
    /* 1ECDC 801588D4 0100422C */  sltiu      $v0, $v0, 0x1
    /* 1ECE0 801588D8 23100200 */  negu       $v0, $v0
    /* 1ECE4 801588DC 0A005530 */  andi       $s5, $v0, 0xA
    /* 1ECE8 801588E0 0200622C */  sltiu      $v0, $v1, 0x2
    /* 1ECEC 801588E4 02004014 */  bnez       $v0, .L801588F0
    /* 1ECF0 801588E8 1000B0AF */   sw        $s0, 0x10($sp)
    /* 1ECF4 801588EC 0F001524 */  addiu      $s5, $zero, 0xF
  .L801588F0:
    /* 1ECF8 801588F0 0500622C */  sltiu      $v0, $v1, 0x5
    /* 1ECFC 801588F4 02004014 */  bnez       $v0, .L80158900
    /* 1ED00 801588F8 0700622C */   sltiu     $v0, $v1, 0x7
    /* 1ED04 801588FC 14001524 */  addiu      $s5, $zero, 0x14
  .L80158900:
    /* 1ED08 80158900 02004014 */  bnez       $v0, .L8015890C
    /* 1ED0C 80158904 21980000 */   addu      $s3, $zero, $zero
    /* 1ED10 80158908 19001524 */  addiu      $s5, $zero, 0x19
  .L8015890C:
    /* 1ED14 8015890C 21900000 */  addu       $s2, $zero, $zero
  .L80158910:
    /* 1ED18 80158910 C0101300 */  sll        $v0, $s3, 3
  .L80158914:
    /* 1ED1C 80158914 C0181200 */  sll        $v1, $s2, 3
    /* 1ED20 80158918 23187200 */  subu       $v1, $v1, $s2
    /* 1ED24 8015891C C0190300 */  sll        $v1, $v1, 7
    /* 1ED28 80158920 21804300 */  addu       $s0, $v0, $v1
    /* 1ED2C 80158924 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 1ED30 80158928 21083000 */  addu       $at, $at, $s0
    /* 1ED34 8015892C 2B7A2280 */  lb         $v0, %lo(dung_map + 0x3)($at)
    /* 1ED38 80158930 00000000 */  nop
    /* 1ED3C 80158934 6D004018 */  blez       $v0, .L80158AEC
    /* 1ED40 80158938 00000000 */   nop
    /* 1ED44 8015893C C9F6000C */  jal        ENG_random__Fl
    /* 1ED48 80158940 64000424 */   addiu     $a0, $zero, 0x64
    /* 1ED4C 80158944 2A105500 */  slt        $v0, $v0, $s5
    /* 1ED50 80158948 68004010 */  beqz       $v0, .L80158AEC
    /* 1ED54 8015894C 00000000 */   nop
    /* 1ED58 80158950 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 1ED5C 80158954 21083000 */  addu       $at, $at, $s0
    /* 1ED60 80158958 2B7A2490 */  lbu        $a0, %lo(dung_map + 0x3)($at)
    /* 1ED64 8015895C 00000000 */  nop
    /* 1ED68 80158960 FFFF8424 */  addiu      $a0, $a0, -0x1
    /* 1ED6C 80158964 001E0400 */  sll        $v1, $a0, 24
    /* 1ED70 80158968 031E0300 */  sra        $v1, $v1, 24
    /* 1ED74 8015896C 40100300 */  sll        $v0, $v1, 1
    /* 1ED78 80158970 21104300 */  addu       $v0, $v0, $v1
    /* 1ED7C 80158974 80100200 */  sll        $v0, $v0, 2
    /* 1ED80 80158978 23104300 */  subu       $v0, $v0, $v1
    /* 1ED84 8015897C 80100200 */  sll        $v0, $v0, 2
    /* 1ED88 80158980 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 1ED8C 80158984 21082200 */  addu       $at, $at, $v0
    /* 1ED90 80158988 6A8C2380 */  lb         $v1, %lo(object + 0x1E)($at)
    /* 1ED94 8015898C 00000000 */  nop
    /* 1ED98 80158990 C0100300 */  sll        $v0, $v1, 3
    /* 1ED9C 80158994 21104300 */  addu       $v0, $v0, $v1
    /* 1EDA0 80158998 40100200 */  sll        $v0, $v0, 1
    /* 1EDA4 8015899C 0E80013C */  lui        $at, %hi(AllObjects + 0x11)
    /* 1EDA8 801589A0 21082200 */  addu       $at, $at, $v0
    /* 1EDAC 801589A4 C1842290 */  lbu        $v0, %lo(AllObjects + 0x11)($at)
    /* 1EDB0 801589A8 00000000 */  nop
    /* 1EDB4 801589AC 4F004010 */  beqz       $v0, .L80158AEC
    /* 1EDB8 801589B0 21A08000 */   addu      $s4, $a0, $zero
    /* 1EDBC 801589B4 21804002 */  addu       $s0, $s2, $zero
    /* 1EDC0 801589B8 21886002 */  addu       $s1, $s3, $zero
    /* 1EDC4 801589BC C9F6000C */  jal        ENG_random__Fl
    /* 1EDC8 801589C0 02000424 */   addiu     $a0, $zero, 0x2
    /* 1EDCC 801589C4 14004014 */  bnez       $v0, .L80158A18
    /* 1EDD0 801589C8 21200002 */   addu      $a0, $s0, $zero
    /* 1EDD4 801589CC FFFF5026 */  addiu      $s0, $s2, -0x1
  .L801589D0:
    /* 1EDD8 801589D0 21200002 */  addu       $a0, $s0, $zero
    /* 1EDDC 801589D4 380B020C */  jal        GetSOLID__Fii
    /* 1EDE0 801589D8 21282002 */   addu      $a1, $s1, $zero
    /* 1EDE4 801589DC 01004238 */  xori       $v0, $v0, 0x1
    /* 1EDE8 801589E0 03004010 */  beqz       $v0, .L801589F0
    /* 1EDEC 801589E4 21200002 */   addu      $a0, $s0, $zero
    /* 1EDF0 801589E8 74620508 */  j          .L801589D0
    /* 1EDF4 801589EC FFFF1026 */   addiu     $s0, $s0, -0x1
  .L801589F0:
    /* 1EDF8 801589F0 A261050C */  jal        WallTrapLocOk__Fii
    /* 1EDFC 801589F4 21282002 */   addu      $a1, $s1, $zero
    /* 1EE00 801589F8 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1EE04 801589FC 3B004010 */  beqz       $v0, .L80158AEC
    /* 1EE08 80158A00 23105002 */   subu      $v0, $s2, $s0
    /* 1EE0C 80158A04 02004228 */  slti       $v0, $v0, 0x2
    /* 1EE10 80158A08 38004014 */  bnez       $v0, .L80158AEC
    /* 1EE14 80158A0C 35000424 */   addiu     $a0, $zero, 0x35
    /* 1EE18 80158A10 97620508 */  j          .L80158A5C
    /* 1EE1C 80158A14 21280002 */   addu      $a1, $s0, $zero
  .L80158A18:
    /* 1EE20 80158A18 FFFF7126 */  addiu      $s1, $s3, -0x1
  .L80158A1C:
    /* 1EE24 80158A1C 380B020C */  jal        GetSOLID__Fii
    /* 1EE28 80158A20 21282002 */   addu      $a1, $s1, $zero
    /* 1EE2C 80158A24 01004238 */  xori       $v0, $v0, 0x1
    /* 1EE30 80158A28 03004010 */  beqz       $v0, .L80158A38
    /* 1EE34 80158A2C 21200002 */   addu      $a0, $s0, $zero
    /* 1EE38 80158A30 87620508 */  j          .L80158A1C
    /* 1EE3C 80158A34 FFFF3126 */   addiu     $s1, $s1, -0x1
  .L80158A38:
    /* 1EE40 80158A38 A261050C */  jal        WallTrapLocOk__Fii
    /* 1EE44 80158A3C 21282002 */   addu      $a1, $s1, $zero
    /* 1EE48 80158A40 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1EE4C 80158A44 29004010 */  beqz       $v0, .L80158AEC
    /* 1EE50 80158A48 23107102 */   subu      $v0, $s3, $s1
    /* 1EE54 80158A4C 02004228 */  slti       $v0, $v0, 0x2
    /* 1EE58 80158A50 26004014 */  bnez       $v0, .L80158AEC
    /* 1EE5C 80158A54 36000424 */   addiu     $a0, $zero, 0x36
    /* 1EE60 80158A58 21280002 */  addu       $a1, $s0, $zero
  .L80158A5C:
    /* 1EE64 80158A5C BE4E010C */  jal        AddObject__Fiii
    /* 1EE68 80158A60 21302002 */   addu      $a2, $s1, $zero
    /* 1EE6C 80158A64 C0181100 */  sll        $v1, $s1, 3
    /* 1EE70 80158A68 C0101000 */  sll        $v0, $s0, 3
    /* 1EE74 80158A6C 23105000 */  subu       $v0, $v0, $s0
    /* 1EE78 80158A70 C0110200 */  sll        $v0, $v0, 7
    /* 1EE7C 80158A74 21186200 */  addu       $v1, $v1, $v0
    /* 1EE80 80158A78 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 1EE84 80158A7C 21082300 */  addu       $at, $at, $v1
    /* 1EE88 80158A80 2B7A2390 */  lbu        $v1, %lo(dung_map + 0x3)($at)
    /* 1EE8C 80158A84 00000000 */  nop
    /* 1EE90 80158A88 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 1EE94 80158A8C 001E0300 */  sll        $v1, $v1, 24
    /* 1EE98 80158A90 031E0300 */  sra        $v1, $v1, 24
    /* 1EE9C 80158A94 40100300 */  sll        $v0, $v1, 1
    /* 1EEA0 80158A98 21104300 */  addu       $v0, $v0, $v1
    /* 1EEA4 80158A9C 80100200 */  sll        $v0, $v0, 2
    /* 1EEA8 80158AA0 23104300 */  subu       $v0, $v0, $v1
    /* 1EEAC 80158AA4 80100200 */  sll        $v0, $v0, 2
    /* 1EEB0 80158AA8 001E1400 */  sll        $v1, $s4, 24
    /* 1EEB4 80158AAC 031E0300 */  sra        $v1, $v1, 24
    /* 1EEB8 80158AB0 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 1EEBC 80158AB4 21082200 */  addu       $at, $at, $v0
    /* 1EEC0 80158AB8 5A8C32A4 */  sh         $s2, %lo(object + 0xE)($at)
    /* 1EEC4 80158ABC 0E80013C */  lui        $at, %hi(object + 0x10)
    /* 1EEC8 80158AC0 21082200 */  addu       $at, $at, $v0
    /* 1EECC 80158AC4 5C8C33A4 */  sh         $s3, %lo(object + 0x10)($at)
    /* 1EED0 80158AC8 40100300 */  sll        $v0, $v1, 1
    /* 1EED4 80158ACC 21104300 */  addu       $v0, $v0, $v1
    /* 1EED8 80158AD0 80100200 */  sll        $v0, $v0, 2
    /* 1EEDC 80158AD4 23104300 */  subu       $v0, $v0, $v1
    /* 1EEE0 80158AD8 80100200 */  sll        $v0, $v0, 2
    /* 1EEE4 80158ADC 01000324 */  addiu      $v1, $zero, 0x1
    /* 1EEE8 80158AE0 0E80013C */  lui        $at, %hi(object + 0x2A)
    /* 1EEEC 80158AE4 21082200 */  addu       $at, $at, $v0
    /* 1EEF0 80158AE8 768C23A0 */  sb         $v1, %lo(object + 0x2A)($at)
  .L80158AEC:
    /* 1EEF4 80158AEC 01005226 */  addiu      $s2, $s2, 0x1
    /* 1EEF8 80158AF0 6000422A */  slti       $v0, $s2, 0x60
    /* 1EEFC 80158AF4 87FF4014 */  bnez       $v0, .L80158914
    /* 1EF00 80158AF8 C0101300 */   sll       $v0, $s3, 3
    /* 1EF04 80158AFC 01007326 */  addiu      $s3, $s3, 0x1
    /* 1EF08 80158B00 6000622A */  slti       $v0, $s3, 0x60
    /* 1EF0C 80158B04 82FF4014 */  bnez       $v0, .L80158910
    /* 1EF10 80158B08 21900000 */   addu      $s2, $zero, $zero
    /* 1EF14 80158B0C 2800BF8F */  lw         $ra, 0x28($sp)
    /* 1EF18 80158B10 2400B58F */  lw         $s5, 0x24($sp)
    /* 1EF1C 80158B14 2000B48F */  lw         $s4, 0x20($sp)
    /* 1EF20 80158B18 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 1EF24 80158B1C 1800B28F */  lw         $s2, 0x18($sp)
    /* 1EF28 80158B20 1400B18F */  lw         $s1, 0x14($sp)
    /* 1EF2C 80158B24 1000B08F */  lw         $s0, 0x10($sp)
    /* 1EF30 80158B28 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 1EF34 80158B2C 0800E003 */  jr         $ra
    /* 1EF38 80158B30 00000000 */   nop
endlabel AddObjTraps__Fv
