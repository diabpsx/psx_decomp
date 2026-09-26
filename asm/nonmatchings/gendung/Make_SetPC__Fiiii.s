.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Make_SetPC__Fiiii, 0x90

glabel Make_SetPC__Fiiii
    /* 20764 8015A35C F0FFBD27 */  addiu      $sp, $sp, -0x10
    /* 20768 8015A360 21480000 */  addu       $t1, $zero, $zero
    /* 2076C 8015A364 40300600 */  sll        $a2, $a2, 1
    /* 20770 8015A368 40380700 */  sll        $a3, $a3, 1
    /* 20774 8015A36C 40200400 */  sll        $a0, $a0, 1
    /* 20778 8015A370 10008424 */  addiu      $a0, $a0, 0x10
    /* 2077C 8015A374 40280500 */  sll        $a1, $a1, 1
    /* 20780 8015A378 1900E018 */  blez       $a3, .L8015A3E0
    /* 20784 8015A37C 1000A524 */   addiu     $a1, $a1, 0x10
  .L8015A380:
    /* 20788 8015A380 1300C018 */  blez       $a2, .L8015A3D0
    /* 2078C 8015A384 21400000 */   addu      $t0, $zero, $zero
    /* 20790 8015A388 2110A900 */  addu       $v0, $a1, $t1
    /* 20794 8015A38C C0500200 */  sll        $t2, $v0, 3
    /* 20798 8015A390 21188800 */  addu       $v1, $a0, $t0
  .L8015A394:
    /* 2079C 8015A394 C0100300 */  sll        $v0, $v1, 3
    /* 207A0 8015A398 23104300 */  subu       $v0, $v0, $v1
    /* 207A4 8015A39C C0110200 */  sll        $v0, $v0, 7
    /* 207A8 8015A3A0 21104201 */  addu       $v0, $t2, $v0
    /* 207AC 8015A3A4 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 207B0 8015A3A8 21082200 */  addu       $at, $at, $v0
    /* 207B4 8015A3AC 2E7A2390 */  lbu        $v1, %lo(dung_map + 0x6)($at)
    /* 207B8 8015A3B0 01000825 */  addiu      $t0, $t0, 0x1
    /* 207BC 8015A3B4 08006334 */  ori        $v1, $v1, 0x8
    /* 207C0 8015A3B8 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 207C4 8015A3BC 21082200 */  addu       $at, $at, $v0
    /* 207C8 8015A3C0 2E7A23A0 */  sb         $v1, %lo(dung_map + 0x6)($at)
    /* 207CC 8015A3C4 2A100601 */  slt        $v0, $t0, $a2
    /* 207D0 8015A3C8 F2FF4014 */  bnez       $v0, .L8015A394
    /* 207D4 8015A3CC 21188800 */   addu      $v1, $a0, $t0
  .L8015A3D0:
    /* 207D8 8015A3D0 01002925 */  addiu      $t1, $t1, 0x1
    /* 207DC 8015A3D4 2A102701 */  slt        $v0, $t1, $a3
    /* 207E0 8015A3D8 E9FF4014 */  bnez       $v0, .L8015A380
    /* 207E4 8015A3DC 00000000 */   nop
  .L8015A3E0:
    /* 207E8 8015A3E0 1000BD27 */  addiu      $sp, $sp, 0x10
    /* 207EC 8015A3E4 0800E003 */  jr         $ra
    /* 207F0 8015A3E8 00000000 */   nop
endlabel Make_SetPC__Fiiii
