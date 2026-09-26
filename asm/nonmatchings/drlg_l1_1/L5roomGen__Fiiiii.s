.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching L5roomGen__Fiiiii, 0x330

glabel L5roomGen__Fiiiii
    /* 38D4 8013D4CC 98FFBD27 */  addiu      $sp, $sp, -0x68
    /* 38D8 8013D4D0 4400B1AF */  sw         $s1, 0x44($sp)
    /* 38DC 8013D4D4 21888000 */  addu       $s1, $a0, $zero
    /* 38E0 8013D4D8 5000B4AF */  sw         $s4, 0x50($sp)
    /* 38E4 8013D4DC 21A0C000 */  addu       $s4, $a2, $zero
    /* 38E8 8013D4E0 4000B0AF */  sw         $s0, 0x40($sp)
    /* 38EC 8013D4E4 7800B08F */  lw         $s0, 0x78($sp)
    /* 38F0 8013D4E8 04000424 */  addiu      $a0, $zero, 0x4
    /* 38F4 8013D4EC 6400BFAF */  sw         $ra, 0x64($sp)
    /* 38F8 8013D4F0 6000BEAF */  sw         $fp, 0x60($sp)
    /* 38FC 8013D4F4 5C00B7AF */  sw         $s7, 0x5C($sp)
    /* 3900 8013D4F8 5800B6AF */  sw         $s6, 0x58($sp)
    /* 3904 8013D4FC 5400B5AF */  sw         $s5, 0x54($sp)
    /* 3908 8013D500 4C00B3AF */  sw         $s3, 0x4C($sp)
    /* 390C 8013D504 4800B2AF */  sw         $s2, 0x48($sp)
    /* 3910 8013D508 1800A5AF */  sw         $a1, 0x18($sp)
    /* 3914 8013D50C C9F6000C */  jal        ENG_random__Fl
    /* 3918 8013D510 2000A7AF */   sw        $a3, 0x20($sp)
    /* 391C 8013D514 21184000 */  addu       $v1, $v0, $zero
    /* 3920 8013D518 01000224 */  addiu      $v0, $zero, 0x1
    /* 3924 8013D51C 03000216 */  bne        $s0, $v0, .L8013D52C
    /* 3928 8013D520 00000000 */   nop
    /* 392C 8013D524 4CF50408 */  j          .L8013D530
    /* 3930 8013D528 2B180300 */   sltu      $v1, $zero, $v1
  .L8013D52C:
    /* 3934 8013D52C 0100632C */  sltiu      $v1, $v1, 0x1
  .L8013D530:
    /* 3938 8013D530 05006010 */  beqz       $v1, .L8013D548
    /* 393C 8013D534 01000224 */   addiu     $v0, $zero, 0x1
    /* 3940 8013D538 54006210 */  beq        $v1, $v0, .L8013D68C
    /* 3944 8013D53C 21B00000 */   addu      $s6, $zero, $zero
    /* 3948 8013D540 F2F50408 */  j          .L8013D7C8
    /* 394C 8013D544 00000000 */   nop
  .L8013D548:
    /* 3950 8013D548 21B00000 */  addu       $s6, $zero, $zero
    /* 3954 8013D54C 2000A88F */  lw         $t0, 0x20($sp)
    /* 3958 8013D550 1800A98F */  lw         $t1, 0x18($sp)
    /* 395C 8013D554 C2170800 */  srl        $v0, $t0, 31
    /* 3960 8013D558 21100201 */  addu       $v0, $t0, $v0
    /* 3964 8013D55C 43100200 */  sra        $v0, $v0, 1
    /* 3968 8013D560 21102201 */  addu       $v0, $t1, $v0
    /* 396C 8013D564 2800A2AF */  sw         $v0, 0x28($sp)
  .L8013D568:
    /* 3970 8013D568 C9F6000C */  jal        ENG_random__Fl
    /* 3974 8013D56C 05000424 */   addiu     $a0, $zero, 0x5
    /* 3978 8013D570 02004224 */  addiu      $v0, $v0, 0x2
    /* 397C 8013D574 43100200 */  sra        $v0, $v0, 1
    /* 3980 8013D578 40980200 */  sll        $s3, $v0, 1
    /* 3984 8013D57C C9F6000C */  jal        ENG_random__Fl
    /* 3988 8013D580 05000424 */   addiu     $a0, $zero, 0x5
    /* 398C 8013D584 02004224 */  addiu      $v0, $v0, 0x2
    /* 3990 8013D588 43100200 */  sra        $v0, $v0, 1
    /* 3994 8013D58C 40900200 */  sll        $s2, $v0, 1
    /* 3998 8013D590 0300622A */  slti       $v0, $s3, 0x3
    /* 399C 8013D594 02004010 */  beqz       $v0, .L8013D5A0
    /* 39A0 8013D598 0300422A */   slti      $v0, $s2, 0x3
    /* 39A4 8013D59C 03001324 */  addiu      $s3, $zero, 0x3
  .L8013D5A0:
    /* 39A8 8013D5A0 03004010 */  beqz       $v0, .L8013D5B0
    /* 39AC 8013D5A4 C2171200 */   srl       $v0, $s2, 31
    /* 39B0 8013D5A8 03001224 */  addiu      $s2, $zero, 0x3
    /* 39B4 8013D5AC C2171200 */  srl        $v0, $s2, 31
  .L8013D5B0:
    /* 39B8 8013D5B0 21104202 */  addu       $v0, $s2, $v0
    /* 39BC 8013D5B4 43100200 */  sra        $v0, $v0, 1
    /* 39C0 8013D5B8 23B83302 */  subu       $s7, $s1, $s3
    /* 39C4 8013D5BC 02005526 */  addiu      $s5, $s2, 0x2
    /* 39C8 8013D5C0 FFFFE426 */  addiu      $a0, $s7, -0x1
    /* 39CC 8013D5C4 2130A002 */  addu       $a2, $s5, $zero
    /* 39D0 8013D5C8 2800A88F */  lw         $t0, 0x28($sp)
    /* 39D4 8013D5CC 01006726 */  addiu      $a3, $s3, 0x1
    /* 39D8 8013D5D0 23F00201 */  subu       $fp, $t0, $v0
    /* 39DC 8013D5D4 FFFFD027 */  addiu      $s0, $fp, -0x1
    /* 39E0 8013D5D8 0EF5040C */  jal        L5checkRoom__Fiiii
    /* 39E4 8013D5DC 21280002 */   addu      $a1, $s0, $zero
    /* 39E8 8013D5E0 0100D626 */  addiu      $s6, $s6, 0x1
    /* 39EC 8013D5E4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 39F0 8013D5E8 04004014 */  bnez       $v0, .L8013D5FC
    /* 39F4 8013D5EC 3000A2AF */   sw        $v0, 0x30($sp)
    /* 39F8 8013D5F0 1400C22A */  slti       $v0, $s6, 0x14
    /* 39FC 8013D5F4 DCFF4014 */  bnez       $v0, .L8013D568
    /* 3A00 8013D5F8 00000000 */   nop
  .L8013D5FC:
    /* 3A04 8013D5FC 3000A98F */  lw         $t1, 0x30($sp)
    /* 3A08 8013D600 01001624 */  addiu      $s6, $zero, 0x1
    /* 3A0C 8013D604 05003615 */  bne        $t1, $s6, .L8013D61C
    /* 3A10 8013D608 2120E002 */   addu      $a0, $s7, $zero
    /* 3A14 8013D60C 2128C003 */  addu       $a1, $fp, $zero
    /* 3A18 8013D610 21306002 */  addu       $a2, $s3, $zero
    /* 3A1C 8013D614 F3F4040C */  jal        L5drawRoom__Fiiii
    /* 3A20 8013D618 21384002 */   addu      $a3, $s2, $zero
  .L8013D61C:
    /* 3A24 8013D61C 21A03402 */  addu       $s4, $s1, $s4
    /* 3A28 8013D620 2188A002 */  addu       $s1, $s5, $zero
    /* 3A2C 8013D624 21208002 */  addu       $a0, $s4, $zero
    /* 3A30 8013D628 21280002 */  addu       $a1, $s0, $zero
    /* 3A34 8013D62C 01006626 */  addiu      $a2, $s3, 0x1
    /* 3A38 8013D630 0EF5040C */  jal        L5checkRoom__Fiiii
    /* 3A3C 8013D634 21382002 */   addu      $a3, $s1, $zero
    /* 3A40 8013D638 FF005030 */  andi       $s0, $v0, 0xFF
    /* 3A44 8013D63C 05001616 */  bne        $s0, $s6, .L8013D654
    /* 3A48 8013D640 21208002 */   addu      $a0, $s4, $zero
    /* 3A4C 8013D644 2128C003 */  addu       $a1, $fp, $zero
    /* 3A50 8013D648 21306002 */  addu       $a2, $s3, $zero
    /* 3A54 8013D64C F3F4040C */  jal        L5drawRoom__Fiiii
    /* 3A58 8013D650 21384002 */   addu      $a3, $s2, $zero
  .L8013D654:
    /* 3A5C 8013D654 3000A88F */  lw         $t0, 0x30($sp)
    /* 3A60 8013D658 00000000 */  nop
    /* 3A64 8013D65C 06001615 */  bne        $t0, $s6, .L8013D678
    /* 3A68 8013D660 2120E002 */   addu      $a0, $s7, $zero
    /* 3A6C 8013D664 1000B6AF */  sw         $s6, 0x10($sp)
    /* 3A70 8013D668 2128C003 */  addu       $a1, $fp, $zero
    /* 3A74 8013D66C 21306002 */  addu       $a2, $s3, $zero
    /* 3A78 8013D670 33F5040C */  jal        L5roomGen__Fiiiii
    /* 3A7C 8013D674 21384002 */   addu      $a3, $s2, $zero
  .L8013D678:
    /* 3A80 8013D678 53001616 */  bne        $s0, $s6, .L8013D7C8
    /* 3A84 8013D67C 21208002 */   addu      $a0, $s4, $zero
    /* 3A88 8013D680 1000B0AF */  sw         $s0, 0x10($sp)
    /* 3A8C 8013D684 EFF50408 */  j          .L8013D7BC
    /* 3A90 8013D688 2128C003 */   addu      $a1, $fp, $zero
  .L8013D68C:
    /* 3A94 8013D68C C2171400 */  srl        $v0, $s4, 31
    /* 3A98 8013D690 21108202 */  addu       $v0, $s4, $v0
    /* 3A9C 8013D694 43100200 */  sra        $v0, $v0, 1
    /* 3AA0 8013D698 21882202 */  addu       $s1, $s1, $v0
    /* 3AA4 8013D69C 3800B1AF */  sw         $s1, 0x38($sp)
  .L8013D6A0:
    /* 3AA8 8013D6A0 C9F6000C */  jal        ENG_random__Fl
    /* 3AAC 8013D6A4 05000424 */   addiu     $a0, $zero, 0x5
    /* 3AB0 8013D6A8 02004224 */  addiu      $v0, $v0, 0x2
    /* 3AB4 8013D6AC 43100200 */  sra        $v0, $v0, 1
    /* 3AB8 8013D6B0 40980200 */  sll        $s3, $v0, 1
    /* 3ABC 8013D6B4 C9F6000C */  jal        ENG_random__Fl
    /* 3AC0 8013D6B8 05000424 */   addiu     $a0, $zero, 0x5
    /* 3AC4 8013D6BC 02004224 */  addiu      $v0, $v0, 0x2
    /* 3AC8 8013D6C0 43100200 */  sra        $v0, $v0, 1
    /* 3ACC 8013D6C4 40900200 */  sll        $s2, $v0, 1
    /* 3AD0 8013D6C8 0300622A */  slti       $v0, $s3, 0x3
    /* 3AD4 8013D6CC 02004010 */  beqz       $v0, .L8013D6D8
    /* 3AD8 8013D6D0 0300422A */   slti      $v0, $s2, 0x3
    /* 3ADC 8013D6D4 03001324 */  addiu      $s3, $zero, 0x3
  .L8013D6D8:
    /* 3AE0 8013D6D8 02004010 */  beqz       $v0, .L8013D6E4
    /* 3AE4 8013D6DC C2171300 */   srl       $v0, $s3, 31
    /* 3AE8 8013D6E0 03001224 */  addiu      $s2, $zero, 0x3
  .L8013D6E4:
    /* 3AEC 8013D6E4 21106202 */  addu       $v0, $s3, $v0
    /* 3AF0 8013D6E8 43100200 */  sra        $v0, $v0, 1
    /* 3AF4 8013D6EC 01005126 */  addiu      $s1, $s2, 0x1
    /* 3AF8 8013D6F0 02007526 */  addiu      $s5, $s3, 0x2
    /* 3AFC 8013D6F4 2130A002 */  addu       $a2, $s5, $zero
    /* 3B00 8013D6F8 21382002 */  addu       $a3, $s1, $zero
    /* 3B04 8013D6FC 3800A98F */  lw         $t1, 0x38($sp)
    /* 3B08 8013D700 1800A88F */  lw         $t0, 0x18($sp)
    /* 3B0C 8013D704 23B82201 */  subu       $s7, $t1, $v0
    /* 3B10 8013D708 23F01201 */  subu       $fp, $t0, $s2
    /* 3B14 8013D70C FFFFF426 */  addiu      $s4, $s7, -0x1
    /* 3B18 8013D710 21208002 */  addu       $a0, $s4, $zero
    /* 3B1C 8013D714 0EF5040C */  jal        L5checkRoom__Fiiii
    /* 3B20 8013D718 FFFFC527 */   addiu     $a1, $fp, -0x1
    /* 3B24 8013D71C FF005030 */  andi       $s0, $v0, 0xFF
    /* 3B28 8013D720 04000016 */  bnez       $s0, .L8013D734
    /* 3B2C 8013D724 0100D626 */   addiu     $s6, $s6, 0x1
    /* 3B30 8013D728 1400C22A */  slti       $v0, $s6, 0x14
    /* 3B34 8013D72C DCFF4014 */  bnez       $v0, .L8013D6A0
    /* 3B38 8013D730 00000000 */   nop
  .L8013D734:
    /* 3B3C 8013D734 01001624 */  addiu      $s6, $zero, 0x1
    /* 3B40 8013D738 07001616 */  bne        $s0, $s6, .L8013D758
    /* 3B44 8013D73C 21208002 */   addu      $a0, $s4, $zero
    /* 3B48 8013D740 2120E002 */  addu       $a0, $s7, $zero
    /* 3B4C 8013D744 2128C003 */  addu       $a1, $fp, $zero
    /* 3B50 8013D748 21306002 */  addu       $a2, $s3, $zero
    /* 3B54 8013D74C F3F4040C */  jal        L5drawRoom__Fiiii
    /* 3B58 8013D750 21384002 */   addu      $a3, $s2, $zero
    /* 3B5C 8013D754 21208002 */  addu       $a0, $s4, $zero
  .L8013D758:
    /* 3B60 8013D758 2130A002 */  addu       $a2, $s5, $zero
    /* 3B64 8013D75C 1800A98F */  lw         $t1, 0x18($sp)
    /* 3B68 8013D760 2000A88F */  lw         $t0, 0x20($sp)
    /* 3B6C 8013D764 21382002 */  addu       $a3, $s1, $zero
    /* 3B70 8013D768 21A02801 */  addu       $s4, $t1, $t0
    /* 3B74 8013D76C 0EF5040C */  jal        L5checkRoom__Fiiii
    /* 3B78 8013D770 21288002 */   addu      $a1, $s4, $zero
    /* 3B7C 8013D774 FF005130 */  andi       $s1, $v0, 0xFF
    /* 3B80 8013D778 05003616 */  bne        $s1, $s6, .L8013D790
    /* 3B84 8013D77C 2120E002 */   addu      $a0, $s7, $zero
    /* 3B88 8013D780 21288002 */  addu       $a1, $s4, $zero
    /* 3B8C 8013D784 21306002 */  addu       $a2, $s3, $zero
    /* 3B90 8013D788 F3F4040C */  jal        L5drawRoom__Fiiii
    /* 3B94 8013D78C 21384002 */   addu      $a3, $s2, $zero
  .L8013D790:
    /* 3B98 8013D790 06001616 */  bne        $s0, $s6, .L8013D7AC
    /* 3B9C 8013D794 2120E002 */   addu      $a0, $s7, $zero
    /* 3BA0 8013D798 1000A0AF */  sw         $zero, 0x10($sp)
    /* 3BA4 8013D79C 2128C003 */  addu       $a1, $fp, $zero
    /* 3BA8 8013D7A0 21306002 */  addu       $a2, $s3, $zero
    /* 3BAC 8013D7A4 33F5040C */  jal        L5roomGen__Fiiiii
    /* 3BB0 8013D7A8 21384002 */   addu      $a3, $s2, $zero
  .L8013D7AC:
    /* 3BB4 8013D7AC 06003616 */  bne        $s1, $s6, .L8013D7C8
    /* 3BB8 8013D7B0 2120E002 */   addu      $a0, $s7, $zero
    /* 3BBC 8013D7B4 1000A0AF */  sw         $zero, 0x10($sp)
    /* 3BC0 8013D7B8 21288002 */  addu       $a1, $s4, $zero
  .L8013D7BC:
    /* 3BC4 8013D7BC 21306002 */  addu       $a2, $s3, $zero
    /* 3BC8 8013D7C0 33F5040C */  jal        L5roomGen__Fiiiii
    /* 3BCC 8013D7C4 21384002 */   addu      $a3, $s2, $zero
  .L8013D7C8:
    /* 3BD0 8013D7C8 6400BF8F */  lw         $ra, 0x64($sp)
    /* 3BD4 8013D7CC 6000BE8F */  lw         $fp, 0x60($sp)
    /* 3BD8 8013D7D0 5C00B78F */  lw         $s7, 0x5C($sp)
    /* 3BDC 8013D7D4 5800B68F */  lw         $s6, 0x58($sp)
    /* 3BE0 8013D7D8 5400B58F */  lw         $s5, 0x54($sp)
    /* 3BE4 8013D7DC 5000B48F */  lw         $s4, 0x50($sp)
    /* 3BE8 8013D7E0 4C00B38F */  lw         $s3, 0x4C($sp)
    /* 3BEC 8013D7E4 4800B28F */  lw         $s2, 0x48($sp)
    /* 3BF0 8013D7E8 4400B18F */  lw         $s1, 0x44($sp)
    /* 3BF4 8013D7EC 4000B08F */  lw         $s0, 0x40($sp)
    /* 3BF8 8013D7F0 6800BD27 */  addiu      $sp, $sp, 0x68
    /* 3BFC 8013D7F4 0800E003 */  jr         $ra
    /* 3C00 8013D7F8 00000000 */   nop
endlabel L5roomGen__Fiiiii
