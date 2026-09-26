.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitMonsters__Fv, 0x3B4

glabel InitMonsters__Fv
    /* 272DC 80160ED4 1280023C */  lui        $v0, %hi(setlevel)
    /* 272E0 80160ED8 0EC14290 */  lbu        $v0, %lo(setlevel)($v0)
    /* 272E4 80160EDC F0FDBD27 */  addiu      $sp, $sp, -0x210
    /* 272E8 80160EE0 0402B5AF */  sw         $s5, 0x204($sp)
    /* 272EC 80160EE4 21A80000 */  addu       $s5, $zero, $zero
    /* 272F0 80160EE8 0802BFAF */  sw         $ra, 0x208($sp)
    /* 272F4 80160EEC 0002B4AF */  sw         $s4, 0x200($sp)
    /* 272F8 80160EF0 FC01B3AF */  sw         $s3, 0x1FC($sp)
    /* 272FC 80160EF4 F801B2AF */  sw         $s2, 0x1F8($sp)
    /* 27300 80160EF8 F401B1AF */  sw         $s1, 0x1F4($sp)
    /* 27304 80160EFC 25004014 */  bnez       $v0, .L80160F94
    /* 27308 80160F00 F001B0AF */   sw        $s0, 0x1F0($sp)
    /* 2730C 80160F04 01000424 */  addiu      $a0, $zero, 0x1
    /* 27310 80160F08 21280000 */  addu       $a1, $zero, $zero
    /* 27314 80160F0C 21300000 */  addu       $a2, $zero, $zero
    /* 27318 80160F10 21380000 */  addu       $a3, $zero, $zero
    /* 2731C 80160F14 74FF010C */  jal        AddMonster__FiiiiUc
    /* 27320 80160F18 1000A0AF */   sw        $zero, 0x10($sp)
    /* 27324 80160F1C 01000424 */  addiu      $a0, $zero, 0x1
    /* 27328 80160F20 21280000 */  addu       $a1, $zero, $zero
    /* 2732C 80160F24 21300000 */  addu       $a2, $zero, $zero
    /* 27330 80160F28 21380000 */  addu       $a3, $zero, $zero
    /* 27334 80160F2C 74FF010C */  jal        AddMonster__FiiiiUc
    /* 27338 80160F30 1000A0AF */   sw        $zero, 0x10($sp)
    /* 2733C 80160F34 01000424 */  addiu      $a0, $zero, 0x1
    /* 27340 80160F38 21280000 */  addu       $a1, $zero, $zero
    /* 27344 80160F3C 21300000 */  addu       $a2, $zero, $zero
    /* 27348 80160F40 21380000 */  addu       $a3, $zero, $zero
    /* 2734C 80160F44 74FF010C */  jal        AddMonster__FiiiiUc
    /* 27350 80160F48 1000A0AF */   sw        $zero, 0x10($sp)
    /* 27354 80160F4C 01000424 */  addiu      $a0, $zero, 0x1
    /* 27358 80160F50 21280000 */  addu       $a1, $zero, $zero
    /* 2735C 80160F54 21300000 */  addu       $a2, $zero, $zero
    /* 27360 80160F58 21380000 */  addu       $a3, $zero, $zero
    /* 27364 80160F5C 74FF010C */  jal        AddMonster__FiiiiUc
    /* 27368 80160F60 1000A0AF */   sw        $zero, 0x10($sp)
    /* 2736C 80160F64 1280023C */  lui        $v0, %hi(setlevel)
    /* 27370 80160F68 0EC14290 */  lbu        $v0, %lo(setlevel)($v0)
    /* 27374 80160F6C 00000000 */  nop
    /* 27378 80160F70 09004014 */  bnez       $v0, .L80160F98
    /* 2737C 80160F74 0F000224 */   addiu     $v0, $zero, 0xF
    /* 27380 80160F78 1280033C */  lui        $v1, %hi(currlevel)
    /* 27384 80160F7C 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 27388 80160F80 10000224 */  addiu      $v0, $zero, 0x10
    /* 2738C 80160F84 06006214 */  bne        $v1, $v0, .L80160FA0
    /* 27390 80160F88 0F000224 */   addiu     $v0, $zero, 0xF
    /* 27394 80160F8C 6781050C */  jal        LoadDiabMonsts__Fv
    /* 27398 80160F90 00000000 */   nop
  .L80160F94:
    /* 2739C 80160F94 0F000224 */  addiu      $v0, $zero, 0xF
  .L80160F98:
    /* 273A0 80160F98 1280033C */  lui        $v1, %hi(currlevel)
    /* 273A4 80160F9C 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
  .L80160FA0:
    /* 273A8 80160FA0 1280143C */  lui        $s4, %hi(numtrigs)
    /* 273AC 80160FA4 78BB948E */  lw         $s4, %lo(numtrigs)($s4)
    /* 273B0 80160FA8 02006214 */  bne        $v1, $v0, .L80160FB4
    /* 273B4 80160FAC 00000000 */   nop
    /* 273B8 80160FB0 01001424 */  addiu      $s4, $zero, 0x1
  .L80160FB4:
    /* 273BC 80160FB4 1C00801A */  blez       $s4, .L80161028
    /* 273C0 80160FB8 21900000 */   addu      $s2, $zero, $zero
  .L80160FBC:
    /* 273C4 80160FBC FEFF1124 */  addiu      $s1, $zero, -0x2
    /* 273C8 80160FC0 00991200 */  sll        $s3, $s2, 4
  .L80160FC4:
    /* 273CC 80160FC4 FEFF1024 */  addiu      $s0, $zero, -0x2
    /* 273D0 80160FC8 0F000624 */  addiu      $a2, $zero, 0xF
  .L80160FCC:
    /* 273D4 80160FCC 0E80013C */  lui        $at, %hi(trigs)
    /* 273D8 80160FD0 21083300 */  addu       $at, $at, $s3
    /* 273DC 80160FD4 CC33248C */  lw         $a0, %lo(trigs)($at)
    /* 273E0 80160FD8 0E80013C */  lui        $at, %hi(trigs + 0x4)
    /* 273E4 80160FDC 21083300 */  addu       $at, $at, $s3
    /* 273E8 80160FE0 D033258C */  lw         $a1, %lo(trigs + 0x4)($at)
    /* 273EC 80160FE4 21380000 */  addu       $a3, $zero, $zero
    /* 273F0 80160FE8 1000A0AF */  sw         $zero, 0x10($sp)
    /* 273F4 80160FEC 21209100 */  addu       $a0, $a0, $s1
    /* 273F8 80160FF0 9033010C */  jal        DoVision__FiiiUcUc
    /* 273FC 80160FF4 2128B000 */   addu      $a1, $a1, $s0
    /* 27400 80160FF8 01001026 */  addiu      $s0, $s0, 0x1
    /* 27404 80160FFC 0200022A */  slti       $v0, $s0, 0x2
    /* 27408 80161000 F2FF4014 */  bnez       $v0, .L80160FCC
    /* 2740C 80161004 0F000624 */   addiu     $a2, $zero, 0xF
    /* 27410 80161008 01003126 */  addiu      $s1, $s1, 0x1
    /* 27414 8016100C 0200222A */  slti       $v0, $s1, 0x2
    /* 27418 80161010 ECFF4014 */  bnez       $v0, .L80160FC4
    /* 2741C 80161014 00000000 */   nop
    /* 27420 80161018 01005226 */  addiu      $s2, $s2, 0x1
    /* 27424 8016101C 2A105402 */  slt        $v0, $s2, $s4
    /* 27428 80161020 E6FF4014 */  bnez       $v0, .L80160FBC
    /* 2742C 80161024 00000000 */   nop
  .L80161028:
    /* 27430 80161028 7680050C */  jal        PlaceQuestMonsters__Fv
    /* 27434 8016102C 00000000 */   nop
    /* 27438 80161030 1280023C */  lui        $v0, %hi(setlevel)
    /* 2743C 80161034 0EC14290 */  lbu        $v0, %lo(setlevel)($v0)
    /* 27440 80161038 00000000 */  nop
    /* 27444 8016103C 6C004014 */  bnez       $v0, .L801611F0
    /* 27448 80161040 00000000 */   nop
    /* 2744C 80161044 F386050C */  jal        PlaceUniques__Fv
    /* 27450 80161048 21880000 */   addu      $s1, $zero, $zero
    /* 27454 8016104C 21900000 */  addu       $s2, $zero, $zero
  .L80161050:
    /* 27458 80161050 21800000 */  addu       $s0, $zero, $zero
    /* 2745C 80161054 21204002 */  addu       $a0, $s2, $zero
  .L80161058:
    /* 27460 80161058 1383010C */  jal        SolidLoc__Fii
    /* 27464 8016105C 21280002 */   addu      $a1, $s0, $zero
    /* 27468 80161060 FF004230 */  andi       $v0, $v0, 0xFF
    /* 2746C 80161064 02004014 */  bnez       $v0, .L80161070
    /* 27470 80161068 00000000 */   nop
    /* 27474 8016106C 01003126 */  addiu      $s1, $s1, 0x1
  .L80161070:
    /* 27478 80161070 01001026 */  addiu      $s0, $s0, 0x1
    /* 2747C 80161074 6000022A */  slti       $v0, $s0, 0x60
    /* 27480 80161078 F7FF4014 */  bnez       $v0, .L80161058
    /* 27484 8016107C 21204002 */   addu      $a0, $s2, $zero
    /* 27488 80161080 01005226 */  addiu      $s2, $s2, 0x1
    /* 2748C 80161084 6000422A */  slti       $v0, $s2, 0x60
    /* 27490 80161088 F1FF4014 */  bnez       $v0, .L80161050
    /* 27494 8016108C 0EEA023C */   lui       $v0, (0xEA0EA0EB >> 16)
    /* 27498 80161090 EBA04234 */  ori        $v0, $v0, (0xEA0EA0EB & 0xFFFF)
    /* 2749C 80161094 18002202 */  mult       $s1, $v0
    /* 274A0 80161098 C31F1100 */  sra        $v1, $s1, 31
    /* 274A4 8016109C 10400000 */  mfhi       $t0
    /* 274A8 801610A0 21101101 */  addu       $v0, $t0, $s1
    /* 274AC 801610A4 43110200 */  sra        $v0, $v0, 5
    /* 274B0 801610A8 23204300 */  subu       $a0, $v0, $v1
    /* 274B4 801610AC 1280033C */  lui        $v1, %hi(gbMaxPlayers)
    /* 274B8 801610B0 A2B96390 */  lbu        $v1, %lo(gbMaxPlayers)($v1)
    /* 274BC 801610B4 01000224 */  addiu      $v0, $zero, 0x1
    /* 274C0 801610B8 02006210 */  beq        $v1, $v0, .L801610C4
    /* 274C4 801610BC 43100400 */   sra       $v0, $a0, 1
    /* 274C8 801610C0 21208200 */  addu       $a0, $a0, $v0
  .L801610C4:
    /* 274CC 801610C4 1280033C */  lui        $v1, %hi(nummonsters)
    /* 274D0 801610C8 CCC2638C */  lw         $v1, %lo(nummonsters)($v1)
    /* 274D4 801610CC 00000000 */  nop
    /* 274D8 801610D0 21108300 */  addu       $v0, $a0, $v1
    /* 274DC 801610D4 B5004228 */  slti       $v0, $v0, 0xB5
    /* 274E0 801610D8 02004014 */  bnez       $v0, .L801610E4
    /* 274E4 801610DC B4000224 */   addiu     $v0, $zero, 0xB4
    /* 274E8 801610E0 23204300 */  subu       $a0, $v0, $v1
  .L801610E4:
    /* 274EC 801610E4 1280053C */  lui        $a1, %hi(nummtypes)
    /* 274F0 801610E8 9CC2A58C */  lw         $a1, %lo(nummtypes)($a1)
    /* 274F4 801610EC 21106400 */  addu       $v0, $v1, $a0
    /* 274F8 801610F0 1280013C */  lui        $at, %hi(totalmonsters)
    /* 274FC 801610F4 D4C222A0 */  sb         $v0, %lo(totalmonsters)($at)
    /* 27500 801610F8 3500A018 */  blez       $a1, .L801611D0
    /* 27504 801610FC 21900000 */   addu      $s2, $zero, $zero
    /* 27508 80161100 21200000 */  addu       $a0, $zero, $zero
    /* 2750C 80161104 1800A327 */  addiu      $v1, $sp, 0x18
    /* 27510 80161108 80101500 */  sll        $v0, $s5, 2
    /* 27514 8016110C 21184300 */  addu       $v1, $v0, $v1
  .L80161110:
    /* 27518 80161110 1180013C */  lui        $at, %hi(Monsters + 0x13)
    /* 2751C 80161114 21082400 */  addu       $at, $at, $a0
    /* 27520 80161118 CFA32290 */  lbu        $v0, %lo(Monsters + 0x13)($at)
    /* 27524 8016111C 00000000 */  nop
    /* 27528 80161120 01004230 */  andi       $v0, $v0, 0x1
    /* 2752C 80161124 04004010 */  beqz       $v0, .L80161138
    /* 27530 80161128 00000000 */   nop
    /* 27534 8016112C 000072AC */  sw         $s2, 0x0($v1)
    /* 27538 80161130 04006324 */  addiu      $v1, $v1, 0x4
    /* 2753C 80161134 0100B526 */  addiu      $s5, $s5, 0x1
  .L80161138:
    /* 27540 80161138 01005226 */  addiu      $s2, $s2, 0x1
    /* 27544 8016113C 2A104502 */  slt        $v0, $s2, $a1
    /* 27548 80161140 F3FF4014 */  bnez       $v0, .L80161110
    /* 2754C 80161144 1C008424 */   addiu     $a0, $a0, 0x1C
    /* 27550 80161148 74840508 */  j          .L801611D0
    /* 27554 8016114C 00000000 */   nop
  .L80161150:
    /* 27558 80161150 C9F6000C */  jal        ENG_random__Fl
    /* 2755C 80161154 2120A002 */   addu      $a0, $s5, $zero
    /* 27560 80161158 80100200 */  sll        $v0, $v0, 2
    /* 27564 8016115C 2118A203 */  addu       $v1, $sp, $v0
    /* 27568 80161160 01000424 */  addiu      $a0, $zero, 0x1
    /* 2756C 80161164 1280023C */  lui        $v0, %hi(currlevel)
    /* 27570 80161168 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 27574 8016116C 1800708C */  lw         $s0, 0x18($v1)
    /* 27578 80161170 13004410 */  beq        $v0, $a0, .L801611C0
    /* 2757C 80161174 01000524 */   addiu     $a1, $zero, 0x1
    /* 27580 80161178 C9F6000C */  jal        ENG_random__Fl
    /* 27584 8016117C 02000424 */   addiu     $a0, $zero, 0x2
    /* 27588 80161180 0E004010 */  beqz       $v0, .L801611BC
    /* 2758C 80161184 02000224 */   addiu     $v0, $zero, 0x2
    /* 27590 80161188 1280033C */  lui        $v1, %hi(currlevel)
    /* 27594 8016118C 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 27598 80161190 00000000 */  nop
    /* 2759C 80161194 05006214 */  bne        $v1, $v0, .L801611AC
    /* 275A0 80161198 00000000 */   nop
    /* 275A4 8016119C C9F6000C */  jal        ENG_random__Fl
    /* 275A8 801611A0 02000424 */   addiu     $a0, $zero, 0x2
    /* 275AC 801611A4 70840508 */  j          .L801611C0
    /* 275B0 801611A8 02004524 */   addiu     $a1, $v0, 0x2
  .L801611AC:
    /* 275B4 801611AC C9F6000C */  jal        ENG_random__Fl
    /* 275B8 801611B0 03000424 */   addiu     $a0, $zero, 0x3
    /* 275BC 801611B4 70840508 */  j          .L801611C0
    /* 275C0 801611B8 03004524 */   addiu     $a1, $v0, 0x3
  .L801611BC:
    /* 275C4 801611BC 01000524 */  addiu      $a1, $zero, 0x1
  .L801611C0:
    /* 275C8 801611C0 21200002 */  addu       $a0, $s0, $zero
    /* 275CC 801611C4 21300000 */  addu       $a2, $zero, $zero
    /* 275D0 801611C8 AB81050C */  jal        PlaceGroup__FiiUci
    /* 275D4 801611CC 21380000 */   addu      $a3, $zero, $zero
  .L801611D0:
    /* 275D8 801611D0 1280033C */  lui        $v1, %hi(totalmonsters)
    /* 275DC 801611D4 D4C26390 */  lbu        $v1, %lo(totalmonsters)($v1)
    /* 275E0 801611D8 1280023C */  lui        $v0, %hi(nummonsters)
    /* 275E4 801611DC CCC2428C */  lw         $v0, %lo(nummonsters)($v0)
    /* 275E8 801611E0 00000000 */  nop
    /* 275EC 801611E4 2A104300 */  slt        $v0, $v0, $v1
    /* 275F0 801611E8 D9FF4014 */  bnez       $v0, .L80161150
    /* 275F4 801611EC 00000000 */   nop
  .L801611F0:
    /* 275F8 801611F0 1B00801A */  blez       $s4, .L80161260
    /* 275FC 801611F4 21900000 */   addu      $s2, $zero, $zero
    /* 27600 801611F8 FEFF1124 */  addiu      $s1, $zero, -0x2
  .L801611FC:
    /* 27604 801611FC 00991200 */  sll        $s3, $s2, 4
  .L80161200:
    /* 27608 80161200 FEFF1024 */  addiu      $s0, $zero, -0x2
    /* 2760C 80161204 0F000624 */  addiu      $a2, $zero, 0xF
  .L80161208:
    /* 27610 80161208 FFFF0724 */  addiu      $a3, $zero, -0x1
    /* 27614 8016120C 0E80013C */  lui        $at, %hi(trigs)
    /* 27618 80161210 21083300 */  addu       $at, $at, $s3
    /* 2761C 80161214 CC33248C */  lw         $a0, %lo(trigs)($at)
    /* 27620 80161218 0E80013C */  lui        $at, %hi(trigs + 0x4)
    /* 27624 8016121C 21083300 */  addu       $at, $at, $s3
    /* 27628 80161220 D033258C */  lw         $a1, %lo(trigs + 0x4)($at)
    /* 2762C 80161224 21209100 */  addu       $a0, $a0, $s1
    /* 27630 80161228 4E33010C */  jal        DoUnVision__Fiiii
    /* 27634 8016122C 2128B000 */   addu      $a1, $a1, $s0
    /* 27638 80161230 01001026 */  addiu      $s0, $s0, 0x1
    /* 2763C 80161234 0200022A */  slti       $v0, $s0, 0x2
    /* 27640 80161238 F3FF4014 */  bnez       $v0, .L80161208
    /* 27644 8016123C 0F000624 */   addiu     $a2, $zero, 0xF
    /* 27648 80161240 01003126 */  addiu      $s1, $s1, 0x1
    /* 2764C 80161244 0200222A */  slti       $v0, $s1, 0x2
    /* 27650 80161248 EDFF4014 */  bnez       $v0, .L80161200
    /* 27654 8016124C 00000000 */   nop
    /* 27658 80161250 01005226 */  addiu      $s2, $s2, 0x1
    /* 2765C 80161254 2A105402 */  slt        $v0, $s2, $s4
    /* 27660 80161258 E8FF4014 */  bnez       $v0, .L801611FC
    /* 27664 8016125C FEFF1124 */   addiu     $s1, $zero, -0x2
  .L80161260:
    /* 27668 80161260 0802BF8F */  lw         $ra, 0x208($sp)
    /* 2766C 80161264 0402B58F */  lw         $s5, 0x204($sp)
    /* 27670 80161268 0002B48F */  lw         $s4, 0x200($sp)
    /* 27674 8016126C FC01B38F */  lw         $s3, 0x1FC($sp)
    /* 27678 80161270 F801B28F */  lw         $s2, 0x1F8($sp)
    /* 2767C 80161274 F401B18F */  lw         $s1, 0x1F4($sp)
    /* 27680 80161278 F001B08F */  lw         $s0, 0x1F0($sp)
    /* 27684 8016127C 1002BD27 */  addiu      $sp, $sp, 0x210
    /* 27688 80161280 0800E003 */  jr         $ra
    /* 2768C 80161284 00000000 */   nop
endlabel InitMonsters__Fv
