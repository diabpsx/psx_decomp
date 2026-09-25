.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching basefilename, 0xAC

glabel basefilename
    /* 17D28 80027D28 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 17D2C 80027D2C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 17D30 80027D30 21888000 */  addu       $s1, $a0, $zero
    /* 17D34 80027D34 2400BFAF */  sw         $ra, 0x24($sp)
    /* 17D38 80027D38 2000B4AF */  sw         $s4, 0x20($sp)
    /* 17D3C 80027D3C 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 17D40 80027D40 1800B2AF */  sw         $s2, 0x18($sp)
    /* 17D44 80027D44 1000B0AF */  sw         $s0, 0x10($sp)
    /* 17D48 80027D48 00002292 */  lbu        $v0, 0x0($s1)
    /* 17D4C 80027D4C 00000000 */  nop
    /* 17D50 80027D50 16004010 */  beqz       $v0, .L80027DAC
    /* 17D54 80027D54 21802002 */   addu      $s0, $s1, $zero
    /* 17D58 80027D58 5C001424 */  addiu      $s4, $zero, 0x5C
    /* 17D5C 80027D5C 3A001324 */  addiu      $s3, $zero, 0x3A
    /* 17D60 80027D60 2F001224 */  addiu      $s2, $zero, 0x2F
    /* 17D64 80027D64 00000292 */  lbu        $v0, 0x0($s0)
  .L80027D68:
    /* 17D68 80027D68 00000000 */  nop
    /* 17D6C 80027D6C 05005410 */  beq        $v0, $s4, .L80027D84
    /* 17D70 80027D70 00000000 */   nop
    /* 17D74 80027D74 03005310 */  beq        $v0, $s3, .L80027D84
    /* 17D78 80027D78 00000000 */   nop
    /* 17D7C 80027D7C 02005214 */  bne        $v0, $s2, .L80027D88
    /* 17D80 80027D80 00000000 */   nop
  .L80027D84:
    /* 17D84 80027D84 01001126 */  addiu      $s1, $s0, 0x1
  .L80027D88:
    /* 17D88 80027D88 00000492 */  lbu        $a0, 0x0($s0)
    /* 17D8C 80027D8C 69A1000C */  jal        toupper
    /* 17D90 80027D90 00000000 */   nop
    /* 17D94 80027D94 000002A2 */  sb         $v0, 0x0($s0)
    /* 17D98 80027D98 01001026 */  addiu      $s0, $s0, 0x1
    /* 17D9C 80027D9C 00000292 */  lbu        $v0, 0x0($s0)
    /* 17DA0 80027DA0 00000000 */  nop
    /* 17DA4 80027DA4 F0FF4014 */  bnez       $v0, .L80027D68
    /* 17DA8 80027DA8 00000000 */   nop
  .L80027DAC:
    /* 17DAC 80027DAC 21102002 */  addu       $v0, $s1, $zero
    /* 17DB0 80027DB0 2400BF8F */  lw         $ra, 0x24($sp)
    /* 17DB4 80027DB4 2000B48F */  lw         $s4, 0x20($sp)
    /* 17DB8 80027DB8 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 17DBC 80027DBC 1800B28F */  lw         $s2, 0x18($sp)
    /* 17DC0 80027DC0 1400B18F */  lw         $s1, 0x14($sp)
    /* 17DC4 80027DC4 1000B08F */  lw         $s0, 0x10($sp)
    /* 17DC8 80027DC8 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 17DCC 80027DCC 0800E003 */  jr         $ra
    /* 17DD0 80027DD0 00000000 */   nop
endlabel basefilename
