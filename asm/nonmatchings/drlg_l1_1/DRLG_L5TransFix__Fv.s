.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L5TransFix__Fv, 0x444

glabel DRLG_L5TransFix__Fv
    /* 666C 80140264 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 6670 80140268 0000B0AF */  sw         $s0, 0x0($sp)
    /* 6674 8014026C 10001024 */  addiu      $s0, $zero, 0x10
    /* 6678 80140270 0400B1AF */  sw         $s1, 0x4($sp)
    /* 667C 80140274 21880000 */  addu       $s1, $zero, $zero
    /* 6680 80140278 1000B4AF */  sw         $s4, 0x10($sp)
    /* 6684 8014027C 0E80143C */  lui        $s4, %hi(dungeon)
    /* 6688 80140280 C4409426 */  addiu      $s4, $s4, %lo(dungeon)
    /* 668C 80140284 1400B5AF */  sw         $s5, 0x14($sp)
    /* 6690 80140288 A0FF9526 */  addiu      $s5, $s4, -0x60
    /* 6694 8014028C 0C00B3AF */  sw         $s3, 0xC($sp)
    /* 6698 80140290 02001324 */  addiu      $s3, $zero, 0x2
    /* 669C 80140294 FFFF1924 */  addiu      $t9, $zero, -0x1
    /* 66A0 80140298 0800B2AF */  sw         $s2, 0x8($sp)
    /* 66A4 8014029C 78001224 */  addiu      $s2, $zero, 0x78
    /* 66A8 801402A0 88000C24 */  addiu      $t4, $zero, 0x88
  .L801402A4:
    /* 66AC 801402A4 40401100 */  sll        $t0, $s1, 1
    /* 66B0 801402A8 21508002 */  addu       $t2, $s4, $zero
    /* 66B4 801402AC 21C00000 */  addu       $t8, $zero, $zero
    /* 66B8 801402B0 2148A002 */  addu       $t1, $s5, $zero
    /* 66BC 801402B4 C0681000 */  sll        $t5, $s0, 3
    /* 66C0 801402B8 0038A525 */  addiu      $a1, $t5, 0x3800
    /* 66C4 801402BC 00380F24 */  addiu      $t7, $zero, 0x3800
    /* 66C8 801402C0 80340E24 */  addiu      $t6, $zero, 0x3480
    /* 66CC 801402C4 803B0724 */  addiu      $a3, $zero, 0x3B80
    /* 66D0 801402C8 00388B25 */  addiu      $t3, $t4, 0x3800
  .L801402CC:
    /* 66D4 801402CC 21180A01 */  addu       $v1, $t0, $t2
    /* 66D8 801402D0 00006694 */  lhu        $a2, 0x0($v1)
    /* 66DC 801402D4 17000224 */  addiu      $v0, $zero, 0x17
    /* 66E0 801402D8 1400C214 */  bne        $a2, $v0, .L8014032C
    /* 66E4 801402DC 18000224 */   addiu     $v0, $zero, 0x18
    /* 66E8 801402E0 FEFF6394 */  lhu        $v1, -0x2($v1)
    /* 66EC 801402E4 12000224 */  addiu      $v0, $zero, 0x12
    /* 66F0 801402E8 10006214 */  bne        $v1, $v0, .L8014032C
    /* 66F4 801402EC 18000224 */   addiu     $v0, $zero, 0x18
    /* 66F8 801402F0 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 66FC 801402F4 21082500 */  addu       $at, $at, $a1
    /* 6700 801402F8 2F7A2390 */  lbu        $v1, %lo(dung_map + 0x7)($at)
    /* 6704 801402FC 2110A701 */  addu       $v0, $t5, $a3
    /* 6708 80140300 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 670C 80140304 21082200 */  addu       $at, $at, $v0
    /* 6710 80140308 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* 6714 8014030C 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 6718 80140310 21082500 */  addu       $at, $at, $a1
    /* 671C 80140314 2F7A2390 */  lbu        $v1, %lo(dung_map + 0x7)($at)
    /* 6720 80140318 21108701 */  addu       $v0, $t4, $a3
    /* 6724 8014031C 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 6728 80140320 21082200 */  addu       $at, $at, $v0
    /* 672C 80140324 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* 6730 80140328 18000224 */  addiu      $v0, $zero, 0x18
  .L8014032C:
    /* 6734 8014032C 1700C214 */  bne        $a2, $v0, .L8014038C
    /* 6738 80140330 12000224 */   addiu     $v0, $zero, 0x12
    /* 673C 80140334 0E80023C */  lui        $v0, %hi(dungeon + 0x60)
    /* 6740 80140338 24414224 */  addiu      $v0, $v0, %lo(dungeon + 0x60)
    /* 6744 8014033C 21100203 */  addu       $v0, $t8, $v0
    /* 6748 80140340 21100201 */  addu       $v0, $t0, $v0
    /* 674C 80140344 00004394 */  lhu        $v1, 0x0($v0)
    /* 6750 80140348 13000224 */  addiu      $v0, $zero, 0x13
    /* 6754 8014034C 0F006214 */  bne        $v1, $v0, .L8014038C
    /* 6758 80140350 12000224 */   addiu     $v0, $zero, 0x12
    /* 675C 80140354 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 6760 80140358 21082500 */  addu       $at, $at, $a1
    /* 6764 8014035C 2F7A2290 */  lbu        $v0, %lo(dung_map + 0x7)($at)
    /* 6768 80140360 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 676C 80140364 21082B00 */  addu       $at, $at, $t3
    /* 6770 80140368 2F7A22A0 */  sb         $v0, %lo(dung_map + 0x7)($at)
    /* 6774 8014036C 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 6778 80140370 21082500 */  addu       $at, $at, $a1
    /* 677C 80140374 2F7A2390 */  lbu        $v1, %lo(dung_map + 0x7)($at)
    /* 6780 80140378 21108701 */  addu       $v0, $t4, $a3
    /* 6784 8014037C 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 6788 80140380 21082200 */  addu       $at, $at, $v0
    /* 678C 80140384 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* 6790 80140388 12000224 */  addiu      $v0, $zero, 0x12
  .L8014038C:
    /* 6794 8014038C 1000C214 */  bne        $a2, $v0, .L801403D0
    /* 6798 80140390 13000224 */   addiu     $v0, $zero, 0x13
    /* 679C 80140394 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 67A0 80140398 21082500 */  addu       $at, $at, $a1
    /* 67A4 8014039C 2F7A2390 */  lbu        $v1, %lo(dung_map + 0x7)($at)
    /* 67A8 801403A0 2110A701 */  addu       $v0, $t5, $a3
    /* 67AC 801403A4 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 67B0 801403A8 21082200 */  addu       $at, $at, $v0
    /* 67B4 801403AC 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* 67B8 801403B0 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 67BC 801403B4 21082500 */  addu       $at, $at, $a1
    /* 67C0 801403B8 2F7A2390 */  lbu        $v1, %lo(dung_map + 0x7)($at)
    /* 67C4 801403BC 21108701 */  addu       $v0, $t4, $a3
    /* 67C8 801403C0 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 67CC 801403C4 21082200 */  addu       $at, $at, $v0
    /* 67D0 801403C8 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* 67D4 801403CC 13000224 */  addiu      $v0, $zero, 0x13
  .L801403D0:
    /* 67D8 801403D0 0F00C214 */  bne        $a2, $v0, .L80140410
    /* 67DC 801403D4 14000224 */   addiu     $v0, $zero, 0x14
    /* 67E0 801403D8 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 67E4 801403DC 21082500 */  addu       $at, $at, $a1
    /* 67E8 801403E0 2F7A2290 */  lbu        $v0, %lo(dung_map + 0x7)($at)
    /* 67EC 801403E4 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 67F0 801403E8 21082B00 */  addu       $at, $at, $t3
    /* 67F4 801403EC 2F7A22A0 */  sb         $v0, %lo(dung_map + 0x7)($at)
    /* 67F8 801403F0 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 67FC 801403F4 21082500 */  addu       $at, $at, $a1
    /* 6800 801403F8 2F7A2390 */  lbu        $v1, %lo(dung_map + 0x7)($at)
    /* 6804 801403FC 21108701 */  addu       $v0, $t4, $a3
    /* 6808 80140400 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 680C 80140404 21082200 */  addu       $at, $at, $v0
    /* 6810 80140408 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* 6814 8014040C 14000224 */  addiu      $v0, $zero, 0x14
  .L80140410:
    /* 6818 80140410 1600C214 */  bne        $a2, $v0, .L8014046C
    /* 681C 80140414 18000224 */   addiu     $v0, $zero, 0x18
    /* 6820 80140418 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 6824 8014041C 21082500 */  addu       $at, $at, $a1
    /* 6828 80140420 2F7A2390 */  lbu        $v1, %lo(dung_map + 0x7)($at)
    /* 682C 80140424 2110A701 */  addu       $v0, $t5, $a3
    /* 6830 80140428 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 6834 8014042C 21082200 */  addu       $at, $at, $v0
    /* 6838 80140430 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* 683C 80140434 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 6840 80140438 21082500 */  addu       $at, $at, $a1
    /* 6844 8014043C 2F7A2290 */  lbu        $v0, %lo(dung_map + 0x7)($at)
    /* 6848 80140440 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 684C 80140444 21082B00 */  addu       $at, $at, $t3
    /* 6850 80140448 2F7A22A0 */  sb         $v0, %lo(dung_map + 0x7)($at)
    /* 6854 8014044C 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 6858 80140450 21082500 */  addu       $at, $at, $a1
    /* 685C 80140454 2F7A2390 */  lbu        $v1, %lo(dung_map + 0x7)($at)
    /* 6860 80140458 21108701 */  addu       $v0, $t4, $a3
    /* 6864 8014045C 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 6868 80140460 21082200 */  addu       $at, $at, $v0
    /* 686C 80140464 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* 6870 80140468 18000224 */  addiu      $v0, $zero, 0x18
  .L8014046C:
    /* 6874 8014046C 1000C214 */  bne        $a2, $v0, .L801404B0
    /* 6878 80140470 06000224 */   addiu     $v0, $zero, 0x6
    /* 687C 80140474 21100A01 */  addu       $v0, $t0, $t2
    /* 6880 80140478 FEFF4394 */  lhu        $v1, -0x2($v0)
    /* 6884 8014047C 06000224 */  addiu      $v0, $zero, 0x6
    /* 6888 80140480 0B006214 */  bne        $v1, $v0, .L801404B0
    /* 688C 80140484 00000000 */   nop
    /* 6890 80140488 FEFF0226 */  addiu      $v0, $s0, -0x2
    /* 6894 8014048C C0100200 */  sll        $v0, $v0, 3
    /* 6898 80140490 21104F00 */  addu       $v0, $v0, $t7
    /* 689C 80140494 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 68A0 80140498 21082200 */  addu       $at, $at, $v0
    /* 68A4 8014049C 2F7A2290 */  lbu        $v0, %lo(dung_map + 0x7)($at)
    /* 68A8 801404A0 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 68AC 801404A4 21082500 */  addu       $at, $at, $a1
    /* 68B0 801404A8 2F7A22A0 */  sb         $v0, %lo(dung_map + 0x7)($at)
    /* 68B4 801404AC 06000224 */  addiu      $v0, $zero, 0x6
  .L801404B0:
    /* 68B8 801404B0 1700C214 */  bne        $a2, $v0, .L80140510
    /* 68BC 801404B4 1B000224 */   addiu     $v0, $zero, 0x1B
    /* 68C0 801404B8 21180901 */  addu       $v1, $t0, $t1
    /* 68C4 801404BC 00006294 */  lhu        $v0, 0x0($v1)
    /* 68C8 801404C0 00000000 */  nop
    /* 68CC 801404C4 07005314 */  bne        $v0, $s3, .L801404E4
    /* 68D0 801404C8 2110A701 */   addu      $v0, $t5, $a3
    /* 68D4 801404CC 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 68D8 801404D0 21082200 */  addu       $at, $at, $v0
    /* 68DC 801404D4 2F7A2290 */  lbu        $v0, %lo(dung_map + 0x7)($at)
    /* 68E0 801404D8 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 68E4 801404DC 21082500 */  addu       $at, $at, $a1
    /* 68E8 801404E0 2F7A22A0 */  sb         $v0, %lo(dung_map + 0x7)($at)
  .L801404E4:
    /* 68EC 801404E4 00006394 */  lhu        $v1, 0x0($v1)
    /* 68F0 801404E8 25000224 */  addiu      $v0, $zero, 0x25
    /* 68F4 801404EC 08006214 */  bne        $v1, $v0, .L80140510
    /* 68F8 801404F0 1B000224 */   addiu     $v0, $zero, 0x1B
    /* 68FC 801404F4 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 6900 801404F8 21082B00 */  addu       $at, $at, $t3
    /* 6904 801404FC 2F7A2290 */  lbu        $v0, %lo(dung_map + 0x7)($at)
    /* 6908 80140500 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 690C 80140504 21082500 */  addu       $at, $at, $a1
    /* 6910 80140508 2F7A22A0 */  sb         $v0, %lo(dung_map + 0x7)($at)
    /* 6914 8014050C 1B000224 */  addiu      $v0, $zero, 0x1B
  .L80140510:
    /* 6918 80140510 0E00C214 */  bne        $a2, $v0, .L8014054C
    /* 691C 80140514 17000224 */   addiu     $v0, $zero, 0x17
    /* 6920 80140518 21100901 */  addu       $v0, $t0, $t1
    /* 6924 8014051C 00004294 */  lhu        $v0, 0x0($v0)
    /* 6928 80140520 00000000 */  nop
    /* 692C 80140524 09005314 */  bne        $v0, $s3, .L8014054C
    /* 6930 80140528 17000224 */   addiu     $v0, $zero, 0x17
    /* 6934 8014052C 2110A701 */  addu       $v0, $t5, $a3
    /* 6938 80140530 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 693C 80140534 21082200 */  addu       $at, $at, $v0
    /* 6940 80140538 2F7A2290 */  lbu        $v0, %lo(dung_map + 0x7)($at)
    /* 6944 8014053C 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 6948 80140540 21082500 */  addu       $at, $at, $a1
    /* 694C 80140544 2F7A22A0 */  sb         $v0, %lo(dung_map + 0x7)($at)
    /* 6950 80140548 17000224 */  addiu      $v0, $zero, 0x17
  .L8014054C:
    /* 6954 8014054C 1500C214 */  bne        $a2, $v0, .L801405A4
    /* 6958 80140550 07000224 */   addiu     $v0, $zero, 0x7
    /* 695C 80140554 21200901 */  addu       $a0, $t0, $t1
    /* 6960 80140558 00008394 */  lhu        $v1, 0x0($a0)
    /* 6964 8014055C 00000000 */  nop
    /* 6968 80140560 05006214 */  bne        $v1, $v0, .L80140578
    /* 696C 80140564 0D000224 */   addiu     $v0, $zero, 0xD
    /* 6970 80140568 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 6974 8014056C 21082500 */  addu       $at, $at, $a1
    /* 6978 80140570 2F7A39A0 */  sb         $t9, %lo(dung_map + 0x7)($at)
    /* 697C 80140574 00008394 */  lhu        $v1, 0x0($a0)
  .L80140578:
    /* 6980 80140578 00000000 */  nop
    /* 6984 8014057C 09006214 */  bne        $v1, $v0, .L801405A4
    /* 6988 80140580 07000224 */   addiu     $v0, $zero, 0x7
    /* 698C 80140584 21104E02 */  addu       $v0, $s2, $t6
    /* 6990 80140588 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 6994 8014058C 21082200 */  addu       $at, $at, $v0
    /* 6998 80140590 2F7A2290 */  lbu        $v0, %lo(dung_map + 0x7)($at)
    /* 699C 80140594 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 69A0 80140598 21082500 */  addu       $at, $at, $a1
    /* 69A4 8014059C 2F7A22A0 */  sb         $v0, %lo(dung_map + 0x7)($at)
    /* 69A8 801405A0 07000224 */  addiu      $v0, $zero, 0x7
  .L801405A4:
    /* 69AC 801405A4 0900C214 */  bne        $a2, $v0, .L801405CC
    /* 69B0 801405A8 0C000224 */   addiu     $v0, $zero, 0xC
    /* 69B4 801405AC 21100901 */  addu       $v0, $t0, $t1
    /* 69B8 801405B0 00004394 */  lhu        $v1, 0x0($v0)
    /* 69BC 801405B4 0D000224 */  addiu      $v0, $zero, 0xD
    /* 69C0 801405B8 04006214 */  bne        $v1, $v0, .L801405CC
    /* 69C4 801405BC 0C000224 */   addiu     $v0, $zero, 0xC
    /* 69C8 801405C0 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 69CC 801405C4 21082500 */  addu       $at, $at, $a1
    /* 69D0 801405C8 2F7A39A0 */  sb         $t9, %lo(dung_map + 0x7)($at)
  .L801405CC:
    /* 69D4 801405CC 0900C214 */  bne        $a2, $v0, .L801405F4
    /* 69D8 801405D0 07000224 */   addiu     $v0, $zero, 0x7
    /* 69DC 801405D4 21100901 */  addu       $v0, $t0, $t1
    /* 69E0 801405D8 00004294 */  lhu        $v0, 0x0($v0)
    /* 69E4 801405DC 00000000 */  nop
    /* 69E8 801405E0 04005314 */  bne        $v0, $s3, .L801405F4
    /* 69EC 801405E4 07000224 */   addiu     $v0, $zero, 0x7
    /* 69F0 801405E8 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 69F4 801405EC 21082500 */  addu       $at, $at, $a1
    /* 69F8 801405F0 2F7A39A0 */  sb         $t9, %lo(dung_map + 0x7)($at)
  .L801405F4:
    /* 69FC 801405F4 0900C214 */  bne        $a2, $v0, .L8014061C
    /* 6A00 801405F8 15000224 */   addiu     $v0, $zero, 0x15
    /* 6A04 801405FC 21100A01 */  addu       $v0, $t0, $t2
    /* 6A08 80140600 FEFF4394 */  lhu        $v1, -0x2($v0)
    /* 6A0C 80140604 01000224 */  addiu      $v0, $zero, 0x1
    /* 6A10 80140608 04006214 */  bne        $v1, $v0, .L8014061C
    /* 6A14 8014060C 15000224 */   addiu     $v0, $zero, 0x15
    /* 6A18 80140610 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 6A1C 80140614 21082500 */  addu       $at, $at, $a1
    /* 6A20 80140618 2F7A39A0 */  sb         $t9, %lo(dung_map + 0x7)($at)
  .L8014061C:
    /* 6A24 8014061C 0800C214 */  bne        $a2, $v0, .L80140640
    /* 6A28 80140620 21100A01 */   addu      $v0, $t0, $t2
    /* 6A2C 80140624 FEFF4394 */  lhu        $v1, -0x2($v0)
    /* 6A30 80140628 01000224 */  addiu      $v0, $zero, 0x1
    /* 6A34 8014062C 04006214 */  bne        $v1, $v0, .L80140640
    /* 6A38 80140630 00000000 */   nop
    /* 6A3C 80140634 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 6A40 80140638 21082500 */  addu       $at, $at, $a1
    /* 6A44 8014063C 2F7A39A0 */  sb         $t9, %lo(dung_map + 0x7)($at)
  .L80140640:
    /* 6A48 80140640 0007A524 */  addiu      $a1, $a1, 0x700
    /* 6A4C 80140644 0007EF25 */  addiu      $t7, $t7, 0x700
    /* 6A50 80140648 0007CE25 */  addiu      $t6, $t6, 0x700
    /* 6A54 8014064C 0007E724 */  addiu      $a3, $a3, 0x700
    /* 6A58 80140650 00076B25 */  addiu      $t3, $t3, 0x700
    /* 6A5C 80140654 60004A25 */  addiu      $t2, $t2, 0x60
    /* 6A60 80140658 60001827 */  addiu      $t8, $t8, 0x60
    /* 6A64 8014065C 000F8226 */  addiu      $v0, $s4, 0xF00
    /* 6A68 80140660 2A104201 */  slt        $v0, $t2, $v0
    /* 6A6C 80140664 19FF4014 */  bnez       $v0, .L801402CC
    /* 6A70 80140668 60002925 */   addiu     $t1, $t1, 0x60
    /* 6A74 8014066C 10005226 */  addiu      $s2, $s2, 0x10
    /* 6A78 80140670 10008C25 */  addiu      $t4, $t4, 0x10
    /* 6A7C 80140674 01003126 */  addiu      $s1, $s1, 0x1
    /* 6A80 80140678 2800222A */  slti       $v0, $s1, 0x28
    /* 6A84 8014067C 09FF4014 */  bnez       $v0, .L801402A4
    /* 6A88 80140680 02001026 */   addiu     $s0, $s0, 0x2
    /* 6A8C 80140684 1400B58F */  lw         $s5, 0x14($sp)
    /* 6A90 80140688 1000B48F */  lw         $s4, 0x10($sp)
    /* 6A94 8014068C 0C00B38F */  lw         $s3, 0xC($sp)
    /* 6A98 80140690 0800B28F */  lw         $s2, 0x8($sp)
    /* 6A9C 80140694 0400B18F */  lw         $s1, 0x4($sp)
    /* 6AA0 80140698 0000B08F */  lw         $s0, 0x0($sp)
    /* 6AA4 8014069C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 6AA8 801406A0 0800E003 */  jr         $ra
    /* 6AAC 801406A4 00000000 */   nop
endlabel DRLG_L5TransFix__Fv
