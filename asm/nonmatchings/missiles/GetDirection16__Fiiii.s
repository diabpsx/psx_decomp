.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetDirection16__Fiiii, 0x21C

glabel GetDirection16__Fiiii
    /* AD4 8013A6CC A8FEBD27 */  addiu      $sp, $sp, -0x158
    /* AD8 8013A6D0 4C01B7AF */  sw         $s7, 0x14C($sp)
    /* ADC 8013A6D4 21B88000 */  addu       $s7, $a0, $zero
    /* AE0 8013A6D8 3401B1AF */  sw         $s1, 0x134($sp)
    /* AE4 8013A6DC 2188A000 */  addu       $s1, $a1, $zero
    /* AE8 8013A6E0 5001BEAF */  sw         $fp, 0x150($sp)
    /* AEC 8013A6E4 21F0C000 */  addu       $fp, $a2, $zero
    /* AF0 8013A6E8 3801B2AF */  sw         $s2, 0x138($sp)
    /* AF4 8013A6EC 2190E000 */  addu       $s2, $a3, $zero
    /* AF8 8013A6F0 1000A727 */  addiu      $a3, $sp, 0x10
    /* AFC 8013A6F4 1280063C */  lui        $a2, %hi(D_80119F30)
    /* B00 8013A6F8 309FC624 */  addiu      $a2, $a2, %lo(D_80119F30)
    /* B04 8013A6FC 2510E600 */  or         $v0, $a3, $a2
    /* B08 8013A700 03004230 */  andi       $v0, $v0, 0x3
    /* B0C 8013A704 5401BFAF */  sw         $ra, 0x154($sp)
    /* B10 8013A708 4801B6AF */  sw         $s6, 0x148($sp)
    /* B14 8013A70C 4401B5AF */  sw         $s5, 0x144($sp)
    /* B18 8013A710 4001B4AF */  sw         $s4, 0x140($sp)
    /* B1C 8013A714 3C01B3AF */  sw         $s3, 0x13C($sp)
    /* B20 8013A718 17004010 */  beqz       $v0, .L8013A778
    /* B24 8013A71C 3001B0AF */   sw        $s0, 0x130($sp)
    /* B28 8013A720 0001C824 */  addiu      $t0, $a2, 0x100
  .L8013A724:
    /* B2C 8013A724 0300C288 */  lwl        $v0, 0x3($a2)
    /* B30 8013A728 0000C298 */  lwr        $v0, 0x0($a2)
    /* B34 8013A72C 0700C388 */  lwl        $v1, 0x7($a2)
    /* B38 8013A730 0400C398 */  lwr        $v1, 0x4($a2)
    /* B3C 8013A734 0B00C488 */  lwl        $a0, 0xB($a2)
    /* B40 8013A738 0800C498 */  lwr        $a0, 0x8($a2)
    /* B44 8013A73C 0F00C588 */  lwl        $a1, 0xF($a2)
    /* B48 8013A740 0C00C598 */  lwr        $a1, 0xC($a2)
    /* B4C 8013A744 0300E2A8 */  swl        $v0, 0x3($a3)
    /* B50 8013A748 0000E2B8 */  swr        $v0, 0x0($a3)
    /* B54 8013A74C 0700E3A8 */  swl        $v1, 0x7($a3)
    /* B58 8013A750 0400E3B8 */  swr        $v1, 0x4($a3)
    /* B5C 8013A754 0B00E4A8 */  swl        $a0, 0xB($a3)
    /* B60 8013A758 0800E4B8 */  swr        $a0, 0x8($a3)
    /* B64 8013A75C 0F00E5A8 */  swl        $a1, 0xF($a3)
    /* B68 8013A760 0C00E5B8 */  swr        $a1, 0xC($a3)
    /* B6C 8013A764 1000C624 */  addiu      $a2, $a2, 0x10
    /* B70 8013A768 EEFFC814 */  bne        $a2, $t0, .L8013A724
    /* B74 8013A76C 1000E724 */   addiu     $a3, $a3, 0x10
    /* B78 8013A770 EAE90408 */  j          .L8013A7A8
    /* B7C 8013A774 00000000 */   nop
  .L8013A778:
    /* B80 8013A778 0001C824 */  addiu      $t0, $a2, 0x100
  .L8013A77C:
    /* B84 8013A77C 0000C28C */  lw         $v0, 0x0($a2)
    /* B88 8013A780 0400C38C */  lw         $v1, 0x4($a2)
    /* B8C 8013A784 0800C48C */  lw         $a0, 0x8($a2)
    /* B90 8013A788 0C00C58C */  lw         $a1, 0xC($a2)
    /* B94 8013A78C 0000E2AC */  sw         $v0, 0x0($a3)
    /* B98 8013A790 0400E3AC */  sw         $v1, 0x4($a3)
    /* B9C 8013A794 0800E4AC */  sw         $a0, 0x8($a3)
    /* BA0 8013A798 0C00E5AC */  sw         $a1, 0xC($a3)
    /* BA4 8013A79C 1000C624 */  addiu      $a2, $a2, 0x10
    /* BA8 8013A7A0 F6FFC814 */  bne        $a2, $t0, .L8013A77C
    /* BAC 8013A7A4 1000E724 */   addiu     $a3, $a3, 0x10
  .L8013A7A8:
    /* BB0 8013A7A8 1280053C */  lui        $a1, %hi(D_8011C268)
    /* BB4 8013A7AC 68C2A524 */  addiu      $a1, $a1, %lo(D_8011C268)
    /* BB8 8013A7B0 0300A288 */  lwl        $v0, 0x3($a1)
    /* BBC 8013A7B4 0000A298 */  lwr        $v0, 0x0($a1)
    /* BC0 8013A7B8 0400A380 */  lb         $v1, 0x4($a1)
    /* BC4 8013A7BC 1301A2AB */  swl        $v0, 0x113($sp)
    /* BC8 8013A7C0 1001A2BB */  swr        $v0, 0x110($sp)
    /* BCC 8013A7C4 1401A3A3 */  sb         $v1, 0x114($sp)
    /* BD0 8013A7C8 1280053C */  lui        $a1, %hi(D_8011C270)
    /* BD4 8013A7CC 70C2A524 */  addiu      $a1, $a1, %lo(D_8011C270)
    /* BD8 8013A7D0 0300A288 */  lwl        $v0, 0x3($a1)
    /* BDC 8013A7D4 0000A298 */  lwr        $v0, 0x0($a1)
    /* BE0 8013A7D8 0400A380 */  lb         $v1, 0x4($a1)
    /* BE4 8013A7DC 1B01A2AB */  swl        $v0, 0x11B($sp)
    /* BE8 8013A7E0 1801A2BB */  swr        $v0, 0x118($sp)
    /* BEC 8013A7E4 1C01A3A3 */  sb         $v1, 0x11C($sp)
    /* BF0 8013A7E8 1280053C */  lui        $a1, %hi(D_8011C278)
    /* BF4 8013A7EC 78C2A524 */  addiu      $a1, $a1, %lo(D_8011C278)
    /* BF8 8013A7F0 0300A288 */  lwl        $v0, 0x3($a1)
    /* BFC 8013A7F4 0000A298 */  lwr        $v0, 0x0($a1)
    /* C00 8013A7F8 0400A380 */  lb         $v1, 0x4($a1)
    /* C04 8013A7FC 2301A2AB */  swl        $v0, 0x123($sp)
    /* C08 8013A800 2001A2BB */  swr        $v0, 0x120($sp)
    /* C0C 8013A804 2401A3A3 */  sb         $v1, 0x124($sp)
    /* C10 8013A808 1280053C */  lui        $a1, %hi(D_8011C280)
    /* C14 8013A80C 80C2A524 */  addiu      $a1, $a1, %lo(D_8011C280)
    /* C18 8013A810 0300A288 */  lwl        $v0, 0x3($a1)
    /* C1C 8013A814 0000A298 */  lwr        $v0, 0x0($a1)
    /* C20 8013A818 0400A380 */  lb         $v1, 0x4($a1)
    /* C24 8013A81C 2B01A2AB */  swl        $v0, 0x12B($sp)
    /* C28 8013A820 2801A2BB */  swr        $v0, 0x128($sp)
    /* C2C 8013A824 2C01A3A3 */  sb         $v1, 0x12C($sp)
    /* C30 8013A828 6D41000C */  jal        abs
    /* C34 8013A82C 2320D703 */   subu      $a0, $fp, $s7
    /* C38 8013A830 21804000 */  addu       $s0, $v0, $zero
    /* C3C 8013A834 1001B627 */  addiu      $s6, $sp, 0x110
    /* C40 8013A838 1801B527 */  addiu      $s5, $sp, 0x118
    /* C44 8013A83C 2001B427 */  addiu      $s4, $sp, 0x120
    /* C48 8013A840 1000022A */  slti       $v0, $s0, 0x10
    /* C4C 8013A844 02004014 */  bnez       $v0, .L8013A850
    /* C50 8013A848 2801B327 */   addiu     $s3, $sp, 0x128
    /* C54 8013A84C 0F001024 */  addiu      $s0, $zero, 0xF
  .L8013A850:
    /* C58 8013A850 6D41000C */  jal        abs
    /* C5C 8013A854 23205102 */   subu      $a0, $s2, $s1
    /* C60 8013A858 21184000 */  addu       $v1, $v0, $zero
    /* C64 8013A85C 10006228 */  slti       $v0, $v1, 0x10
    /* C68 8013A860 03004014 */  bnez       $v0, .L8013A870
    /* C6C 8013A864 00110300 */   sll       $v0, $v1, 4
    /* C70 8013A868 0F000324 */  addiu      $v1, $zero, 0xF
    /* C74 8013A86C 00110300 */  sll        $v0, $v1, 4
  .L8013A870:
    /* C78 8013A870 1000A327 */  addiu      $v1, $sp, 0x10
    /* C7C 8013A874 21104300 */  addu       $v0, $v0, $v1
    /* C80 8013A878 21105000 */  addu       $v0, $v0, $s0
    /* C84 8013A87C 00004390 */  lbu        $v1, 0x0($v0)
    /* C88 8013A880 2A10D703 */  slt        $v0, $fp, $s7
    /* C8C 8013A884 05004010 */  beqz       $v0, .L8013A89C
    /* C90 8013A888 2A105102 */   slt       $v0, $s2, $s1
    /* C94 8013A88C 06004014 */  bnez       $v0, .L8013A8A8
    /* C98 8013A890 2110C302 */   addu      $v0, $s6, $v1
    /* C9C 8013A894 2AEA0408 */  j          .L8013A8A8
    /* CA0 8013A898 2110A302 */   addu      $v0, $s5, $v1
  .L8013A89C:
    /* CA4 8013A89C 02004014 */  bnez       $v0, .L8013A8A8
    /* CA8 8013A8A0 21108302 */   addu      $v0, $s4, $v1
    /* CAC 8013A8A4 21106302 */  addu       $v0, $s3, $v1
  .L8013A8A8:
    /* CB0 8013A8A8 00004390 */  lbu        $v1, 0x0($v0)
    /* CB4 8013A8AC 00000000 */  nop
    /* CB8 8013A8B0 21106000 */  addu       $v0, $v1, $zero
    /* CBC 8013A8B4 5401BF8F */  lw         $ra, 0x154($sp)
    /* CC0 8013A8B8 5001BE8F */  lw         $fp, 0x150($sp)
    /* CC4 8013A8BC 4C01B78F */  lw         $s7, 0x14C($sp)
    /* CC8 8013A8C0 4801B68F */  lw         $s6, 0x148($sp)
    /* CCC 8013A8C4 4401B58F */  lw         $s5, 0x144($sp)
    /* CD0 8013A8C8 4001B48F */  lw         $s4, 0x140($sp)
    /* CD4 8013A8CC 3C01B38F */  lw         $s3, 0x13C($sp)
    /* CD8 8013A8D0 3801B28F */  lw         $s2, 0x138($sp)
    /* CDC 8013A8D4 3401B18F */  lw         $s1, 0x134($sp)
    /* CE0 8013A8D8 3001B08F */  lw         $s0, 0x130($sp)
    /* CE4 8013A8DC 5801BD27 */  addiu      $sp, $sp, 0x158
    /* CE8 8013A8E0 0800E003 */  jr         $ra
    /* CEC 8013A8E4 00000000 */   nop
endlabel GetDirection16__Fiiii
