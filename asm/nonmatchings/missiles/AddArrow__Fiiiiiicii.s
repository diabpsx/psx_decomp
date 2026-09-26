.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddArrow__Fiiiiiicii, 0x1C0

glabel AddArrow__Fiiiiiicii
    /* 3A60 8013D658 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 3A64 8013D65C 2400B3AF */  sw         $s3, 0x24($sp)
    /* 3A68 8013D660 21988000 */  addu       $s3, $a0, $zero
    /* 3A6C 8013D664 2800B4AF */  sw         $s4, 0x28($sp)
    /* 3A70 8013D668 21A0A000 */  addu       $s4, $a1, $zero
    /* 3A74 8013D66C 2000B2AF */  sw         $s2, 0x20($sp)
    /* 3A78 8013D670 4800B28F */  lw         $s2, 0x48($sp)
    /* 3A7C 8013D674 4C00A28F */  lw         $v0, 0x4C($sp)
    /* 3A80 8013D678 5400A48F */  lw         $a0, 0x54($sp)
    /* 3A84 8013D67C 5000A593 */  lbu        $a1, 0x50($sp)
    /* 3A88 8013D680 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 3A8C 8013D684 21A8C000 */  addu       $s5, $a2, $zero
    /* 3A90 8013D688 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 3A94 8013D68C 2188E000 */  addu       $s1, $a3, $zero
    /* 3A98 8013D690 3000BFAF */  sw         $ra, 0x30($sp)
    /* 3A9C 8013D694 0B009116 */  bne        $s4, $s1, .L8013D6C4
    /* 3AA0 8013D698 1800B0AF */   sw        $s0, 0x18($sp)
    /* 3AA4 8013D69C 0900B216 */  bne        $s5, $s2, .L8013D6C4
    /* 3AA8 8013D6A0 80100200 */   sll       $v0, $v0, 2
    /* 3AAC 8013D6A4 1080013C */  lui        $at, %hi(XDirAdd)
    /* 3AB0 8013D6A8 21082200 */  addu       $at, $at, $v0
    /* 3AB4 8013D6AC D829238C */  lw         $v1, %lo(XDirAdd)($at)
    /* 3AB8 8013D6B0 1080013C */  lui        $at, %hi(YDirAdd)
    /* 3ABC 8013D6B4 21082200 */  addu       $at, $at, $v0
    /* 3AC0 8013D6B8 F829228C */  lw         $v0, %lo(YDirAdd)($at)
    /* 3AC4 8013D6BC 21882302 */  addu       $s1, $s1, $v1
    /* 3AC8 8013D6C0 21904202 */  addu       $s2, $s2, $v0
  .L8013D6C4:
    /* 3ACC 8013D6C4 3000A014 */  bnez       $a1, .L8013D788
    /* 3AD0 8013D6C8 2130A002 */   addu      $a2, $s5, $zero
    /* 3AD4 8013D6CC 40100400 */  sll        $v0, $a0, 1
    /* 3AD8 8013D6D0 21104400 */  addu       $v0, $v0, $a0
    /* 3ADC 8013D6D4 80100200 */  sll        $v0, $v0, 2
    /* 3AE0 8013D6D8 21104400 */  addu       $v0, $v0, $a0
    /* 3AE4 8013D6DC 00110200 */  sll        $v0, $v0, 4
    /* 3AE8 8013D6E0 23104400 */  subu       $v0, $v0, $a0
    /* 3AEC 8013D6E4 80100200 */  sll        $v0, $v0, 2
    /* 3AF0 8013D6E8 21104400 */  addu       $v0, $v0, $a0
    /* 3AF4 8013D6EC C0800200 */  sll        $s0, $v0, 3
    /* 3AF8 8013D6F0 0E80013C */  lui        $at, %hi(plr + 0x19B8)
    /* 3AFC 8013D6F4 21083000 */  addu       $at, $at, $s0
    /* 3B00 8013D6F8 F0BE228C */  lw         $v0, %lo(plr + 0x19B8)($at)
    /* 3B04 8013D6FC 00000000 */  nop
    /* 3B08 8013D700 04004230 */  andi       $v0, $v0, 0x4
    /* 3B0C 8013D704 04004010 */  beqz       $v0, .L8013D718
    /* 3B10 8013D708 20000324 */   addiu     $v1, $zero, 0x20
    /* 3B14 8013D70C C9F6000C */  jal        ENG_random__Fl
    /* 3B18 8013D710 20000424 */   addiu     $a0, $zero, 0x20
    /* 3B1C 8013D714 10004324 */  addiu      $v1, $v0, 0x10
  .L8013D718:
    /* 3B20 8013D718 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 3B24 8013D71C 21083000 */  addu       $at, $at, $s0
    /* 3B28 8013D720 2EA62480 */  lb         $a0, %lo(plr + 0xF6)($at)
    /* 3B2C 8013D724 01000224 */  addiu      $v0, $zero, 0x1
    /* 3B30 8013D728 08008214 */  bne        $a0, $v0, .L8013D74C
    /* 3B34 8013D72C 00000000 */   nop
    /* 3B38 8013D730 0E80013C */  lui        $at, %hi(plr + 0x13C)
    /* 3B3C 8013D734 21083000 */  addu       $at, $at, $s0
    /* 3B40 8013D738 74A62280 */  lb         $v0, %lo(plr + 0x13C)($at)
    /* 3B44 8013D73C 00000000 */  nop
    /* 3B48 8013D740 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 3B4C 8013D744 83100200 */  sra        $v0, $v0, 2
    /* 3B50 8013D748 21186200 */  addu       $v1, $v1, $v0
  .L8013D74C:
    /* 3B54 8013D74C 08008014 */  bnez       $a0, .L8013D770
    /* 3B58 8013D750 21206002 */   addu      $a0, $s3, $zero
    /* 3B5C 8013D754 0E80013C */  lui        $at, %hi(plr + 0x13C)
    /* 3B60 8013D758 21083000 */  addu       $at, $at, $s0
    /* 3B64 8013D75C 74A62280 */  lb         $v0, %lo(plr + 0x13C)($at)
    /* 3B68 8013D760 00000000 */  nop
    /* 3B6C 8013D764 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 3B70 8013D768 C3100200 */  sra        $v0, $v0, 3
    /* 3B74 8013D76C 21186200 */  addu       $v1, $v1, $v0
  .L8013D770:
    /* 3B78 8013D770 21288002 */  addu       $a1, $s4, $zero
    /* 3B7C 8013D774 2130A002 */  addu       $a2, $s5, $zero
    /* 3B80 8013D778 21382002 */  addu       $a3, $s1, $zero
    /* 3B84 8013D77C 1000B2AF */  sw         $s2, 0x10($sp)
    /* 3B88 8013D780 E8F50408 */  j          .L8013D7A0
    /* 3B8C 8013D784 1400A3AF */   sw        $v1, 0x14($sp)
  .L8013D788:
    /* 3B90 8013D788 21206002 */  addu       $a0, $s3, $zero
    /* 3B94 8013D78C 21288002 */  addu       $a1, $s4, $zero
    /* 3B98 8013D790 21382002 */  addu       $a3, $s1, $zero
    /* 3B9C 8013D794 20000224 */  addiu      $v0, $zero, 0x20
    /* 3BA0 8013D798 1000B2AF */  sw         $s2, 0x10($sp)
    /* 3BA4 8013D79C 1400A2AF */  sw         $v0, 0x14($sp)
  .L8013D7A0:
    /* 3BA8 8013D7A0 62EA040C */  jal        GetMissileVel__Fiiiiii
    /* 3BAC 8013D7A4 00000000 */   nop
    /* 3BB0 8013D7A8 21208002 */  addu       $a0, $s4, $zero
    /* 3BB4 8013D7AC 2128A002 */  addu       $a1, $s5, $zero
    /* 3BB8 8013D7B0 21302002 */  addu       $a2, $s1, $zero
    /* 3BBC 8013D7B4 B3E9040C */  jal        GetDirection16__Fiiii
    /* 3BC0 8013D7B8 21384002 */   addu      $a3, $s2, $zero
    /* 3BC4 8013D7BC 80181300 */  sll        $v1, $s3, 2
    /* 3BC8 8013D7C0 21187300 */  addu       $v1, $v1, $s3
    /* 3BCC 8013D7C4 80180300 */  sll        $v1, $v1, 2
    /* 3BD0 8013D7C8 23187300 */  subu       $v1, $v1, $s3
    /* 3BD4 8013D7CC 80180300 */  sll        $v1, $v1, 2
    /* 3BD8 8013D7D0 01004224 */  addiu      $v0, $v0, 0x1
    /* 3BDC 8013D7D4 1080013C */  lui        $at, %hi(missile + 0x47)
    /* 3BE0 8013D7D8 21082300 */  addu       $at, $at, $v1
    /* 3BE4 8013D7DC 9F2C22A0 */  sb         $v0, %lo(missile + 0x47)($at)
    /* 3BE8 8013D7E0 00010224 */  addiu      $v0, $zero, 0x100
    /* 3BEC 8013D7E4 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 3BF0 8013D7E8 21082300 */  addu       $at, $at, $v1
    /* 3BF4 8013D7EC 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* 3BF8 8013D7F0 3000BF8F */  lw         $ra, 0x30($sp)
    /* 3BFC 8013D7F4 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 3C00 8013D7F8 2800B48F */  lw         $s4, 0x28($sp)
    /* 3C04 8013D7FC 2400B38F */  lw         $s3, 0x24($sp)
    /* 3C08 8013D800 2000B28F */  lw         $s2, 0x20($sp)
    /* 3C0C 8013D804 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 3C10 8013D808 1800B08F */  lw         $s0, 0x18($sp)
    /* 3C14 8013D80C 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 3C18 8013D810 0800E003 */  jr         $ra
    /* 3C1C 8013D814 00000000 */   nop
endlabel AddArrow__Fiiiiiicii
