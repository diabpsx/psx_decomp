.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ResurrectFX__Fiiii, 0x228

glabel ResurrectFX__Fiiii
    /* 8FDC0 8009FDC0 B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 8FDC4 8009FDC4 3000B4AF */  sw         $s4, 0x30($sp)
    /* 8FDC8 8009FDC8 21A08000 */  addu       $s4, $a0, $zero
    /* 8FDCC 8009FDCC 2400B1AF */  sw         $s1, 0x24($sp)
    /* 8FDD0 8009FDD0 2188A000 */  addu       $s1, $a1, $zero
    /* 8FDD4 8009FDD4 2000B0AF */  sw         $s0, 0x20($sp)
    /* 8FDD8 8009FDD8 2180C000 */  addu       $s0, $a2, $zero
    /* 8FDDC 8009FDDC 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 8FDE0 8009FDE0 2198E000 */  addu       $s3, $a3, $zero
    /* 8FDE4 8009FDE4 4400BFAF */  sw         $ra, 0x44($sp)
    /* 8FDE8 8009FDE8 4000BEAF */  sw         $fp, 0x40($sp)
    /* 8FDEC 8009FDEC 3C00B7AF */  sw         $s7, 0x3C($sp)
    /* 8FDF0 8009FDF0 3800B6AF */  sw         $s6, 0x38($sp)
    /* 8FDF4 8009FDF4 3400B5AF */  sw         $s5, 0x34($sp)
    /* 8FDF8 8009FDF8 3E10020C */  jal        VID_GetTick__Fv
    /* 8FDFC 8009FDFC 2800B2AF */   sw        $s2, 0x28($sp)
    /* 8FE00 8009FE00 21208002 */  addu       $a0, $s4, $zero
    /* 8FE04 8009FE04 C22F1100 */  srl        $a1, $s1, 31
    /* 8FE08 8009FE08 21282502 */  addu       $a1, $s1, $a1
    /* 8FE0C 8009FE0C 43280500 */  sra        $a1, $a1, 1
    /* 8FE10 8009FE10 08000624 */  addiu      $a2, $zero, 0x8
    /* 8FE14 8009FE14 21382002 */  addu       $a3, $s1, $zero
    /* 8FE18 8009FE18 40000324 */  addiu      $v1, $zero, 0x40
    /* 8FE1C 8009FE1C 82900200 */  srl        $s2, $v0, 2
    /* 8FE20 8009FE20 01005232 */  andi       $s2, $s2, 0x1
    /* 8FE24 8009FE24 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8FE28 8009FE28 1400A0AF */  sw         $zero, 0x14($sp)
    /* 8FE2C 8009FE2C 1800A3AF */  sw         $v1, 0x18($sp)
    /* 8FE30 8009FE30 B07E020C */  jal        Teleportfx__Fiiiiiiii
    /* 8FE34 8009FE34 1C00B3AF */   sw        $s3, 0x1C($sp)
    /* 8FE38 8009FE38 2000163C */  lui        $s6, (0x202020 >> 16)
    /* 8FE3C 8009FE3C 2020D636 */  ori        $s6, $s6, (0x202020 & 0xFFFF)
    /* 8FE40 8009FE40 8000153C */  lui        $s5, (0x808080 >> 16)
    /* 8FE44 8009FE44 8080B536 */  ori        $s5, $s5, (0x808080 & 0xFFFF)
    /* 8FE48 8009FE48 F6FF8426 */  addiu      $a0, $s4, -0xA
    /* 8FE4C 8009FE4C 21280000 */  addu       $a1, $zero, $zero
    /* 8FE50 8009FE50 0A000624 */  addiu      $a2, $zero, 0xA
    /* 8FE54 8009FE54 40801100 */  sll        $s0, $s1, 1
    /* 8FE58 8009FE58 21801102 */  addu       $s0, $s0, $s1
    /* 8FE5C 8009FE5C C2171000 */  srl        $v0, $s0, 31
    /* 8FE60 8009FE60 21800202 */  addu       $s0, $s0, $v0
    /* 8FE64 8009FE64 43801000 */  sra        $s0, $s0, 1
    /* 8FE68 8009FE68 21381202 */  addu       $a3, $s0, $s2
    /* 8FE6C 8009FE6C 05000226 */  addiu      $v0, $s0, 0x5
    /* 8FE70 8009FE70 1000A2AF */  sw         $v0, 0x10($sp)
    /* 8FE74 8009FE74 1400B6AF */  sw         $s6, 0x14($sp)
    /* 8FE78 8009FE78 1800B5AF */  sw         $s5, 0x18($sp)
    /* 8FE7C 8009FE7C C37B020C */  jal        drawpolyG4__Fiiiiiiii
    /* 8FE80 8009FE80 1C00B3AF */   sw        $s3, 0x1C($sp)
    /* 8FE84 8009FE84 21208002 */  addu       $a0, $s4, $zero
    /* 8FE88 8009FE88 21280000 */  addu       $a1, $zero, $zero
    /* 8FE8C 8009FE8C 08000624 */  addiu      $a2, $zero, 0x8
    /* 8FE90 8009FE90 06000726 */  addiu      $a3, $s0, 0x6
    /* 8FE94 8009FE94 1000A7AF */  sw         $a3, 0x10($sp)
    /* 8FE98 8009FE98 1400B5AF */  sw         $s5, 0x14($sp)
    /* 8FE9C 8009FE9C 1800B5AF */  sw         $s5, 0x18($sp)
    /* 8FEA0 8009FEA0 C37B020C */  jal        drawpolyG4__Fiiiiiiii
    /* 8FEA4 8009FEA4 1C00B3AF */   sw        $s3, 0x1C($sp)
    /* 8FEA8 8009FEA8 08009726 */  addiu      $s7, $s4, 0x8
    /* 8FEAC 8009FEAC 2120E002 */  addu       $a0, $s7, $zero
    /* 8FEB0 8009FEB0 21280000 */  addu       $a1, $zero, $zero
    /* 8FEB4 8009FEB4 0A000624 */  addiu      $a2, $zero, 0xA
    /* 8FEB8 8009FEB8 05005226 */  addiu      $s2, $s2, 0x5
    /* 8FEBC 8009FEBC 21381202 */  addu       $a3, $s0, $s2
    /* 8FEC0 8009FEC0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8FEC4 8009FEC4 1400B5AF */  sw         $s5, 0x14($sp)
    /* 8FEC8 8009FEC8 1800B6AF */  sw         $s6, 0x18($sp)
    /* 8FECC 8009FECC C37B020C */  jal        drawpolyG4__Fiiiiiiii
    /* 8FED0 8009FED0 1C00B3AF */   sw        $s3, 0x1C($sp)
    /* 8FED4 8009FED4 60001E3C */  lui        $fp, (0x606060 >> 16)
    /* 8FED8 8009FED8 6060DE37 */  ori        $fp, $fp, (0x606060 & 0xFFFF)
    /* 8FEDC 8009FEDC FEFF8426 */  addiu      $a0, $s4, -0x2
    /* 8FEE0 8009FEE0 21280000 */  addu       $a1, $zero, $zero
    /* 8FEE4 8009FEE4 01000624 */  addiu      $a2, $zero, 0x1
    /* 8FEE8 8009FEE8 FFFF1626 */  addiu      $s6, $s0, -0x1
    /* 8FEEC 8009FEEC 2138C002 */  addu       $a3, $s6, $zero
    /* 8FEF0 8009FEF0 1000BEAF */  sw         $fp, 0x10($sp)
    /* 8FEF4 8009FEF4 767B020C */  jal        drawpolyF4__Fiiiiii
    /* 8FEF8 8009FEF8 1400B3AF */   sw        $s3, 0x14($sp)
    /* 8FEFC 8009FEFC FFFF8426 */  addiu      $a0, $s4, -0x1
    /* 8FF00 8009FF00 21280000 */  addu       $a1, $zero, $zero
    /* 8FF04 8009FF04 01000624 */  addiu      $a2, $zero, 0x1
    /* 8FF08 8009FF08 21380002 */  addu       $a3, $s0, $zero
    /* 8FF0C 8009FF0C 1000B5AF */  sw         $s5, 0x10($sp)
    /* 8FF10 8009FF10 767B020C */  jal        drawpolyF4__Fiiiiii
    /* 8FF14 8009FF14 1400B3AF */   sw        $s3, 0x14($sp)
    /* 8FF18 8009FF18 8000123C */  lui        $s2, (0x80C0C0 >> 16)
    /* 8FF1C 8009FF1C C0C05236 */  ori        $s2, $s2, (0x80C0C0 & 0xFFFF)
    /* 8FF20 8009FF20 21208002 */  addu       $a0, $s4, $zero
    /* 8FF24 8009FF24 21280000 */  addu       $a1, $zero, $zero
    /* 8FF28 8009FF28 02000624 */  addiu      $a2, $zero, 0x2
    /* 8FF2C 8009FF2C 01001126 */  addiu      $s1, $s0, 0x1
    /* 8FF30 8009FF30 21382002 */  addu       $a3, $s1, $zero
    /* 8FF34 8009FF34 1000B2AF */  sw         $s2, 0x10($sp)
    /* 8FF38 8009FF38 767B020C */  jal        drawpolyF4__Fiiiiii
    /* 8FF3C 8009FF3C 1400B3AF */   sw        $s3, 0x14($sp)
    /* 8FF40 8009FF40 02008426 */  addiu      $a0, $s4, 0x2
    /* 8FF44 8009FF44 21280000 */  addu       $a1, $zero, $zero
    /* 8FF48 8009FF48 04000624 */  addiu      $a2, $zero, 0x4
    /* 8FF4C 8009FF4C 02000726 */  addiu      $a3, $s0, 0x2
    /* 8FF50 8009FF50 FFFF0234 */  ori        $v0, $zero, 0xFFFF
    /* 8FF54 8009FF54 1000A2AF */  sw         $v0, 0x10($sp)
    /* 8FF58 8009FF58 767B020C */  jal        drawpolyF4__Fiiiiii
    /* 8FF5C 8009FF5C 1400B3AF */   sw        $s3, 0x14($sp)
    /* 8FF60 8009FF60 06008426 */  addiu      $a0, $s4, 0x6
    /* 8FF64 8009FF64 21280000 */  addu       $a1, $zero, $zero
    /* 8FF68 8009FF68 02000624 */  addiu      $a2, $zero, 0x2
    /* 8FF6C 8009FF6C 21382002 */  addu       $a3, $s1, $zero
    /* 8FF70 8009FF70 1000B2AF */  sw         $s2, 0x10($sp)
    /* 8FF74 8009FF74 767B020C */  jal        drawpolyF4__Fiiiiii
    /* 8FF78 8009FF78 1400B3AF */   sw        $s3, 0x14($sp)
    /* 8FF7C 8009FF7C 2120E002 */  addu       $a0, $s7, $zero
    /* 8FF80 8009FF80 21280000 */  addu       $a1, $zero, $zero
    /* 8FF84 8009FF84 01000624 */  addiu      $a2, $zero, 0x1
    /* 8FF88 8009FF88 21380002 */  addu       $a3, $s0, $zero
    /* 8FF8C 8009FF8C 1000B5AF */  sw         $s5, 0x10($sp)
    /* 8FF90 8009FF90 767B020C */  jal        drawpolyF4__Fiiiiii
    /* 8FF94 8009FF94 1400B3AF */   sw        $s3, 0x14($sp)
    /* 8FF98 8009FF98 09008426 */  addiu      $a0, $s4, 0x9
    /* 8FF9C 8009FF9C 21280000 */  addu       $a1, $zero, $zero
    /* 8FFA0 8009FFA0 01000624 */  addiu      $a2, $zero, 0x1
    /* 8FFA4 8009FFA4 2138C002 */  addu       $a3, $s6, $zero
    /* 8FFA8 8009FFA8 1000BEAF */  sw         $fp, 0x10($sp)
    /* 8FFAC 8009FFAC 767B020C */  jal        drawpolyF4__Fiiiiii
    /* 8FFB0 8009FFB0 1400B3AF */   sw        $s3, 0x14($sp)
    /* 8FFB4 8009FFB4 4400BF8F */  lw         $ra, 0x44($sp)
    /* 8FFB8 8009FFB8 4000BE8F */  lw         $fp, 0x40($sp)
    /* 8FFBC 8009FFBC 3C00B78F */  lw         $s7, 0x3C($sp)
    /* 8FFC0 8009FFC0 3800B68F */  lw         $s6, 0x38($sp)
    /* 8FFC4 8009FFC4 3400B58F */  lw         $s5, 0x34($sp)
    /* 8FFC8 8009FFC8 3000B48F */  lw         $s4, 0x30($sp)
    /* 8FFCC 8009FFCC 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 8FFD0 8009FFD0 2800B28F */  lw         $s2, 0x28($sp)
    /* 8FFD4 8009FFD4 2400B18F */  lw         $s1, 0x24($sp)
    /* 8FFD8 8009FFD8 2000B08F */  lw         $s0, 0x20($sp)
    /* 8FFDC 8009FFDC 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 8FFE0 8009FFE0 0800E003 */  jr         $ra
    /* 8FFE4 8009FFE4 00000000 */   nop
endlabel ResurrectFX__Fiiii
