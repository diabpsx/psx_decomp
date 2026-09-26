.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetDirection8__Fiiii, 0x21C

glabel GetDirection8__Fiiii
    /* 8B8 8013A4B0 A8FEBD27 */  addiu      $sp, $sp, -0x158
    /* 8BC 8013A4B4 4C01B7AF */  sw         $s7, 0x14C($sp)
    /* 8C0 8013A4B8 21B88000 */  addu       $s7, $a0, $zero
    /* 8C4 8013A4BC 3401B1AF */  sw         $s1, 0x134($sp)
    /* 8C8 8013A4C0 2188A000 */  addu       $s1, $a1, $zero
    /* 8CC 8013A4C4 5001BEAF */  sw         $fp, 0x150($sp)
    /* 8D0 8013A4C8 21F0C000 */  addu       $fp, $a2, $zero
    /* 8D4 8013A4CC 3801B2AF */  sw         $s2, 0x138($sp)
    /* 8D8 8013A4D0 2190E000 */  addu       $s2, $a3, $zero
    /* 8DC 8013A4D4 1000A727 */  addiu      $a3, $sp, 0x10
    /* 8E0 8013A4D8 1280063C */  lui        $a2, %hi(D_80119E30)
    /* 8E4 8013A4DC 309EC624 */  addiu      $a2, $a2, %lo(D_80119E30)
    /* 8E8 8013A4E0 2510E600 */  or         $v0, $a3, $a2
    /* 8EC 8013A4E4 03004230 */  andi       $v0, $v0, 0x3
    /* 8F0 8013A4E8 5401BFAF */  sw         $ra, 0x154($sp)
    /* 8F4 8013A4EC 4801B6AF */  sw         $s6, 0x148($sp)
    /* 8F8 8013A4F0 4401B5AF */  sw         $s5, 0x144($sp)
    /* 8FC 8013A4F4 4001B4AF */  sw         $s4, 0x140($sp)
    /* 900 8013A4F8 3C01B3AF */  sw         $s3, 0x13C($sp)
    /* 904 8013A4FC 17004010 */  beqz       $v0, .L8013A55C
    /* 908 8013A500 3001B0AF */   sw        $s0, 0x130($sp)
    /* 90C 8013A504 0001C824 */  addiu      $t0, $a2, 0x100
  .L8013A508:
    /* 910 8013A508 0300C288 */  lwl        $v0, 0x3($a2)
    /* 914 8013A50C 0000C298 */  lwr        $v0, 0x0($a2)
    /* 918 8013A510 0700C388 */  lwl        $v1, 0x7($a2)
    /* 91C 8013A514 0400C398 */  lwr        $v1, 0x4($a2)
    /* 920 8013A518 0B00C488 */  lwl        $a0, 0xB($a2)
    /* 924 8013A51C 0800C498 */  lwr        $a0, 0x8($a2)
    /* 928 8013A520 0F00C588 */  lwl        $a1, 0xF($a2)
    /* 92C 8013A524 0C00C598 */  lwr        $a1, 0xC($a2)
    /* 930 8013A528 0300E2A8 */  swl        $v0, 0x3($a3)
    /* 934 8013A52C 0000E2B8 */  swr        $v0, 0x0($a3)
    /* 938 8013A530 0700E3A8 */  swl        $v1, 0x7($a3)
    /* 93C 8013A534 0400E3B8 */  swr        $v1, 0x4($a3)
    /* 940 8013A538 0B00E4A8 */  swl        $a0, 0xB($a3)
    /* 944 8013A53C 0800E4B8 */  swr        $a0, 0x8($a3)
    /* 948 8013A540 0F00E5A8 */  swl        $a1, 0xF($a3)
    /* 94C 8013A544 0C00E5B8 */  swr        $a1, 0xC($a3)
    /* 950 8013A548 1000C624 */  addiu      $a2, $a2, 0x10
    /* 954 8013A54C EEFFC814 */  bne        $a2, $t0, .L8013A508
    /* 958 8013A550 1000E724 */   addiu     $a3, $a3, 0x10
    /* 95C 8013A554 63E90408 */  j          .L8013A58C
    /* 960 8013A558 00000000 */   nop
  .L8013A55C:
    /* 964 8013A55C 0001C824 */  addiu      $t0, $a2, 0x100
  .L8013A560:
    /* 968 8013A560 0000C28C */  lw         $v0, 0x0($a2)
    /* 96C 8013A564 0400C38C */  lw         $v1, 0x4($a2)
    /* 970 8013A568 0800C48C */  lw         $a0, 0x8($a2)
    /* 974 8013A56C 0C00C58C */  lw         $a1, 0xC($a2)
    /* 978 8013A570 0000E2AC */  sw         $v0, 0x0($a3)
    /* 97C 8013A574 0400E3AC */  sw         $v1, 0x4($a3)
    /* 980 8013A578 0800E4AC */  sw         $a0, 0x8($a3)
    /* 984 8013A57C 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 988 8013A580 1000C624 */  addiu      $a2, $a2, 0x10
    /* 98C 8013A584 F6FFC814 */  bne        $a2, $t0, .L8013A560
    /* 990 8013A588 1000E724 */   addiu     $a3, $a3, 0x10
  .L8013A58C:
    /* 994 8013A58C 1280053C */  lui        $a1, %hi(D_8011C258)
    /* 998 8013A590 58C2A524 */  addiu      $a1, $a1, %lo(D_8011C258)
    /* 99C 8013A594 0000A280 */  lb         $v0, 0x0($a1)
    /* 9A0 8013A598 0100A380 */  lb         $v1, 0x1($a1)
    /* 9A4 8013A59C 0200A480 */  lb         $a0, 0x2($a1)
    /* 9A8 8013A5A0 1001A2A3 */  sb         $v0, 0x110($sp)
    /* 9AC 8013A5A4 1101A3A3 */  sb         $v1, 0x111($sp)
    /* 9B0 8013A5A8 1201A4A3 */  sb         $a0, 0x112($sp)
    /* 9B4 8013A5AC 1280053C */  lui        $a1, %hi(D_8011C25C)
    /* 9B8 8013A5B0 5CC2A524 */  addiu      $a1, $a1, %lo(D_8011C25C)
    /* 9BC 8013A5B4 0000A280 */  lb         $v0, 0x0($a1)
    /* 9C0 8013A5B8 0100A380 */  lb         $v1, 0x1($a1)
    /* 9C4 8013A5BC 0200A480 */  lb         $a0, 0x2($a1)
    /* 9C8 8013A5C0 1801A2A3 */  sb         $v0, 0x118($sp)
    /* 9CC 8013A5C4 1901A3A3 */  sb         $v1, 0x119($sp)
    /* 9D0 8013A5C8 1A01A4A3 */  sb         $a0, 0x11A($sp)
    /* 9D4 8013A5CC 1280053C */  lui        $a1, %hi(D_8011C260)
    /* 9D8 8013A5D0 60C2A524 */  addiu      $a1, $a1, %lo(D_8011C260)
    /* 9DC 8013A5D4 0000A280 */  lb         $v0, 0x0($a1)
    /* 9E0 8013A5D8 0100A380 */  lb         $v1, 0x1($a1)
    /* 9E4 8013A5DC 0200A480 */  lb         $a0, 0x2($a1)
    /* 9E8 8013A5E0 2001A2A3 */  sb         $v0, 0x120($sp)
    /* 9EC 8013A5E4 2101A3A3 */  sb         $v1, 0x121($sp)
    /* 9F0 8013A5E8 2201A4A3 */  sb         $a0, 0x122($sp)
    /* 9F4 8013A5EC 1280053C */  lui        $a1, %hi(D_8011C264)
    /* 9F8 8013A5F0 64C2A524 */  addiu      $a1, $a1, %lo(D_8011C264)
    /* 9FC 8013A5F4 0000A280 */  lb         $v0, 0x0($a1)
    /* A00 8013A5F8 0100A380 */  lb         $v1, 0x1($a1)
    /* A04 8013A5FC 0200A480 */  lb         $a0, 0x2($a1)
    /* A08 8013A600 2801A2A3 */  sb         $v0, 0x128($sp)
    /* A0C 8013A604 2901A3A3 */  sb         $v1, 0x129($sp)
    /* A10 8013A608 2A01A4A3 */  sb         $a0, 0x12A($sp)
    /* A14 8013A60C 6D41000C */  jal        abs
    /* A18 8013A610 2320D703 */   subu      $a0, $fp, $s7
    /* A1C 8013A614 21804000 */  addu       $s0, $v0, $zero
    /* A20 8013A618 1001B627 */  addiu      $s6, $sp, 0x110
    /* A24 8013A61C 1801B527 */  addiu      $s5, $sp, 0x118
    /* A28 8013A620 2001B427 */  addiu      $s4, $sp, 0x120
    /* A2C 8013A624 1000022A */  slti       $v0, $s0, 0x10
    /* A30 8013A628 02004014 */  bnez       $v0, .L8013A634
    /* A34 8013A62C 2801B327 */   addiu     $s3, $sp, 0x128
    /* A38 8013A630 0F001024 */  addiu      $s0, $zero, 0xF
  .L8013A634:
    /* A3C 8013A634 6D41000C */  jal        abs
    /* A40 8013A638 23205102 */   subu      $a0, $s2, $s1
    /* A44 8013A63C 21184000 */  addu       $v1, $v0, $zero
    /* A48 8013A640 10006228 */  slti       $v0, $v1, 0x10
    /* A4C 8013A644 03004014 */  bnez       $v0, .L8013A654
    /* A50 8013A648 00110300 */   sll       $v0, $v1, 4
    /* A54 8013A64C 0F000324 */  addiu      $v1, $zero, 0xF
    /* A58 8013A650 00110300 */  sll        $v0, $v1, 4
  .L8013A654:
    /* A5C 8013A654 1000A327 */  addiu      $v1, $sp, 0x10
    /* A60 8013A658 21104300 */  addu       $v0, $v0, $v1
    /* A64 8013A65C 21105000 */  addu       $v0, $v0, $s0
    /* A68 8013A660 00004390 */  lbu        $v1, 0x0($v0)
    /* A6C 8013A664 2A10D703 */  slt        $v0, $fp, $s7
    /* A70 8013A668 05004010 */  beqz       $v0, .L8013A680
    /* A74 8013A66C 2A105102 */   slt       $v0, $s2, $s1
    /* A78 8013A670 06004014 */  bnez       $v0, .L8013A68C
    /* A7C 8013A674 2110C302 */   addu      $v0, $s6, $v1
    /* A80 8013A678 A3E90408 */  j          .L8013A68C
    /* A84 8013A67C 2110A302 */   addu      $v0, $s5, $v1
  .L8013A680:
    /* A88 8013A680 02004014 */  bnez       $v0, .L8013A68C
    /* A8C 8013A684 21108302 */   addu      $v0, $s4, $v1
    /* A90 8013A688 21106302 */  addu       $v0, $s3, $v1
  .L8013A68C:
    /* A94 8013A68C 00004390 */  lbu        $v1, 0x0($v0)
    /* A98 8013A690 00000000 */  nop
    /* A9C 8013A694 21106000 */  addu       $v0, $v1, $zero
    /* AA0 8013A698 5401BF8F */  lw         $ra, 0x154($sp)
    /* AA4 8013A69C 5001BE8F */  lw         $fp, 0x150($sp)
    /* AA8 8013A6A0 4C01B78F */  lw         $s7, 0x14C($sp)
    /* AAC 8013A6A4 4801B68F */  lw         $s6, 0x148($sp)
    /* AB0 8013A6A8 4401B58F */  lw         $s5, 0x144($sp)
    /* AB4 8013A6AC 4001B48F */  lw         $s4, 0x140($sp)
    /* AB8 8013A6B0 3C01B38F */  lw         $s3, 0x13C($sp)
    /* ABC 8013A6B4 3801B28F */  lw         $s2, 0x138($sp)
    /* AC0 8013A6B8 3401B18F */  lw         $s1, 0x134($sp)
    /* AC4 8013A6BC 3001B08F */  lw         $s0, 0x130($sp)
    /* AC8 8013A6C0 5801BD27 */  addiu      $sp, $sp, 0x158
    /* ACC 8013A6C4 0800E003 */  jr         $ra
    /* AD0 8013A6C8 00000000 */   nop
endlabel GetDirection8__Fiiii
