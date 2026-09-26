.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MAI_SkelSd__Fi, 0x1B0

glabel MAI_SkelSd__Fi
    /* 16190 8014FD88 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 16194 8014FD8C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 16198 8014FD90 21908000 */  addu       $s2, $a0, $zero
    /* 1619C 8014FD94 40101200 */  sll        $v0, $s2, 1
    /* 161A0 8014FD98 21105200 */  addu       $v0, $v0, $s2
    /* 161A4 8014FD9C 80100200 */  sll        $v0, $v0, 2
    /* 161A8 8014FDA0 21105200 */  addu       $v0, $v0, $s2
    /* 161AC 8014FDA4 C0100200 */  sll        $v0, $v0, 3
    /* 161B0 8014FDA8 1080033C */  lui        $v1, %hi(monster)
    /* 161B4 8014FDAC 94536324 */  addiu      $v1, $v1, %lo(monster)
    /* 161B8 8014FDB0 1400B1AF */  sw         $s1, 0x14($sp)
    /* 161BC 8014FDB4 21884300 */  addu       $s1, $v0, $v1
    /* 161C0 8014FDB8 2400BFAF */  sw         $ra, 0x24($sp)
    /* 161C4 8014FDBC 2000B4AF */  sw         $s4, 0x20($sp)
    /* 161C8 8014FDC0 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 161CC 8014FDC4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 161D0 8014FDC8 33002282 */  lb         $v0, 0x33($s1)
    /* 161D4 8014FDCC 00000000 */  nop
    /* 161D8 8014FDD0 50004014 */  bnez       $v0, .L8014FF14
    /* 161DC 8014FDD4 00000000 */   nop
    /* 161E0 8014FDD8 4E002292 */  lbu        $v0, 0x4E($s1)
    /* 161E4 8014FDDC 00000000 */  nop
    /* 161E8 8014FDE0 4C004010 */  beqz       $v0, .L8014FF14
    /* 161EC 8014FDE4 21A00000 */   addu      $s4, $zero, $zero
    /* 161F0 8014FDE8 34002482 */  lb         $a0, 0x34($s1)
    /* 161F4 8014FDEC 35002582 */  lb         $a1, 0x35($s1)
    /* 161F8 8014FDF0 4A002292 */  lbu        $v0, 0x4A($s1)
    /* 161FC 8014FDF4 43002682 */  lb         $a2, 0x43($s1)
    /* 16200 8014FDF8 23808200 */  subu       $s0, $a0, $v0
    /* 16204 8014FDFC 4B002292 */  lbu        $v0, 0x4B($s1)
    /* 16208 8014FE00 44002782 */  lb         $a3, 0x44($s1)
    /* 1620C 8014FE04 8AF6000C */  jal        GetDirection__Fiiii
    /* 16210 8014FE08 2398A200 */   subu      $s3, $a1, $v0
    /* 16214 8014FE0C 21200002 */  addu       $a0, $s0, $zero
    /* 16218 8014FE10 21804000 */  addu       $s0, $v0, $zero
    /* 1621C 8014FE14 6D41000C */  jal        abs
    /* 16220 8014FE18 3C0030A2 */   sb        $s0, 0x3C($s1)
    /* 16224 8014FE1C 02004228 */  slti       $v0, $v0, 0x2
    /* 16228 8014FE20 04004010 */  beqz       $v0, .L8014FE34
    /* 1622C 8014FE24 00000000 */   nop
    /* 16230 8014FE28 6D41000C */  jal        abs
    /* 16234 8014FE2C 21206002 */   addu      $a0, $s3, $zero
    /* 16238 8014FE30 02005428 */  slti       $s4, $v0, 0x2
  .L8014FE34:
    /* 1623C 8014FE34 19008012 */  beqz       $s4, .L8014FE9C
    /* 16240 8014FE38 0D000224 */   addiu     $v0, $zero, 0xD
    /* 16244 8014FE3C 18002386 */  lh         $v1, 0x18($s1)
    /* 16248 8014FE40 00000000 */  nop
    /* 1624C 8014FE44 0A006210 */  beq        $v1, $v0, .L8014FE70
    /* 16250 8014FE48 00000000 */   nop
    /* 16254 8014FE4C C9F6000C */  jal        ENG_random__Fl
    /* 16258 8014FE50 64000424 */   addiu     $a0, $zero, 0x64
    /* 1625C 8014FE54 4D002392 */  lbu        $v1, 0x4D($s1)
    /* 16260 8014FE58 00000000 */  nop
    /* 16264 8014FE5C 40180300 */  sll        $v1, $v1, 1
    /* 16268 8014FE60 14006324 */  addiu      $v1, $v1, 0x14
    /* 1626C 8014FE64 2A104300 */  slt        $v0, $v0, $v1
    /* 16270 8014FE68 05004010 */  beqz       $v0, .L8014FE80
    /* 16274 8014FE6C 00000000 */   nop
  .L8014FE70:
    /* 16278 8014FE70 0B5C050C */  jal        M_StartAttack__Fi
    /* 1627C 8014FE74 21204002 */   addu      $a0, $s2, $zero
    /* 16280 8014FE78 C03F0508 */  j          .L8014FF00
    /* 16284 8014FE7C 00000000 */   nop
  .L8014FE80:
    /* 16288 8014FE80 C9F6000C */  jal        ENG_random__Fl
    /* 1628C 8014FE84 0A000424 */   addiu     $a0, $zero, 0xA
    /* 16290 8014FE88 4D002592 */  lbu        $a1, 0x4D($s1)
    /* 16294 8014FE8C 21204002 */  addu       $a0, $s2, $zero
    /* 16298 8014FE90 40280500 */  sll        $a1, $a1, 1
    /* 1629C 8014FE94 BA3F0508 */  j          .L8014FEE8
    /* 162A0 8014FE98 F6FFA524 */   addiu     $a1, $a1, -0xA
  .L8014FE9C:
    /* 162A4 8014FE9C 18002386 */  lh         $v1, 0x18($s1)
    /* 162A8 8014FEA0 00000000 */  nop
    /* 162AC 8014FEA4 14006210 */  beq        $v1, $v0, .L8014FEF8
    /* 162B0 8014FEA8 21204002 */   addu      $a0, $s2, $zero
    /* 162B4 8014FEAC C9F6000C */  jal        ENG_random__Fl
    /* 162B8 8014FEB0 64000424 */   addiu     $a0, $zero, 0x64
    /* 162BC 8014FEB4 4D002392 */  lbu        $v1, 0x4D($s1)
    /* 162C0 8014FEB8 23000424 */  addiu      $a0, $zero, 0x23
    /* 162C4 8014FEBC 80180300 */  sll        $v1, $v1, 2
    /* 162C8 8014FEC0 23208300 */  subu       $a0, $a0, $v1
    /* 162CC 8014FEC4 2A104400 */  slt        $v0, $v0, $a0
    /* 162D0 8014FEC8 0B004010 */  beqz       $v0, .L8014FEF8
    /* 162D4 8014FECC 21204002 */   addu      $a0, $s2, $zero
    /* 162D8 8014FED0 C9F6000C */  jal        ENG_random__Fl
    /* 162DC 8014FED4 0A000424 */   addiu     $a0, $zero, 0xA
    /* 162E0 8014FED8 4D002592 */  lbu        $a1, 0x4D($s1)
    /* 162E4 8014FEDC 21204002 */  addu       $a0, $s2, $zero
    /* 162E8 8014FEE0 40280500 */  sll        $a1, $a1, 1
    /* 162EC 8014FEE4 F1FFA524 */  addiu      $a1, $a1, -0xF
  .L8014FEE8:
    /* 162F0 8014FEE8 042B050C */  jal        M_StartDelay__Fii
    /* 162F4 8014FEEC 23284500 */   subu      $a1, $v0, $a1
    /* 162F8 8014FEF0 C03F0508 */  j          .L8014FF00
    /* 162FC 8014FEF4 00000000 */   nop
  .L8014FEF8:
    /* 16300 8014FEF8 D43D050C */  jal        M_CallWalk__Fii
    /* 16304 8014FEFC 21280002 */   addu      $a1, $s0, $zero
  .L8014FF00:
    /* 16308 8014FF00 33002282 */  lb         $v0, 0x33($s1)
    /* 1630C 8014FF04 00000000 */  nop
    /* 16310 8014FF08 02004014 */  bnez       $v0, .L8014FF14
    /* 16314 8014FF0C 00000000 */   nop
    /* 16318 8014FF10 5A0020A2 */  sb         $zero, 0x5A($s1)
  .L8014FF14:
    /* 1631C 8014FF14 2400BF8F */  lw         $ra, 0x24($sp)
    /* 16320 8014FF18 2000B48F */  lw         $s4, 0x20($sp)
    /* 16324 8014FF1C 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 16328 8014FF20 1800B28F */  lw         $s2, 0x18($sp)
    /* 1632C 8014FF24 1400B18F */  lw         $s1, 0x14($sp)
    /* 16330 8014FF28 1000B08F */  lw         $s0, 0x10($sp)
    /* 16334 8014FF2C 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 16338 8014FF30 0800E003 */  jr         $ra
    /* 1633C 8014FF34 00000000 */   nop
endlabel MAI_SkelSd__Fi
