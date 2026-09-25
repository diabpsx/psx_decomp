.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DoUnLight__Fv, 0x244

glabel DoUnLight__Fv
    /* 3CAF4 8004CAF4 6666053C */  lui        $a1, (0x66666667 >> 16)
    /* 3CAF8 8004CAF8 1280033C */  lui        $v1, %hi(gr_scrxoff)
    /* 3CAFC 8004CAFC 98B0638C */  lw         $v1, %lo(gr_scrxoff)($v1)
    /* 3CB00 8004CB00 6766A534 */  ori        $a1, $a1, (0x66666667 & 0xFFFF)
    /* 3CB04 8004CB04 03140300 */  sra        $v0, $v1, 16
    /* 3CB08 8004CB08 18004500 */  mult       $v0, $a1
    /* 3CB0C 8004CB0C 1280043C */  lui        $a0, %hi(gr_scryoff)
    /* 3CB10 8004CB10 9CB0848C */  lw         $a0, %lo(gr_scryoff)($a0)
    /* 3CB14 8004CB14 10380000 */  mfhi       $a3
    /* 3CB18 8004CB18 03140400 */  sra        $v0, $a0, 16
    /* 3CB1C 8004CB1C 00000000 */  nop
    /* 3CB20 8004CB20 18004500 */  mult       $v0, $a1
    /* 3CB24 8004CB24 F8FFBD27 */  addiu      $sp, $sp, -0x8
    /* 3CB28 8004CB28 0400B1AF */  sw         $s1, 0x4($sp)
    /* 3CB2C 8004CB2C 0000B0AF */  sw         $s0, 0x0($sp)
    /* 3CB30 8004CB30 C31F0300 */  sra        $v1, $v1, 31
    /* 3CB34 8004CB34 C3270400 */  sra        $a0, $a0, 31
    /* 3CB38 8004CB38 03110700 */  sra        $v0, $a3, 4
    /* 3CB3C 8004CB3C 23284300 */  subu       $a1, $v0, $v1
    /* 3CB40 8004CB40 F7FFAD24 */  addiu      $t5, $a1, -0x9
    /* 3CB44 8004CB44 10300000 */  mfhi       $a2
    /* 3CB48 8004CB48 03110600 */  sra        $v0, $a2, 4
    /* 3CB4C 8004CB4C 23184400 */  subu       $v1, $v0, $a0
    /* 3CB50 8004CB50 1280023C */  lui        $v0, %hi(leveltype)
    /* 3CB54 8004CB54 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 3CB58 8004CB58 00000000 */  nop
    /* 3CB5C 8004CB5C 03004014 */  bnez       $v0, .L8004CB6C
    /* 3CB60 8004CB60 F3FF6E24 */   addiu     $t6, $v1, -0xD
    /* 3CB64 8004CB64 FFFFAD24 */  addiu      $t5, $a1, -0x1
    /* 3CB68 8004CB68 FBFF6E24 */  addiu      $t6, $v1, -0x5
  .L8004CB6C:
    /* 3CB6C 8004CB6C 0D001824 */  addiu      $t8, $zero, 0xD
    /* 3CB70 8004CB70 0E001924 */  addiu      $t9, $zero, 0xE
    /* 3CB74 8004CB74 30001024 */  addiu      $s0, $zero, 0x30
    /* 3CB78 8004CB78 0B00C005 */  bltz       $t6, .L8004CBA8
    /* 3CB7C 8004CB7C 30000F24 */   addiu     $t7, $zero, 0x30
    /* 3CB80 8004CB80 0E00C225 */  addiu      $v0, $t6, 0xE
    /* 3CB84 8004CB84 2A10E201 */  slt        $v0, $t7, $v0
    /* 3CB88 8004CB88 08004014 */  bnez       $v0, .L8004CBAC
    /* 3CB8C 8004CB8C 2148A001 */   addu      $t1, $t5, $zero
    /* 3CB90 8004CB90 0700A005 */  bltz       $t5, .L8004CBB0
    /* 3CB94 8004CB94 21103801 */   addu      $v0, $t1, $t8
    /* 3CB98 8004CB98 0D00A325 */  addiu      $v1, $t5, 0xD
    /* 3CB9C 8004CB9C 2A10E301 */  slt        $v0, $t7, $v1
    /* 3CBA0 8004CBA0 3B004010 */  beqz       $v0, .L8004CC90
    /* 3CBA4 8004CBA4 2A106900 */   slt       $v0, $v1, $t1
  .L8004CBA8:
    /* 3CBA8 8004CBA8 2148A001 */  addu       $t1, $t5, $zero
  .L8004CBAC:
    /* 3CBAC 8004CBAC 21103801 */  addu       $v0, $t1, $t8
  .L8004CBB0:
    /* 3CBB0 8004CBB0 2A104900 */  slt        $v0, $v0, $t1
    /* 3CBB4 8004CBB4 5B004014 */  bnez       $v0, .L8004CD24
    /* 3CBB8 8004CBB8 C0100900 */   sll       $v0, $t1, 3
    /* 3CBBC 8004CBBC 1080033C */  lui        $v1, %hi(dung_map_b)
    /* 3CBC0 8004CBC0 A81A6324 */  addiu      $v1, $v1, %lo(dung_map_b)
    /* 3CBC4 8004CBC4 23104900 */  subu       $v0, $v0, $t1
    /* 3CBC8 8004CBC8 C0100200 */  sll        $v0, $v0, 3
    /* 3CBCC 8004CBCC 21604300 */  addu       $t4, $v0, $v1
    /* 3CBD0 8004CBD0 1080033C */  lui        $v1, %hi(dung_map_g)
    /* 3CBD4 8004CBD4 680E6324 */  addiu      $v1, $v1, %lo(dung_map_g)
    /* 3CBD8 8004CBD8 21584300 */  addu       $t3, $v0, $v1
    /* 3CBDC 8004CBDC 1080033C */  lui        $v1, %hi(dung_map_r)
    /* 3CBE0 8004CBE0 28026324 */  addiu      $v1, $v1, %lo(dung_map_r)
    /* 3CBE4 8004CBE4 21504300 */  addu       $t2, $v0, $v1
  .L8004CBE8:
    /* 3CBE8 8004CBE8 2118C001 */  addu       $v1, $t6, $zero
    /* 3CBEC 8004CBEC 21207900 */  addu       $a0, $v1, $t9
    /* 3CBF0 8004CBF0 2A108300 */  slt        $v0, $a0, $v1
    /* 3CBF4 8004CBF4 1D004014 */  bnez       $v0, .L8004CC6C
    /* 3CBF8 8004CBF8 00000000 */   nop
    /* 3CBFC 8004CBFC 2A400902 */  slt        $t0, $s0, $t1
    /* 3CC00 8004CC00 21388000 */  addu       $a3, $a0, $zero
    /* 3CC04 8004CC04 21306C00 */  addu       $a2, $v1, $t4
    /* 3CC08 8004CC08 21286B00 */  addu       $a1, $v1, $t3
    /* 3CC0C 8004CC0C 21206A00 */  addu       $a0, $v1, $t2
  .L8004CC10:
    /* 3CC10 8004CC10 10002005 */  bltz       $t1, .L8004CC54
    /* 3CC14 8004CC14 00000000 */   nop
    /* 3CC18 8004CC18 0E000015 */  bnez       $t0, .L8004CC54
    /* 3CC1C 8004CC1C 00000000 */   nop
    /* 3CC20 8004CC20 0C006004 */  bltz       $v1, .L8004CC54
    /* 3CC24 8004CC24 2A10E301 */   slt       $v0, $t7, $v1
    /* 3CC28 8004CC28 0A004014 */  bnez       $v0, .L8004CC54
    /* 3CC2C 8004CC2C 00000000 */   nop
    /* 3CC30 8004CC30 7811828F */  lw         $v0, %gp_rel(restore_r)($gp)
    /* 3CC34 8004CC34 00000000 */  nop
    /* 3CC38 8004CC38 000082A0 */  sb         $v0, 0x0($a0)
    /* 3CC3C 8004CC3C 7C11828F */  lw         $v0, %gp_rel(restore_g)($gp)
    /* 3CC40 8004CC40 00000000 */  nop
    /* 3CC44 8004CC44 0000A2A0 */  sb         $v0, 0x0($a1)
    /* 3CC48 8004CC48 8011828F */  lw         $v0, %gp_rel(restore_b)($gp)
    /* 3CC4C 8004CC4C 00000000 */  nop
    /* 3CC50 8004CC50 0000C2A0 */  sb         $v0, 0x0($a2)
  .L8004CC54:
    /* 3CC54 8004CC54 0100C624 */  addiu      $a2, $a2, 0x1
    /* 3CC58 8004CC58 0100A524 */  addiu      $a1, $a1, 0x1
    /* 3CC5C 8004CC5C 01006324 */  addiu      $v1, $v1, 0x1
    /* 3CC60 8004CC60 2A10E300 */  slt        $v0, $a3, $v1
    /* 3CC64 8004CC64 EAFF4010 */  beqz       $v0, .L8004CC10
    /* 3CC68 8004CC68 01008424 */   addiu     $a0, $a0, 0x1
  .L8004CC6C:
    /* 3CC6C 8004CC6C 38008C25 */  addiu      $t4, $t4, 0x38
    /* 3CC70 8004CC70 38006B25 */  addiu      $t3, $t3, 0x38
    /* 3CC74 8004CC74 01002925 */  addiu      $t1, $t1, 0x1
    /* 3CC78 8004CC78 2110B801 */  addu       $v0, $t5, $t8
    /* 3CC7C 8004CC7C 2A104900 */  slt        $v0, $v0, $t1
    /* 3CC80 8004CC80 D9FF4010 */  beqz       $v0, .L8004CBE8
    /* 3CC84 8004CC84 38004A25 */   addiu     $t2, $t2, 0x38
    /* 3CC88 8004CC88 49330108 */  j          .L8004CD24
    /* 3CC8C 8004CC8C 00000000 */   nop
  .L8004CC90:
    /* 3CC90 8004CC90 24004014 */  bnez       $v0, .L8004CD24
    /* 3CC94 8004CC94 21506000 */   addu      $t2, $v1, $zero
    /* 3CC98 8004CC98 1080023C */  lui        $v0, %hi(dung_map_r)
    /* 3CC9C 8004CC9C 28024224 */  addiu      $v0, $v0, %lo(dung_map_r)
    /* 3CCA0 8004CCA0 2168C201 */  addu       $t5, $t6, $v0
    /* 3CCA4 8004CCA4 1080023C */  lui        $v0, %hi(dung_map_g)
    /* 3CCA8 8004CCA8 680E4224 */  addiu      $v0, $v0, %lo(dung_map_g)
    /* 3CCAC 8004CCAC 2160C201 */  addu       $t4, $t6, $v0
    /* 3CCB0 8004CCB0 1080023C */  lui        $v0, %hi(dung_map_b)
    /* 3CCB4 8004CCB4 A81A4224 */  addiu      $v0, $v0, %lo(dung_map_b)
    /* 3CCB8 8004CCB8 2158C201 */  addu       $t3, $t6, $v0
    /* 3CCBC 8004CCBC C0100900 */  sll        $v0, $t1, 3
    /* 3CCC0 8004CCC0 23104900 */  subu       $v0, $v0, $t1
    /* 3CCC4 8004CCC4 C0400200 */  sll        $t0, $v0, 3
  .L8004CCC8:
    /* 3CCC8 8004CCC8 21380D01 */  addu       $a3, $t0, $t5
    /* 3CCCC 8004CCCC 21300C01 */  addu       $a2, $t0, $t4
    /* 3CCD0 8004CCD0 2118C001 */  addu       $v1, $t6, $zero
    /* 3CCD4 8004CCD4 21207900 */  addu       $a0, $v1, $t9
    /* 3CCD8 8004CCD8 2A108300 */  slt        $v0, $a0, $v1
    /* 3CCDC 8004CCDC 0D004014 */  bnez       $v0, .L8004CD14
    /* 3CCE0 8004CCE0 21280B01 */   addu      $a1, $t0, $t3
  .L8004CCE4:
    /* 3CCE4 8004CCE4 78118293 */  lbu        $v0, %gp_rel(restore_r)($gp)
    /* 3CCE8 8004CCE8 01006324 */  addiu      $v1, $v1, 0x1
    /* 3CCEC 8004CCEC 0000E2A0 */  sb         $v0, 0x0($a3)
    /* 3CCF0 8004CCF0 7C118293 */  lbu        $v0, %gp_rel(restore_g)($gp)
    /* 3CCF4 8004CCF4 0100E724 */  addiu      $a3, $a3, 0x1
    /* 3CCF8 8004CCF8 0000C2A0 */  sb         $v0, 0x0($a2)
    /* 3CCFC 8004CCFC 80118293 */  lbu        $v0, %gp_rel(restore_b)($gp)
    /* 3CD00 8004CD00 0100C624 */  addiu      $a2, $a2, 0x1
    /* 3CD04 8004CD04 0000A2A0 */  sb         $v0, 0x0($a1)
    /* 3CD08 8004CD08 2A108300 */  slt        $v0, $a0, $v1
    /* 3CD0C 8004CD0C F5FF4010 */  beqz       $v0, .L8004CCE4
    /* 3CD10 8004CD10 0100A524 */   addiu     $a1, $a1, 0x1
  .L8004CD14:
    /* 3CD14 8004CD14 01002925 */  addiu      $t1, $t1, 0x1
    /* 3CD18 8004CD18 2A104901 */  slt        $v0, $t2, $t1
    /* 3CD1C 8004CD1C EAFF4010 */  beqz       $v0, .L8004CCC8
    /* 3CD20 8004CD20 38000825 */   addiu     $t0, $t0, 0x38
  .L8004CD24:
    /* 3CD24 8004CD24 0400B18F */  lw         $s1, 0x4($sp)
    /* 3CD28 8004CD28 0000B08F */  lw         $s0, 0x0($sp)
    /* 3CD2C 8004CD2C 0800BD27 */  addiu      $sp, $sp, 0x8
    /* 3CD30 8004CD30 0800E003 */  jr         $ra
    /* 3CD34 8004CD34 00000000 */   nop
endlabel DoUnLight__Fv
