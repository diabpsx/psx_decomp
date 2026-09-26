.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8013B6EC, 0xE4

glabel func_8013B6EC
    /* 1AF4 8013B6EC 21180000 */  addu       $v1, $zero, $zero
    /* 1AF8 8013B6F0 1480073C */  lui        $a3, %hi(D_80139E2C)
    /* 1AFC 8013B6F4 2C9EE724 */  addiu      $a3, $a3, %lo(D_80139E2C)
    /* 1B00 8013B6F8 21308000 */  addu       $a2, $a0, $zero
    /* 1B04 8013B6FC F0000A24 */  addiu      $t2, $zero, 0xF0
    /* 1B08 8013B700 FFFF083C */  lui        $t0, (0xFFFF0F01 >> 16)
    /* 1B0C 8013B704 010F0835 */  ori        $t0, $t0, (0xFFFF0F01 & 0xFFFF)
    /* 1B10 8013B708 000F0924 */  addiu      $t1, $zero, 0xF00
  .L8013B70C:
    /* 1B14 8013B70C 0000E290 */  lbu        $v0, 0x0($a3)
    /* 1B18 8013B710 00000000 */  nop
    /* 1B1C 8013B714 FF004530 */  andi       $a1, $v0, 0xFF
    /* 1B20 8013B718 F000A22C */  sltiu      $v0, $a1, 0xF0
    /* 1B24 8013B71C 17004010 */  beqz       $v0, .L8013B77C
    /* 1B28 8013B720 0100E724 */   addiu     $a3, $a3, 0x1
    /* 1B2C 8013B724 0B006010 */  beqz       $v1, .L8013B754
    /* 1B30 8013B728 00000000 */   nop
    /* 1B34 8013B72C 1A00A004 */  bltz       $a1, .L8013B798
    /* 1B38 8013B730 00000000 */   nop
  .L8013B734:
    /* 1B3C 8013B734 2310C300 */  subu       $v0, $a2, $v1
    /* 1B40 8013B738 00004290 */  lbu        $v0, 0x0($v0)
    /* 1B44 8013B73C FFFFA524 */  addiu      $a1, $a1, -0x1
    /* 1B48 8013B740 0000C2A0 */  sb         $v0, 0x0($a2)
    /* 1B4C 8013B744 FBFFA104 */  bgez       $a1, .L8013B734
    /* 1B50 8013B748 0100C624 */   addiu     $a2, $a2, 0x1
    /* 1B54 8013B74C E6ED0408 */  j          .L8013B798
    /* 1B58 8013B750 00000000 */   nop
  .L8013B754:
    /* 1B5C 8013B754 1000A004 */  bltz       $a1, .L8013B798
    /* 1B60 8013B758 00000000 */   nop
  .L8013B75C:
    /* 1B64 8013B75C 0000E290 */  lbu        $v0, 0x0($a3)
    /* 1B68 8013B760 0100E724 */  addiu      $a3, $a3, 0x1
    /* 1B6C 8013B764 FFFFA524 */  addiu      $a1, $a1, -0x1
    /* 1B70 8013B768 0000C2A0 */  sb         $v0, 0x0($a2)
    /* 1B74 8013B76C FBFFA104 */  bgez       $a1, .L8013B75C
    /* 1B78 8013B770 0100C624 */   addiu     $a2, $a2, 0x1
    /* 1B7C 8013B774 E6ED0408 */  j          .L8013B798
    /* 1B80 8013B778 00000000 */   nop
  .L8013B77C:
    /* 1B84 8013B77C 0600AA10 */  beq        $a1, $t2, .L8013B798
    /* 1B88 8013B780 21180000 */   addu      $v1, $zero, $zero
    /* 1B8C 8013B784 0000E390 */  lbu        $v1, 0x0($a3)
    /* 1B90 8013B788 0100E724 */  addiu      $a3, $a3, 0x1
    /* 1B94 8013B78C 00120500 */  sll        $v0, $a1, 8
    /* 1B98 8013B790 25104300 */  or         $v0, $v0, $v1
    /* 1B9C 8013B794 21184800 */  addu       $v1, $v0, $t0
  .L8013B798:
    /* 1BA0 8013B798 DCFF6914 */  bne        $v1, $t1, .L8013B70C
    /* 1BA4 8013B79C 04000524 */   addiu     $a1, $zero, 0x4
    /* 1BA8 8013B7A0 FF870634 */  ori        $a2, $zero, 0x87FF
    /* 1BAC 8013B7A4 08008424 */  addiu      $a0, $a0, 0x8
  .L8013B7A8:
    /* 1BB0 8013B7A8 00008294 */  lhu        $v0, 0x0($a0)
    /* 1BB4 8013B7AC F8FF8394 */  lhu        $v1, -0x8($a0)
    /* 1BB8 8013B7B0 0100A524 */  addiu      $a1, $a1, 0x1
    /* 1BBC 8013B7B4 26104300 */  xor        $v0, $v0, $v1
    /* 1BC0 8013B7B8 000082A4 */  sh         $v0, 0x0($a0)
    /* 1BC4 8013B7BC 2A10C500 */  slt        $v0, $a2, $a1
    /* 1BC8 8013B7C0 F9FF4010 */  beqz       $v0, .L8013B7A8
    /* 1BCC 8013B7C4 02008424 */   addiu     $a0, $a0, 0x2
    /* 1BD0 8013B7C8 0800E003 */  jr         $ra
    /* 1BD4 8013B7CC 00000000 */   nop
endlabel func_8013B6EC
    /* 1BD8 8013B7D0 00000000 */  nop
    /* 1BDC 8013B7D4 00000000 */  nop
    /* 1BE0 8013B7D8 00000000 */  nop
