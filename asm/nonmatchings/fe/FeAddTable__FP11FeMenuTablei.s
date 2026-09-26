.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FeAddTable__FP11FeMenuTablei, 0x7C

glabel FeAddTable__FP11FeMenuTablei
    /* DC 80139CD4 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* E0 80139CD8 2000B0AF */  sw         $s0, 0x20($sp)
    /* E4 80139CDC 21808000 */  addu       $s0, $a0, $zero
    /* E8 80139CE0 2800B2AF */  sw         $s2, 0x28($sp)
    /* EC 80139CE4 2190A000 */  addu       $s2, $a1, $zero
    /* F0 80139CE8 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* F4 80139CEC 09E7040C */  jal        FeInitBuffer__Fv
    /* F8 80139CF0 2400B1AF */   sw        $s1, 0x24($sp)
    /* FC 80139CF4 0F00401A */  blez       $s2, .L80139D34
    /* 100 80139CF8 21880000 */   addu      $s1, $zero, $zero
  .L80139CFC:
    /* 104 80139CFC 1000028E */  lw         $v0, 0x10($s0)
    /* 108 80139D00 0C000796 */  lhu        $a3, 0xC($s0)
    /* 10C 80139D04 1000A2AF */  sw         $v0, 0x10($sp)
    /* 110 80139D08 1400028E */  lw         $v0, 0x14($s0)
    /* 114 80139D0C 01003126 */  addiu      $s1, $s1, 0x1
    /* 118 80139D10 1400A2AF */  sw         $v0, 0x14($sp)
    /* 11C 80139D14 0000048E */  lw         $a0, 0x0($s0)
    /* 120 80139D18 0400058E */  lw         $a1, 0x4($s0)
    /* 124 80139D1C 0800068E */  lw         $a2, 0x8($s0)
    /* 128 80139D20 14E7040C */  jal        FeAddEntry__Fii8TXT_JUSTUsP7FeTableP5CFont
    /* 12C 80139D24 18001026 */   addiu     $s0, $s0, 0x18
    /* 130 80139D28 2A103202 */  slt        $v0, $s1, $s2
    /* 134 80139D2C F3FF4014 */  bnez       $v0, .L80139CFC
    /* 138 80139D30 00000000 */   nop
  .L80139D34:
    /* 13C 80139D34 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 140 80139D38 2800B28F */  lw         $s2, 0x28($sp)
    /* 144 80139D3C 2400B18F */  lw         $s1, 0x24($sp)
    /* 148 80139D40 2000B08F */  lw         $s0, 0x20($sp)
    /* 14C 80139D44 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 150 80139D48 0800E003 */  jr         $ra
    /* 154 80139D4C 00000000 */   nop
endlabel FeAddTable__FP11FeMenuTablei
