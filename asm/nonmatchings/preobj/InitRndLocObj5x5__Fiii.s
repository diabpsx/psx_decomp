.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitRndLocObj5x5__Fiii, 0x11C

glabel InitRndLocObj5x5__Fiii
    /* 1DD74 8015796C C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 1DD78 80157970 1800B0AF */  sw         $s0, 0x18($sp)
    /* 1DD7C 80157974 21808000 */  addu       $s0, $a0, $zero
    /* 1DD80 80157978 2320B000 */  subu       $a0, $a1, $s0
    /* 1DD84 8015797C 3800BEAF */  sw         $fp, 0x38($sp)
    /* 1DD88 80157980 21F0C000 */  addu       $fp, $a2, $zero
    /* 1DD8C 80157984 3C00BFAF */  sw         $ra, 0x3C($sp)
    /* 1DD90 80157988 3400B7AF */  sw         $s7, 0x34($sp)
    /* 1DD94 8015798C 3000B6AF */  sw         $s6, 0x30($sp)
    /* 1DD98 80157990 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 1DD9C 80157994 2800B4AF */  sw         $s4, 0x28($sp)
    /* 1DDA0 80157998 2400B3AF */  sw         $s3, 0x24($sp)
    /* 1DDA4 8015799C 2000B2AF */  sw         $s2, 0x20($sp)
    /* 1DDA8 801579A0 C9F6000C */  jal        ENG_random__Fl
    /* 1DDAC 801579A4 1C00B1AF */   sw        $s1, 0x1C($sp)
    /* 1DDB0 801579A8 21B85000 */  addu       $s7, $v0, $s0
    /* 1DDB4 801579AC 2900E01A */  blez       $s7, .L80157A54
    /* 1DDB8 801579B0 21B00000 */   addu      $s6, $zero, $zero
    /* 1DDBC 801579B4 21A80000 */  addu       $s5, $zero, $zero
  .L801579B8:
    /* 1DDC0 801579B8 01001324 */  addiu      $s3, $zero, 0x1
  .L801579BC:
    /* 1DDC4 801579BC C9F6000C */  jal        ENG_random__Fl
    /* 1DDC8 801579C0 40000424 */   addiu     $a0, $zero, 0x40
    /* 1DDCC 801579C4 40000424 */  addiu      $a0, $zero, 0x40
    /* 1DDD0 801579C8 C9F6000C */  jal        ENG_random__Fl
    /* 1DDD4 801579CC 10005424 */   addiu     $s4, $v0, 0x10
    /* 1DDD8 801579D0 10005224 */  addiu      $s2, $v0, 0x10
    /* 1DDDC 801579D4 FEFF1124 */  addiu      $s1, $zero, -0x2
  .L801579D8:
    /* 1DDE0 801579D8 FEFF1024 */  addiu      $s0, $zero, -0x2
    /* 1DDE4 801579DC 21209002 */  addu       $a0, $s4, $s0
  .L801579E0:
    /* 1DDE8 801579E0 305D050C */  jal        RndLocOk__Fii
    /* 1DDEC 801579E4 21285102 */   addu      $a1, $s2, $s1
    /* 1DDF0 801579E8 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1DDF4 801579EC 02004014 */  bnez       $v0, .L801579F8
    /* 1DDF8 801579F0 00000000 */   nop
    /* 1DDFC 801579F4 21980000 */  addu       $s3, $zero, $zero
  .L801579F8:
    /* 1DE00 801579F8 01001026 */  addiu      $s0, $s0, 0x1
    /* 1DE04 801579FC 0300022A */  slti       $v0, $s0, 0x3
    /* 1DE08 80157A00 F7FF4014 */  bnez       $v0, .L801579E0
    /* 1DE0C 80157A04 21209002 */   addu      $a0, $s4, $s0
    /* 1DE10 80157A08 01003126 */  addiu      $s1, $s1, 0x1
    /* 1DE14 80157A0C 0300222A */  slti       $v0, $s1, 0x3
    /* 1DE18 80157A10 F1FF4014 */  bnez       $v0, .L801579D8
    /* 1DE1C 80157A14 FF006232 */   andi      $v0, $s3, 0xFF
    /* 1DE20 80157A18 06004014 */  bnez       $v0, .L80157A34
    /* 1DE24 80157A1C 0100B526 */   addiu     $s5, $s5, 0x1
    /* 1DE28 80157A20 214EA22A */  slti       $v0, $s5, 0x4E21
    /* 1DE2C 80157A24 0B004010 */  beqz       $v0, .L80157A54
    /* 1DE30 80157A28 01001324 */   addiu     $s3, $zero, 0x1
    /* 1DE34 80157A2C 6F5E0508 */  j          .L801579BC
    /* 1DE38 80157A30 00000000 */   nop
  .L80157A34:
    /* 1DE3C 80157A34 2120C003 */  addu       $a0, $fp, $zero
    /* 1DE40 80157A38 21288002 */  addu       $a1, $s4, $zero
    /* 1DE44 80157A3C BE4E010C */  jal        AddObject__Fiii
    /* 1DE48 80157A40 21304002 */   addu      $a2, $s2, $zero
    /* 1DE4C 80157A44 0100D626 */  addiu      $s6, $s6, 0x1
    /* 1DE50 80157A48 2A10D702 */  slt        $v0, $s6, $s7
    /* 1DE54 80157A4C DAFF4014 */  bnez       $v0, .L801579B8
    /* 1DE58 80157A50 21A80000 */   addu      $s5, $zero, $zero
  .L80157A54:
    /* 1DE5C 80157A54 3C00BF8F */  lw         $ra, 0x3C($sp)
    /* 1DE60 80157A58 3800BE8F */  lw         $fp, 0x38($sp)
    /* 1DE64 80157A5C 3400B78F */  lw         $s7, 0x34($sp)
    /* 1DE68 80157A60 3000B68F */  lw         $s6, 0x30($sp)
    /* 1DE6C 80157A64 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 1DE70 80157A68 2800B48F */  lw         $s4, 0x28($sp)
    /* 1DE74 80157A6C 2400B38F */  lw         $s3, 0x24($sp)
    /* 1DE78 80157A70 2000B28F */  lw         $s2, 0x20($sp)
    /* 1DE7C 80157A74 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 1DE80 80157A78 1800B08F */  lw         $s0, 0x18($sp)
    /* 1DE84 80157A7C 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 1DE88 80157A80 0800E003 */  jr         $ra
    /* 1DE8C 80157A84 00000000 */   nop
endlabel InitRndLocObj5x5__Fiii
