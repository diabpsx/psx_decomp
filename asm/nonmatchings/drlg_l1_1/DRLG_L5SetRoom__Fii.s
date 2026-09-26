.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L5SetRoom__Fii, 0x100

glabel DRLG_L5SetRoom__Fii
    /* 5900 8013F4F8 F0FFBD27 */  addiu      $sp, $sp, -0x10
    /* 5904 8013F4FC 21500000 */  addu       $t2, $zero, $zero
    /* 5908 8013F500 1280083C */  lui        $t0, %hi(pSetPiece)
    /* 590C 8013F504 DCC0088D */  lw         $t0, %lo(pSetPiece)($t0)
    /* 5910 8013F508 1280023C */  lui        $v0, %hi(pSetPiece)
    /* 5914 8013F50C DCC0428C */  lw         $v0, %lo(pSetPiece)($v0)
    /* 5918 8013F510 00000C91 */  lbu        $t4, 0x0($t0)
    /* 591C 8013F514 02000D91 */  lbu        $t5, 0x2($t0)
    /* 5920 8013F518 1280013C */  lui        $at, %hi(setpc_x)
    /* 5924 8013F51C E4C024AC */  sw         $a0, %lo(setpc_x)($at)
    /* 5928 8013F520 1280013C */  lui        $at, %hi(setpc_y)
    /* 592C 8013F524 E8C025AC */  sw         $a1, %lo(setpc_y)($at)
    /* 5930 8013F528 1280013C */  lui        $at, %hi(setpc_w)
    /* 5934 8013F52C ECC02CAC */  sw         $t4, %lo(setpc_w)($at)
    /* 5938 8013F530 1280013C */  lui        $at, %hi(setpc_h)
    /* 593C 8013F534 F0C02DAC */  sw         $t5, %lo(setpc_h)($at)
    /* 5940 8013F538 2C00A011 */  beqz       $t5, .L8013F5EC
    /* 5944 8013F53C 04004824 */   addiu     $t0, $v0, 0x4
    /* 5948 8013F540 0E800E3C */  lui        $t6, %hi(dungeon)
    /* 594C 8013F544 C440CE25 */  addiu      $t6, $t6, %lo(dungeon)
    /* 5950 8013F548 0D000F24 */  addiu      $t7, $zero, 0xD
  .L8013F54C:
    /* 5954 8013F54C 23008011 */  beqz       $t4, .L8013F5DC
    /* 5958 8013F550 21380000 */   addu      $a3, $zero, $zero
    /* 595C 8013F554 2118AA00 */  addu       $v1, $a1, $t2
    /* 5960 8013F558 40480300 */  sll        $t1, $v1, 1
    /* 5964 8013F55C 80100300 */  sll        $v0, $v1, 2
    /* 5968 8013F560 21104300 */  addu       $v0, $v0, $v1
    /* 596C 8013F564 C0580200 */  sll        $t3, $v0, 3
    /* 5970 8013F568 21308000 */  addu       $a2, $a0, $zero
  .L8013F56C:
    /* 5974 8013F56C 00000391 */  lbu        $v1, 0x0($t0)
    /* 5978 8013F570 00000000 */  nop
    /* 597C 8013F574 0F006010 */  beqz       $v1, .L8013F5B4
    /* 5980 8013F578 40100600 */   sll       $v0, $a2, 1
    /* 5984 8013F57C 21104600 */  addu       $v0, $v0, $a2
    /* 5988 8013F580 40110200 */  sll        $v0, $v0, 5
    /* 598C 8013F584 21104E00 */  addu       $v0, $v0, $t6
    /* 5990 8013F588 21102201 */  addu       $v0, $t1, $v0
    /* 5994 8013F58C 000043A4 */  sh         $v1, 0x0($v0)
    /* 5998 8013F590 1280033C */  lui        $v1, %hi(mydflags)
    /* 599C 8013F594 D8C0638C */  lw         $v1, %lo(mydflags)($v1)
    /* 59A0 8013F598 21106601 */  addu       $v0, $t3, $a2
    /* 59A4 8013F59C 21186200 */  addu       $v1, $v1, $v0
    /* 59A8 8013F5A0 00006290 */  lbu        $v0, 0x0($v1)
    /* 59AC 8013F5A4 00000000 */  nop
    /* 59B0 8013F5A8 80004234 */  ori        $v0, $v0, 0x80
    /* 59B4 8013F5AC 72FD0408 */  j          .L8013F5C8
    /* 59B8 8013F5B0 000062A0 */   sb        $v0, 0x0($v1)
  .L8013F5B4:
    /* 59BC 8013F5B4 21104600 */  addu       $v0, $v0, $a2
    /* 59C0 8013F5B8 40110200 */  sll        $v0, $v0, 5
    /* 59C4 8013F5BC 21104E00 */  addu       $v0, $v0, $t6
    /* 59C8 8013F5C0 21102201 */  addu       $v0, $t1, $v0
    /* 59CC 8013F5C4 00004FA4 */  sh         $t7, 0x0($v0)
  .L8013F5C8:
    /* 59D0 8013F5C8 02000825 */  addiu      $t0, $t0, 0x2
    /* 59D4 8013F5CC 0100E724 */  addiu      $a3, $a3, 0x1
    /* 59D8 8013F5D0 2A10EC00 */  slt        $v0, $a3, $t4
    /* 59DC 8013F5D4 E5FF4014 */  bnez       $v0, .L8013F56C
    /* 59E0 8013F5D8 0100C624 */   addiu     $a2, $a2, 0x1
  .L8013F5DC:
    /* 59E4 8013F5DC 01004A25 */  addiu      $t2, $t2, 0x1
    /* 59E8 8013F5E0 2A104D01 */  slt        $v0, $t2, $t5
    /* 59EC 8013F5E4 D9FF4014 */  bnez       $v0, .L8013F54C
    /* 59F0 8013F5E8 00000000 */   nop
  .L8013F5EC:
    /* 59F4 8013F5EC 1000BD27 */  addiu      $sp, $sp, 0x10
    /* 59F8 8013F5F0 0800E003 */  jr         $ra
    /* 59FC 8013F5F4 00000000 */   nop
endlabel DRLG_L5SetRoom__Fii
