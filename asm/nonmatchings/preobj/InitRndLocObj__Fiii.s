.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitRndLocObj__Fiii, 0xC0

glabel InitRndLocObj__Fiii
    /* 1DA34 8015762C C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 1DA38 80157630 1800B0AF */  sw         $s0, 0x18($sp)
    /* 1DA3C 80157634 21808000 */  addu       $s0, $a0, $zero
    /* 1DA40 80157638 2320B000 */  subu       $a0, $a1, $s0
    /* 1DA44 8015763C 3800BEAF */  sw         $fp, 0x38($sp)
    /* 1DA48 80157640 21F0C000 */  addu       $fp, $a2, $zero
    /* 1DA4C 80157644 3C00BFAF */  sw         $ra, 0x3C($sp)
    /* 1DA50 80157648 3400B7AF */  sw         $s7, 0x34($sp)
    /* 1DA54 8015764C 3000B6AF */  sw         $s6, 0x30($sp)
    /* 1DA58 80157650 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 1DA5C 80157654 2800B4AF */  sw         $s4, 0x28($sp)
    /* 1DA60 80157658 2400B3AF */  sw         $s3, 0x24($sp)
    /* 1DA64 8015765C 2000B2AF */  sw         $s2, 0x20($sp)
    /* 1DA68 80157660 C9F6000C */  jal        ENG_random__Fl
    /* 1DA6C 80157664 1C00B1AF */   sw        $s1, 0x1C($sp)
    /* 1DA70 80157668 21B85000 */  addu       $s7, $v0, $s0
    /* 1DA74 8015766C 4200E01A */  blez       $s7, D_80157778
    /* 1DA78 80157670 21B00000 */   addu      $s6, $zero, $zero
  .L80157674:
    /* 1DA7C 80157674 C9F6000C */  jal        ENG_random__Fl
    /* 1DA80 80157678 40000424 */   addiu     $a0, $zero, 0x40
    /* 1DA84 8015767C 40000424 */  addiu      $a0, $zero, 0x40
    /* 1DA88 80157680 C9F6000C */  jal        ENG_random__Fl
    /* 1DA8C 80157684 21884000 */   addu      $s1, $v0, $zero
    /* 1DA90 80157688 0F003326 */  addiu      $s3, $s1, 0xF
    /* 1DA94 8015768C 21206002 */  addu       $a0, $s3, $zero
    /* 1DA98 80157690 21904000 */  addu       $s2, $v0, $zero
    /* 1DA9C 80157694 0F005026 */  addiu      $s0, $s2, 0xF
    /* 1DAA0 80157698 305D050C */  jal        RndLocOk__Fii
    /* 1DAA4 8015769C 21280002 */   addu      $a1, $s0, $zero
    /* 1DAA8 801576A0 10003426 */  addiu      $s4, $s1, 0x10
    /* 1DAAC 801576A4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1DAB0 801576A8 F2FF4010 */  beqz       $v0, .L80157674
    /* 1DAB4 801576AC 10005526 */   addiu     $s5, $s2, 0x10
    /* 1DAB8 801576B0 21208002 */  addu       $a0, $s4, $zero
    /* 1DABC 801576B4 305D050C */  jal        RndLocOk__Fii
    /* 1DAC0 801576B8 21280002 */   addu      $a1, $s0, $zero
    /* 1DAC4 801576BC FF004230 */  andi       $v0, $v0, 0xFF
    /* 1DAC8 801576C0 ECFF4010 */  beqz       $v0, .L80157674
    /* 1DACC 801576C4 11003126 */   addiu     $s1, $s1, 0x11
    /* 1DAD0 801576C8 21202002 */  addu       $a0, $s1, $zero
    /* 1DAD4 801576CC 305D050C */  jal        RndLocOk__Fii
    /* 1DAD8 801576D0 21280002 */   addu      $a1, $s0, $zero
    /* 1DADC 801576D4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1DAE0 801576D8 E6FF4010 */  beqz       $v0, .L80157674
    /* 1DAE4 801576DC 21206002 */   addu      $a0, $s3, $zero
    /* 1DAE8 801576E0 305D050C */  jal        RndLocOk__Fii
    /* 1DAEC 801576E4 2128A002 */   addu      $a1, $s5, $zero
    /* 1DAF0 801576E8 FF004230 */  andi       $v0, $v0, 0xFF
endlabel InitRndLocObj__Fiii
