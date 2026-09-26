.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L4SetWalls__Fv, 0xB0

glabel DRLG_L4SetWalls__Fv
    /* 1AA38 80154630 10000824 */  addiu      $t0, $zero, 0x10
    /* 1AA3C 80154634 21300000 */  addu       $a2, $zero, $zero
    /* 1AA40 80154638 0E800B3C */  lui        $t3, %hi(dungeon)
    /* 1AA44 8015463C C4406B25 */  addiu      $t3, $t3, %lo(dungeon)
    /* 1AA48 80154640 06000A24 */  addiu      $t2, $zero, 0x6
    /* 1AA4C 80154644 DFFF0924 */  addiu      $t1, $zero, -0x21
  .L80154648:
    /* 1AA50 80154648 2800C228 */  slti       $v0, $a2, 0x28
    /* 1AA54 8015464C 22004010 */  beqz       $v0, .L801546D8
    /* 1AA58 80154650 21280000 */   addu      $a1, $zero, $zero
    /* 1AA5C 80154654 40380600 */  sll        $a3, $a2, 1
    /* 1AA60 80154658 21206001 */  addu       $a0, $t3, $zero
    /* 1AA64 8015465C C0100800 */  sll        $v0, $t0, 3
    /* 1AA68 80154660 00384324 */  addiu      $v1, $v0, 0x3800
  .L80154664:
    /* 1AA6C 80154664 2800A228 */  slti       $v0, $a1, 0x28
    /* 1AA70 80154668 18004010 */  beqz       $v0, .L801546CC
    /* 1AA74 8015466C 2110E400 */   addu      $v0, $a3, $a0
    /* 1AA78 80154670 00004294 */  lhu        $v0, 0x0($v0)
    /* 1AA7C 80154674 00000000 */  nop
    /* 1AA80 80154678 03004A10 */  beq        $v0, $t2, .L80154688
    /* 1AA84 8015467C 00000000 */   nop
    /* 1AA88 80154680 06004014 */  bnez       $v0, .L8015469C
    /* 1AA8C 80154684 00000000 */   nop
  .L80154688:
    /* 1AA90 80154688 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 1AA94 8015468C 21082300 */  addu       $at, $at, $v1
    /* 1AA98 80154690 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 1AA9C 80154694 AC510508 */  j          .L801546B0
    /* 1AAA0 80154698 20004234 */   ori       $v0, $v0, 0x20
  .L8015469C:
    /* 1AAA4 8015469C 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 1AAA8 801546A0 21082300 */  addu       $at, $at, $v1
    /* 1AAAC 801546A4 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 1AAB0 801546A8 00000000 */  nop
    /* 1AAB4 801546AC 24104900 */  and        $v0, $v0, $t1
  .L801546B0:
    /* 1AAB8 801546B0 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 1AABC 801546B4 21082300 */  addu       $at, $at, $v1
    /* 1AAC0 801546B8 2E7A22A0 */  sb         $v0, %lo(dung_map + 0x6)($at)
    /* 1AAC4 801546BC 00076324 */  addiu      $v1, $v1, 0x700
    /* 1AAC8 801546C0 60008424 */  addiu      $a0, $a0, 0x60
    /* 1AACC 801546C4 99510508 */  j          .L80154664
    /* 1AAD0 801546C8 0100A524 */   addiu     $a1, $a1, 0x1
  .L801546CC:
    /* 1AAD4 801546CC 02000825 */  addiu      $t0, $t0, 0x2
    /* 1AAD8 801546D0 92510508 */  j          .L80154648
    /* 1AADC 801546D4 0100C624 */   addiu     $a2, $a2, 0x1
  .L801546D8:
    /* 1AAE0 801546D8 0800E003 */  jr         $ra
    /* 1AAE4 801546DC 00000000 */   nop
endlabel DRLG_L4SetWalls__Fv
