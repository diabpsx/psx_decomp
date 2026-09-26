.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L4SetSPRoom__Fii, 0x100

glabel DRLG_L4SetSPRoom__Fii
    /* 15AFC 8014F6F4 F0FFBD27 */  addiu      $sp, $sp, -0x10
    /* 15B00 8014F6F8 21500000 */  addu       $t2, $zero, $zero
    /* 15B04 8014F6FC 1280083C */  lui        $t0, %hi(pSetPiece)
    /* 15B08 8014F700 DCC0088D */  lw         $t0, %lo(pSetPiece)($t0)
    /* 15B0C 8014F704 1280023C */  lui        $v0, %hi(pSetPiece)
    /* 15B10 8014F708 DCC0428C */  lw         $v0, %lo(pSetPiece)($v0)
    /* 15B14 8014F70C 00000C91 */  lbu        $t4, 0x0($t0)
    /* 15B18 8014F710 02000D91 */  lbu        $t5, 0x2($t0)
    /* 15B1C 8014F714 1280013C */  lui        $at, %hi(setpc_x)
    /* 15B20 8014F718 E4C024AC */  sw         $a0, %lo(setpc_x)($at)
    /* 15B24 8014F71C 1280013C */  lui        $at, %hi(setpc_y)
    /* 15B28 8014F720 E8C025AC */  sw         $a1, %lo(setpc_y)($at)
    /* 15B2C 8014F724 1280013C */  lui        $at, %hi(setpc_w)
    /* 15B30 8014F728 ECC02CAC */  sw         $t4, %lo(setpc_w)($at)
    /* 15B34 8014F72C 1280013C */  lui        $at, %hi(setpc_h)
    /* 15B38 8014F730 F0C02DAC */  sw         $t5, %lo(setpc_h)($at)
    /* 15B3C 8014F734 2C00A011 */  beqz       $t5, .L8014F7E8
    /* 15B40 8014F738 04004824 */   addiu     $t0, $v0, 0x4
    /* 15B44 8014F73C 0E800E3C */  lui        $t6, %hi(dungeon)
    /* 15B48 8014F740 C440CE25 */  addiu      $t6, $t6, %lo(dungeon)
    /* 15B4C 8014F744 06000F24 */  addiu      $t7, $zero, 0x6
  .L8014F748:
    /* 15B50 8014F748 23008011 */  beqz       $t4, .L8014F7D8
    /* 15B54 8014F74C 21380000 */   addu      $a3, $zero, $zero
    /* 15B58 8014F750 2118AA00 */  addu       $v1, $a1, $t2
    /* 15B5C 8014F754 40480300 */  sll        $t1, $v1, 1
    /* 15B60 8014F758 80100300 */  sll        $v0, $v1, 2
    /* 15B64 8014F75C 21104300 */  addu       $v0, $v0, $v1
    /* 15B68 8014F760 C0580200 */  sll        $t3, $v0, 3
    /* 15B6C 8014F764 21308000 */  addu       $a2, $a0, $zero
  .L8014F768:
    /* 15B70 8014F768 00000391 */  lbu        $v1, 0x0($t0)
    /* 15B74 8014F76C 00000000 */  nop
    /* 15B78 8014F770 0F006010 */  beqz       $v1, .L8014F7B0
    /* 15B7C 8014F774 40100600 */   sll       $v0, $a2, 1
    /* 15B80 8014F778 21104600 */  addu       $v0, $v0, $a2
    /* 15B84 8014F77C 40110200 */  sll        $v0, $v0, 5
    /* 15B88 8014F780 21104E00 */  addu       $v0, $v0, $t6
    /* 15B8C 8014F784 21102201 */  addu       $v0, $t1, $v0
    /* 15B90 8014F788 000043A4 */  sh         $v1, 0x0($v0)
    /* 15B94 8014F78C 1280033C */  lui        $v1, %hi(mydflags)
    /* 15B98 8014F790 D8C0638C */  lw         $v1, %lo(mydflags)($v1)
    /* 15B9C 8014F794 21106601 */  addu       $v0, $t3, $a2
    /* 15BA0 8014F798 21186200 */  addu       $v1, $v1, $v0
    /* 15BA4 8014F79C 00006290 */  lbu        $v0, 0x0($v1)
    /* 15BA8 8014F7A0 00000000 */  nop
    /* 15BAC 8014F7A4 80004234 */  ori        $v0, $v0, 0x80
    /* 15BB0 8014F7A8 F13D0508 */  j          .L8014F7C4
    /* 15BB4 8014F7AC 000062A0 */   sb        $v0, 0x0($v1)
  .L8014F7B0:
    /* 15BB8 8014F7B0 21104600 */  addu       $v0, $v0, $a2
    /* 15BBC 8014F7B4 40110200 */  sll        $v0, $v0, 5
    /* 15BC0 8014F7B8 21104E00 */  addu       $v0, $v0, $t6
    /* 15BC4 8014F7BC 21102201 */  addu       $v0, $t1, $v0
    /* 15BC8 8014F7C0 00004FA4 */  sh         $t7, 0x0($v0)
  .L8014F7C4:
    /* 15BCC 8014F7C4 02000825 */  addiu      $t0, $t0, 0x2
    /* 15BD0 8014F7C8 0100E724 */  addiu      $a3, $a3, 0x1
    /* 15BD4 8014F7CC 2A10EC00 */  slt        $v0, $a3, $t4
    /* 15BD8 8014F7D0 E5FF4014 */  bnez       $v0, .L8014F768
    /* 15BDC 8014F7D4 0100C624 */   addiu     $a2, $a2, 0x1
  .L8014F7D8:
    /* 15BE0 8014F7D8 01004A25 */  addiu      $t2, $t2, 0x1
    /* 15BE4 8014F7DC 2A104D01 */  slt        $v0, $t2, $t5
    /* 15BE8 8014F7E0 D9FF4014 */  bnez       $v0, .L8014F748
    /* 15BEC 8014F7E4 00000000 */   nop
  .L8014F7E8:
    /* 15BF0 8014F7E8 1000BD27 */  addiu      $sp, $sp, 0x10
    /* 15BF4 8014F7EC 0800E003 */  jr         $ra
    /* 15BF8 8014F7F0 00000000 */   nop
endlabel DRLG_L4SetSPRoom__Fii
