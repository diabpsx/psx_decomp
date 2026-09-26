.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L4Corners__Fv, 0x94

glabel DRLG_L4Corners__Fv
    /* 1A8C4 801544BC 01000924 */  addiu      $t1, $zero, 0x1
    /* 1A8C8 801544C0 0E800A3C */  lui        $t2, %hi(dungeon)
    /* 1A8CC 801544C4 C4404A25 */  addiu      $t2, $t2, %lo(dungeon)
    /* 1A8D0 801544C8 60004B25 */  addiu      $t3, $t2, 0x60
  .L801544CC:
    /* 1A8D4 801544CC 01000724 */  addiu      $a3, $zero, 0x1
    /* 1A8D8 801544D0 40400900 */  sll        $t0, $t1, 1
    /* 1A8DC 801544D4 60006625 */  addiu      $a2, $t3, 0x60
    /* 1A8E0 801544D8 60004525 */  addiu      $a1, $t2, 0x60
  .L801544DC:
    /* 1A8E4 801544DC 21180501 */  addu       $v1, $t0, $a1
    /* 1A8E8 801544E0 00006494 */  lhu        $a0, 0x0($v1)
    /* 1A8EC 801544E4 00000000 */  nop
    /* 1A8F0 801544E8 EEFF8224 */  addiu      $v0, $a0, -0x12
    /* 1A8F4 801544EC 0D00422C */  sltiu      $v0, $v0, 0xD
    /* 1A8F8 801544F0 0C004010 */  beqz       $v0, .L80154524
    /* 1A8FC 801544F4 21100601 */   addu      $v0, $t0, $a2
    /* 1A900 801544F8 00004294 */  lhu        $v0, 0x0($v0)
    /* 1A904 801544FC 00000000 */  nop
    /* 1A908 80154500 1200422C */  sltiu      $v0, $v0, 0x12
    /* 1A90C 80154504 06004014 */  bnez       $v0, .L80154520
    /* 1A910 80154508 62008224 */   addiu     $v0, $a0, 0x62
    /* 1A914 8015450C 02006294 */  lhu        $v0, 0x2($v1)
    /* 1A918 80154510 00000000 */  nop
    /* 1A91C 80154514 1200422C */  sltiu      $v0, $v0, 0x12
    /* 1A920 80154518 02004010 */  beqz       $v0, .L80154524
    /* 1A924 8015451C 62008224 */   addiu     $v0, $a0, 0x62
  .L80154520:
    /* 1A928 80154520 000062A4 */  sh         $v0, 0x0($v1)
  .L80154524:
    /* 1A92C 80154524 6000C624 */  addiu      $a2, $a2, 0x60
    /* 1A930 80154528 0100E724 */  addiu      $a3, $a3, 0x1
    /* 1A934 8015452C 2700E228 */  slti       $v0, $a3, 0x27
    /* 1A938 80154530 EAFF4014 */  bnez       $v0, .L801544DC
    /* 1A93C 80154534 6000A524 */   addiu     $a1, $a1, 0x60
    /* 1A940 80154538 01002925 */  addiu      $t1, $t1, 0x1
    /* 1A944 8015453C 27002229 */  slti       $v0, $t1, 0x27
    /* 1A948 80154540 E2FF4014 */  bnez       $v0, .L801544CC
    /* 1A94C 80154544 00000000 */   nop
    /* 1A950 80154548 0800E003 */  jr         $ra
    /* 1A954 8015454C 00000000 */   nop
endlabel DRLG_L4Corners__Fv
