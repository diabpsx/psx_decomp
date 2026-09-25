.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching OperateWeaponRack__FiiUc, 0x1A8

glabel OperateWeaponRack__FiiUc
    /* 4D610 8005D610 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 4D614 8005D614 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 4D618 8005D618 21988000 */  addu       $s3, $a0, $zero
    /* 4D61C 8005D61C 2000B0AF */  sw         $s0, 0x20($sp)
    /* 4D620 8005D620 2180A000 */  addu       $s0, $a1, $zero
    /* 4D624 8005D624 2400B1AF */  sw         $s1, 0x24($sp)
    /* 4D628 8005D628 21880000 */  addu       $s1, $zero, $zero
    /* 4D62C 8005D62C 40101000 */  sll        $v0, $s0, 1
    /* 4D630 8005D630 21105000 */  addu       $v0, $v0, $s0
    /* 4D634 8005D634 80100200 */  sll        $v0, $v0, 2
    /* 4D638 8005D638 23105000 */  subu       $v0, $v0, $s0
    /* 4D63C 8005D63C 80180200 */  sll        $v1, $v0, 2
    /* 4D640 8005D640 3000BFAF */  sw         $ra, 0x30($sp)
    /* 4D644 8005D644 2800B2AF */  sw         $s2, 0x28($sp)
    /* 4D648 8005D648 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 4D64C 8005D64C 21082300 */  addu       $at, $at, $v1
    /* 4D650 8005D650 6F8C2280 */  lb         $v0, %lo(object + 0x23)($at)
    /* 4D654 8005D654 00000000 */  nop
    /* 4D658 8005D658 4F004010 */  beqz       $v0, .L8005D798
    /* 4D65C 8005D65C 2190C000 */   addu      $s2, $a2, $zero
    /* 4D660 8005D660 0E80013C */  lui        $at, %hi(object + 0x4)
    /* 4D664 8005D664 21082300 */  addu       $at, $at, $v1
    /* 4D668 8005D668 508C248C */  lw         $a0, %lo(object + 0x4)($at)
    /* 4D66C 8005D66C B3F6000C */  jal        SetRndSeed__Fl
    /* 4D670 8005D670 00000000 */   nop
    /* 4D674 8005D674 C9F6000C */  jal        ENG_random__Fl
    /* 4D678 8005D678 04000424 */   addiu     $a0, $zero, 0x4
    /* 4D67C 8005D67C 01004324 */  addiu      $v1, $v0, 0x1
    /* 4D680 8005D680 02000224 */  addiu      $v0, $zero, 0x2
    /* 4D684 8005D684 10006210 */  beq        $v1, $v0, .L8005D6C8
    /* 4D688 8005D688 03006228 */   slti      $v0, $v1, 0x3
    /* 4D68C 8005D68C 05004010 */  beqz       $v0, .L8005D6A4
    /* 4D690 8005D690 01000224 */   addiu     $v0, $zero, 0x1
    /* 4D694 8005D694 0A006210 */  beq        $v1, $v0, .L8005D6C0
    /* 4D698 8005D698 40101000 */   sll       $v0, $s0, 1
    /* 4D69C 8005D69C B8750108 */  j          .L8005D6E0
    /* 4D6A0 8005D6A0 00000000 */   nop
  .L8005D6A4:
    /* 4D6A4 8005D6A4 03000224 */  addiu      $v0, $zero, 0x3
    /* 4D6A8 8005D6A8 09006210 */  beq        $v1, $v0, .L8005D6D0
    /* 4D6AC 8005D6AC 04000224 */   addiu     $v0, $zero, 0x4
    /* 4D6B0 8005D6B0 09006210 */  beq        $v1, $v0, .L8005D6D8
    /* 4D6B4 8005D6B4 40101000 */   sll       $v0, $s0, 1
    /* 4D6B8 8005D6B8 B8750108 */  j          .L8005D6E0
    /* 4D6BC 8005D6BC 00000000 */   nop
  .L8005D6C0:
    /* 4D6C0 8005D6C0 B7750108 */  j          .L8005D6DC
    /* 4D6C4 8005D6C4 01001124 */   addiu     $s1, $zero, 0x1
  .L8005D6C8:
    /* 4D6C8 8005D6C8 B7750108 */  j          .L8005D6DC
    /* 4D6CC 8005D6CC 02001124 */   addiu     $s1, $zero, 0x2
  .L8005D6D0:
    /* 4D6D0 8005D6D0 B7750108 */  j          .L8005D6DC
    /* 4D6D4 8005D6D4 03001124 */   addiu     $s1, $zero, 0x3
  .L8005D6D8:
    /* 4D6D8 8005D6D8 04001124 */  addiu      $s1, $zero, 0x4
  .L8005D6DC:
    /* 4D6DC 8005D6DC 40101000 */  sll        $v0, $s0, 1
  .L8005D6E0:
    /* 4D6E0 8005D6E0 21105000 */  addu       $v0, $v0, $s0
    /* 4D6E4 8005D6E4 80100200 */  sll        $v0, $v0, 2
    /* 4D6E8 8005D6E8 23105000 */  subu       $v0, $v0, $s0
    /* 4D6EC 8005D6EC 80180200 */  sll        $v1, $v0, 2
    /* 4D6F0 8005D6F0 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 4D6F4 8005D6F4 21082300 */  addu       $at, $at, $v1
    /* 4D6F8 8005D6F8 6D8C2290 */  lbu        $v0, %lo(object + 0x21)($at)
    /* 4D6FC 8005D6FC 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 4D700 8005D700 21082300 */  addu       $at, $at, $v1
    /* 4D704 8005D704 6F8C20A0 */  sb         $zero, %lo(object + 0x23)($at)
    /* 4D708 8005D708 01004224 */  addiu      $v0, $v0, 0x1
    /* 4D70C 8005D70C 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 4D710 8005D710 21082300 */  addu       $at, $at, $v1
    /* 4D714 8005D714 6D8C22A0 */  sb         $v0, %lo(object + 0x21)($at)
    /* 4D718 8005D718 1280023C */  lui        $v0, %hi(deltaload)
    /* 4D71C 8005D71C 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 4D720 8005D720 00000000 */  nop
    /* 4D724 8005D724 1C004014 */  bnez       $v0, .L8005D798
    /* 4D728 8005D728 00000000 */   nop
    /* 4D72C 8005D72C 1280023C */  lui        $v0, %hi(leveltype)
    /* 4D730 8005D730 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 4D734 8005D734 00000000 */  nop
    /* 4D738 8005D738 0200422C */  sltiu      $v0, $v0, 0x2
    /* 4D73C 8005D73C 02004014 */  bnez       $v0, .L8005D748
    /* 4D740 8005D740 21300000 */   addu      $a2, $zero, $zero
    /* 4D744 8005D744 01000624 */  addiu      $a2, $zero, 0x1
  .L8005D748:
    /* 4D748 8005D748 21382002 */  addu       $a3, $s1, $zero
    /* 4D74C 8005D74C 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 4D750 8005D750 21082300 */  addu       $at, $at, $v1
    /* 4D754 8005D754 6B8C2480 */  lb         $a0, %lo(object + 0x1F)($at)
    /* 4D758 8005D758 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 4D75C 8005D75C 21082300 */  addu       $at, $at, $v1
    /* 4D760 8005D760 6C8C2580 */  lb         $a1, %lo(object + 0x20)($at)
    /* 4D764 8005D764 FF004232 */  andi       $v0, $s2, 0xFF
    /* 4D768 8005D768 1000A0AF */  sw         $zero, 0x10($sp)
    /* 4D76C 8005D76C 1400A2AF */  sw         $v0, 0x14($sp)
    /* 4D770 8005D770 B113010C */  jal        CreateTypeItem__FiiUciiUcUc
    /* 4D774 8005D774 1800A0AF */   sw        $zero, 0x18($sp)
    /* 4D778 8005D778 1280023C */  lui        $v0, %hi(myplr)
    /* 4D77C 8005D77C 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 4D780 8005D780 00000000 */  nop
    /* 4D784 8005D784 04006216 */  bne        $s3, $v0, .L8005D798
    /* 4D788 8005D788 21200000 */   addu      $a0, $zero, $zero
    /* 4D78C 8005D78C 2D000524 */  addiu      $a1, $zero, 0x2D
    /* 4D790 8005D790 0D3E010C */  jal        NetSendCmdParam1__FUcUcUs
    /* 4D794 8005D794 FFFF0632 */   andi      $a2, $s0, 0xFFFF
  .L8005D798:
    /* 4D798 8005D798 3000BF8F */  lw         $ra, 0x30($sp)
    /* 4D79C 8005D79C 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 4D7A0 8005D7A0 2800B28F */  lw         $s2, 0x28($sp)
    /* 4D7A4 8005D7A4 2400B18F */  lw         $s1, 0x24($sp)
    /* 4D7A8 8005D7A8 2000B08F */  lw         $s0, 0x20($sp)
    /* 4D7AC 8005D7AC 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 4D7B0 8005D7B0 0800E003 */  jr         $ra
    /* 4D7B4 8005D7B4 00000000 */   nop
endlabel OperateWeaponRack__FiiUc
