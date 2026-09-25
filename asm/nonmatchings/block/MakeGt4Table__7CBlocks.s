.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MakeGt4Table__7CBlocks, 0x1E4

glabel MakeGt4Table__7CBlocks
    /* 7DD70 8008DD70 A0FFBD27 */  addiu      $sp, $sp, -0x60
    /* 7DD74 8008DD74 4800B0AF */  sw         $s0, 0x48($sp)
    /* 7DD78 8008DD78 21808000 */  addu       $s0, $a0, $zero
    /* 7DD7C 8008DD7C 5800BFAF */  sw         $ra, 0x58($sp)
    /* 7DD80 8008DD80 5400B3AF */  sw         $s3, 0x54($sp)
    /* 7DD84 8008DD84 5000B2AF */  sw         $s2, 0x50($sp)
    /* 7DD88 8008DD88 4C00B1AF */  sw         $s1, 0x4C($sp)
    /* 7DD8C 8008DD8C 2800028E */  lw         $v0, 0x28($s0)
    /* 7DD90 8008DD90 01800534 */  ori        $a1, $zero, 0x8001
    /* 7DD94 8008DD94 20004494 */  lhu        $a0, 0x20($v0)
    /* 7DD98 8008DD98 1280063C */  lui        $a2, %hi(D_8011ACBC)
    /* 7DD9C 8008DD9C BCACC624 */  addiu      $a2, $a2, %lo(D_8011ACBC)
    /* 7DDA0 8008DDA0 7785000C */  jal        GAL_Alloc
    /* 7DDA4 8008DDA4 00210400 */   sll       $a0, $a0, 4
    /* 7DDA8 8008DDA8 FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 7DDAC 8008DDAC 06004314 */  bne        $v0, $v1, .L8008DDC8
    /* 7DDB0 8008DDB0 B40002AE */   sw        $v0, 0xB4($s0)
    /* 7DDB4 8008DDB4 21200000 */  addu       $a0, $zero, $zero
    /* 7DDB8 8008DDB8 1180053C */  lui        $a1, %hi(D_8011054C)
    /* 7DDBC 8008DDBC 4C05A524 */  addiu      $a1, $a1, %lo(D_8011054C)
    /* 7DDC0 8008DDC0 A583000C */  jal        DBG_Error
    /* 7DDC4 8008DDC4 BC020624 */   addiu     $a2, $zero, 0x2BC
  .L8008DDC8:
    /* 7DDC8 8008DDC8 B400048E */  lw         $a0, 0xB4($s0)
    /* 7DDCC 8008DDCC DD85000C */  jal        GAL_Lock
    /* 7DDD0 8008DDD0 00000000 */   nop
    /* 7DDD4 8008DDD4 06004014 */  bnez       $v0, .L8008DDF0
    /* 7DDD8 8008DDD8 B00002AE */   sw        $v0, 0xB0($s0)
    /* 7DDDC 8008DDDC 21200000 */  addu       $a0, $zero, $zero
    /* 7DDE0 8008DDE0 1180053C */  lui        $a1, %hi(D_8011054C)
    /* 7DDE4 8008DDE4 4C05A524 */  addiu      $a1, $a1, %lo(D_8011054C)
    /* 7DDE8 8008DDE8 A583000C */  jal        DBG_Error
    /* 7DDEC 8008DDEC BE020624 */   addiu     $a2, $zero, 0x2BE
  .L8008DDF0:
    /* 7DDF0 8008DDF0 21980000 */  addu       $s3, $zero, $zero
    /* 7DDF4 8008DDF4 21900000 */  addu       $s2, $zero, $zero
  .L8008DDF8:
    /* 7DDF8 8008DDF8 2800028E */  lw         $v0, 0x28($s0)
    /* 7DDFC 8008DDFC 00000000 */  nop
    /* 7DE00 8008DE00 20004294 */  lhu        $v0, 0x20($v0)
    /* 7DE04 8008DE04 00000000 */  nop
    /* 7DE08 8008DE08 2B106202 */  sltu       $v0, $s3, $v0
    /* 7DE0C 8008DE0C 49004010 */  beqz       $v0, .L8008DF34
    /* 7DE10 8008DE10 21200002 */   addu      $a0, $s0, $zero
    /* 7DE14 8008DE14 2400068E */  lw         $a2, 0x24($s0)
    /* 7DE18 8008DE18 1000A527 */  addiu      $a1, $sp, 0x10
    /* 7DE1C 8008DE1C D537020C */  jal        MakeGt4__7CBlocksP8POLY_GT4P9FRAME_HDR
    /* 7DE20 8008DE20 2130D200 */   addu      $a2, $a2, $s2
    /* 7DE24 8008DE24 1000A527 */  addiu      $a1, $sp, 0x10
    /* 7DE28 8008DE28 00891300 */  sll        $s1, $s3, 4
    /* 7DE2C 8008DE2C 2400028E */  lw         $v0, 0x24($s0)
    /* 7DE30 8008DE30 B000048E */  lw         $a0, 0xB0($s0)
    /* 7DE34 8008DE34 21104202 */  addu       $v0, $s2, $v0
    /* 7DE38 8008DE38 0800478C */  lw         $a3, 0x8($v0)
    /* 7DE3C 8008DE3C 21209100 */  addu       $a0, $a0, $s1
    /* 7DE40 8008DE40 FF01E630 */  andi       $a2, $a3, 0x1FF
    /* 7DE44 8008DE44 423A0700 */  srl        $a3, $a3, 9
    /* 7DE48 8008DE48 3E47020C */  jal        InitFromGt4__9LittleGt4P8POLY_GT4ii
    /* 7DE4C 8008DE4C FF01E730 */   andi      $a3, $a3, 0x1FF
    /* 7DE50 8008DE50 B000028E */  lw         $v0, 0xB0($s0)
    /* 7DE54 8008DE54 00000000 */  nop
    /* 7DE58 8008DE58 21102202 */  addu       $v0, $s1, $v0
    /* 7DE5C 8008DE5C 0F0040A0 */  sb         $zero, 0xF($v0)
    /* 7DE60 8008DE60 2400028E */  lw         $v0, 0x24($s0)
    /* 7DE64 8008DE64 00000000 */  nop
    /* 7DE68 8008DE68 21104202 */  addu       $v0, $s2, $v0
    /* 7DE6C 8008DE6C 0400428C */  lw         $v0, 0x4($v0)
    /* 7DE70 8008DE70 0020033C */  lui        $v1, (0x20000000 >> 16)
    /* 7DE74 8008DE74 24104300 */  and        $v0, $v0, $v1
    /* 7DE78 8008DE78 08004010 */  beqz       $v0, .L8008DE9C
    /* 7DE7C 8008DE7C 00000000 */   nop
    /* 7DE80 8008DE80 B000038E */  lw         $v1, 0xB0($s0)
    /* 7DE84 8008DE84 00000000 */  nop
    /* 7DE88 8008DE88 21182302 */  addu       $v1, $s1, $v1
    /* 7DE8C 8008DE8C 0F006290 */  lbu        $v0, 0xF($v1)
    /* 7DE90 8008DE90 00000000 */  nop
    /* 7DE94 8008DE94 01004234 */  ori        $v0, $v0, 0x1
    /* 7DE98 8008DE98 0F0062A0 */  sb         $v0, 0xF($v1)
  .L8008DE9C:
    /* 7DE9C 8008DE9C 2400028E */  lw         $v0, 0x24($s0)
    /* 7DEA0 8008DEA0 00000000 */  nop
    /* 7DEA4 8008DEA4 21104202 */  addu       $v0, $s2, $v0
    /* 7DEA8 8008DEA8 0400428C */  lw         $v0, 0x4($v0)
    /* 7DEAC 8008DEAC 0021033C */  lui        $v1, (0x21000000 >> 16)
    /* 7DEB0 8008DEB0 24104300 */  and        $v0, $v0, $v1
    /* 7DEB4 8008DEB4 08004010 */  beqz       $v0, .L8008DED8
    /* 7DEB8 8008DEB8 00000000 */   nop
    /* 7DEBC 8008DEBC B000038E */  lw         $v1, 0xB0($s0)
    /* 7DEC0 8008DEC0 00000000 */  nop
    /* 7DEC4 8008DEC4 21182302 */  addu       $v1, $s1, $v1
    /* 7DEC8 8008DEC8 0F006290 */  lbu        $v0, 0xF($v1)
    /* 7DECC 8008DECC 00000000 */  nop
    /* 7DED0 8008DED0 02004234 */  ori        $v0, $v0, 0x2
    /* 7DED4 8008DED4 0F0062A0 */  sb         $v0, 0xF($v1)
  .L8008DED8:
    /* 7DED8 8008DED8 2400028E */  lw         $v0, 0x24($s0)
    /* 7DEDC 8008DEDC 00000000 */  nop
    /* 7DEE0 8008DEE0 21104202 */  addu       $v0, $s2, $v0
    /* 7DEE4 8008DEE4 0400428C */  lw         $v0, 0x4($v0)
    /* 7DEE8 8008DEE8 0040033C */  lui        $v1, (0x40000000 >> 16)
    /* 7DEEC 8008DEEC 24104300 */  and        $v0, $v0, $v1
    /* 7DEF0 8008DEF0 0D004010 */  beqz       $v0, .L8008DF28
    /* 7DEF4 8008DEF4 00000000 */   nop
    /* 7DEF8 8008DEF8 1280023C */  lui        $v0, %hi(leveltype)
    /* 7DEFC 8008DEFC 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 7DF00 8008DF00 00000000 */  nop
    /* 7DF04 8008DF04 08004014 */  bnez       $v0, .L8008DF28
    /* 7DF08 8008DF08 00000000 */   nop
    /* 7DF0C 8008DF0C B000038E */  lw         $v1, 0xB0($s0)
    /* 7DF10 8008DF10 00000000 */  nop
    /* 7DF14 8008DF14 21182302 */  addu       $v1, $s1, $v1
    /* 7DF18 8008DF18 0F006290 */  lbu        $v0, 0xF($v1)
    /* 7DF1C 8008DF1C 00000000 */  nop
    /* 7DF20 8008DF20 10004234 */  ori        $v0, $v0, 0x10
    /* 7DF24 8008DF24 0F0062A0 */  sb         $v0, 0xF($v1)
  .L8008DF28:
    /* 7DF28 8008DF28 0C005226 */  addiu      $s2, $s2, 0xC
    /* 7DF2C 8008DF2C 7E370208 */  j          .L8008DDF8
    /* 7DF30 8008DF30 01007326 */   addiu     $s3, $s3, 0x1
  .L8008DF34:
    /* 7DF34 8008DF34 5800BF8F */  lw         $ra, 0x58($sp)
    /* 7DF38 8008DF38 5400B38F */  lw         $s3, 0x54($sp)
    /* 7DF3C 8008DF3C 5000B28F */  lw         $s2, 0x50($sp)
    /* 7DF40 8008DF40 4C00B18F */  lw         $s1, 0x4C($sp)
    /* 7DF44 8008DF44 4800B08F */  lw         $s0, 0x48($sp)
    /* 7DF48 8008DF48 6000BD27 */  addiu      $sp, $sp, 0x60
    /* 7DF4C 8008DF4C 0800E003 */  jr         $ra
    /* 7DF50 8008DF50 00000000 */   nop
endlabel MakeGt4Table__7CBlocks
