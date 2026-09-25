.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RecreateItem__FiiUsiii, 0x254

glabel RecreateItem__FiiUsiii
    /* 3BA14 8004BA14 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 3BA18 8004BA18 2400B1AF */  sw         $s1, 0x24($sp)
    /* 3BA1C 8004BA1C 21888000 */  addu       $s1, $a0, $zero
    /* 3BA20 8004BA20 3400B5AF */  sw         $s5, 0x34($sp)
    /* 3BA24 8004BA24 1280153C */  lui        $s5, %hi(FePlayerNo)
    /* 3BA28 8004BA28 78B3B58E */  lw         $s5, %lo(FePlayerNo)($s5)
    /* 3BA2C 8004BA2C 2140C000 */  addu       $t0, $a2, $zero
    /* 3BA30 8004BA30 2800B2AF */  sw         $s2, 0x28($sp)
    /* 3BA34 8004BA34 2190E000 */  addu       $s2, $a3, $zero
    /* 3BA38 8004BA38 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 3BA3C 8004BA3C 3000B4AF */  sw         $s4, 0x30($sp)
    /* 3BA40 8004BA40 5000B48F */  lw         $s4, 0x50($sp)
    /* 3BA44 8004BA44 5400A38F */  lw         $v1, 0x54($sp)
    /* 3BA48 8004BA48 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 3BA4C 8004BA4C 3800BFAF */  sw         $ra, 0x38($sp)
    /* 3BA50 8004BA50 2000B0AF */  sw         $s0, 0x20($sp)
    /* 3BA54 8004BA54 1280013C */  lui        $at, %hi(FePlayerNo)
    /* 3BA58 8004BA58 78B335AC */  sw         $s5, %lo(FePlayerNo)($at)
    /* 3BA5C 8004BA5C 03006210 */  beq        $v1, $v0, .L8004BA6C
    /* 3BA60 8004BA60 21980001 */   addu      $s3, $t0, $zero
    /* 3BA64 8004BA64 1280013C */  lui        $at, %hi(FePlayerNo)
    /* 3BA68 8004BA68 78B323AC */  sw         $v1, %lo(FePlayerNo)($at)
  .L8004BA6C:
    /* 3BA6C 8004BA6C 2D00A014 */  bnez       $a1, .L8004BB24
    /* 3BA70 8004BA70 00020431 */   andi      $a0, $t0, 0x200
    /* 3BA74 8004BA74 C0101100 */  sll        $v0, $s1, 3
    /* 3BA78 8004BA78 23105100 */  subu       $v0, $v0, $s1
    /* 3BA7C 8004BA7C 80100200 */  sll        $v0, $v0, 2
    /* 3BA80 8004BA80 23105100 */  subu       $v0, $v0, $s1
    /* 3BA84 8004BA84 80800200 */  sll        $s0, $v0, 2
    /* 3BA88 8004BA88 0D80043C */  lui        $a0, %hi(item)
    /* 3BA8C 8004BA8C 541D8424 */  addiu      $a0, $a0, %lo(item)
    /* 3BA90 8004BA90 21200402 */  addu       $a0, $s0, $a0
    /* 3BA94 8004BA94 F2FE000C */  jal        SetPlrHandItem__FP10ItemStructi
    /* 3BA98 8004BA98 21280000 */   addu      $a1, $zero, $zero
    /* 3BA9C 8004BA9C 0D80013C */  lui        $at, %hi(item + 0x14)
    /* 3BAA0 8004BAA0 21083000 */  addu       $at, $at, $s0
    /* 3BAA4 8004BAA4 681D34AC */  sw         $s4, %lo(item + 0x14)($at)
    /* 3BAA8 8004BAA8 0D80013C */  lui        $at, %hi(item + 0x14)
    /* 3BAAC 8004BAAC 21083000 */  addu       $at, $at, $s0
    /* 3BAB0 8004BAB0 681D228C */  lw         $v0, %lo(item + 0x14)($at)
    /* 3BAB4 8004BAB4 0D80013C */  lui        $at, %hi(item + 0x24)
    /* 3BAB8 8004BAB8 21083000 */  addu       $at, $at, $s0
    /* 3BABC 8004BABC 781D33A4 */  sh         $s3, %lo(item + 0x24)($at)
    /* 3BAC0 8004BAC0 0D80013C */  lui        $at, %hi(item + 0x10)
    /* 3BAC4 8004BAC4 21083000 */  addu       $at, $at, $s0
    /* 3BAC8 8004BAC8 641D32AC */  sw         $s2, %lo(item + 0x10)($at)
    /* 3BACC 8004BACC C4094228 */  slti       $v0, $v0, 0x9C4
    /* 3BAD0 8004BAD0 07004014 */  bnez       $v0, .L8004BAF0
    /* 3BAD4 8004BAD4 E903822A */   slti      $v0, $s4, 0x3E9
    /* 3BAD8 8004BAD8 06000224 */  addiu      $v0, $zero, 0x6
    /* 3BADC 8004BADC 0D80013C */  lui        $at, %hi(item + 0x4C)
    /* 3BAE0 8004BAE0 21083000 */  addu       $at, $at, $s0
    /* 3BAE4 8004BAE4 A01D22A0 */  sb         $v0, %lo(item + 0x4C)($at)
    /* 3BAE8 8004BAE8 052F0108 */  j          .L8004BC14
    /* 3BAEC 8004BAEC C0101100 */   sll       $v0, $s1, 3
  .L8004BAF0:
    /* 3BAF0 8004BAF0 06004010 */  beqz       $v0, .L8004BB0C
    /* 3BAF4 8004BAF4 04000224 */   addiu     $v0, $zero, 0x4
    /* 3BAF8 8004BAF8 0D80013C */  lui        $at, %hi(item + 0x4C)
    /* 3BAFC 8004BAFC 21083000 */  addu       $at, $at, $s0
    /* 3BB00 8004BB00 A01D22A0 */  sb         $v0, %lo(item + 0x4C)($at)
    /* 3BB04 8004BB04 052F0108 */  j          .L8004BC14
    /* 3BB08 8004BB08 C0101100 */   sll       $v0, $s1, 3
  .L8004BB0C:
    /* 3BB0C 8004BB0C 05000224 */  addiu      $v0, $zero, 0x5
    /* 3BB10 8004BB10 0D80013C */  lui        $at, %hi(item + 0x4C)
    /* 3BB14 8004BB14 21083000 */  addu       $at, $at, $s0
    /* 3BB18 8004BB18 A01D22A0 */  sb         $v0, %lo(item + 0x4C)($at)
    /* 3BB1C 8004BB1C 052F0108 */  j          .L8004BC14
    /* 3BB20 8004BB20 C0101100 */   sll       $v0, $s1, 3
  .L8004BB24:
    /* 3BB24 8004BB24 FFFF6632 */  andi       $a2, $s3, 0xFFFF
    /* 3BB28 8004BB28 1000C014 */  bnez       $a2, .L8004BB6C
    /* 3BB2C 8004BB2C 007C0231 */   andi      $v0, $t0, 0x7C00
    /* 3BB30 8004BB30 C0801100 */  sll        $s0, $s1, 3
    /* 3BB34 8004BB34 23801102 */  subu       $s0, $s0, $s1
    /* 3BB38 8004BB38 80801000 */  sll        $s0, $s0, 2
    /* 3BB3C 8004BB3C 23801102 */  subu       $s0, $s0, $s1
    /* 3BB40 8004BB40 80801000 */  sll        $s0, $s0, 2
    /* 3BB44 8004BB44 0D80023C */  lui        $v0, %hi(item)
    /* 3BB48 8004BB48 541D4224 */  addiu      $v0, $v0, %lo(item)
    /* 3BB4C 8004BB4C 21800202 */  addu       $s0, $s0, $v0
    /* 3BB50 8004BB50 F2FE000C */  jal        SetPlrHandItem__FP10ItemStructi
    /* 3BB54 8004BB54 21200002 */   addu      $a0, $s0, $zero
    /* 3BB58 8004BB58 21200002 */  addu       $a0, $s0, $zero
    /* 3BB5C 8004BB5C 9DFF000C */  jal        SetPlrHandSeed__FP10ItemStructi
    /* 3BB60 8004BB60 21284002 */   addu      $a1, $s2, $zero
    /* 3BB64 8004BB64 052F0108 */  j          .L8004BC14
    /* 3BB68 8004BB68 C0101100 */   sll       $v0, $s1, 3
  .L8004BB6C:
    /* 3BB6C 8004BB6C 07004010 */  beqz       $v0, .L8004BB8C
    /* 3BB70 8004BB70 80010331 */   andi      $v1, $t0, 0x180
    /* 3BB74 8004BB74 1000B4AF */  sw         $s4, 0x10($sp)
    /* 3BB78 8004BB78 21202002 */  addu       $a0, $s1, $zero
    /* 3BB7C 8004BB7C 2D29010C */  jal        RecreateTownItem__FiiUsii
    /* 3BB80 8004BB80 21384002 */   addu      $a3, $s2, $zero
    /* 3BB84 8004BB84 052F0108 */  j          .L8004BC14
    /* 3BB88 8004BB88 C0101100 */   sll       $v0, $s1, 3
  .L8004BB8C:
    /* 3BB8C 8004BB8C 80010224 */  addiu      $v0, $zero, 0x180
    /* 3BB90 8004BB90 07006214 */  bne        $v1, $v0, .L8004BBB0
    /* 3BB94 8004BB94 21480000 */   addu      $t1, $zero, $zero
    /* 3BB98 8004BB98 21202002 */  addu       $a0, $s1, $zero
    /* 3BB9C 8004BB9C 21284002 */  addu       $a1, $s2, $zero
    /* 3BBA0 8004BBA0 4813010C */  jal        SetupAllUseful__Fiii
    /* 3BBA4 8004BBA4 3F000631 */   andi      $a2, $t0, 0x3F
    /* 3BBA8 8004BBA8 052F0108 */  j          .L8004BC14
    /* 3BBAC 8004BBAC C0101100 */   sll       $v0, $s1, 3
  .L8004BBB0:
    /* 3BBB0 8004BBB0 21500000 */  addu       $t2, $zero, $zero
    /* 3BBB4 8004BBB4 00010231 */  andi       $v0, $t0, 0x100
    /* 3BBB8 8004BBB8 2B180200 */  sltu       $v1, $zero, $v0
    /* 3BBBC 8004BBBC 80000231 */  andi       $v0, $t0, 0x80
    /* 3BBC0 8004BBC0 02004010 */  beqz       $v0, .L8004BBCC
    /* 3BBC4 8004BBC4 21580000 */   addu      $t3, $zero, $zero
    /* 3BBC8 8004BBC8 0F000324 */  addiu      $v1, $zero, 0xF
  .L8004BBCC:
    /* 3BBCC 8004BBCC 40000231 */  andi       $v0, $t0, 0x40
    /* 3BBD0 8004BBD0 02004010 */  beqz       $v0, .L8004BBDC
    /* 3BBD4 8004BBD4 00000000 */   nop
    /* 3BBD8 8004BBD8 01000924 */  addiu      $t1, $zero, 0x1
  .L8004BBDC:
    /* 3BBDC 8004BBDC 02008010 */  beqz       $a0, .L8004BBE8
    /* 3BBE0 8004BBE0 00800231 */   andi      $v0, $t0, 0x8000
    /* 3BBE4 8004BBE4 01000A24 */  addiu      $t2, $zero, 0x1
  .L8004BBE8:
    /* 3BBE8 8004BBE8 02004010 */  beqz       $v0, .L8004BBF4
    /* 3BBEC 8004BBEC 21202002 */   addu      $a0, $s1, $zero
    /* 3BBF0 8004BBF0 01000B24 */  addiu      $t3, $zero, 0x1
  .L8004BBF4:
    /* 3BBF4 8004BBF4 21304002 */  addu       $a2, $s2, $zero
    /* 3BBF8 8004BBF8 3F000731 */  andi       $a3, $t0, 0x3F
    /* 3BBFC 8004BBFC 1000A3AF */  sw         $v1, 0x10($sp)
    /* 3BC00 8004BC00 1400A9AF */  sw         $t1, 0x14($sp)
    /* 3BC04 8004BC04 1800AAAF */  sw         $t2, 0x18($sp)
    /* 3BC08 8004BC08 2411010C */  jal        SetupAllItems__FiiiiiUcUcUc
    /* 3BC0C 8004BC0C 1C00ABAF */   sw        $t3, 0x1C($sp)
    /* 3BC10 8004BC10 C0101100 */  sll        $v0, $s1, 3
  .L8004BC14:
    /* 3BC14 8004BC14 23105100 */  subu       $v0, $v0, $s1
    /* 3BC18 8004BC18 80100200 */  sll        $v0, $v0, 2
    /* 3BC1C 8004BC1C 23105100 */  subu       $v0, $v0, $s1
    /* 3BC20 8004BC20 1280033C */  lui        $v1, %hi(FePlayerNo)
    /* 3BC24 8004BC24 78B3638C */  lw         $v1, %lo(FePlayerNo)($v1)
    /* 3BC28 8004BC28 80100200 */  sll        $v0, $v0, 2
    /* 3BC2C 8004BC2C 0D80013C */  lui        $at, %hi(item + 0x65)
    /* 3BC30 8004BC30 21082200 */  addu       $at, $at, $v0
    /* 3BC34 8004BC34 B91D23A0 */  sb         $v1, %lo(item + 0x65)($at)
    /* 3BC38 8004BC38 1280013C */  lui        $at, %hi(FePlayerNo)
    /* 3BC3C 8004BC3C 78B335AC */  sw         $s5, %lo(FePlayerNo)($at)
    /* 3BC40 8004BC40 3800BF8F */  lw         $ra, 0x38($sp)
    /* 3BC44 8004BC44 3400B58F */  lw         $s5, 0x34($sp)
    /* 3BC48 8004BC48 3000B48F */  lw         $s4, 0x30($sp)
    /* 3BC4C 8004BC4C 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 3BC50 8004BC50 2800B28F */  lw         $s2, 0x28($sp)
    /* 3BC54 8004BC54 2400B18F */  lw         $s1, 0x24($sp)
    /* 3BC58 8004BC58 2000B08F */  lw         $s0, 0x20($sp)
    /* 3BC5C 8004BC5C 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 3BC60 8004BC60 0800E003 */  jr         $ra
    /* 3BC64 8004BC64 00000000 */   nop
endlabel RecreateItem__FiiUsiii
