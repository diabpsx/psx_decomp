.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DropShadows__Fiiii, 0x2A4

glabel DropShadows__Fiiii
    /* 7B880 8008B880 80FFBD27 */  addiu      $sp, $sp, -0x80
    /* 7B884 8008B884 5800B0AF */  sw         $s0, 0x58($sp)
    /* 7B888 8008B888 9224103C */  lui        $s0, (0x24924925 >> 16)
    /* 7B88C 8008B88C 7A048293 */  lbu        $v0, %gp_rel(BACKR)($gp)
    /* 7B890 8008B890 7B048393 */  lbu        $v1, %gp_rel(BACKG)($gp)
    /* 7B894 8008B894 25491036 */  ori        $s0, $s0, (0x24924925 & 0xFFFF)
    /* 7B898 8008B898 3000A4AF */  sw         $a0, 0x30($sp)
    /* 7B89C 8008B89C 19005000 */  multu      $v0, $s0
    /* 7B8A0 8008B8A0 7C048493 */  lbu        $a0, %gp_rel(BACKB)($gp)
    /* 7B8A4 8008B8A4 6400B3AF */  sw         $s3, 0x64($sp)
    /* 7B8A8 8008B8A8 2198A000 */  addu       $s3, $a1, $zero
    /* 7B8AC 8008B8AC 6800B4AF */  sw         $s4, 0x68($sp)
    /* 7B8B0 8008B8B0 21A0C000 */  addu       $s4, $a2, $zero
    /* 7B8B4 8008B8B4 7800BEAF */  sw         $fp, 0x78($sp)
    /* 7B8B8 8008B8B8 21F0E000 */  addu       $fp, $a3, $zero
    /* 7B8BC 8008B8BC 7C00BFAF */  sw         $ra, 0x7C($sp)
    /* 7B8C0 8008B8C0 7400B7AF */  sw         $s7, 0x74($sp)
    /* 7B8C4 8008B8C4 6000B2AF */  sw         $s2, 0x60($sp)
    /* 7B8C8 8008B8C8 10900000 */  mfhi       $s2
    /* 7B8CC 8008B8CC 7000B6AF */  sw         $s6, 0x70($sp)
    /* 7B8D0 8008B8D0 6C00B5AF */  sw         $s5, 0x6C($sp)
    /* 7B8D4 8008B8D4 19007000 */  multu      $v1, $s0
    /* 7B8D8 8008B8D8 5C00B1AF */  sw         $s1, 0x5C($sp)
    /* 7B8DC 8008B8DC 42A80200 */  srl        $s5, $v0, 1
    /* 7B8E0 8008B8E0 42400300 */  srl        $t0, $v1, 1
    /* 7B8E4 8008B8E4 42B00400 */  srl        $s6, $a0, 1
    /* 7B8E8 8008B8E8 1800B5AF */  sw         $s5, 0x18($sp)
    /* 7B8EC 8008B8EC 3800A8AF */  sw         $t0, 0x38($sp)
    /* 7B8F0 8008B8F0 1C00A8AF */  sw         $t0, 0x1C($sp)
    /* 7B8F4 8008B8F4 2000B6AF */  sw         $s6, 0x20($sp)
    /* 7B8F8 8008B8F8 2400B5AF */  sw         $s5, 0x24($sp)
    /* 7B8FC 8008B8FC 2800A8AF */  sw         $t0, 0x28($sp)
    /* 7B900 8008B900 2C00B6AF */  sw         $s6, 0x2C($sp)
    /* 7B904 8008B904 10880000 */  mfhi       $s1
    /* 7B908 8008B908 23105200 */  subu       $v0, $v0, $s2
    /* 7B90C 8008B90C 42100200 */  srl        $v0, $v0, 1
    /* 7B910 8008B910 19009000 */  multu      $a0, $s0
    /* 7B914 8008B914 21904202 */  addu       $s2, $s2, $v0
    /* 7B918 8008B918 82901200 */  srl        $s2, $s2, 2
    /* 7B91C 8008B91C FF005232 */  andi       $s2, $s2, 0xFF
    /* 7B920 8008B920 21384002 */  addu       $a3, $s2, $zero
    /* 7B924 8008B924 23187100 */  subu       $v1, $v1, $s1
    /* 7B928 8008B928 42180300 */  srl        $v1, $v1, 1
    /* 7B92C 8008B92C 21882302 */  addu       $s1, $s1, $v1
    /* 7B930 8008B930 82881100 */  srl        $s1, $s1, 2
    /* 7B934 8008B934 FF003132 */  andi       $s1, $s1, 0xFF
    /* 7B938 8008B938 21282002 */  addu       $a1, $s1, $zero
    /* 7B93C 8008B93C 1000B1AF */  sw         $s1, 0x10($sp)
    /* 7B940 8008B940 10800000 */  mfhi       $s0
    /* 7B944 8008B944 23209000 */  subu       $a0, $a0, $s0
    /* 7B948 8008B948 42200400 */  srl        $a0, $a0, 1
    /* 7B94C 8008B94C 21800402 */  addu       $s0, $s0, $a0
    /* 7B950 8008B950 82801000 */  srl        $s0, $s0, 2
    /* 7B954 8008B954 21204002 */  addu       $a0, $s2, $zero
    /* 7B958 8008B958 FF001032 */  andi       $s0, $s0, 0xFF
    /* 7B95C 8008B95C 21300002 */  addu       $a2, $s0, $zero
    /* 7B960 8008B960 D22D020C */  jal        GetDropShadowG4__FUcUcUcUcUcUcUcUcUcUcUcUc
    /* 7B964 8008B964 1400B0AF */   sw        $s0, 0x14($sp)
    /* 7B968 8008B968 2120A002 */  addu       $a0, $s5, $zero
    /* 7B96C 8008B96C 2130C002 */  addu       $a2, $s6, $zero
    /* 7B970 8008B970 3800A58F */  lw         $a1, 0x38($sp)
    /* 7B974 8008B974 3000A897 */  lhu        $t0, 0x30($sp)
    /* 7B978 8008B978 0A0053A4 */  sh         $s3, 0xA($v0)
    /* 7B97C 8008B97C 080048A4 */  sh         $t0, 0x8($v0)
    /* 7B980 8008B980 3000A88F */  lw         $t0, 0x30($sp)
    /* 7B984 8008B984 21384002 */  addu       $a3, $s2, $zero
    /* 7B988 8008B988 120053A4 */  sh         $s3, 0x12($v0)
    /* 7B98C 8008B98C 21A01401 */  addu       $s4, $t0, $s4
    /* 7B990 8008B990 04000825 */  addiu      $t0, $t0, 0x4
    /* 7B994 8008B994 100054A4 */  sh         $s4, 0x10($v0)
    /* 7B998 8008B998 4000A8AF */  sw         $t0, 0x40($sp)
    /* 7B99C 8008B99C 4000A897 */  lhu        $t0, 0x40($sp)
    /* 7B9A0 8008B9A0 FCFF9726 */  addiu      $s7, $s4, -0x4
    /* 7B9A4 8008B9A4 180048A4 */  sh         $t0, 0x18($v0)
    /* 7B9A8 8008B9A8 04006826 */  addiu      $t0, $s3, 0x4
    /* 7B9AC 8008B9AC 5000A8AF */  sw         $t0, 0x50($sp)
    /* 7B9B0 8008B9B0 5000A897 */  lhu        $t0, 0x50($sp)
    /* 7B9B4 8008B9B4 200057A4 */  sh         $s7, 0x20($v0)
    /* 7B9B8 8008B9B8 1A0048A4 */  sh         $t0, 0x1A($v0)
    /* 7B9BC 8008B9BC 5000A897 */  lhu        $t0, 0x50($sp)
    /* 7B9C0 8008B9C0 00000000 */  nop
    /* 7B9C4 8008B9C4 220048A4 */  sh         $t0, 0x22($v0)
    /* 7B9C8 8008B9C8 3800A88F */  lw         $t0, 0x38($sp)
    /* 7B9CC 8008B9CC 1000B1AF */  sw         $s1, 0x10($sp)
    /* 7B9D0 8008B9D0 1400B0AF */  sw         $s0, 0x14($sp)
    /* 7B9D4 8008B9D4 1800B5AF */  sw         $s5, 0x18($sp)
    /* 7B9D8 8008B9D8 2000B6AF */  sw         $s6, 0x20($sp)
    /* 7B9DC 8008B9DC 2400B2AF */  sw         $s2, 0x24($sp)
    /* 7B9E0 8008B9E0 2800B1AF */  sw         $s1, 0x28($sp)
    /* 7B9E4 8008B9E4 2C00B0AF */  sw         $s0, 0x2C($sp)
    /* 7B9E8 8008B9E8 D22D020C */  jal        GetDropShadowG4__FUcUcUcUcUcUcUcUcUcUcUcUc
    /* 7B9EC 8008B9EC 1C00A8AF */   sw        $t0, 0x1C($sp)
    /* 7B9F0 8008B9F0 2120A002 */  addu       $a0, $s5, $zero
    /* 7B9F4 8008B9F4 3800A58F */  lw         $a1, 0x38($sp)
    /* 7B9F8 8008B9F8 2130C002 */  addu       $a2, $s6, $zero
    /* 7B9FC 8008B9FC 080057A4 */  sh         $s7, 0x8($v0)
    /* 7BA00 8008BA00 5000A897 */  lhu        $t0, 0x50($sp)
    /* 7BA04 8008BA04 100054A4 */  sh         $s4, 0x10($v0)
    /* 7BA08 8008BA08 0A0048A4 */  sh         $t0, 0xA($v0)
    /* 7BA0C 8008BA0C 4800B3A7 */  sh         $s3, 0x48($sp)
    /* 7BA10 8008BA10 120053A4 */  sh         $s3, 0x12($v0)
    /* 7BA14 8008BA14 21987E02 */  addu       $s3, $s3, $fp
    /* 7BA18 8008BA18 FCFF7E26 */  addiu      $fp, $s3, -0x4
    /* 7BA1C 8008BA1C 180057A4 */  sh         $s7, 0x18($v0)
    /* 7BA20 8008BA20 1A005EA4 */  sh         $fp, 0x1A($v0)
    /* 7BA24 8008BA24 200054A4 */  sh         $s4, 0x20($v0)
    /* 7BA28 8008BA28 220053A4 */  sh         $s3, 0x22($v0)
    /* 7BA2C 8008BA2C 3800A88F */  lw         $t0, 0x38($sp)
    /* 7BA30 8008BA30 2138A002 */  addu       $a3, $s5, $zero
    /* 7BA34 8008BA34 1400B6AF */  sw         $s6, 0x14($sp)
    /* 7BA38 8008BA38 1800B2AF */  sw         $s2, 0x18($sp)
    /* 7BA3C 8008BA3C 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 7BA40 8008BA40 2000B0AF */  sw         $s0, 0x20($sp)
    /* 7BA44 8008BA44 2400B2AF */  sw         $s2, 0x24($sp)
    /* 7BA48 8008BA48 2800B1AF */  sw         $s1, 0x28($sp)
    /* 7BA4C 8008BA4C 2C00B0AF */  sw         $s0, 0x2C($sp)
    /* 7BA50 8008BA50 D22D020C */  jal        GetDropShadowG4__FUcUcUcUcUcUcUcUcUcUcUcUc
    /* 7BA54 8008BA54 1000A8AF */   sw        $t0, 0x10($sp)
    /* 7BA58 8008BA58 21204002 */  addu       $a0, $s2, $zero
    /* 7BA5C 8008BA5C 21282002 */  addu       $a1, $s1, $zero
    /* 7BA60 8008BA60 21300002 */  addu       $a2, $s0, $zero
    /* 7BA64 8008BA64 4000A897 */  lhu        $t0, 0x40($sp)
    /* 7BA68 8008BA68 0A005EA4 */  sh         $fp, 0xA($v0)
    /* 7BA6C 8008BA6C 100057A4 */  sh         $s7, 0x10($v0)
    /* 7BA70 8008BA70 12005EA4 */  sh         $fp, 0x12($v0)
    /* 7BA74 8008BA74 080048A4 */  sh         $t0, 0x8($v0)
    /* 7BA78 8008BA78 3000B097 */  lhu        $s0, 0x30($sp)
    /* 7BA7C 8008BA7C 1A0053A4 */  sh         $s3, 0x1A($v0)
    /* 7BA80 8008BA80 200054A4 */  sh         $s4, 0x20($v0)
    /* 7BA84 8008BA84 220053A4 */  sh         $s3, 0x22($v0)
    /* 7BA88 8008BA88 180050A4 */  sh         $s0, 0x18($v0)
    /* 7BA8C 8008BA8C 3800A88F */  lw         $t0, 0x38($sp)
    /* 7BA90 8008BA90 2138A002 */  addu       $a3, $s5, $zero
    /* 7BA94 8008BA94 1400B6AF */  sw         $s6, 0x14($sp)
    /* 7BA98 8008BA98 1800A4AF */  sw         $a0, 0x18($sp)
    /* 7BA9C 8008BA9C 1C00A5AF */  sw         $a1, 0x1C($sp)
    /* 7BAA0 8008BAA0 2000A6AF */  sw         $a2, 0x20($sp)
    /* 7BAA4 8008BAA4 2400A7AF */  sw         $a3, 0x24($sp)
    /* 7BAA8 8008BAA8 2C00B6AF */  sw         $s6, 0x2C($sp)
    /* 7BAAC 8008BAAC 1000A8AF */  sw         $t0, 0x10($sp)
    /* 7BAB0 8008BAB0 D22D020C */  jal        GetDropShadowG4__FUcUcUcUcUcUcUcUcUcUcUcUc
    /* 7BAB4 8008BAB4 2800A8AF */   sw        $t0, 0x28($sp)
    /* 7BAB8 8008BAB8 080050A4 */  sh         $s0, 0x8($v0)
    /* 7BABC 8008BABC 4800A897 */  lhu        $t0, 0x48($sp)
    /* 7BAC0 8008BAC0 00000000 */  nop
    /* 7BAC4 8008BAC4 0A0048A4 */  sh         $t0, 0xA($v0)
    /* 7BAC8 8008BAC8 4000A897 */  lhu        $t0, 0x40($sp)
    /* 7BACC 8008BACC 00000000 */  nop
    /* 7BAD0 8008BAD0 100048A4 */  sh         $t0, 0x10($v0)
    /* 7BAD4 8008BAD4 5000A897 */  lhu        $t0, 0x50($sp)
    /* 7BAD8 8008BAD8 180050A4 */  sh         $s0, 0x18($v0)
    /* 7BADC 8008BADC 1A0053A4 */  sh         $s3, 0x1A($v0)
    /* 7BAE0 8008BAE0 120048A4 */  sh         $t0, 0x12($v0)
    /* 7BAE4 8008BAE4 4000A897 */  lhu        $t0, 0x40($sp)
    /* 7BAE8 8008BAE8 22005EA4 */  sh         $fp, 0x22($v0)
    /* 7BAEC 8008BAEC 200048A4 */  sh         $t0, 0x20($v0)
    /* 7BAF0 8008BAF0 7C00BF8F */  lw         $ra, 0x7C($sp)
    /* 7BAF4 8008BAF4 7800BE8F */  lw         $fp, 0x78($sp)
    /* 7BAF8 8008BAF8 7400B78F */  lw         $s7, 0x74($sp)
    /* 7BAFC 8008BAFC 7000B68F */  lw         $s6, 0x70($sp)
    /* 7BB00 8008BB00 6C00B58F */  lw         $s5, 0x6C($sp)
    /* 7BB04 8008BB04 6800B48F */  lw         $s4, 0x68($sp)
    /* 7BB08 8008BB08 6400B38F */  lw         $s3, 0x64($sp)
    /* 7BB0C 8008BB0C 6000B28F */  lw         $s2, 0x60($sp)
    /* 7BB10 8008BB10 5C00B18F */  lw         $s1, 0x5C($sp)
    /* 7BB14 8008BB14 5800B08F */  lw         $s0, 0x58($sp)
    /* 7BB18 8008BB18 8000BD27 */  addiu      $sp, $sp, 0x80
    /* 7BB1C 8008BB1C 0800E003 */  jr         $ra
    /* 7BB20 8008BB20 00000000 */   nop
endlabel DropShadows__Fiiii
