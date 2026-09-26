.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_CallWalk2__Fii, 0xF8

glabel M_CallWalk2__Fii
    /* 15CF8 8014F8F0 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 15CFC 8014F8F4 1800B2AF */  sw         $s2, 0x18($sp)
    /* 15D00 8014F8F8 21908000 */  addu       $s2, $a0, $zero
    /* 15D04 8014F8FC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 15D08 8014F900 2188A000 */  addu       $s1, $a1, $zero
    /* 15D0C 8014F904 2400BFAF */  sw         $ra, 0x24($sp)
    /* 15D10 8014F908 2000B4AF */  sw         $s4, 0x20($sp)
    /* 15D14 8014F90C 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 15D18 8014F910 EB53050C */  jal        DirOK__Fii
    /* 15D1C 8014F914 1000B0AF */   sw        $s0, 0x10($sp)
    /* 15D20 8014F918 21804000 */  addu       $s0, $v0, $zero
    /* 15D24 8014F91C 02000424 */  addiu      $a0, $zero, 0x2
    /* 15D28 8014F920 C9F6000C */  jal        ENG_random__Fl
    /* 15D2C 8014F924 21A02002 */   addu      $s4, $s1, $zero
    /* 15D30 8014F928 0D004010 */  beqz       $v0, .L8014F960
    /* 15D34 8014F92C FF000232 */   andi      $v0, $s0, 0xFF
    /* 15D38 8014F930 1C004014 */  bnez       $v0, .L8014F9A4
    /* 15D3C 8014F934 21980000 */   addu      $s3, $zero, $zero
    /* 15D40 8014F938 FFFF2226 */  addiu      $v0, $s1, -0x1
    /* 15D44 8014F93C 07005130 */  andi       $s1, $v0, 0x7
    /* 15D48 8014F940 21204002 */  addu       $a0, $s2, $zero
    /* 15D4C 8014F944 EB53050C */  jal        DirOK__Fii
    /* 15D50 8014F948 21282002 */   addu      $a1, $s1, $zero
    /* 15D54 8014F94C FF004230 */  andi       $v0, $v0, 0xFF
    /* 15D58 8014F950 14004014 */  bnez       $v0, .L8014F9A4
    /* 15D5C 8014F954 01008226 */   addiu     $v0, $s4, 0x1
    /* 15D60 8014F958 633E0508 */  j          .L8014F98C
    /* 15D64 8014F95C 07005130 */   andi      $s1, $v0, 0x7
  .L8014F960:
    /* 15D68 8014F960 10004014 */  bnez       $v0, .L8014F9A4
    /* 15D6C 8014F964 21980000 */   addu      $s3, $zero, $zero
    /* 15D70 8014F968 01002226 */  addiu      $v0, $s1, 0x1
    /* 15D74 8014F96C 07005130 */  andi       $s1, $v0, 0x7
    /* 15D78 8014F970 21204002 */  addu       $a0, $s2, $zero
    /* 15D7C 8014F974 EB53050C */  jal        DirOK__Fii
    /* 15D80 8014F978 21282002 */   addu      $a1, $s1, $zero
    /* 15D84 8014F97C FF004230 */  andi       $v0, $v0, 0xFF
    /* 15D88 8014F980 08004014 */  bnez       $v0, .L8014F9A4
    /* 15D8C 8014F984 FFFF8226 */   addiu     $v0, $s4, -0x1
    /* 15D90 8014F988 07005130 */  andi       $s1, $v0, 0x7
  .L8014F98C:
    /* 15D94 8014F98C 21204002 */  addu       $a0, $s2, $zero
    /* 15D98 8014F990 EB53050C */  jal        DirOK__Fii
    /* 15D9C 8014F994 21282002 */   addu      $a1, $s1, $zero
    /* 15DA0 8014F998 FF004230 */  andi       $v0, $v0, 0xFF
    /* 15DA4 8014F99C 03004010 */  beqz       $v0, .L8014F9AC
    /* 15DA8 8014F9A0 21806002 */   addu      $s0, $s3, $zero
  .L8014F9A4:
    /* 15DAC 8014F9A4 01001324 */  addiu      $s3, $zero, 0x1
    /* 15DB0 8014F9A8 21806002 */  addu       $s0, $s3, $zero
  .L8014F9AC:
    /* 15DB4 8014F9AC FF001032 */  andi       $s0, $s0, 0xFF
    /* 15DB8 8014F9B0 03000012 */  beqz       $s0, .L8014F9C0
    /* 15DBC 8014F9B4 21204002 */   addu      $a0, $s2, $zero
    /* 15DC0 8014F9B8 433C050C */  jal        M_WalkDir__Fii
    /* 15DC4 8014F9BC 21282002 */   addu      $a1, $s1, $zero
  .L8014F9C0:
    /* 15DC8 8014F9C0 21100002 */  addu       $v0, $s0, $zero
    /* 15DCC 8014F9C4 2400BF8F */  lw         $ra, 0x24($sp)
    /* 15DD0 8014F9C8 2000B48F */  lw         $s4, 0x20($sp)
    /* 15DD4 8014F9CC 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 15DD8 8014F9D0 1800B28F */  lw         $s2, 0x18($sp)
    /* 15DDC 8014F9D4 1400B18F */  lw         $s1, 0x14($sp)
    /* 15DE0 8014F9D8 1000B08F */  lw         $s0, 0x10($sp)
    /* 15DE4 8014F9DC 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 15DE8 8014F9E0 0800E003 */  jr         $ra
    /* 15DEC 8014F9E4 00000000 */   nop
endlabel M_CallWalk2__Fii
