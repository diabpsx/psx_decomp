.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FuncACID__FP13MissileStructiii, 0xA8

glabel FuncACID__FP13MissileStructiii
    /* 6CBB8 8007CBB8 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 6CBBC 8007CBBC 21500000 */  addu       $t2, $zero, $zero
    /* 6CBC0 8007CBC0 3800BFAF */  sw         $ra, 0x38($sp)
    /* 6CBC4 8007CBC4 3F008880 */  lb         $t0, 0x3F($a0)
    /* 6CBC8 8007CBC8 00000000 */  nop
    /* 6CBCC 8007CBCC 0700022D */  sltiu      $v0, $t0, 0x7
    /* 6CBD0 8007CBD0 1F004010 */  beqz       $v0, .L8007CC50
    /* 6CBD4 8007CBD4 21480000 */   addu      $t1, $zero, $zero
    /* 6CBD8 8007CBD8 05000229 */  slti       $v0, $t0, 0x5
    /* 6CBDC 8007CBDC 05004014 */  bnez       $v0, .L8007CBF4
    /* 6CBE0 8007CBE0 03000229 */   slti      $v0, $t0, 0x3
    /* 6CBE4 8007CBE4 01000A24 */  addiu      $t2, $zero, 0x1
    /* 6CBE8 8007CBE8 FFFF0225 */  addiu      $v0, $t0, -0x1
    /* 6CBEC 8007CBEC 07004838 */  xori       $t0, $v0, 0x7
    /* 6CBF0 8007CBF0 03000229 */  slti       $v0, $t0, 0x3
  .L8007CBF4:
    /* 6CBF4 8007CBF4 03004014 */  bnez       $v0, .L8007CC04
    /* 6CBF8 8007CBF8 00000000 */   nop
    /* 6CBFC 8007CBFC 01000924 */  addiu      $t1, $zero, 0x1
    /* 6CC00 8007CC00 01000831 */  andi       $t0, $t0, 0x1
  .L8007CC04:
    /* 6CC04 8007CC04 47008380 */  lb         $v1, 0x47($a0)
    /* 6CC08 8007CC08 E0000224 */  addiu      $v0, $zero, 0xE0
    /* 6CC0C 8007CC0C 2800A2AF */  sw         $v0, 0x28($sp)
    /* 6CC10 8007CC10 2C00A2AF */  sw         $v0, 0x2C($sp)
    /* 6CC14 8007CC14 80000224 */  addiu      $v0, $zero, 0x80
    /* 6CC18 8007CC18 3000A2AF */  sw         $v0, 0x30($sp)
    /* 6CC1C 8007CC1C 01000224 */  addiu      $v0, $zero, 0x1
    /* 6CC20 8007CC20 2120A000 */  addu       $a0, $a1, $zero
    /* 6CC24 8007CC24 2128C000 */  addu       $a1, $a2, $zero
    /* 6CC28 8007CC28 2130E000 */  addu       $a2, $a3, $zero
    /* 6CC2C 8007CC2C 21380000 */  addu       $a3, $zero, $zero
    /* 6CC30 8007CC30 1400A0AF */  sw         $zero, 0x14($sp)
    /* 6CC34 8007CC34 1800A8AF */  sw         $t0, 0x18($sp)
    /* 6CC38 8007CC38 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 6CC3C 8007CC3C 2000AAAF */  sw         $t2, 0x20($sp)
    /* 6CC40 8007CC40 2400A9AF */  sw         $t1, 0x24($sp)
    /* 6CC44 8007CC44 3400A2AF */  sw         $v0, 0x34($sp)
    /* 6CC48 8007CC48 0DEF010C */  jal        TempPrintMissile__FiiiiiiiiccUcUcUcc
    /* 6CC4C 8007CC4C 1000A3AF */   sw        $v1, 0x10($sp)
  .L8007CC50:
    /* 6CC50 8007CC50 3800BF8F */  lw         $ra, 0x38($sp)
    /* 6CC54 8007CC54 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 6CC58 8007CC58 0800E003 */  jr         $ra
    /* 6CC5C 8007CC5C 00000000 */   nop
endlabel FuncACID__FP13MissileStructiii
