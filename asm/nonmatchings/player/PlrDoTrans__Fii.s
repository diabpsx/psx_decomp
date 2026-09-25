.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PlrDoTrans__Fii, 0x118

glabel PlrDoTrans__Fii
    /* 50CE4 80060CE4 1280023C */  lui        $v0, %hi(leveltype)
    /* 50CE8 80060CE8 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 50CEC 80060CEC C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 50CF0 80060CF0 2800B4AF */  sw         $s4, 0x28($sp)
    /* 50CF4 80060CF4 21A08000 */  addu       $s4, $a0, $zero
    /* 50CF8 80060CF8 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 50CFC 80060CFC 21A8A000 */  addu       $s5, $a1, $zero
    /* 50D00 80060D00 3400BFAF */  sw         $ra, 0x34($sp)
    /* 50D04 80060D04 3000B6AF */  sw         $s6, 0x30($sp)
    /* 50D08 80060D08 2400B3AF */  sw         $s3, 0x24($sp)
    /* 50D0C 80060D0C 2000B2AF */  sw         $s2, 0x20($sp)
    /* 50D10 80060D10 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 50D14 80060D14 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 50D18 80060D18 0200422C */  sltiu      $v0, $v0, 0x2
    /* 50D1C 80060D1C 29004010 */  beqz       $v0, .L80060DC4
    /* 50D20 80060D20 1800B0AF */   sw        $s0, 0x18($sp)
    /* 50D24 80060D24 21100000 */  addu       $v0, $zero, $zero
    /* 50D28 80060D28 29004014 */  bnez       $v0, .L80060DD0
    /* 50D2C 80060D2C FFFFB226 */   addiu     $s2, $s5, -0x1
    /* 50D30 80060D30 01001624 */  addiu      $s6, $zero, 0x1
    /* 50D34 80060D34 FFFF9026 */  addiu      $s0, $s4, -0x1
  .L80060D38:
    /* 50D38 80060D38 01008326 */  addiu      $v1, $s4, 0x1
    /* 50D3C 80060D3C 2A107000 */  slt        $v0, $v1, $s0
    /* 50D40 80060D40 19004014 */  bnez       $v0, .L80060DA8
    /* 50D44 80060D44 C0101000 */   sll       $v0, $s0, 3
    /* 50D48 80060D48 21986000 */  addu       $s3, $v1, $zero
    /* 50D4C 80060D4C C0181200 */  sll        $v1, $s2, 3
    /* 50D50 80060D50 23105000 */  subu       $v0, $v0, $s0
    /* 50D54 80060D54 C0110200 */  sll        $v0, $v0, 7
    /* 50D58 80060D58 21884300 */  addu       $s1, $v0, $v1
  .L80060D5C:
    /* 50D5C 80060D5C 21200002 */  addu       $a0, $s0, $zero
    /* 50D60 80060D60 380B020C */  jal        GetSOLID__Fii
    /* 50D64 80060D64 21284002 */   addu      $a1, $s2, $zero
    /* 50D68 80060D68 01004238 */  xori       $v0, $v0, 0x1
    /* 50D6C 80060D6C 0A004010 */  beqz       $v0, .L80060D98
    /* 50D70 80060D70 00000000 */   nop
    /* 50D74 80060D74 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 50D78 80060D78 21083100 */  addu       $at, $at, $s1
    /* 50D7C 80060D7C 2F7A2280 */  lb         $v0, %lo(dung_map + 0x7)($at)
    /* 50D80 80060D80 00000000 */  nop
    /* 50D84 80060D84 04004010 */  beqz       $v0, .L80060D98
    /* 50D88 80060D88 00000000 */   nop
    /* 50D8C 80060D8C 0E80013C */  lui        $at, %hi(TransList)
    /* 50D90 80060D90 21082200 */  addu       $at, $at, $v0
    /* 50D94 80060D94 287936A0 */  sb         $s6, %lo(TransList)($at)
  .L80060D98:
    /* 50D98 80060D98 01001026 */  addiu      $s0, $s0, 0x1
    /* 50D9C 80060D9C 2A107002 */  slt        $v0, $s3, $s0
    /* 50DA0 80060DA0 EEFF4010 */  beqz       $v0, .L80060D5C
    /* 50DA4 80060DA4 80033126 */   addiu     $s1, $s1, 0x380
  .L80060DA8:
    /* 50DA8 80060DA8 01005226 */  addiu      $s2, $s2, 0x1
    /* 50DAC 80060DAC 0100A226 */  addiu      $v0, $s5, 0x1
    /* 50DB0 80060DB0 2A105200 */  slt        $v0, $v0, $s2
    /* 50DB4 80060DB4 E0FF4010 */  beqz       $v0, .L80060D38
    /* 50DB8 80060DB8 FFFF9026 */   addiu     $s0, $s4, -0x1
    /* 50DBC 80060DBC 74830108 */  j          .L80060DD0
    /* 50DC0 80060DC0 00000000 */   nop
  .L80060DC4:
    /* 50DC4 80060DC4 01000224 */  addiu      $v0, $zero, 0x1
    /* 50DC8 80060DC8 0E80013C */  lui        $at, %hi(TransList + 0x1)
    /* 50DCC 80060DCC 297922A0 */  sb         $v0, %lo(TransList + 0x1)($at)
  .L80060DD0:
    /* 50DD0 80060DD0 3400BF8F */  lw         $ra, 0x34($sp)
    /* 50DD4 80060DD4 3000B68F */  lw         $s6, 0x30($sp)
    /* 50DD8 80060DD8 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 50DDC 80060DDC 2800B48F */  lw         $s4, 0x28($sp)
    /* 50DE0 80060DE0 2400B38F */  lw         $s3, 0x24($sp)
    /* 50DE4 80060DE4 2000B28F */  lw         $s2, 0x20($sp)
    /* 50DE8 80060DE8 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 50DEC 80060DEC 1800B08F */  lw         $s0, 0x18($sp)
    /* 50DF0 80060DF0 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 50DF4 80060DF4 0800E003 */  jr         $ra
    /* 50DF8 80060DF8 00000000 */   nop
endlabel PlrDoTrans__Fii
