.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BIRD_StartHop__FP10BIRDSTRUCT, 0x1D4

glabel BIRD_StartHop__FP10BIRDSTRUCT
    /* 9BB78 800ABB78 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 9BB7C 800ABB7C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 9BB80 800ABB80 21808000 */  addu       $s0, $a0, $zero
    /* 9BB84 800ABB84 08000424 */  addiu      $a0, $zero, 0x8
    /* 9BB88 800ABB88 2400BFAF */  sw         $ra, 0x24($sp)
    /* 9BB8C 800ABB8C 2000B4AF */  sw         $s4, 0x20($sp)
    /* 9BB90 800ABB90 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 9BB94 800ABB94 1800B2AF */  sw         $s2, 0x18($sp)
    /* 9BB98 800ABB98 C9F6000C */  jal        ENG_random__Fl
    /* 9BB9C 800ABB9C 1400B1AF */   sw        $s1, 0x14($sp)
    /* 9BBA0 800ABBA0 21A04000 */  addu       $s4, $v0, $zero
    /* 9BBA4 800ABBA4 1280013C */  lui        $at, %hi(offset_x)
    /* 9BBA8 800ABBA8 21083400 */  addu       $at, $at, $s4
    /* 9BBAC 800ABBAC A8C22280 */  lb         $v0, %lo(offset_x)($at)
    /* 9BBB0 800ABBB0 1D0B8483 */  lb         $a0, %gp_rel(hop_height)($gp)
    /* 9BBB4 800ABBB4 00000000 */  nop
    /* 9BBB8 800ABBB8 18004400 */  mult       $v0, $a0
    /* 9BBBC 800ABBBC 12980000 */  mflo       $s3
    /* 9BBC0 800ABBC0 1280013C */  lui        $at, %hi(offset_y)
    /* 9BBC4 800ABBC4 21083400 */  addu       $at, $at, $s4
    /* 9BBC8 800ABBC8 B0C22280 */  lb         $v0, %lo(offset_y)($at)
    /* 9BBCC 800ABBCC 00000000 */  nop
    /* 9BBD0 800ABBD0 18004400 */  mult       $v0, $a0
    /* 9BBD4 800ABBD4 14000392 */  lbu        $v1, 0x14($s0)
    /* 9BBD8 800ABBD8 12900000 */  mflo       $s2
    /* 9BBDC 800ABBDC 13006014 */  bnez       $v1, .L800ABC2C
    /* 9BBE0 800ABBE0 00000000 */   nop
    /* 9BBE4 800ABBE4 04000686 */  lh         $a2, 0x4($s0)
    /* 9BBE8 800ABBE8 0000028E */  lw         $v0, 0x0($s0)
    /* 9BBEC 800ABBEC 06000786 */  lh         $a3, 0x6($s0)
    /* 9BBF0 800ABBF0 2130D300 */  addu       $a2, $a2, $s3
    /* 9BBF4 800ABBF4 04004484 */  lh         $a0, 0x4($v0)
    /* 9BBF8 800ABBF8 06004584 */  lh         $a1, 0x6($v0)
    /* 9BBFC 800ABBFC B9AD020C */  jal        BirdDistanceOK__Fiiii
    /* 9BC00 800ABC00 2138F200 */   addu      $a3, $a3, $s2
    /* 9BC04 800ABC04 FF004230 */  andi       $v0, $v0, 0xFF
    /* 9BC08 800ABC08 21004014 */  bnez       $v0, .L800ABC90
    /* 9BC0C 800ABC0C 00000000 */   nop
    /* 9BC10 800ABC10 08000482 */  lb         $a0, 0x8($s0)
    /* 9BC14 800ABC14 0000028E */  lw         $v0, 0x0($s0)
    /* 9BC18 800ABC18 09000582 */  lb         $a1, 0x9($s0)
    /* 9BC1C 800ABC1C 08004680 */  lb         $a2, 0x8($v0)
    /* 9BC20 800ABC20 09004780 */  lb         $a3, 0x9($v0)
    /* 9BC24 800ABC24 21AF0208 */  j          .L800ABC84
    /* 9BC28 800ABC28 00000000 */   nop
  .L800ABC2C:
    /* 9BC2C 800ABC2C C9AE020C */  jal        GetPerch__FP10BIRDSTRUCT
    /* 9BC30 800ABC30 21200002 */   addu      $a0, $s0, $zero
    /* 9BC34 800ABC34 40100200 */  sll        $v0, $v0, 1
    /* 9BC38 800ABC38 1280033C */  lui        $v1, %hi(D_8011B2A0)
    /* 9BC3C 800ABC3C A0B26324 */  addiu      $v1, $v1, %lo(D_8011B2A0)
    /* 9BC40 800ABC40 21884300 */  addu       $s1, $v0, $v1
    /* 9BC44 800ABC44 00002482 */  lb         $a0, 0x0($s1)
    /* 9BC48 800ABC48 01002582 */  lb         $a1, 0x1($s1)
    /* 9BC4C 800ABC4C 04000686 */  lh         $a2, 0x4($s0)
    /* 9BC50 800ABC50 06000786 */  lh         $a3, 0x6($s0)
    /* 9BC54 800ABC54 C0200400 */  sll        $a0, $a0, 3
    /* 9BC58 800ABC58 C0280500 */  sll        $a1, $a1, 3
    /* 9BC5C 800ABC5C 2130D300 */  addu       $a2, $a2, $s3
    /* 9BC60 800ABC60 B9AD020C */  jal        BirdDistanceOK__Fiiii
    /* 9BC64 800ABC64 2138F200 */   addu      $a3, $a3, $s2
    /* 9BC68 800ABC68 FF004230 */  andi       $v0, $v0, 0xFF
    /* 9BC6C 800ABC6C 08004014 */  bnez       $v0, .L800ABC90
    /* 9BC70 800ABC70 00000000 */   nop
    /* 9BC74 800ABC74 08000482 */  lb         $a0, 0x8($s0)
    /* 9BC78 800ABC78 09000582 */  lb         $a1, 0x9($s0)
    /* 9BC7C 800ABC7C 00002682 */  lb         $a2, 0x0($s1)
    /* 9BC80 800ABC80 01002782 */  lb         $a3, 0x1($s1)
  .L800ABC84:
    /* 9BC84 800ABC84 8AF6000C */  jal        GetDirection__Fiiii
    /* 9BC88 800ABC88 00000000 */   nop
    /* 9BC8C 800ABC8C 21A04000 */  addu       $s4, $v0, $zero
  .L800ABC90:
    /* 9BC90 800ABC90 C9F6000C */  jal        ENG_random__Fl
    /* 9BC94 800ABC94 03000424 */   addiu     $a0, $zero, 0x3
    /* 9BC98 800ABC98 01004224 */  addiu      $v0, $v0, 0x1
    /* 9BC9C 800ABC9C 100002A2 */  sb         $v0, 0x10($s0)
    /* 9BCA0 800ABCA0 00160200 */  sll        $v0, $v0, 24
    /* 9BCA4 800ABCA4 03160200 */  sra        $v0, $v0, 24
    /* 9BCA8 800ABCA8 1D0B8383 */  lb         $v1, %gp_rel(hop_height)($gp)
    /* 9BCAC 800ABCAC 1280013C */  lui        $at, %hi(offset_x)
    /* 9BCB0 800ABCB0 21083400 */  addu       $at, $at, $s4
    /* 9BCB4 800ABCB4 A8C23380 */  lb         $s3, %lo(offset_x)($at)
    /* 9BCB8 800ABCB8 21186200 */  addu       $v1, $v1, $v0
    /* 9BCBC 800ABCBC 18006302 */  mult       $s3, $v1
    /* 9BCC0 800ABCC0 12980000 */  mflo       $s3
    /* 9BCC4 800ABCC4 1280013C */  lui        $at, %hi(offset_y)
    /* 9BCC8 800ABCC8 21083400 */  addu       $at, $at, $s4
    /* 9BCCC 800ABCCC B0C23280 */  lb         $s2, %lo(offset_y)($at)
    /* 9BCD0 800ABCD0 00000000 */  nop
    /* 9BCD4 800ABCD4 18004302 */  mult       $s2, $v1
    /* 9BCD8 800ABCD8 04000486 */  lh         $a0, 0x4($s0)
    /* 9BCDC 800ABCDC 06000586 */  lh         $a1, 0x6($s0)
    /* 9BCE0 800ABCE0 21209300 */  addu       $a0, $a0, $s3
    /* 9BCE4 800ABCE4 C3200400 */  sra        $a0, $a0, 3
    /* 9BCE8 800ABCE8 12900000 */  mflo       $s2
    /* 9BCEC 800ABCEC 2128B200 */  addu       $a1, $a1, $s2
    /* 9BCF0 800ABCF0 1383010C */  jal        SolidLoc__Fii
    /* 9BCF4 800ABCF4 C3280500 */   sra       $a1, $a1, 3
    /* 9BCF8 800ABCF8 FF004230 */  andi       $v0, $v0, 0xFF
    /* 9BCFC 800ABCFC 06004014 */  bnez       $v0, .L800ABD18
    /* 9BD00 800ABD00 04000224 */   addiu     $v0, $zero, 0x4
    /* 9BD04 800ABD04 0C0014A2 */  sb         $s4, 0xC($s0)
    /* 9BD08 800ABD08 120002A2 */  sb         $v0, 0x12($s0)
    /* 9BD0C 800ABD0C 1D0B8293 */  lbu        $v0, %gp_rel(hop_height)($gp)
    /* 9BD10 800ABD10 4AAF0208 */  j          .L800ABD28
    /* 9BD14 800ABD14 0F0002A2 */   sb        $v0, 0xF($s0)
  .L800ABD18:
    /* 9BD18 800ABD18 C9F6000C */  jal        ENG_random__Fl
    /* 9BD1C 800ABD1C 32000424 */   addiu     $a0, $zero, 0x32
    /* 9BD20 800ABD20 0A004224 */  addiu      $v0, $v0, 0xA
    /* 9BD24 800ABD24 0F0002A2 */  sb         $v0, 0xF($s0)
  .L800ABD28:
    /* 9BD28 800ABD28 2400BF8F */  lw         $ra, 0x24($sp)
    /* 9BD2C 800ABD2C 2000B48F */  lw         $s4, 0x20($sp)
    /* 9BD30 800ABD30 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 9BD34 800ABD34 1800B28F */  lw         $s2, 0x18($sp)
    /* 9BD38 800ABD38 1400B18F */  lw         $s1, 0x14($sp)
    /* 9BD3C 800ABD3C 1000B08F */  lw         $s0, 0x10($sp)
    /* 9BD40 800ABD40 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 9BD44 800ABD44 0800E003 */  jr         $ra
    /* 9BD48 800ABD48 00000000 */   nop
endlabel BIRD_StartHop__FP10BIRDSTRUCT
