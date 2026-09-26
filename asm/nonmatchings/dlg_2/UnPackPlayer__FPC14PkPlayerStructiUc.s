.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching UnPackPlayer__FPC14PkPlayerStructiUc, 0x2CC

glabel UnPackPlayer__FPC14PkPlayerStructiUc
    /* 213C0 8015AFB8 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 213C4 8015AFBC 2000B4AF */  sw         $s4, 0x20($sp)
    /* 213C8 8015AFC0 21A08000 */  addu       $s4, $a0, $zero
    /* 213CC 8015AFC4 2400B5AF */  sw         $s5, 0x24($sp)
    /* 213D0 8015AFC8 21A8A000 */  addu       $s5, $a1, $zero
    /* 213D4 8015AFCC 2120A002 */  addu       $a0, $s5, $zero
    /* 213D8 8015AFD0 40101500 */  sll        $v0, $s5, 1
    /* 213DC 8015AFD4 21105500 */  addu       $v0, $v0, $s5
    /* 213E0 8015AFD8 80100200 */  sll        $v0, $v0, 2
    /* 213E4 8015AFDC 21105500 */  addu       $v0, $v0, $s5
    /* 213E8 8015AFE0 00110200 */  sll        $v0, $v0, 4
    /* 213EC 8015AFE4 23105500 */  subu       $v0, $v0, $s5
    /* 213F0 8015AFE8 80100200 */  sll        $v0, $v0, 2
    /* 213F4 8015AFEC 21105500 */  addu       $v0, $v0, $s5
    /* 213F8 8015AFF0 C0100200 */  sll        $v0, $v0, 3
    /* 213FC 8015AFF4 E8048592 */  lbu        $a1, 0x4E8($s4)
    /* 21400 8015AFF8 0E80033C */  lui        $v1, %hi(plr)
    /* 21404 8015AFFC 38A56324 */  addiu      $v1, $v1, %lo(plr)
    /* 21408 8015B000 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 2140C 8015B004 21984300 */  addu       $s3, $v0, $v1
    /* 21410 8015B008 1000B0AF */  sw         $s0, 0x10($sp)
    /* 21414 8015B00C 2180C000 */  addu       $s0, $a2, $zero
    /* 21418 8015B010 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 2141C 8015B014 2800B6AF */  sw         $s6, 0x28($sp)
    /* 21420 8015B018 1800B2AF */  sw         $s2, 0x18($sp)
    /* 21424 8015B01C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 21428 8015B020 959C010C */  jal        ClrPlrPath__Fi
    /* 2142C 8015B024 240065AE */   sw        $a1, 0x24($s3)
    /* 21430 8015B028 D6006426 */  addiu      $a0, $s3, 0xD6
    /* 21434 8015B02C 78048526 */  addiu      $a1, $s4, 0x478
    /* 21438 8015B030 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 2143C 8015B034 F240000C */  jal        strcpy
    /* 21440 8015B038 1E0062A2 */   sb        $v0, 0x1E($s3)
    /* 21444 8015B03C 2120A002 */  addu       $a0, $s5, $zero
    /* 21448 8015B040 E9048292 */  lbu        $v0, 0x4E9($s4)
    /* 2144C 8015B044 01000524 */  addiu      $a1, $zero, 0x1
    /* 21450 8015B048 FC9B010C */  jal        InitPlayer__FiUc
    /* 21454 8015B04C F60062A2 */   sb        $v0, 0xF6($s3)
    /* 21458 8015B050 EE048292 */  lbu        $v0, 0x4EE($s4)
    /* 2145C 8015B054 EB048492 */  lbu        $a0, 0x4EB($s4)
    /* 21460 8015B058 EC048592 */  lbu        $a1, 0x4EC($s4)
    /* 21464 8015B05C ED048692 */  lbu        $a2, 0x4ED($s4)
    /* 21468 8015B060 EF048792 */  lbu        $a3, 0x4EF($s4)
    /* 2146C 8015B064 F0048892 */  lbu        $t0, 0x4F0($s4)
    /* 21470 8015B068 6004898E */  lw         $t1, 0x460($s4)
    /* 21474 8015B06C 3C0162A2 */  sb         $v0, 0x13C($s3)
    /* 21478 8015B070 EA048292 */  lbu        $v0, 0x4EA($s4)
    /* 2147C 8015B074 3C016382 */  lb         $v1, 0x13C($s3)
    /* 21480 8015B078 FE0064A6 */  sh         $a0, 0xFE($s3)
    /* 21484 8015B07C FC0064A6 */  sh         $a0, 0xFC($s3)
    /* 21488 8015B080 6404848E */  lw         $a0, 0x464($s4)
    /* 2148C 8015B084 020165A6 */  sh         $a1, 0x102($s3)
    /* 21490 8015B088 000165A6 */  sh         $a1, 0x100($s3)
    /* 21494 8015B08C 060166A6 */  sh         $a2, 0x106($s3)
    /* 21498 8015B090 040166A6 */  sh         $a2, 0x104($s3)
    /* 2149C 8015B094 080167AE */  sw         $a3, 0x108($s3)
    /* 214A0 8015B098 5A0068A2 */  sb         $t0, 0x5A($s3)
    /* 214A4 8015B09C 400169AE */  sw         $t1, 0x140($s3)
    /* 214A8 8015B0A0 80180300 */  sll        $v1, $v1, 2
    /* 214AC 8015B0A4 FA0062A6 */  sh         $v0, 0xFA($s3)
    /* 214B0 8015B0A8 F80062A6 */  sh         $v0, 0xF8($s3)
    /* 214B4 8015B0AC 6804828E */  lw         $v0, 0x468($s4)
    /* 214B8 8015B0B0 0E80013C */  lui        $at, %hi(ExpLvlsTbl)
    /* 214BC 8015B0B4 21082300 */  addu       $at, $at, $v1
    /* 214C0 8015B0B8 68A4238C */  lw         $v1, %lo(ExpLvlsTbl)($at)
    /* 214C4 8015B0BC FF001032 */  andi       $s0, $s0, 0xFF
    /* 214C8 8015B0C0 140164AE */  sw         $a0, 0x114($s3)
    /* 214CC 8015B0C4 180162AE */  sw         $v0, 0x118($s3)
    /* 214D0 8015B0C8 05000016 */  bnez       $s0, .L8015B0E0
    /* 214D4 8015B0CC 480163AE */   sw        $v1, 0x148($s3)
    /* 214D8 8015B0D0 83110400 */  sra        $v0, $a0, 6
    /* 214DC 8015B0D4 0200401C */  bgtz       $v0, .L8015B0E0
    /* 214E0 8015B0D8 40000224 */   addiu     $v0, $zero, 0x40
    /* 214E4 8015B0DC 140162AE */  sw         $v0, 0x114($s3)
  .L8015B0E0:
    /* 214E8 8015B0E0 7004848E */  lw         $a0, 0x470($s4)
    /* 214EC 8015B0E4 6C04858E */  lw         $a1, 0x46C($s4)
    /* 214F0 8015B0E8 5004828E */  lw         $v0, 0x450($s4)
    /* 214F4 8015B0EC 5404838E */  lw         $v1, 0x454($s4)
    /* 214F8 8015B0F0 7404868E */  lw         $a2, 0x474($s4)
    /* 214FC 8015B0F4 F2048792 */  lbu        $a3, 0x4F2($s4)
    /* 21500 8015B0F8 21800000 */  addu       $s0, $zero, $zero
    /* 21504 8015B0FC 2C0164AE */  sw         $a0, 0x12C($s3)
    /* 21508 8015B100 280165AE */  sw         $a1, 0x128($s3)
    /* 2150C 8015B104 B80062AE */  sw         $v0, 0xB8($s3)
    /* 21510 8015B108 BC0063AE */  sw         $v1, 0xBC($s3)
    /* 21514 8015B10C 640066AE */  sw         $a2, 0x64($s3)
    /* 21518 8015B110 680067A2 */  sb         $a3, 0x68($s3)
    /* 2151C 8015B114 21187002 */  addu       $v1, $s3, $s0
  .L8015B118:
    /* 21520 8015B118 21109002 */  addu       $v0, $s4, $s0
    /* 21524 8015B11C C0044290 */  lbu        $v0, 0x4C0($v0)
    /* 21528 8015B120 01001026 */  addiu      $s0, $s0, 0x1
    /* 2152C 8015B124 710062A0 */  sb         $v0, 0x71($v1)
    /* 21530 8015B128 2500022A */  slti       $v0, $s0, 0x25
    /* 21534 8015B12C FAFF4014 */  bnez       $v0, .L8015B118
    /* 21538 8015B130 21187002 */   addu      $v1, $s3, $s0
    /* 2153C 8015B134 A0009226 */  addiu      $s2, $s4, 0xA0
    /* 21540 8015B138 B0017126 */  addiu      $s1, $s3, 0x1B0
    /* 21544 8015B13C 06001024 */  addiu      $s0, $zero, 0x6
    /* 21548 8015B140 FFFF1624 */  addiu      $s6, $zero, -0x1
  .L8015B144:
    /* 2154C 8015B144 21204002 */  addu       $a0, $s2, $zero
    /* 21550 8015B148 6B6B050C */  jal        UnPackItem__FPC12PkItemStructP10ItemStruct
    /* 21554 8015B14C 21282002 */   addu      $a1, $s1, $zero
    /* 21558 8015B150 14005226 */  addiu      $s2, $s2, 0x14
    /* 2155C 8015B154 FFFF1026 */  addiu      $s0, $s0, -0x1
    /* 21560 8015B158 FAFF1616 */  bne        $s0, $s6, .L8015B144
    /* 21564 8015B15C 6C003126 */   addiu     $s1, $s1, 0x6C
    /* 21568 8015B160 2C019226 */  addiu      $s2, $s4, 0x12C
    /* 2156C 8015B164 A4047126 */  addiu      $s1, $s3, 0x4A4
    /* 21570 8015B168 27001024 */  addiu      $s0, $zero, 0x27
    /* 21574 8015B16C FFFF1624 */  addiu      $s6, $zero, -0x1
  .L8015B170:
    /* 21578 8015B170 21204002 */  addu       $a0, $s2, $zero
    /* 2157C 8015B174 6B6B050C */  jal        UnPackItem__FPC12PkItemStructP10ItemStruct
    /* 21580 8015B178 21282002 */   addu      $a1, $s1, $zero
    /* 21584 8015B17C 14005226 */  addiu      $s2, $s2, 0x14
    /* 21588 8015B180 FFFF1026 */  addiu      $s0, $s0, -0x1
    /* 2158C 8015B184 FAFF1616 */  bne        $s0, $s6, .L8015B170
    /* 21590 8015B188 6C003126 */   addiu     $s1, $s1, 0x6C
    /* 21594 8015B18C 21800000 */  addu       $s0, $zero, $zero
    /* 21598 8015B190 21187002 */  addu       $v1, $s3, $s0
  .L8015B194:
    /* 2159C 8015B194 21109002 */  addu       $v0, $s4, $s0
    /* 215A0 8015B198 98044290 */  lbu        $v0, 0x498($v0)
    /* 215A4 8015B19C 01001026 */  addiu      $s0, $s0, 0x1
    /* 215A8 8015B1A0 881562A0 */  sb         $v0, 0x1588($v1)
    /* 215AC 8015B1A4 2800022A */  slti       $v0, $s0, 0x28
    /* 215B0 8015B1A8 FAFF4014 */  bnez       $v0, .L8015B194
    /* 215B4 8015B1AC 21187002 */   addu      $v1, $s3, $s0
    /* 215B8 8015B1B0 21206002 */  addu       $a0, $s3, $zero
    /* 215BC 8015B1B4 21908002 */  addu       $s2, $s4, $zero
    /* 215C0 8015B1B8 B0157126 */  addiu      $s1, $s3, 0x15B0
    /* 215C4 8015B1BC 07001024 */  addiu      $s0, $zero, 0x7
    /* 215C8 8015B1C0 F1044292 */  lbu        $v0, 0x4F1($s2)
    /* 215CC 8015B1C4 FFFF1424 */  addiu      $s4, $zero, -0x1
    /* 215D0 8015B1C8 B86B050C */  jal        VerifyGoldSeeds__FP12PlayerStruct
    /* 215D4 8015B1CC 841562AE */   sw        $v0, 0x1584($s3)
  .L8015B1D0:
    /* 215D8 8015B1D0 21204002 */  addu       $a0, $s2, $zero
    /* 215DC 8015B1D4 6B6B050C */  jal        UnPackItem__FPC12PkItemStructP10ItemStruct
    /* 215E0 8015B1D8 21282002 */   addu      $a1, $s1, $zero
    /* 215E4 8015B1DC 14005226 */  addiu      $s2, $s2, 0x14
    /* 215E8 8015B1E0 FFFF1026 */  addiu      $s0, $s0, -0x1
    /* 215EC 8015B1E4 FAFF1416 */  bne        $s0, $s4, .L8015B1D0
    /* 215F0 8015B1E8 6C003126 */   addiu     $s1, $s1, 0x6C
    /* 215F4 8015B1EC 1280023C */  lui        $v0, %hi(myplr)
    /* 215F8 8015B1F0 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 215FC 8015B1F4 00000000 */  nop
    /* 21600 8015B1F8 1200A216 */  bne        $s5, $v0, .L8015B244
    /* 21604 8015B1FC 2120A002 */   addu      $a0, $s5, $zero
    /* 21608 8015B200 FFFF0424 */  addiu      $a0, $zero, -0x1
    /* 2160C 8015B204 1280033C */  lui        $v1, %hi(StorePlrNo)
    /* 21610 8015B208 B4BA638C */  lw         $v1, %lo(StorePlrNo)($v1)
    /* 21614 8015B20C 13001024 */  addiu      $s0, $zero, 0x13
    /* 21618 8015B210 00110300 */  sll        $v0, $v1, 4
    /* 2161C 8015B214 21104300 */  addu       $v0, $v0, $v1
    /* 21620 8015B218 C0100200 */  sll        $v0, $v0, 3
    /* 21624 8015B21C 23104300 */  subu       $v0, $v0, $v1
    /* 21628 8015B220 00110200 */  sll        $v0, $v0, 4
    /* 2162C 8015B224 04084224 */  addiu      $v0, $v0, 0x804
  .L8015B228:
    /* 21630 8015B228 0E80013C */  lui        $at, %hi(_witchitem + 0x2C)
    /* 21634 8015B22C 21082200 */  addu       $at, $at, $v0
    /* 21638 8015B230 44FA24A4 */  sh         $a0, %lo(_witchitem + 0x2C)($at)
    /* 2163C 8015B234 FFFF1026 */  addiu      $s0, $s0, -0x1
    /* 21640 8015B238 FBFF0106 */  bgez       $s0, .L8015B228
    /* 21644 8015B23C 94FF4224 */   addiu     $v0, $v0, -0x6C
    /* 21648 8015B240 2120A002 */  addu       $a0, $s5, $zero
  .L8015B244:
    /* 2164C 8015B244 C6FE000C */  jal        CalcPlrInv__FiUc
    /* 21650 8015B248 21280000 */   addu      $a1, $zero, $zero
    /* 21654 8015B24C E01960A2 */  sb         $zero, 0x19E0($s3)
    /* 21658 8015B250 E11960A2 */  sb         $zero, 0x19E1($s3)
    /* 2165C 8015B254 E21960A2 */  sb         $zero, 0x19E2($s3)
    /* 21660 8015B258 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 21664 8015B25C 2800B68F */  lw         $s6, 0x28($sp)
    /* 21668 8015B260 2400B58F */  lw         $s5, 0x24($sp)
    /* 2166C 8015B264 2000B48F */  lw         $s4, 0x20($sp)
    /* 21670 8015B268 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 21674 8015B26C 1800B28F */  lw         $s2, 0x18($sp)
    /* 21678 8015B270 1400B18F */  lw         $s1, 0x14($sp)
    /* 2167C 8015B274 1000B08F */  lw         $s0, 0x10($sp)
    /* 21680 8015B278 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 21684 8015B27C 0800E003 */  jr         $ra
    /* 21688 8015B280 00000000 */   nop
endlabel UnPackPlayer__FPC14PkPlayerStructiUc
