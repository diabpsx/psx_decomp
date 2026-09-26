.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L5FTVR__Fiiiii, 0x488

glabel DRLG_L5FTVR__Fiiiii
    /* 60EC 8013FCE4 B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 60F0 8013FCE8 2400B1AF */  sw         $s1, 0x24($sp)
    /* 60F4 8013FCEC 3C00B7AF */  sw         $s7, 0x3C($sp)
    /* 60F8 8013FCF0 21B8A000 */  addu       $s7, $a1, $zero
    /* 60FC 8013FCF4 2000B0AF */  sw         $s0, 0x20($sp)
    /* 6100 8013FCF8 2180C000 */  addu       $s0, $a2, $zero
    /* 6104 8013FCFC 4000BEAF */  sw         $fp, 0x40($sp)
    /* 6108 8013FD00 21F0E000 */  addu       $fp, $a3, $zero
    /* 610C 8013FD04 C0481E00 */  sll        $t1, $fp, 3
    /* 6110 8013FD08 C0101000 */  sll        $v0, $s0, 3
    /* 6114 8013FD0C 23105000 */  subu       $v0, $v0, $s0
    /* 6118 8013FD10 C0510200 */  sll        $t2, $v0, 7
    /* 611C 8013FD14 21402A01 */  addu       $t0, $t1, $t2
    /* 6120 8013FD18 4400BFAF */  sw         $ra, 0x44($sp)
    /* 6124 8013FD1C 3800B6AF */  sw         $s6, 0x38($sp)
    /* 6128 8013FD20 3400B5AF */  sw         $s5, 0x34($sp)
    /* 612C 8013FD24 3000B4AF */  sw         $s4, 0x30($sp)
    /* 6130 8013FD28 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 6134 8013FD2C 2800B2AF */  sw         $s2, 0x28($sp)
    /* 6138 8013FD30 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 613C 8013FD34 21082800 */  addu       $at, $at, $t0
    /* 6140 8013FD38 2F7A2280 */  lb         $v0, %lo(dung_map + 0x7)($at)
    /* 6144 8013FD3C 5800A58F */  lw         $a1, 0x58($sp)
    /* 6148 8013FD40 6C004014 */  bnez       $v0, .L8013FEF4
    /* 614C 8013FD44 21888000 */   addu      $s1, $a0, $zero
    /* 6150 8013FD48 0E80033C */  lui        $v1, %hi(dungeon)
    /* 6154 8013FD4C C4406324 */  addiu      $v1, $v1, %lo(dungeon)
    /* 6158 8013FD50 40101100 */  sll        $v0, $s1, 1
    /* 615C 8013FD54 21105100 */  addu       $v0, $v0, $s1
    /* 6160 8013FD58 40110200 */  sll        $v0, $v0, 5
    /* 6164 8013FD5C 21104300 */  addu       $v0, $v0, $v1
    /* 6168 8013FD60 40181700 */  sll        $v1, $s7, 1
    /* 616C 8013FD64 21186200 */  addu       $v1, $v1, $v0
    /* 6170 8013FD68 00006394 */  lhu        $v1, 0x0($v1)
    /* 6174 8013FD6C 0D000224 */  addiu      $v0, $zero, 0xD
    /* 6178 8013FD70 61006214 */  bne        $v1, $v0, .L8013FEF8
    /* 617C 8013FD74 01000224 */   addiu     $v0, $zero, 0x1
    /* 6180 8013FD78 01002B26 */  addiu      $t3, $s1, 0x1
    /* 6184 8013FD7C 2128E002 */  addu       $a1, $s7, $zero
    /* 6188 8013FD80 02001626 */  addiu      $s6, $s0, 0x2
    /* 618C 8013FD84 2130C002 */  addu       $a2, $s6, $zero
    /* 6190 8013FD88 1800ABAF */  sw         $t3, 0x18($sp)
    /* 6194 8013FD8C 1800A48F */  lw         $a0, 0x18($sp)
    /* 6198 8013FD90 1280023C */  lui        $v0, %hi(TransVal)
    /* 619C 8013FD94 48C14290 */  lbu        $v0, %lo(TransVal)($v0)
    /* 61A0 8013FD98 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 61A4 8013FD9C 21082800 */  addu       $at, $at, $t0
    /* 61A8 8013FDA0 2F7A22A0 */  sb         $v0, %lo(dung_map + 0x7)($at)
    /* 61AC 8013FDA4 01000226 */  addiu      $v0, $s0, 0x1
    /* 61B0 8013FDA8 C0400200 */  sll        $t0, $v0, 3
    /* 61B4 8013FDAC 23400201 */  subu       $t0, $t0, $v0
    /* 61B8 8013FDB0 C0410800 */  sll        $t0, $t0, 7
    /* 61BC 8013FDB4 1280033C */  lui        $v1, %hi(TransVal)
    /* 61C0 8013FDB8 48C16390 */  lbu        $v1, %lo(TransVal)($v1)
    /* 61C4 8013FDBC 21102801 */  addu       $v0, $t1, $t0
    /* 61C8 8013FDC0 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 61CC 8013FDC4 21082200 */  addu       $at, $at, $v0
    /* 61D0 8013FDC8 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* 61D4 8013FDCC 0100C227 */  addiu      $v0, $fp, 0x1
    /* 61D8 8013FDD0 C0100200 */  sll        $v0, $v0, 3
    /* 61DC 8013FDD4 1280093C */  lui        $t1, %hi(TransVal)
    /* 61E0 8013FDD8 48C12991 */  lbu        $t1, %lo(TransVal)($t1)
    /* 61E4 8013FDDC 21184A00 */  addu       $v1, $v0, $t2
    /* 61E8 8013FDE0 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 61EC 8013FDE4 21082300 */  addu       $at, $at, $v1
    /* 61F0 8013FDE8 2F7A29A0 */  sb         $t1, %lo(dung_map + 0x7)($at)
    /* 61F4 8013FDEC 1280033C */  lui        $v1, %hi(TransVal)
    /* 61F8 8013FDF0 48C16390 */  lbu        $v1, %lo(TransVal)($v1)
    /* 61FC 8013FDF4 21104800 */  addu       $v0, $v0, $t0
    /* 6200 8013FDF8 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 6204 8013FDFC 21082200 */  addu       $at, $at, $v0
    /* 6208 8013FE00 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* 620C 8013FE04 01000224 */  addiu      $v0, $zero, 0x1
    /* 6210 8013FE08 39FF040C */  jal        DRLG_L5FTVR__Fiiiii
    /* 6214 8013FE0C 1000A2AF */   sw        $v0, 0x10($sp)
    /* 6218 8013FE10 FFFF3526 */  addiu      $s5, $s1, -0x1
    /* 621C 8013FE14 2120A002 */  addu       $a0, $s5, $zero
    /* 6220 8013FE18 2128E002 */  addu       $a1, $s7, $zero
    /* 6224 8013FE1C FEFF1426 */  addiu      $s4, $s0, -0x2
    /* 6228 8013FE20 21308002 */  addu       $a2, $s4, $zero
    /* 622C 8013FE24 2138C003 */  addu       $a3, $fp, $zero
    /* 6230 8013FE28 02000224 */  addiu      $v0, $zero, 0x2
    /* 6234 8013FE2C 39FF040C */  jal        DRLG_L5FTVR__Fiiiii
    /* 6238 8013FE30 1000A2AF */   sw        $v0, 0x10($sp)
    /* 623C 8013FE34 21202002 */  addu       $a0, $s1, $zero
    /* 6240 8013FE38 0100F326 */  addiu      $s3, $s7, 0x1
    /* 6244 8013FE3C 21286002 */  addu       $a1, $s3, $zero
    /* 6248 8013FE40 21300002 */  addu       $a2, $s0, $zero
    /* 624C 8013FE44 0200D227 */  addiu      $s2, $fp, 0x2
    /* 6250 8013FE48 21384002 */  addu       $a3, $s2, $zero
    /* 6254 8013FE4C 03000224 */  addiu      $v0, $zero, 0x3
    /* 6258 8013FE50 39FF040C */  jal        DRLG_L5FTVR__Fiiiii
    /* 625C 8013FE54 1000A2AF */   sw        $v0, 0x10($sp)
    /* 6260 8013FE58 21202002 */  addu       $a0, $s1, $zero
    /* 6264 8013FE5C FFFFF126 */  addiu      $s1, $s7, -0x1
    /* 6268 8013FE60 21282002 */  addu       $a1, $s1, $zero
    /* 626C 8013FE64 21300002 */  addu       $a2, $s0, $zero
    /* 6270 8013FE68 FEFFD027 */  addiu      $s0, $fp, -0x2
    /* 6274 8013FE6C 21380002 */  addu       $a3, $s0, $zero
    /* 6278 8013FE70 04000224 */  addiu      $v0, $zero, 0x4
    /* 627C 8013FE74 39FF040C */  jal        DRLG_L5FTVR__Fiiiii
    /* 6280 8013FE78 1000A2AF */   sw        $v0, 0x10($sp)
    /* 6284 8013FE7C 2120A002 */  addu       $a0, $s5, $zero
    /* 6288 8013FE80 21282002 */  addu       $a1, $s1, $zero
    /* 628C 8013FE84 21308002 */  addu       $a2, $s4, $zero
    /* 6290 8013FE88 21380002 */  addu       $a3, $s0, $zero
    /* 6294 8013FE8C 05000224 */  addiu      $v0, $zero, 0x5
    /* 6298 8013FE90 39FF040C */  jal        DRLG_L5FTVR__Fiiiii
    /* 629C 8013FE94 1000A2AF */   sw        $v0, 0x10($sp)
    /* 62A0 8013FE98 21282002 */  addu       $a1, $s1, $zero
    /* 62A4 8013FE9C 2130C002 */  addu       $a2, $s6, $zero
    /* 62A8 8013FEA0 21380002 */  addu       $a3, $s0, $zero
    /* 62AC 8013FEA4 1800A48F */  lw         $a0, 0x18($sp)
    /* 62B0 8013FEA8 06000224 */  addiu      $v0, $zero, 0x6
    /* 62B4 8013FEAC 39FF040C */  jal        DRLG_L5FTVR__Fiiiii
    /* 62B8 8013FEB0 1000A2AF */   sw        $v0, 0x10($sp)
    /* 62BC 8013FEB4 2120A002 */  addu       $a0, $s5, $zero
    /* 62C0 8013FEB8 21286002 */  addu       $a1, $s3, $zero
    /* 62C4 8013FEBC 21308002 */  addu       $a2, $s4, $zero
    /* 62C8 8013FEC0 21384002 */  addu       $a3, $s2, $zero
    /* 62CC 8013FEC4 07000224 */  addiu      $v0, $zero, 0x7
    /* 62D0 8013FEC8 39FF040C */  jal        DRLG_L5FTVR__Fiiiii
    /* 62D4 8013FECC 1000A2AF */   sw        $v0, 0x10($sp)
    /* 62D8 8013FED0 21286002 */  addu       $a1, $s3, $zero
    /* 62DC 8013FED4 2130C002 */  addu       $a2, $s6, $zero
    /* 62E0 8013FED8 21384002 */  addu       $a3, $s2, $zero
    /* 62E4 8013FEDC 1800A48F */  lw         $a0, 0x18($sp)
    /* 62E8 8013FEE0 08000224 */  addiu      $v0, $zero, 0x8
    /* 62EC 8013FEE4 39FF040C */  jal        DRLG_L5FTVR__Fiiiii
    /* 62F0 8013FEE8 1000A2AF */   sw        $v0, 0x10($sp)
    /* 62F4 8013FEEC 4E000508 */  j          .L80140138
    /* 62F8 8013FEF0 00000000 */   nop
  .L8013FEF4:
    /* 62FC 8013FEF4 01000224 */  addiu      $v0, $zero, 0x1
  .L8013FEF8:
    /* 6300 8013FEF8 1400A214 */  bne        $a1, $v0, .L8013FF4C
    /* 6304 8013FEFC 02000224 */   addiu     $v0, $zero, 0x2
    /* 6308 8013FF00 C0101E00 */  sll        $v0, $fp, 3
    /* 630C 8013FF04 C0181000 */  sll        $v1, $s0, 3
    /* 6310 8013FF08 23187000 */  subu       $v1, $v1, $s0
    /* 6314 8013FF0C C0190300 */  sll        $v1, $v1, 7
    /* 6318 8013FF10 1280043C */  lui        $a0, %hi(TransVal)
    /* 631C 8013FF14 48C18490 */  lbu        $a0, %lo(TransVal)($a0)
    /* 6320 8013FF18 21104300 */  addu       $v0, $v0, $v1
    /* 6324 8013FF1C 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 6328 8013FF20 21082200 */  addu       $at, $at, $v0
    /* 632C 8013FF24 2F7A24A0 */  sb         $a0, %lo(dung_map + 0x7)($at)
    /* 6330 8013FF28 0100C227 */  addiu      $v0, $fp, 0x1
    /* 6334 8013FF2C C0100200 */  sll        $v0, $v0, 3
    /* 6338 8013FF30 1280043C */  lui        $a0, %hi(TransVal)
    /* 633C 8013FF34 48C18490 */  lbu        $a0, %lo(TransVal)($a0)
    /* 6340 8013FF38 21104300 */  addu       $v0, $v0, $v1
    /* 6344 8013FF3C 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 6348 8013FF40 21082200 */  addu       $at, $at, $v0
    /* 634C 8013FF44 2F7A24A0 */  sb         $a0, %lo(dung_map + 0x7)($at)
    /* 6350 8013FF48 02000224 */  addiu      $v0, $zero, 0x2
  .L8013FF4C:
    /* 6354 8013FF4C 1500A214 */  bne        $a1, $v0, .L8013FFA4
    /* 6358 8013FF50 03000224 */   addiu     $v0, $zero, 0x3
    /* 635C 8013FF54 C0201E00 */  sll        $a0, $fp, 3
    /* 6360 8013FF58 01000226 */  addiu      $v0, $s0, 0x1
    /* 6364 8013FF5C C0180200 */  sll        $v1, $v0, 3
    /* 6368 8013FF60 23186200 */  subu       $v1, $v1, $v0
    /* 636C 8013FF64 C0190300 */  sll        $v1, $v1, 7
    /* 6370 8013FF68 1280023C */  lui        $v0, %hi(TransVal)
    /* 6374 8013FF6C 48C14290 */  lbu        $v0, %lo(TransVal)($v0)
    /* 6378 8013FF70 21208300 */  addu       $a0, $a0, $v1
    /* 637C 8013FF74 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 6380 8013FF78 21082400 */  addu       $at, $at, $a0
    /* 6384 8013FF7C 2F7A22A0 */  sb         $v0, %lo(dung_map + 0x7)($at)
    /* 6388 8013FF80 0100C227 */  addiu      $v0, $fp, 0x1
    /* 638C 8013FF84 C0100200 */  sll        $v0, $v0, 3
    /* 6390 8013FF88 1280043C */  lui        $a0, %hi(TransVal)
    /* 6394 8013FF8C 48C18490 */  lbu        $a0, %lo(TransVal)($a0)
    /* 6398 8013FF90 21104300 */  addu       $v0, $v0, $v1
    /* 639C 8013FF94 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 63A0 8013FF98 21082200 */  addu       $at, $at, $v0
    /* 63A4 8013FF9C 2F7A24A0 */  sb         $a0, %lo(dung_map + 0x7)($at)
    /* 63A8 8013FFA0 03000224 */  addiu      $v0, $zero, 0x3
  .L8013FFA4:
    /* 63AC 8013FFA4 1600A214 */  bne        $a1, $v0, .L80140000
    /* 63B0 8013FFA8 04000224 */   addiu     $v0, $zero, 0x4
    /* 63B4 8013FFAC C0201E00 */  sll        $a0, $fp, 3
    /* 63B8 8013FFB0 C0101000 */  sll        $v0, $s0, 3
    /* 63BC 8013FFB4 23105000 */  subu       $v0, $v0, $s0
    /* 63C0 8013FFB8 C0110200 */  sll        $v0, $v0, 7
    /* 63C4 8013FFBC 1280033C */  lui        $v1, %hi(TransVal)
    /* 63C8 8013FFC0 48C16390 */  lbu        $v1, %lo(TransVal)($v1)
    /* 63CC 8013FFC4 21108200 */  addu       $v0, $a0, $v0
    /* 63D0 8013FFC8 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 63D4 8013FFCC 21082200 */  addu       $at, $at, $v0
    /* 63D8 8013FFD0 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* 63DC 8013FFD4 01000326 */  addiu      $v1, $s0, 0x1
    /* 63E0 8013FFD8 C0100300 */  sll        $v0, $v1, 3
    /* 63E4 8013FFDC 23104300 */  subu       $v0, $v0, $v1
    /* 63E8 8013FFE0 C0110200 */  sll        $v0, $v0, 7
    /* 63EC 8013FFE4 1280033C */  lui        $v1, %hi(TransVal)
    /* 63F0 8013FFE8 48C16390 */  lbu        $v1, %lo(TransVal)($v1)
    /* 63F4 8013FFEC 21208200 */  addu       $a0, $a0, $v0
    /* 63F8 8013FFF0 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 63FC 8013FFF4 21082400 */  addu       $at, $at, $a0
    /* 6400 8013FFF8 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* 6404 8013FFFC 04000224 */  addiu      $v0, $zero, 0x4
  .L80140000:
    /* 6408 80140000 1700A214 */  bne        $a1, $v0, .L80140060
    /* 640C 80140004 05000224 */   addiu     $v0, $zero, 0x5
    /* 6410 80140008 0100C427 */  addiu      $a0, $fp, 0x1
    /* 6414 8014000C C0200400 */  sll        $a0, $a0, 3
    /* 6418 80140010 C0101000 */  sll        $v0, $s0, 3
    /* 641C 80140014 23105000 */  subu       $v0, $v0, $s0
    /* 6420 80140018 C0110200 */  sll        $v0, $v0, 7
    /* 6424 8014001C 1280033C */  lui        $v1, %hi(TransVal)
    /* 6428 80140020 48C16390 */  lbu        $v1, %lo(TransVal)($v1)
    /* 642C 80140024 21108200 */  addu       $v0, $a0, $v0
    /* 6430 80140028 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 6434 8014002C 21082200 */  addu       $at, $at, $v0
    /* 6438 80140030 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* 643C 80140034 01000326 */  addiu      $v1, $s0, 0x1
    /* 6440 80140038 C0100300 */  sll        $v0, $v1, 3
    /* 6444 8014003C 23104300 */  subu       $v0, $v0, $v1
    /* 6448 80140040 C0110200 */  sll        $v0, $v0, 7
    /* 644C 80140044 1280033C */  lui        $v1, %hi(TransVal)
    /* 6450 80140048 48C16390 */  lbu        $v1, %lo(TransVal)($v1)
    /* 6454 8014004C 21208200 */  addu       $a0, $a0, $v0
    /* 6458 80140050 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 645C 80140054 21082400 */  addu       $at, $at, $a0
    /* 6460 80140058 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* 6464 8014005C 05000224 */  addiu      $v0, $zero, 0x5
  .L80140060:
    /* 6468 80140060 0E00A214 */  bne        $a1, $v0, .L8014009C
    /* 646C 80140064 06000224 */   addiu     $v0, $zero, 0x6
    /* 6470 80140068 0100C327 */  addiu      $v1, $fp, 0x1
    /* 6474 8014006C C0180300 */  sll        $v1, $v1, 3
    /* 6478 80140070 01000426 */  addiu      $a0, $s0, 0x1
    /* 647C 80140074 C0100400 */  sll        $v0, $a0, 3
    /* 6480 80140078 23104400 */  subu       $v0, $v0, $a0
    /* 6484 8014007C C0110200 */  sll        $v0, $v0, 7
    /* 6488 80140080 1280043C */  lui        $a0, %hi(TransVal)
    /* 648C 80140084 48C18490 */  lbu        $a0, %lo(TransVal)($a0)
    /* 6490 80140088 21186200 */  addu       $v1, $v1, $v0
    /* 6494 8014008C 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 6498 80140090 21082300 */  addu       $at, $at, $v1
    /* 649C 80140094 2F7A24A0 */  sb         $a0, %lo(dung_map + 0x7)($at)
    /* 64A0 80140098 06000224 */  addiu      $v0, $zero, 0x6
  .L8014009C:
    /* 64A4 8014009C 0D00A214 */  bne        $a1, $v0, .L801400D4
    /* 64A8 801400A0 07000224 */   addiu     $v0, $zero, 0x7
    /* 64AC 801400A4 0100C227 */  addiu      $v0, $fp, 0x1
    /* 64B0 801400A8 C0100200 */  sll        $v0, $v0, 3
    /* 64B4 801400AC C0181000 */  sll        $v1, $s0, 3
    /* 64B8 801400B0 23187000 */  subu       $v1, $v1, $s0
    /* 64BC 801400B4 C0190300 */  sll        $v1, $v1, 7
    /* 64C0 801400B8 1280043C */  lui        $a0, %hi(TransVal)
    /* 64C4 801400BC 48C18490 */  lbu        $a0, %lo(TransVal)($a0)
    /* 64C8 801400C0 21104300 */  addu       $v0, $v0, $v1
    /* 64CC 801400C4 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 64D0 801400C8 21082200 */  addu       $at, $at, $v0
    /* 64D4 801400CC 2F7A24A0 */  sb         $a0, %lo(dung_map + 0x7)($at)
    /* 64D8 801400D0 07000224 */  addiu      $v0, $zero, 0x7
  .L801400D4:
    /* 64DC 801400D4 0D00A214 */  bne        $a1, $v0, .L8014010C
    /* 64E0 801400D8 08000224 */   addiu     $v0, $zero, 0x8
    /* 64E4 801400DC C0201E00 */  sll        $a0, $fp, 3
    /* 64E8 801400E0 01000326 */  addiu      $v1, $s0, 0x1
    /* 64EC 801400E4 C0100300 */  sll        $v0, $v1, 3
    /* 64F0 801400E8 23104300 */  subu       $v0, $v0, $v1
    /* 64F4 801400EC C0110200 */  sll        $v0, $v0, 7
    /* 64F8 801400F0 1280033C */  lui        $v1, %hi(TransVal)
    /* 64FC 801400F4 48C16390 */  lbu        $v1, %lo(TransVal)($v1)
    /* 6500 801400F8 21208200 */  addu       $a0, $a0, $v0
    /* 6504 801400FC 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 6508 80140100 21082400 */  addu       $at, $at, $a0
    /* 650C 80140104 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* 6510 80140108 08000224 */  addiu      $v0, $zero, 0x8
  .L8014010C:
    /* 6514 8014010C 0A00A214 */  bne        $a1, $v0, .L80140138
    /* 6518 80140110 C0101E00 */   sll       $v0, $fp, 3
    /* 651C 80140114 C0181000 */  sll        $v1, $s0, 3
    /* 6520 80140118 23187000 */  subu       $v1, $v1, $s0
    /* 6524 8014011C C0190300 */  sll        $v1, $v1, 7
    /* 6528 80140120 1280043C */  lui        $a0, %hi(TransVal)
    /* 652C 80140124 48C18490 */  lbu        $a0, %lo(TransVal)($a0)
    /* 6530 80140128 21104300 */  addu       $v0, $v0, $v1
    /* 6534 8014012C 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 6538 80140130 21082200 */  addu       $at, $at, $v0
    /* 653C 80140134 2F7A24A0 */  sb         $a0, %lo(dung_map + 0x7)($at)
  .L80140138:
    /* 6540 80140138 4400BF8F */  lw         $ra, 0x44($sp)
    /* 6544 8014013C 4000BE8F */  lw         $fp, 0x40($sp)
    /* 6548 80140140 3C00B78F */  lw         $s7, 0x3C($sp)
    /* 654C 80140144 3800B68F */  lw         $s6, 0x38($sp)
    /* 6550 80140148 3400B58F */  lw         $s5, 0x34($sp)
    /* 6554 8014014C 3000B48F */  lw         $s4, 0x30($sp)
    /* 6558 80140150 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 655C 80140154 2800B28F */  lw         $s2, 0x28($sp)
    /* 6560 80140158 2400B18F */  lw         $s1, 0x24($sp)
    /* 6564 8014015C 2000B08F */  lw         $s0, 0x20($sp)
    /* 6568 80140160 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 656C 80140164 0800E003 */  jr         $ra
    /* 6570 80140168 00000000 */   nop
endlabel DRLG_L5FTVR__Fiiiii
