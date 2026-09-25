.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckDist__Fii, 0xE8

glabel CheckDist__Fii
    /* 9B910 800AB910 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 9B914 800AB914 2000B4AF */  sw         $s4, 0x20($sp)
    /* 9B918 800AB918 21A08000 */  addu       $s4, $a0, $zero
    /* 9B91C 800AB91C 2400B5AF */  sw         $s5, 0x24($sp)
    /* 9B920 800AB920 21A8A000 */  addu       $s5, $a1, $zero
    /* 9B924 800AB924 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 9B928 800AB928 21980000 */  addu       $s3, $zero, $zero
    /* 9B92C 800AB92C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 9B930 800AB930 21880000 */  addu       $s1, $zero, $zero
    /* 9B934 800AB934 2800BFAF */  sw         $ra, 0x28($sp)
    /* 9B938 800AB938 1800B2AF */  sw         $s2, 0x18($sp)
    /* 9B93C 800AB93C 1000B0AF */  sw         $s0, 0x10($sp)
  .L800AB940:
    /* 9B940 800AB940 0E80013C */  lui        $at, %hi(plr + 0x1D)
    /* 9B944 800AB944 21083100 */  addu       $at, $at, $s1
    /* 9B948 800AB948 55A52290 */  lbu        $v0, %lo(plr + 0x1D)($at)
    /* 9B94C 800AB94C 00000000 */  nop
    /* 9B950 800AB950 1A004010 */  beqz       $v0, .L800AB9BC
    /* 9B954 800AB954 00000000 */   nop
    /* 9B958 800AB958 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 9B95C 800AB95C 21083100 */  addu       $at, $at, $s1
    /* 9B960 800AB960 68A52484 */  lh         $a0, %lo(plr + 0x30)($at)
    /* 9B964 800AB964 6D41000C */  jal        abs
    /* 9B968 800AB968 23208402 */   subu      $a0, $s4, $a0
    /* 9B96C 800AB96C 21900000 */  addu       $s2, $zero, $zero
    /* 9B970 800AB970 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 9B974 800AB974 21083100 */  addu       $at, $at, $s1
    /* 9B978 800AB978 6AA52484 */  lh         $a0, %lo(plr + 0x32)($at)
    /* 9B97C 800AB97C 21804000 */  addu       $s0, $v0, $zero
    /* 9B980 800AB980 6D41000C */  jal        abs
    /* 9B984 800AB984 2320A402 */   subu      $a0, $s5, $a0
    /* 9B988 800AB988 21200002 */  addu       $a0, $s0, $zero
    /* 9B98C 800AB98C 6D41000C */  jal        abs
    /* 9B990 800AB990 21804000 */   addu      $s0, $v0, $zero
    /* 9B994 800AB994 05004228 */  slti       $v0, $v0, 0x5
    /* 9B998 800AB998 04004010 */  beqz       $v0, .L800AB9AC
    /* 9B99C 800AB99C 00000000 */   nop
    /* 9B9A0 800AB9A0 6D41000C */  jal        abs
    /* 9B9A4 800AB9A4 21200002 */   addu      $a0, $s0, $zero
    /* 9B9A8 800AB9A8 05005228 */  slti       $s2, $v0, 0x5
  .L800AB9AC:
    /* 9B9AC 800AB9AC 03004012 */  beqz       $s2, .L800AB9BC
    /* 9B9B0 800AB9B0 01006226 */   addiu     $v0, $s3, 0x1
    /* 9B9B4 800AB9B4 74AE0208 */  j          .L800AB9D0
    /* 9B9B8 800AB9B8 2B100200 */   sltu      $v0, $zero, $v0
  .L800AB9BC:
    /* 9B9BC 800AB9BC 01007326 */  addiu      $s3, $s3, 0x1
    /* 9B9C0 800AB9C0 0200622A */  slti       $v0, $s3, 0x2
    /* 9B9C4 800AB9C4 DEFF4014 */  bnez       $v0, .L800AB940
    /* 9B9C8 800AB9C8 E8193126 */   addiu     $s1, $s1, 0x19E8
    /* 9B9CC 800AB9CC 21100000 */  addu       $v0, $zero, $zero
  .L800AB9D0:
    /* 9B9D0 800AB9D0 2800BF8F */  lw         $ra, 0x28($sp)
    /* 9B9D4 800AB9D4 2400B58F */  lw         $s5, 0x24($sp)
    /* 9B9D8 800AB9D8 2000B48F */  lw         $s4, 0x20($sp)
    /* 9B9DC 800AB9DC 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 9B9E0 800AB9E0 1800B28F */  lw         $s2, 0x18($sp)
    /* 9B9E4 800AB9E4 1400B18F */  lw         $s1, 0x14($sp)
    /* 9B9E8 800AB9E8 1000B08F */  lw         $s0, 0x10($sp)
    /* 9B9EC 800AB9EC 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 9B9F0 800AB9F0 0800E003 */  jr         $ra
    /* 9B9F4 800AB9F4 00000000 */   nop
endlabel CheckDist__Fii
