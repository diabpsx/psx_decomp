.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_StartBoy__Fv, 0x1A8

glabel S_StartBoy__Fv
    /* 5DD54 8006DD54 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 5DD58 8006DD58 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 5DD5C 8006DD5C 1800B0AF */  sw         $s0, 0x18($sp)
    /* 5DD60 8006DD60 262180A3 */  sb         $zero, %gp_rel(D_8011C8A6)($gp)
    /* 5DD64 8006DD64 611380A3 */  sb         $zero, %gp_rel(stextsize)($gp)
    /* 5DD68 8006DD68 621380A3 */  sb         $zero, %gp_rel(stextscrl)($gp)
    /* 5DD6C 8006DD6C 4AED010C */  jal        GetStr__Fi
    /* 5DD70 8006DD70 D8040424 */   addiu     $a0, $zero, 0x4D8
    /* 5DD74 8006DD74 21200000 */  addu       $a0, $zero, $zero
    /* 5DD78 8006DD78 01000524 */  addiu      $a1, $zero, 0x1
    /* 5DD7C 8006DD7C 01000624 */  addiu      $a2, $zero, 0x1
    /* 5DD80 8006DD80 21384000 */  addu       $a3, $v0, $zero
    /* 5DD84 8006DD84 03000224 */  addiu      $v0, $zero, 0x3
    /* 5DD88 8006DD88 1000A2AF */  sw         $v0, 0x10($sp)
    /* 5DD8C 8006DD8C 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5DD90 8006DD90 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5DD94 8006DD94 5CA7010C */  jal        AddSLine__Fi
    /* 5DD98 8006DD98 03000424 */   addiu     $a0, $zero, 0x3
    /* 5DD9C 8006DD9C 3413838F */  lw         $v1, %gp_rel(StorePlrNo)($gp)
    /* 5DDA0 8006DDA0 00000000 */  nop
    /* 5DDA4 8006DDA4 C0100300 */  sll        $v0, $v1, 3
    /* 5DDA8 8006DDA8 23104300 */  subu       $v0, $v0, $v1
    /* 5DDAC 8006DDAC 80100200 */  sll        $v0, $v0, 2
    /* 5DDB0 8006DDB0 23104300 */  subu       $v0, $v0, $v1
    /* 5DDB4 8006DDB4 80100200 */  sll        $v0, $v0, 2
    /* 5DDB8 8006DDB8 0E80013C */  lui        $at, %hi(_boyitem + 0x2C)
    /* 5DDBC 8006DDBC 21082200 */  addu       $at, $at, $v0
    /* 5DDC0 8006DDC0 240B2384 */  lh         $v1, %lo(_boyitem + 0x2C)($at)
    /* 5DDC4 8006DDC4 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 5DDC8 8006DDC8 34006210 */  beq        $v1, $v0, .L8006DE9C
    /* 5DDCC 8006DDCC 00000000 */   nop
    /* 5DDD0 8006DDD0 4AED010C */  jal        GetStr__Fi
    /* 5DDD4 8006DDD4 2D040424 */   addiu     $a0, $zero, 0x42D
    /* 5DDD8 8006DDD8 21200000 */  addu       $a0, $zero, $zero
    /* 5DDDC 8006DDDC 06000524 */  addiu      $a1, $zero, 0x6
    /* 5DDE0 8006DDE0 01000624 */  addiu      $a2, $zero, 0x1
    /* 5DDE4 8006DDE4 21384000 */  addu       $a3, $v0, $zero
    /* 5DDE8 8006DDE8 01001024 */  addiu      $s0, $zero, 0x1
    /* 5DDEC 8006DDEC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5DDF0 8006DDF0 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5DDF4 8006DDF4 1400B0AF */   sw        $s0, 0x14($sp)
    /* 5DDF8 8006DDF8 4AED010C */  jal        GetStr__Fi
    /* 5DDFC 8006DDFC 27020424 */   addiu     $a0, $zero, 0x227
    /* 5DE00 8006DE00 21200000 */  addu       $a0, $zero, $zero
    /* 5DE04 8006DE04 08000524 */  addiu      $a1, $zero, 0x8
    /* 5DE08 8006DE08 01000624 */  addiu      $a2, $zero, 0x1
    /* 5DE0C 8006DE0C 21384000 */  addu       $a3, $v0, $zero
    /* 5DE10 8006DE10 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5DE14 8006DE14 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5DE18 8006DE18 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5DE1C 8006DE1C 4AED010C */  jal        GetStr__Fi
    /* 5DE20 8006DE20 94000424 */   addiu     $a0, $zero, 0x94
    /* 5DE24 8006DE24 21200000 */  addu       $a0, $zero, $zero
    /* 5DE28 8006DE28 09000524 */  addiu      $a1, $zero, 0x9
    /* 5DE2C 8006DE2C 01000624 */  addiu      $a2, $zero, 0x1
    /* 5DE30 8006DE30 21384000 */  addu       $a3, $v0, $zero
    /* 5DE34 8006DE34 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5DE38 8006DE38 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5DE3C 8006DE3C 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5DE40 8006DE40 4AED010C */  jal        GetStr__Fi
    /* 5DE44 8006DE44 2E020424 */   addiu     $a0, $zero, 0x22E
    /* 5DE48 8006DE48 21200000 */  addu       $a0, $zero, $zero
    /* 5DE4C 8006DE4C 0A000524 */  addiu      $a1, $zero, 0xA
    /* 5DE50 8006DE50 01000624 */  addiu      $a2, $zero, 0x1
    /* 5DE54 8006DE54 21384000 */  addu       $a3, $v0, $zero
    /* 5DE58 8006DE58 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5DE5C 8006DE5C 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5DE60 8006DE60 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5DE64 8006DE64 4AED010C */  jal        GetStr__Fi
    /* 5DE68 8006DE68 CB040424 */   addiu     $a0, $zero, 0x4CB
    /* 5DE6C 8006DE6C 21200000 */  addu       $a0, $zero, $zero
    /* 5DE70 8006DE70 0C000524 */  addiu      $a1, $zero, 0xC
    /* 5DE74 8006DE74 01000624 */  addiu      $a2, $zero, 0x1
    /* 5DE78 8006DE78 21384000 */  addu       $a3, $v0, $zero
    /* 5DE7C 8006DE7C 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5DE80 8006DE80 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5DE84 8006DE84 1400B0AF */   sw        $s0, 0x14($sp)
    /* 5DE88 8006DE88 4AED010C */  jal        GetStr__Fi
    /* 5DE8C 8006DE8C 8C030424 */   addiu     $a0, $zero, 0x38C
    /* 5DE90 8006DE90 21200000 */  addu       $a0, $zero, $zero
    /* 5DE94 8006DE94 B5B70108 */  j          .L8006DED4
    /* 5DE98 8006DE98 0D000524 */   addiu     $a1, $zero, 0xD
  .L8006DE9C:
    /* 5DE9C 8006DE9C 4AED010C */  jal        GetStr__Fi
    /* 5DEA0 8006DEA0 2D040424 */   addiu     $a0, $zero, 0x42D
    /* 5DEA4 8006DEA4 21200000 */  addu       $a0, $zero, $zero
    /* 5DEA8 8006DEA8 08000524 */  addiu      $a1, $zero, 0x8
    /* 5DEAC 8006DEAC 01000624 */  addiu      $a2, $zero, 0x1
    /* 5DEB0 8006DEB0 21384000 */  addu       $a3, $v0, $zero
    /* 5DEB4 8006DEB4 01001024 */  addiu      $s0, $zero, 0x1
    /* 5DEB8 8006DEB8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5DEBC 8006DEBC 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5DEC0 8006DEC0 1400B0AF */   sw        $s0, 0x14($sp)
    /* 5DEC4 8006DEC4 4AED010C */  jal        GetStr__Fi
    /* 5DEC8 8006DEC8 8C030424 */   addiu     $a0, $zero, 0x38C
    /* 5DECC 8006DECC 21200000 */  addu       $a0, $zero, $zero
    /* 5DED0 8006DED0 0C000524 */  addiu      $a1, $zero, 0xC
  .L8006DED4:
    /* 5DED4 8006DED4 01000624 */  addiu      $a2, $zero, 0x1
    /* 5DED8 8006DED8 21384000 */  addu       $a3, $v0, $zero
    /* 5DEDC 8006DEDC 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5DEE0 8006DEE0 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5DEE4 8006DEE4 1400B0AF */   sw        $s0, 0x14($sp)
    /* 5DEE8 8006DEE8 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 5DEEC 8006DEEC 1800B08F */  lw         $s0, 0x18($sp)
    /* 5DEF0 8006DEF0 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 5DEF4 8006DEF4 0800E003 */  jr         $ra
    /* 5DEF8 8006DEF8 00000000 */   nop
endlabel S_StartBoy__Fv
