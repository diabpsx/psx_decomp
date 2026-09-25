.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetPal__7TextDatP9FRAME_HDRP8POLY_FT4, 0xC4

glabel SetPal__7TextDatP9FRAME_HDRP8POLY_FT4
    /* 83DD4 80093DD4 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 83DD8 80093DD8 1800B0AF */  sw         $s0, 0x18($sp)
    /* 83DDC 80093DDC 21808000 */  addu       $s0, $a0, $zero
    /* 83DE0 80093DE0 2400BFAF */  sw         $ra, 0x24($sp)
    /* 83DE4 80093DE4 2000B2AF */  sw         $s2, 0x20($sp)
    /* 83DE8 80093DE8 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 83DEC 80093DEC 0600A590 */  lbu        $a1, 0x6($a1)
    /* 83DF0 80093DF0 D454020C */  jal        GetPal__7TextDati_80095350
    /* 83DF4 80093DF4 2190C000 */   addu      $s2, $a2, $zero
    /* 83DF8 80093DF8 21884000 */  addu       $s1, $v0, $zero
    /* 83DFC 80093DFC 0000228E */  lw         $v0, 0x0($s1)
    /* 83E00 80093E00 00000000 */  nop
    /* 83E04 80093E04 01004230 */  andi       $v0, $v0, 0x1
    /* 83E08 80093E08 04004010 */  beqz       $v0, .L80093E1C
    /* 83E0C 80093E0C 00000000 */   nop
    /* 83E10 80093E10 02002296 */  lhu        $v0, 0x2($s1)
    /* 83E14 80093E14 9F4F0208 */  j          .L80093E7C
    /* 83E18 80093E18 0E0042A6 */   sh        $v0, 0xE($s2)
  .L80093E1C:
    /* 83E1C 80093E1C B054020C */  jal        CanXferPal__C7TextDat
    /* 83E20 80093E20 21200002 */   addu      $a0, $s0, $zero
    /* 83E24 80093E24 05004014 */  bnez       $v0, .L80093E3C
    /* 83E28 80093E28 21200000 */   addu      $a0, $zero, $zero
    /* 83E2C 80093E2C 1180053C */  lui        $a1, %hi(D_80110598)
    /* 83E30 80093E30 9805A524 */  addiu      $a1, $a1, %lo(D_80110598)
    /* 83E34 80093E34 A583000C */  jal        DBG_Error
    /* 83E38 80093E38 66050624 */   addiu     $a2, $zero, 0x566
  .L80093E3C:
    /* 83E3C 80093E3C 5800048E */  lw         $a0, 0x58($s0)
    /* 83E40 80093E40 5C00058E */  lw         $a1, 0x5C($s0)
    /* 83E44 80093E44 164C000C */  jal        GetClut
    /* 83E48 80093E48 00000000 */   nop
    /* 83E4C 80093E4C 1000A427 */  addiu      $a0, $sp, 0x10
    /* 83E50 80093E50 0E0042A6 */  sh         $v0, 0xE($s2)
    /* 83E54 80093E54 5800028E */  lw         $v0, 0x58($s0)
    /* 83E58 80093E58 04002526 */  addiu      $a1, $s1, 0x4
    /* 83E5C 80093E5C 1000A2A7 */  sh         $v0, 0x10($sp)
    /* 83E60 80093E60 5C00038E */  lw         $v1, 0x5C($s0)
    /* 83E64 80093E64 40000224 */  addiu      $v0, $zero, 0x40
    /* 83E68 80093E68 1400A2A7 */  sh         $v0, 0x14($sp)
    /* 83E6C 80093E6C 01000224 */  addiu      $v0, $zero, 0x1
    /* 83E70 80093E70 1600A2A7 */  sh         $v0, 0x16($sp)
    /* 83E74 80093E74 494F000C */  jal        LoadImage
    /* 83E78 80093E78 1200A3A7 */   sh        $v1, 0x12($sp)
  .L80093E7C:
    /* 83E7C 80093E7C 2400BF8F */  lw         $ra, 0x24($sp)
    /* 83E80 80093E80 2000B28F */  lw         $s2, 0x20($sp)
    /* 83E84 80093E84 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 83E88 80093E88 1800B08F */  lw         $s0, 0x18($sp)
    /* 83E8C 80093E8C 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 83E90 80093E90 0800E003 */  jr         $ra
    /* 83E94 80093E94 00000000 */   nop
endlabel SetPal__7TextDatP9FRAME_HDRP8POLY_FT4
