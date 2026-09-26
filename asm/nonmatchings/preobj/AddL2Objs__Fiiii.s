.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddL2Objs__Fiiii, 0xFC

glabel AddL2Objs__Fiiii
    /* 1E8B4 801584AC C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 1E8B8 801584B0 2C00B7AF */  sw         $s7, 0x2C($sp)
    /* 1E8BC 801584B4 21B88000 */  addu       $s7, $a0, $zero
    /* 1E8C0 801584B8 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1E8C4 801584BC 2190A000 */  addu       $s2, $a1, $zero
    /* 1E8C8 801584C0 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1E8CC 801584C4 2198C000 */  addu       $s3, $a2, $zero
    /* 1E8D0 801584C8 2000B4AF */  sw         $s4, 0x20($sp)
    /* 1E8D4 801584CC 21A0E000 */  addu       $s4, $a3, $zero
    /* 1E8D8 801584D0 2A105402 */  slt        $v0, $s2, $s4
    /* 1E8DC 801584D4 3000BFAF */  sw         $ra, 0x30($sp)
    /* 1E8E0 801584D8 2800B6AF */  sw         $s6, 0x28($sp)
    /* 1E8E4 801584DC 2400B5AF */  sw         $s5, 0x24($sp)
    /* 1E8E8 801584E0 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1E8EC 801584E4 24004010 */  beqz       $v0, .L80158578
    /* 1E8F0 801584E8 1000B0AF */   sw        $s0, 0x10($sp)
    /* 1E8F4 801584EC 0D001624 */  addiu      $s6, $zero, 0xD
    /* 1E8F8 801584F0 1D021524 */  addiu      $s5, $zero, 0x21D
    /* 1E8FC 801584F4 2188E002 */  addu       $s1, $s7, $zero
  .L801584F8:
    /* 1E900 801584F8 2A103302 */  slt        $v0, $s1, $s3
    /* 1E904 801584FC 1A004010 */  beqz       $v0, .L80158568
    /* 1E908 80158500 21202002 */   addu      $a0, $s1, $zero
  .L80158504:
    /* 1E90C 80158504 910A020C */  jal        GetDPiece__Fii
    /* 1E910 80158508 21284002 */   addu      $a1, $s2, $zero
    /* 1E914 8015850C 00140200 */  sll        $v0, $v0, 16
    /* 1E918 80158510 03840200 */  sra        $s0, $v0, 16
    /* 1E91C 80158514 04001612 */  beq        $s0, $s6, .L80158528
    /* 1E920 80158518 2A000424 */   addiu     $a0, $zero, 0x2A
    /* 1E924 8015851C 06001516 */  bne        $s0, $s5, .L80158538
    /* 1E928 80158520 11000224 */   addiu     $v0, $zero, 0x11
    /* 1E92C 80158524 2A000424 */  addiu      $a0, $zero, 0x2A
  .L80158528:
    /* 1E930 80158528 21282002 */  addu       $a1, $s1, $zero
    /* 1E934 8015852C BE4E010C */  jal        AddObject__Fiii
    /* 1E938 80158530 21304002 */   addu      $a2, $s2, $zero
    /* 1E93C 80158534 11000224 */  addiu      $v0, $zero, 0x11
  .L80158538:
    /* 1E940 80158538 03000212 */  beq        $s0, $v0, .L80158548
    /* 1E944 8015853C 1E020224 */   addiu     $v0, $zero, 0x21E
    /* 1E948 80158540 05000216 */  bne        $s0, $v0, .L80158558
    /* 1E94C 80158544 00000000 */   nop
  .L80158548:
    /* 1E950 80158548 2B000424 */  addiu      $a0, $zero, 0x2B
    /* 1E954 8015854C 21282002 */  addu       $a1, $s1, $zero
    /* 1E958 80158550 BE4E010C */  jal        AddObject__Fiii
    /* 1E95C 80158554 21304002 */   addu      $a2, $s2, $zero
  .L80158558:
    /* 1E960 80158558 01003126 */  addiu      $s1, $s1, 0x1
    /* 1E964 8015855C 2A103302 */  slt        $v0, $s1, $s3
    /* 1E968 80158560 E8FF4014 */  bnez       $v0, .L80158504
    /* 1E96C 80158564 21202002 */   addu      $a0, $s1, $zero
  .L80158568:
    /* 1E970 80158568 01005226 */  addiu      $s2, $s2, 0x1
    /* 1E974 8015856C 2A105402 */  slt        $v0, $s2, $s4
    /* 1E978 80158570 E1FF4014 */  bnez       $v0, .L801584F8
    /* 1E97C 80158574 2188E002 */   addu      $s1, $s7, $zero
  .L80158578:
    /* 1E980 80158578 3000BF8F */  lw         $ra, 0x30($sp)
    /* 1E984 8015857C 2C00B78F */  lw         $s7, 0x2C($sp)
    /* 1E988 80158580 2800B68F */  lw         $s6, 0x28($sp)
    /* 1E98C 80158584 2400B58F */  lw         $s5, 0x24($sp)
    /* 1E990 80158588 2000B48F */  lw         $s4, 0x20($sp)
    /* 1E994 8015858C 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 1E998 80158590 1800B28F */  lw         $s2, 0x18($sp)
    /* 1E99C 80158594 1400B18F */  lw         $s1, 0x14($sp)
    /* 1E9A0 80158598 1000B08F */  lw         $s0, 0x10($sp)
    /* 1E9A4 8015859C 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 1E9A8 801585A0 0800E003 */  jr         $ra
    /* 1E9AC 801585A4 00000000 */   nop
endlabel AddL2Objs__Fiiii
