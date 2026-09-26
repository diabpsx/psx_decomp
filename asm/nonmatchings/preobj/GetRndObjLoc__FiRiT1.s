.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetRndObjLoc__FiRiT1, 0x104

glabel GetRndObjLoc__FiRiT1
    /* 1D690 80157288 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 1D694 8015728C 2800B2AF */  sw         $s2, 0x28($sp)
    /* 1D698 80157290 21908000 */  addu       $s2, $a0, $zero
    /* 1D69C 80157294 3000B4AF */  sw         $s4, 0x30($sp)
    /* 1D6A0 80157298 21A0A000 */  addu       $s4, $a1, $zero
    /* 1D6A4 8015729C 3400B5AF */  sw         $s5, 0x34($sp)
    /* 1D6A8 801572A0 21A8C000 */  addu       $s5, $a2, $zero
    /* 1D6AC 801572A4 3800BFAF */  sw         $ra, 0x38($sp)
    /* 1D6B0 801572A8 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 1D6B4 801572AC 2400B1AF */  sw         $s1, 0x24($sp)
    /* 1D6B8 801572B0 2C004012 */  beqz       $s2, .L80157364
    /* 1D6BC 801572B4 2000B0AF */   sw        $s0, 0x20($sp)
    /* 1D6C0 801572B8 21980000 */  addu       $s3, $zero, $zero
    /* 1D6C4 801572BC 01007326 */  addiu      $s3, $s3, 0x1
  .L801572C0:
    /* 1D6C8 801572C0 E903622A */  slti       $v0, $s3, 0x3E9
    /* 1D6CC 801572C4 04004014 */  bnez       $v0, .L801572D8
    /* 1D6D0 801572C8 0200422A */   slti      $v0, $s2, 0x2
    /* 1D6D4 801572CC 02004014 */  bnez       $v0, .L801572D8
    /* 1D6D8 801572D0 00000000 */   nop
    /* 1D6DC 801572D4 FFFF5226 */  addiu      $s2, $s2, -0x1
  .L801572D8:
    /* 1D6E0 801572D8 C9F6000C */  jal        ENG_random__Fl
    /* 1D6E4 801572DC 60000424 */   addiu     $a0, $zero, 0x60
    /* 1D6E8 801572E0 60000424 */  addiu      $a0, $zero, 0x60
    /* 1D6EC 801572E4 C9F6000C */  jal        ENG_random__Fl
    /* 1D6F0 801572E8 000082AE */   sw        $v0, 0x0($s4)
    /* 1D6F4 801572EC 21180000 */  addu       $v1, $zero, $zero
    /* 1D6F8 801572F0 21880000 */  addu       $s1, $zero, $zero
    /* 1D6FC 801572F4 1800401A */  blez       $s2, .L80157358
    /* 1D700 801572F8 0000A2AE */   sw        $v0, 0x0($s5)
  .L801572FC:
    /* 1D704 801572FC 1000401A */  blez       $s2, .L80157340
    /* 1D708 80157300 21800000 */   addu      $s0, $zero, $zero
    /* 1D70C 80157304 FF006230 */  andi       $v0, $v1, 0xFF
  .L80157308:
    /* 1D710 80157308 0D004014 */  bnez       $v0, .L80157340
    /* 1D714 8015730C 00000000 */   nop
    /* 1D718 80157310 0000848E */  lw         $a0, 0x0($s4)
    /* 1D71C 80157314 0000A58E */  lw         $a1, 0x0($s5)
    /* 1D720 80157318 21209100 */  addu       $a0, $a0, $s1
    /* 1D724 8015731C 305D050C */  jal        RndLocOk__Fii
    /* 1D728 80157320 2128B000 */   addu      $a1, $a1, $s0
    /* 1D72C 80157324 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1D730 80157328 0100422C */  sltiu      $v0, $v0, 0x1
    /* 1D734 8015732C 21184000 */  addu       $v1, $v0, $zero
    /* 1D738 80157330 01001026 */  addiu      $s0, $s0, 0x1
    /* 1D73C 80157334 2A101202 */  slt        $v0, $s0, $s2
    /* 1D740 80157338 F3FF4014 */  bnez       $v0, .L80157308
    /* 1D744 8015733C FF006230 */   andi      $v0, $v1, 0xFF
  .L80157340:
    /* 1D748 80157340 01003126 */  addiu      $s1, $s1, 0x1
    /* 1D74C 80157344 2A103202 */  slt        $v0, $s1, $s2
    /* 1D750 80157348 03004010 */  beqz       $v0, .L80157358
    /* 1D754 8015734C FF006230 */   andi      $v0, $v1, 0xFF
    /* 1D758 80157350 EAFF4010 */  beqz       $v0, .L801572FC
    /* 1D75C 80157354 00000000 */   nop
  .L80157358:
    /* 1D760 80157358 FF006230 */  andi       $v0, $v1, 0xFF
    /* 1D764 8015735C D8FF4014 */  bnez       $v0, .L801572C0
    /* 1D768 80157360 01007326 */   addiu     $s3, $s3, 0x1
  .L80157364:
    /* 1D76C 80157364 3800BF8F */  lw         $ra, 0x38($sp)
    /* 1D770 80157368 3400B58F */  lw         $s5, 0x34($sp)
    /* 1D774 8015736C 3000B48F */  lw         $s4, 0x30($sp)
    /* 1D778 80157370 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 1D77C 80157374 2800B28F */  lw         $s2, 0x28($sp)
    /* 1D780 80157378 2400B18F */  lw         $s1, 0x24($sp)
    /* 1D784 8015737C 2000B08F */  lw         $s0, 0x20($sp)
    /* 1D788 80157380 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 1D78C 80157384 0800E003 */  jr         $ra
    /* 1D790 80157388 00000000 */   nop
endlabel GetRndObjLoc__FiRiT1
