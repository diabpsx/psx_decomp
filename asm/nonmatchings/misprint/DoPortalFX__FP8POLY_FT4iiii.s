.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DoPortalFX__FP8POLY_FT4iiii, 0x370

glabel DoPortalFX__FP8POLY_FT4iiii
    /* 6B8C4 8007B8C4 A8FFBD27 */  addiu      $sp, $sp, -0x58
    /* 6B8C8 8007B8C8 5000BEAF */  sw         $fp, 0x50($sp)
    /* 6B8CC 8007B8CC 21F0A000 */  addu       $fp, $a1, $zero
    /* 6B8D0 8007B8D0 3C00B3AF */  sw         $s3, 0x3C($sp)
    /* 6B8D4 8007B8D4 21980000 */  addu       $s3, $zero, $zero
    /* 6B8D8 8007B8D8 3800B2AF */  sw         $s2, 0x38($sp)
    /* 6B8DC 8007B8DC 21908000 */  addu       $s2, $a0, $zero
    /* 6B8E0 8007B8E0 4C00B7AF */  sw         $s7, 0x4C($sp)
    /* 6B8E4 8007B8E4 28005726 */  addiu      $s7, $s2, 0x28
    /* 6B8E8 8007B8E8 2B405702 */  sltu       $t0, $s2, $s7
    /* 6B8EC 8007B8EC 4000B4AF */  sw         $s4, 0x40($sp)
    /* 6B8F0 8007B8F0 FF00143C */  lui        $s4, (0xFFFFFF >> 16)
    /* 6B8F4 8007B8F4 FFFF9436 */  ori        $s4, $s4, (0xFFFFFF & 0xFFFF)
    /* 6B8F8 8007B8F8 1000A6AF */  sw         $a2, 0x10($sp)
    /* 6B8FC 8007B8FC 00FF063C */  lui        $a2, (0xFF000000 >> 16)
    /* 6B900 8007B900 5400BFAF */  sw         $ra, 0x54($sp)
    /* 6B904 8007B904 4800B6AF */  sw         $s6, 0x48($sp)
    /* 6B908 8007B908 4400B5AF */  sw         $s5, 0x44($sp)
    /* 6B90C 8007B90C 3400B1AF */  sw         $s1, 0x34($sp)
    /* 6B910 8007B910 3000B0AF */  sw         $s0, 0x30($sp)
    /* 6B914 8007B914 1800A7AF */  sw         $a3, 0x18($sp)
    /* 6B918 8007B918 2000A8AF */  sw         $t0, 0x20($sp)
    /* 6B91C 8007B91C 5800B2AF */  sw         $s2, 0x58($sp)
    /* 6B920 8007B920 0C005092 */  lbu        $s0, 0xC($s2)
    /* 6B924 8007B924 08005596 */  lhu        $s5, 0x8($s2)
    /* 6B928 8007B928 10005696 */  lhu        $s6, 0x10($s2)
    /* 6B92C 8007B92C 0A005196 */  lhu        $s1, 0xA($s2)
    /* 6B930 8007B930 5800A427 */  addiu      $a0, $sp, 0x58
  .L8007B934:
    /* 6B934 8007B934 39F5010C */  jal        PRIM_GetPrim__FPP8POLY_FT4_8007d4e4
    /* 6B938 8007B938 2800A6AF */   sw        $a2, 0x28($sp)
    /* 6B93C 8007B93C 5800A48F */  lw         $a0, 0x58($sp)
    /* 6B940 8007B940 2000A88F */  lw         $t0, 0x20($sp)
    /* 6B944 8007B944 2800A68F */  lw         $a2, 0x28($sp)
    /* 6B948 8007B948 07000011 */  beqz       $t0, .L8007B968
    /* 6B94C 8007B94C 21184002 */   addu      $v1, $s2, $zero
  .L8007B950:
    /* 6B950 8007B950 00006290 */  lbu        $v0, 0x0($v1)
    /* 6B954 8007B954 01006324 */  addiu      $v1, $v1, 0x1
    /* 6B958 8007B958 000082A0 */  sb         $v0, 0x0($a0)
    /* 6B95C 8007B95C 2B107700 */  sltu       $v0, $v1, $s7
    /* 6B960 8007B960 FBFF4014 */  bnez       $v0, .L8007B950
    /* 6B964 8007B964 01008424 */   addiu     $a0, $a0, 0x1
  .L8007B968:
    /* 6B968 8007B968 5800A28F */  lw         $v0, 0x58($sp)
    /* 6B96C 8007B96C 00000000 */  nop
    /* 6B970 8007B970 0C0050A0 */  sb         $s0, 0xC($v0)
    /* 6B974 8007B974 5800A28F */  lw         $v0, 0x58($sp)
    /* 6B978 8007B978 0E80033C */  lui        $v1, %hi(D_800E38E4)
    /* 6B97C 8007B97C E4386324 */  addiu      $v1, $v1, %lo(D_800E38E4)
    /* 6B980 8007B980 140050A0 */  sb         $s0, 0x14($v0)
    /* 6B984 8007B984 80101300 */  sll        $v0, $s3, 2
    /* 6B988 8007B988 5800A48F */  lw         $a0, 0x58($sp)
    /* 6B98C 8007B98C 21284300 */  addu       $a1, $v0, $v1
    /* 6B990 8007B990 0A0091A4 */  sh         $s1, 0xA($a0)
    /* 6B994 8007B994 120091A4 */  sh         $s1, 0x12($a0)
    /* 6B998 8007B998 0000A28C */  lw         $v0, 0x0($a1)
    /* 6B99C 8007B99C 00000000 */  nop
    /* 6B9A0 8007B9A0 2110A202 */  addu       $v0, $s5, $v0
    /* 6B9A4 8007B9A4 080082A4 */  sh         $v0, 0x8($a0)
    /* 6B9A8 8007B9A8 0000A28C */  lw         $v0, 0x0($a1)
    /* 6B9AC 8007B9AC 01001026 */  addiu      $s0, $s0, 0x1
    /* 6B9B0 8007B9B0 1C0090A0 */  sb         $s0, 0x1C($a0)
    /* 6B9B4 8007B9B4 5800A38F */  lw         $v1, 0x58($sp)
    /* 6B9B8 8007B9B8 2310C202 */  subu       $v0, $s6, $v0
    /* 6B9BC 8007B9BC 100082A4 */  sh         $v0, 0x10($a0)
    /* 6B9C0 8007B9C0 240070A0 */  sb         $s0, 0x24($v1)
    /* 6B9C4 8007B9C4 5800A38F */  lw         $v1, 0x58($sp)
    /* 6B9C8 8007B9C8 01003126 */  addiu      $s1, $s1, 0x1
    /* 6B9CC 8007B9CC 1A0071A4 */  sh         $s1, 0x1A($v1)
    /* 6B9D0 8007B9D0 220071A4 */  sh         $s1, 0x22($v1)
    /* 6B9D4 8007B9D4 0000A28C */  lw         $v0, 0x0($a1)
    /* 6B9D8 8007B9D8 00000000 */  nop
    /* 6B9DC 8007B9DC 2110A202 */  addu       $v0, $s5, $v0
    /* 6B9E0 8007B9E0 180062A4 */  sh         $v0, 0x18($v1)
    /* 6B9E4 8007B9E4 0000A28C */  lw         $v0, 0x0($a1)
    /* 6B9E8 8007B9E8 1280043C */  lui        $a0, %hi(PauseMode)
    /* 6B9EC 8007B9EC A4B78490 */  lbu        $a0, %lo(PauseMode)($a0)
    /* 6B9F0 8007B9F0 2310C202 */  subu       $v0, $s6, $v0
    /* 6B9F4 8007B9F4 09008014 */  bnez       $a0, .L8007BA1C
    /* 6B9F8 8007B9F8 200062A4 */   sh        $v0, 0x20($v1)
    /* 6B9FC 8007B9FC 0000A38C */  lw         $v1, 0x0($a1)
    /* 6BA00 8007BA00 00000000 */  nop
    /* 6BA04 8007BA04 12006228 */  slti       $v0, $v1, 0x12
    /* 6BA08 8007BA08 03004010 */  beqz       $v0, .L8007BA18
    /* 6BA0C 8007BA0C 01006224 */   addiu     $v0, $v1, 0x1
    /* 6BA10 8007BA10 87EE0108 */  j          .L8007BA1C
    /* 6BA14 8007BA14 0000A2AC */   sw        $v0, 0x0($a1)
  .L8007BA18:
    /* 6BA18 8007BA18 0000A0AC */  sw         $zero, 0x0($a1)
  .L8007BA1C:
    /* 6BA1C 8007BA1C 5800A38F */  lw         $v1, 0x58($sp)
    /* 6BA20 8007BA20 00000000 */  nop
    /* 6BA24 8007BA24 07006290 */  lbu        $v0, 0x7($v1)
    /* 6BA28 8007BA28 00000000 */  nop
    /* 6BA2C 8007BA2C FD004230 */  andi       $v0, $v0, 0xFD
    /* 6BA30 8007BA30 070062A0 */  sb         $v0, 0x7($v1)
    /* 6BA34 8007BA34 5800A28F */  lw         $v0, 0x58($sp)
    /* 6BA38 8007BA38 00000000 */  nop
    /* 6BA3C 8007BA3C 04005EA0 */  sb         $fp, 0x4($v0)
    /* 6BA40 8007BA40 5800A28F */  lw         $v0, 0x58($sp)
    /* 6BA44 8007BA44 1000A893 */  lbu        $t0, 0x10($sp)
    /* 6BA48 8007BA48 00000000 */  nop
    /* 6BA4C 8007BA4C 050048A0 */  sb         $t0, 0x5($v0)
    /* 6BA50 8007BA50 5800A28F */  lw         $v0, 0x58($sp)
    /* 6BA54 8007BA54 1800A893 */  lbu        $t0, 0x18($sp)
    /* 6BA58 8007BA58 00000000 */  nop
    /* 6BA5C 8007BA5C 060048A0 */  sb         $t0, 0x6($v0)
    /* 6BA60 8007BA60 5800A38F */  lw         $v1, 0x58($sp)
    /* 6BA64 8007BA64 00000000 */  nop
    /* 6BA68 8007BA68 07006290 */  lbu        $v0, 0x7($v1)
    /* 6BA6C 8007BA6C 01007326 */  addiu      $s3, $s3, 0x1
    /* 6BA70 8007BA70 FE004230 */  andi       $v0, $v0, 0xFE
    /* 6BA74 8007BA74 070062A0 */  sb         $v0, 0x7($v1)
    /* 6BA78 8007BA78 5800A58F */  lw         $a1, 0x58($sp)
    /* 6BA7C 8007BA7C 6800A88F */  lw         $t0, 0x68($sp)
    /* 6BA80 8007BA80 1280023C */  lui        $v0, %hi(ThisOt)
    /* 6BA84 8007BA84 B4AA428C */  lw         $v0, %lo(ThisOt)($v0)
    /* 6BA88 8007BA88 80200800 */  sll        $a0, $t0, 2
    /* 6BA8C 8007BA8C 21208200 */  addu       $a0, $a0, $v0
    /* 6BA90 8007BA90 0000A38C */  lw         $v1, 0x0($a1)
    /* 6BA94 8007BA94 0000828C */  lw         $v0, 0x0($a0)
    /* 6BA98 8007BA98 24186600 */  and        $v1, $v1, $a2
    /* 6BA9C 8007BA9C 24105400 */  and        $v0, $v0, $s4
    /* 6BAA0 8007BAA0 25186200 */  or         $v1, $v1, $v0
    /* 6BAA4 8007BAA4 0000A3AC */  sw         $v1, 0x0($a1)
    /* 6BAA8 8007BAA8 0000828C */  lw         $v0, 0x0($a0)
    /* 6BAAC 8007BAAC 2428B400 */  and        $a1, $a1, $s4
    /* 6BAB0 8007BAB0 24104600 */  and        $v0, $v0, $a2
    /* 6BAB4 8007BAB4 25104500 */  or         $v0, $v0, $a1
    /* 6BAB8 8007BAB8 000082AC */  sw         $v0, 0x0($a0)
    /* 6BABC 8007BABC 3600622A */  slti       $v0, $s3, 0x36
    /* 6BAC0 8007BAC0 9CFF4014 */  bnez       $v0, .L8007B934
    /* 6BAC4 8007BAC4 5800A427 */   addiu     $a0, $sp, 0x58
    /* 6BAC8 8007BAC8 5800B2AF */  sw         $s2, 0x58($sp)
    /* 6BACC 8007BACC 0C0050A2 */  sb         $s0, 0xC($s2)
    /* 6BAD0 8007BAD0 5800A28F */  lw         $v0, 0x58($sp)
    /* 6BAD4 8007BAD4 0E80033C */  lui        $v1, %hi(D_800E38E4)
    /* 6BAD8 8007BAD8 E4386324 */  addiu      $v1, $v1, %lo(D_800E38E4)
    /* 6BADC 8007BADC 140050A0 */  sb         $s0, 0x14($v0)
    /* 6BAE0 8007BAE0 80101300 */  sll        $v0, $s3, 2
    /* 6BAE4 8007BAE4 5800A48F */  lw         $a0, 0x58($sp)
    /* 6BAE8 8007BAE8 21284300 */  addu       $a1, $v0, $v1
    /* 6BAEC 8007BAEC 0A0091A4 */  sh         $s1, 0xA($a0)
    /* 6BAF0 8007BAF0 120091A4 */  sh         $s1, 0x12($a0)
    /* 6BAF4 8007BAF4 0000A28C */  lw         $v0, 0x0($a1)
    /* 6BAF8 8007BAF8 00000000 */  nop
    /* 6BAFC 8007BAFC 2110A202 */  addu       $v0, $s5, $v0
    /* 6BB00 8007BB00 080082A4 */  sh         $v0, 0x8($a0)
    /* 6BB04 8007BB04 0000A28C */  lw         $v0, 0x0($a1)
    /* 6BB08 8007BB08 00000000 */  nop
    /* 6BB0C 8007BB0C 2310C202 */  subu       $v0, $s6, $v0
    /* 6BB10 8007BB10 100082A4 */  sh         $v0, 0x10($a0)
    /* 6BB14 8007BB14 0000A28C */  lw         $v0, 0x0($a1)
    /* 6BB18 8007BB18 00000000 */  nop
    /* 6BB1C 8007BB1C 2110A202 */  addu       $v0, $s5, $v0
    /* 6BB20 8007BB20 180082A4 */  sh         $v0, 0x18($a0)
    /* 6BB24 8007BB24 0000A28C */  lw         $v0, 0x0($a1)
    /* 6BB28 8007BB28 1280033C */  lui        $v1, %hi(PauseMode)
    /* 6BB2C 8007BB2C A4B76390 */  lbu        $v1, %lo(PauseMode)($v1)
    /* 6BB30 8007BB30 2310C202 */  subu       $v0, $s6, $v0
    /* 6BB34 8007BB34 09006014 */  bnez       $v1, .L8007BB5C
    /* 6BB38 8007BB38 200082A4 */   sh        $v0, 0x20($a0)
    /* 6BB3C 8007BB3C 0000A38C */  lw         $v1, 0x0($a1)
    /* 6BB40 8007BB40 00000000 */  nop
    /* 6BB44 8007BB44 12006228 */  slti       $v0, $v1, 0x12
    /* 6BB48 8007BB48 03004010 */  beqz       $v0, .L8007BB58
    /* 6BB4C 8007BB4C 01006224 */   addiu     $v0, $v1, 0x1
    /* 6BB50 8007BB50 D7EE0108 */  j          .L8007BB5C
    /* 6BB54 8007BB54 0000A2AC */   sw        $v0, 0x0($a1)
  .L8007BB58:
    /* 6BB58 8007BB58 0000A0AC */  sw         $zero, 0x0($a1)
  .L8007BB5C:
    /* 6BB5C 8007BB5C 5800A38F */  lw         $v1, 0x58($sp)
    /* 6BB60 8007BB60 00000000 */  nop
    /* 6BB64 8007BB64 07006290 */  lbu        $v0, 0x7($v1)
    /* 6BB68 8007BB68 00000000 */  nop
    /* 6BB6C 8007BB6C FD004230 */  andi       $v0, $v0, 0xFD
    /* 6BB70 8007BB70 070062A0 */  sb         $v0, 0x7($v1)
    /* 6BB74 8007BB74 5800A28F */  lw         $v0, 0x58($sp)
    /* 6BB78 8007BB78 00000000 */  nop
    /* 6BB7C 8007BB7C 04005EA0 */  sb         $fp, 0x4($v0)
    /* 6BB80 8007BB80 5800A28F */  lw         $v0, 0x58($sp)
    /* 6BB84 8007BB84 1000A893 */  lbu        $t0, 0x10($sp)
    /* 6BB88 8007BB88 00000000 */  nop
    /* 6BB8C 8007BB8C 050048A0 */  sb         $t0, 0x5($v0)
    /* 6BB90 8007BB90 5800A28F */  lw         $v0, 0x58($sp)
    /* 6BB94 8007BB94 FF00063C */  lui        $a2, (0xFFFFFF >> 16)
    /* 6BB98 8007BB98 1800A893 */  lbu        $t0, 0x18($sp)
    /* 6BB9C 8007BB9C 00000000 */  nop
    /* 6BBA0 8007BBA0 060048A0 */  sb         $t0, 0x6($v0)
    /* 6BBA4 8007BBA4 5800A38F */  lw         $v1, 0x58($sp)
    /* 6BBA8 8007BBA8 FFFFC634 */  ori        $a2, $a2, (0xFFFFFF & 0xFFFF)
    /* 6BBAC 8007BBAC 07006290 */  lbu        $v0, 0x7($v1)
    /* 6BBB0 8007BBB0 00FF073C */  lui        $a3, (0xFF000000 >> 16)
    /* 6BBB4 8007BBB4 FE004230 */  andi       $v0, $v0, 0xFE
    /* 6BBB8 8007BBB8 070062A0 */  sb         $v0, 0x7($v1)
    /* 6BBBC 8007BBBC 5800A58F */  lw         $a1, 0x58($sp)
    /* 6BBC0 8007BBC0 6800A88F */  lw         $t0, 0x68($sp)
    /* 6BBC4 8007BBC4 1280023C */  lui        $v0, %hi(ThisOt)
    /* 6BBC8 8007BBC8 B4AA428C */  lw         $v0, %lo(ThisOt)($v0)
    /* 6BBCC 8007BBCC 80200800 */  sll        $a0, $t0, 2
    /* 6BBD0 8007BBD0 21208200 */  addu       $a0, $a0, $v0
    /* 6BBD4 8007BBD4 0000A38C */  lw         $v1, 0x0($a1)
    /* 6BBD8 8007BBD8 0000828C */  lw         $v0, 0x0($a0)
    /* 6BBDC 8007BBDC 24186700 */  and        $v1, $v1, $a3
    /* 6BBE0 8007BBE0 24104600 */  and        $v0, $v0, $a2
    /* 6BBE4 8007BBE4 25186200 */  or         $v1, $v1, $v0
    /* 6BBE8 8007BBE8 0000A3AC */  sw         $v1, 0x0($a1)
    /* 6BBEC 8007BBEC 0000828C */  lw         $v0, 0x0($a0)
    /* 6BBF0 8007BBF0 2428A600 */  and        $a1, $a1, $a2
    /* 6BBF4 8007BBF4 24104700 */  and        $v0, $v0, $a3
    /* 6BBF8 8007BBF8 25104500 */  or         $v0, $v0, $a1
    /* 6BBFC 8007BBFC 000082AC */  sw         $v0, 0x0($a0)
    /* 6BC00 8007BC00 5400BF8F */  lw         $ra, 0x54($sp)
    /* 6BC04 8007BC04 5000BE8F */  lw         $fp, 0x50($sp)
    /* 6BC08 8007BC08 4C00B78F */  lw         $s7, 0x4C($sp)
    /* 6BC0C 8007BC0C 4800B68F */  lw         $s6, 0x48($sp)
    /* 6BC10 8007BC10 4400B58F */  lw         $s5, 0x44($sp)
    /* 6BC14 8007BC14 4000B48F */  lw         $s4, 0x40($sp)
    /* 6BC18 8007BC18 3C00B38F */  lw         $s3, 0x3C($sp)
    /* 6BC1C 8007BC1C 3800B28F */  lw         $s2, 0x38($sp)
    /* 6BC20 8007BC20 3400B18F */  lw         $s1, 0x34($sp)
    /* 6BC24 8007BC24 3000B08F */  lw         $s0, 0x30($sp)
    /* 6BC28 8007BC28 5800BD27 */  addiu      $sp, $sp, 0x58
    /* 6BC2C 8007BC2C 0800E003 */  jr         $ra
    /* 6BC30 8007BC30 00000000 */   nop
endlabel DoPortalFX__FP8POLY_FT4iiii
