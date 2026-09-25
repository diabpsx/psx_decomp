.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DDXread, 0xA0

glabel DDXread
    /* 13520 80023520 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 13524 80023524 2400BFAF */  sw         $ra, 0x24($sp)
    /* 13528 80023528 2000B2AF */  sw         $s2, 0x20($sp)
    /* 1352C 8002352C 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 13530 80023530 1800B0AF */  sw         $s0, 0x18($sp)
    /* 13534 80023534 21808000 */  addu       $s0, $a0, $zero
    /* 13538 80023538 2188C000 */  addu       $s1, $a2, $zero
    /* 1353C 8002353C 03002016 */  bnez       $s1, .L8002354C
    /* 13540 80023540 2190A000 */   addu      $s2, $a1, $zero
    /* 13544 80023544 698D0008 */  j          .L800235A4
    /* 13548 80023548 21100000 */   addu      $v0, $zero, $zero
  .L8002354C:
    /* 1354C 8002354C 9B8C000C */  jal        SwapByte
    /* 13550 80023550 FE000434 */   ori       $a0, $zero, 0xFE
    /* 13554 80023554 9B8C000C */  jal        SwapByte
    /* 13558 80023558 72000434 */   ori       $a0, $zero, 0x72
    /* 1355C 8002355C AF8C000C */  jal        PutLong
    /* 13560 80023560 21200002 */   addu      $a0, $s0, $zero
    /* 13564 80023564 AF8C000C */  jal        PutLong
    /* 13568 80023568 21202002 */   addu      $a0, $s1, $zero
    /* 1356C 8002356C 0900201A */  blez       $s1, .L80023594
    /* 13570 80023570 21800000 */   addu      $s0, $zero, $zero
  .L80023574:
    /* 13574 80023574 9B8C000C */  jal        SwapByte
    /* 13578 80023578 21200000 */   addu      $a0, $zero, $zero
    /* 1357C 8002357C 21185002 */  addu       $v1, $s2, $s0
    /* 13580 80023580 000062A0 */  sb         $v0, 0x0($v1)
    /* 13584 80023584 01001026 */  addiu      $s0, $s0, 0x1
    /* 13588 80023588 2A101102 */  slt        $v0, $s0, $s1
    /* 1358C 8002358C F9FF4014 */  bnez       $v0, .L80023574
    /* 13590 80023590 00000000 */   nop
  .L80023594:
    /* 13594 80023594 9B8C000C */  jal        SwapByte
    /* 13598 80023598 21200000 */   addu      $a0, $zero, $zero
    /* 1359C 8002359C C28C000C */  jal        GetLong
    /* 135A0 800235A0 00000000 */   nop
  .L800235A4:
    /* 135A4 800235A4 2400BF8F */  lw         $ra, 0x24($sp)
    /* 135A8 800235A8 2000B28F */  lw         $s2, 0x20($sp)
    /* 135AC 800235AC 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 135B0 800235B0 1800B08F */  lw         $s0, 0x18($sp)
    /* 135B4 800235B4 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 135B8 800235B8 0800E003 */  jr         $ra
    /* 135BC 800235BC 00000000 */   nop
endlabel DDXread
