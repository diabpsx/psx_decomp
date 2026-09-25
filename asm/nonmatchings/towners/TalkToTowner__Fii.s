.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TalkToTowner__Fii, 0x159C

glabel TalkToTowner__Fii
    /* 2B998 8003B998 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 2B99C 8003B99C 2800B2AF */  sw         $s2, 0x28($sp)
    /* 2B9A0 8003B9A0 21908000 */  addu       $s2, $a0, $zero
    /* 2B9A4 8003B9A4 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 2B9A8 8003B9A8 2198A000 */  addu       $s3, $a1, $zero
    /* 2B9AC 8003B9AC 03000424 */  addiu      $a0, $zero, 0x3
    /* 2B9B0 8003B9B0 3400BFAF */  sw         $ra, 0x34($sp)
    /* 2B9B4 8003B9B4 3000B4AF */  sw         $s4, 0x30($sp)
    /* 2B9B8 8003B9B8 2400B1AF */  sw         $s1, 0x24($sp)
    /* 2B9BC 8003B9BC C9F6000C */  jal        ENG_random__Fl
    /* 2B9C0 8003B9C0 2000B0AF */   sw        $s0, 0x20($sp)
    /* 2B9C4 8003B9C4 C9F6000C */  jal        ENG_random__Fl
    /* 2B9C8 8003B9C8 04000424 */   addiu     $a0, $zero, 0x4
    /* 2B9CC 8003B9CC C9F6000C */  jal        ENG_random__Fl
    /* 2B9D0 8003B9D0 05000424 */   addiu     $a0, $zero, 0x5
    /* 2B9D4 8003B9D4 40101200 */  sll        $v0, $s2, 1
    /* 2B9D8 8003B9D8 21105200 */  addu       $v0, $v0, $s2
    /* 2B9DC 8003B9DC 80100200 */  sll        $v0, $v0, 2
    /* 2B9E0 8003B9E0 21105200 */  addu       $v0, $v0, $s2
    /* 2B9E4 8003B9E4 00110200 */  sll        $v0, $v0, 4
    /* 2B9E8 8003B9E8 23105200 */  subu       $v0, $v0, $s2
    /* 2B9EC 8003B9EC 80100200 */  sll        $v0, $v0, 2
    /* 2B9F0 8003B9F0 21105200 */  addu       $v0, $v0, $s2
    /* 2B9F4 8003B9F4 C0A00200 */  sll        $s4, $v0, 3
    /* 2B9F8 8003B9F8 40101300 */  sll        $v0, $s3, 1
    /* 2B9FC 8003B9FC 21105300 */  addu       $v0, $v0, $s3
    /* 2BA00 8003BA00 00110200 */  sll        $v0, $v0, 4
    /* 2BA04 8003BA04 21105300 */  addu       $v0, $v0, $s3
    /* 2BA08 8003BA08 80880200 */  sll        $s1, $v0, 2
    /* 2BA0C 8003BA0C 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 2BA10 8003BA10 21083400 */  addu       $at, $at, $s4
    /* 2BA14 8003BA14 68A52284 */  lh         $v0, %lo(plr + 0x30)($at)
    /* 2BA18 8003BA18 0D80013C */  lui        $at, %hi(towner + 0x8)
    /* 2BA1C 8003BA1C 21083100 */  addu       $at, $at, $s1
    /* 2BA20 8003BA20 88FE248C */  lw         $a0, %lo(towner + 0x8)($at)
    /* 2BA24 8003BA24 6D41000C */  jal        abs
    /* 2BA28 8003BA28 23204400 */   subu      $a0, $v0, $a0
    /* 2BA2C 8003BA2C 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 2BA30 8003BA30 21083400 */  addu       $at, $at, $s4
    /* 2BA34 8003BA34 6AA52384 */  lh         $v1, %lo(plr + 0x32)($at)
    /* 2BA38 8003BA38 0D80013C */  lui        $at, %hi(towner + 0xC)
    /* 2BA3C 8003BA3C 21083100 */  addu       $at, $at, $s1
    /* 2BA40 8003BA40 8CFE248C */  lw         $a0, %lo(towner + 0xC)($at)
    /* 2BA44 8003BA44 21804000 */  addu       $s0, $v0, $zero
    /* 2BA48 8003BA48 6D41000C */  jal        abs
    /* 2BA4C 8003BA4C 23206400 */   subu      $a0, $v1, $a0
    /* 2BA50 8003BA50 0300102A */  slti       $s0, $s0, 0x3
    /* 2BA54 8003BA54 2E050012 */  beqz       $s0, .L8003CF10
    /* 2BA58 8003BA58 03004228 */   slti      $v0, $v0, 0x3
    /* 2BA5C 8003BA5C 2C054010 */  beqz       $v0, .L8003CF10
    /* 2BA60 8003BA60 00000000 */   nop
    /* 2BA64 8003BA64 1280023C */  lui        $v0, %hi(qtextflag)
    /* 2BA68 8003BA68 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 2BA6C 8003BA6C 00000000 */  nop
    /* 2BA70 8003BA70 27054014 */  bnez       $v0, .L8003CF10
    /* 2BA74 8003BA74 00000000 */   nop
    /* 2BA78 8003BA78 1280023C */  lui        $v0, %hi(stextflag)
    /* 2BA7C 8003BA7C E0BA4280 */  lb         $v0, %lo(stextflag)($v0)
    /* 2BA80 8003BA80 00000000 */  nop
    /* 2BA84 8003BA84 22054014 */  bnez       $v0, .L8003CF10
    /* 2BA88 8003BA88 00000000 */   nop
    /* 2BA8C 8003BA8C 0D80013C */  lui        $at, %hi(towner + 0x51)
    /* 2BA90 8003BA90 21083100 */  addu       $at, $at, $s1
    /* 2BA94 8003BA94 D1FE20A0 */  sb         $zero, %lo(towner + 0x51)($at)
    /* 2BA98 8003BA98 1280023C */  lui        $v0, %hi(myplr)
    /* 2BA9C 8003BA9C 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 2BAA0 8003BAA0 00000000 */  nop
    /* 2BAA4 8003BAA4 80100200 */  sll        $v0, $v0, 2
    /* 2BAA8 8003BAA8 1280013C */  lui        $at, %hi(_pcurs)
    /* 2BAAC 8003BAAC 21082200 */  addu       $at, $at, $v0
    /* 2BAB0 8003BAB0 30B7228C */  lw         $v0, %lo(_pcurs)($at)
    /* 2BAB4 8003BAB4 00000000 */  nop
    /* 2BAB8 8003BAB8 0C004228 */  slti       $v0, $v0, 0xC
    /* 2BABC 8003BABC 06004014 */  bnez       $v0, .L8003BAD8
    /* 2BAC0 8003BAC0 00000000 */   nop
    /* 2BAC4 8003BAC4 2783050C */  jal        func_80160C9C
    /* 2BAC8 8003BAC8 00000000 */   nop
    /* 2BACC 8003BACC FF004230 */  andi       $v0, $v0, 0xFF
    /* 2BAD0 8003BAD0 0F054010 */  beqz       $v0, .L8003CF10
    /* 2BAD4 8003BAD4 00000000 */   nop
  .L8003BAD8:
    /* 2BAD8 8003BAD8 E2E7000C */  jal        GetActiveTowner__Fi
    /* 2BADC 8003BADC 03000424 */   addiu     $a0, $zero, 0x3
    /* 2BAE0 8003BAE0 0E016216 */  bne        $s3, $v0, .L8003BF1C
    /* 2BAE4 8003BAE4 00000000 */   nop
    /* 2BAE8 8003BAE8 0E80013C */  lui        $at, %hi(plr + 0x167)
    /* 2BAEC 8003BAEC 21083400 */  addu       $at, $at, $s4
    /* 2BAF0 8003BAF0 9FA62290 */  lbu        $v0, %lo(plr + 0x167)($at)
    /* 2BAF4 8003BAF4 00000000 */  nop
    /* 2BAF8 8003BAF8 15004014 */  bnez       $v0, .L8003BB50
    /* 2BAFC 8003BAFC 40101200 */   sll       $v0, $s2, 1
    /* 2BB00 8003BB00 0D80013C */  lui        $at, %hi(towner + 0x51)
    /* 2BB04 8003BB04 21083100 */  addu       $at, $at, $s1
    /* 2BB08 8003BB08 D1FE2290 */  lbu        $v0, %lo(towner + 0x51)($at)
    /* 2BB0C 8003BB0C 00000000 */  nop
    /* 2BB10 8003BB10 0F004014 */  bnez       $v0, .L8003BB50
    /* 2BB14 8003BB14 40101200 */   sll       $v0, $s2, 1
    /* 2BB18 8003BB18 96000224 */  addiu      $v0, $zero, 0x96
    /* 2BB1C 8003BB1C 0D80013C */  lui        $at, %hi(towner + 0x4C)
    /* 2BB20 8003BB20 21083100 */  addu       $at, $at, $s1
    /* 2BB24 8003BB24 CCFE22AC */  sw         $v0, %lo(towner + 0x4C)($at)
    /* 2BB28 8003BB28 0D80013C */  lui        $at, %hi(towner + 0x88)
    /* 2BB2C 8003BB2C 21083100 */  addu       $at, $at, $s1
    /* 2BB30 8003BB30 08FF32AC */  sw         $s2, %lo(towner + 0x88)($at)
    /* 2BB34 8003BB34 1E37010C */  jal        InitQTextMsg__Fi
    /* 2BB38 8003BB38 02010424 */   addiu     $a0, $zero, 0x102
    /* 2BB3C 8003BB3C 01000224 */  addiu      $v0, $zero, 0x1
    /* 2BB40 8003BB40 0D80013C */  lui        $at, %hi(towner + 0x51)
    /* 2BB44 8003BB44 21083100 */  addu       $at, $at, $s1
    /* 2BB48 8003BB48 D1FE22A0 */  sb         $v0, %lo(towner + 0x51)($at)
    /* 2BB4C 8003BB4C 40101200 */  sll        $v0, $s2, 1
  .L8003BB50:
    /* 2BB50 8003BB50 21105200 */  addu       $v0, $v0, $s2
    /* 2BB54 8003BB54 80100200 */  sll        $v0, $v0, 2
    /* 2BB58 8003BB58 21105200 */  addu       $v0, $v0, $s2
    /* 2BB5C 8003BB5C 00110200 */  sll        $v0, $v0, 4
    /* 2BB60 8003BB60 23105200 */  subu       $v0, $v0, $s2
    /* 2BB64 8003BB64 80100200 */  sll        $v0, $v0, 2
    /* 2BB68 8003BB68 21105200 */  addu       $v0, $v0, $s2
    /* 2BB6C 8003BB6C C0180200 */  sll        $v1, $v0, 3
    /* 2BB70 8003BB70 0E80013C */  lui        $at, %hi(plr + 0x168)
    /* 2BB74 8003BB74 21082300 */  addu       $at, $at, $v1
    /* 2BB78 8003BB78 A0A62290 */  lbu        $v0, %lo(plr + 0x168)($at)
    /* 2BB7C 8003BB7C 00000000 */  nop
    /* 2BB80 8003BB80 07004014 */  bnez       $v0, .L8003BBA0
    /* 2BB84 8003BB84 00000000 */   nop
    /* 2BB88 8003BB88 0E80013C */  lui        $at, %hi(plr + 0x16A)
    /* 2BB8C 8003BB8C 21082300 */  addu       $at, $at, $v1
    /* 2BB90 8003BB90 A2A62290 */  lbu        $v0, %lo(plr + 0x16A)($at)
    /* 2BB94 8003BB94 00000000 */  nop
    /* 2BB98 8003BB98 58004010 */  beqz       $v0, .L8003BCFC
    /* 2BB9C 8003BB9C 00000000 */   nop
  .L8003BBA0:
    /* 2BBA0 8003BBA0 0E80043C */  lui        $a0, %hi(quests + 0xF2)
    /* 2BBA4 8003BBA4 32DB8424 */  addiu      $a0, $a0, %lo(quests + 0xF2)
    /* 2BBA8 8003BBA8 00008390 */  lbu        $v1, 0x0($a0)
    /* 2BBAC 8003BBAC 00000000 */  nop
    /* 2BBB0 8003BBB0 52006010 */  beqz       $v1, .L8003BCFC
    /* 2BBB4 8003BBB4 00000000 */   nop
    /* 2BBB8 8003BBB8 0E80023C */  lui        $v0, %hi(quests + 0x100)
    /* 2BBBC 8003BBBC 40DB4290 */  lbu        $v0, %lo(quests + 0x100)($v0)
    /* 2BBC0 8003BBC0 00000000 */  nop
    /* 2BBC4 8003BBC4 25004014 */  bnez       $v0, .L8003BC5C
    /* 2BBC8 8003BBC8 40101300 */   sll       $v0, $s3, 1
    /* 2BBCC 8003BBCC 21105300 */  addu       $v0, $v0, $s3
    /* 2BBD0 8003BBD0 00110200 */  sll        $v0, $v0, 4
    /* 2BBD4 8003BBD4 21105300 */  addu       $v0, $v0, $s3
    /* 2BBD8 8003BBD8 80800200 */  sll        $s0, $v0, 2
    /* 2BBDC 8003BBDC 0D80013C */  lui        $at, %hi(towner + 0x51)
    /* 2BBE0 8003BBE0 21083000 */  addu       $at, $at, $s0
    /* 2BBE4 8003BBE4 D1FE2290 */  lbu        $v0, %lo(towner + 0x51)($at)
    /* 2BBE8 8003BBE8 00000000 */  nop
    /* 2BBEC 8003BBEC 1B004014 */  bnez       $v0, .L8003BC5C
    /* 2BBF0 8003BBF0 01001124 */   addiu     $s1, $zero, 0x1
    /* 2BBF4 8003BBF4 01000224 */  addiu      $v0, $zero, 0x1
    /* 2BBF8 8003BBF8 0E80013C */  lui        $at, %hi(quests + 0x100)
    /* 2BBFC 8003BBFC 40DB31A0 */  sb         $s1, %lo(quests + 0x100)($at)
    /* 2BC00 8003BC00 0E80013C */  lui        $at, %hi(quests + 0x101)
    /* 2BC04 8003BC04 41DB31A0 */  sb         $s1, %lo(quests + 0x101)($at)
    /* 2BC08 8003BC08 06006214 */  bne        $v1, $v0, .L8003BC24
    /* 2BC0C 8003BC0C 96000224 */   addiu     $v0, $zero, 0x96
    /* 2BC10 8003BC10 02000224 */  addiu      $v0, $zero, 0x2
    /* 2BC14 8003BC14 000082A0 */  sb         $v0, 0x0($a0)
    /* 2BC18 8003BC18 0E80013C */  lui        $at, %hi(quests + 0xFF)
    /* 2BC1C 8003BC1C 3FDB31A0 */  sb         $s1, %lo(quests + 0xFF)($at)
    /* 2BC20 8003BC20 96000224 */  addiu      $v0, $zero, 0x96
  .L8003BC24:
    /* 2BC24 8003BC24 0D80013C */  lui        $at, %hi(towner + 0x4C)
    /* 2BC28 8003BC28 21083000 */  addu       $at, $at, $s0
    /* 2BC2C 8003BC2C CCFE22AC */  sw         $v0, %lo(towner + 0x4C)($at)
    /* 2BC30 8003BC30 0D80013C */  lui        $at, %hi(towner + 0x88)
    /* 2BC34 8003BC34 21083000 */  addu       $at, $at, $s0
    /* 2BC38 8003BC38 08FF32AC */  sw         $s2, %lo(towner + 0x88)($at)
    /* 2BC3C 8003BC3C 1E37010C */  jal        InitQTextMsg__Fi
    /* 2BC40 8003BC40 01000424 */   addiu     $a0, $zero, 0x1
    /* 2BC44 8003BC44 01000424 */  addiu      $a0, $zero, 0x1
    /* 2BC48 8003BC48 0D80013C */  lui        $at, %hi(towner + 0x51)
    /* 2BC4C 8003BC4C 21083000 */  addu       $at, $at, $s0
    /* 2BC50 8003BC50 D1FE31A0 */  sb         $s1, %lo(towner + 0x51)($at)
    /* 2BC54 8003BC54 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 2BC58 8003BC58 0C000524 */   addiu     $a1, $zero, 0xC
  .L8003BC5C:
    /* 2BC5C 8003BC5C 0E80033C */  lui        $v1, %hi(quests + 0xF2)
    /* 2BC60 8003BC60 32DB6390 */  lbu        $v1, %lo(quests + 0xF2)($v1)
    /* 2BC64 8003BC64 03000224 */  addiu      $v0, $zero, 0x3
    /* 2BC68 8003BC68 24006214 */  bne        $v1, $v0, .L8003BCFC
    /* 2BC6C 8003BC6C 01000224 */   addiu     $v0, $zero, 0x1
    /* 2BC70 8003BC70 0E80033C */  lui        $v1, %hi(quests + 0x100)
    /* 2BC74 8003BC74 40DB6390 */  lbu        $v1, %lo(quests + 0x100)($v1)
    /* 2BC78 8003BC78 00000000 */  nop
    /* 2BC7C 8003BC7C 1F006214 */  bne        $v1, $v0, .L8003BCFC
    /* 2BC80 8003BC80 40101300 */   sll       $v0, $s3, 1
    /* 2BC84 8003BC84 21105300 */  addu       $v0, $v0, $s3
    /* 2BC88 8003BC88 00110200 */  sll        $v0, $v0, 4
    /* 2BC8C 8003BC8C 21105300 */  addu       $v0, $v0, $s3
    /* 2BC90 8003BC90 80800200 */  sll        $s0, $v0, 2
    /* 2BC94 8003BC94 0D80013C */  lui        $at, %hi(towner + 0x51)
    /* 2BC98 8003BC98 21083000 */  addu       $at, $at, $s0
    /* 2BC9C 8003BC9C D1FE2290 */  lbu        $v0, %lo(towner + 0x51)($at)
    /* 2BCA0 8003BCA0 00000000 */  nop
    /* 2BCA4 8003BCA4 15004014 */  bnez       $v0, .L8003BCFC
    /* 2BCA8 8003BCA8 02000224 */   addiu     $v0, $zero, 0x2
    /* 2BCAC 8003BCAC 0E80013C */  lui        $at, %hi(quests + 0x100)
    /* 2BCB0 8003BCB0 40DB22A0 */  sb         $v0, %lo(quests + 0x100)($at)
    /* 2BCB4 8003BCB4 0E80013C */  lui        $at, %hi(quests + 0xFF)
    /* 2BCB8 8003BCB8 3FDB22A0 */  sb         $v0, %lo(quests + 0xFF)($at)
    /* 2BCBC 8003BCBC 96000224 */  addiu      $v0, $zero, 0x96
    /* 2BCC0 8003BCC0 0D80013C */  lui        $at, %hi(towner + 0x4C)
    /* 2BCC4 8003BCC4 21083000 */  addu       $at, $at, $s0
    /* 2BCC8 8003BCC8 CCFE22AC */  sw         $v0, %lo(towner + 0x4C)($at)
    /* 2BCCC 8003BCCC 0D80013C */  lui        $at, %hi(towner + 0x88)
    /* 2BCD0 8003BCD0 21083000 */  addu       $at, $at, $s0
    /* 2BCD4 8003BCD4 08FF32AC */  sw         $s2, %lo(towner + 0x88)($at)
    /* 2BCD8 8003BCD8 1E37010C */  jal        InitQTextMsg__Fi
    /* 2BCDC 8003BCDC 03000424 */   addiu     $a0, $zero, 0x3
    /* 2BCE0 8003BCE0 01000424 */  addiu      $a0, $zero, 0x1
    /* 2BCE4 8003BCE4 01000224 */  addiu      $v0, $zero, 0x1
    /* 2BCE8 8003BCE8 0D80013C */  lui        $at, %hi(towner + 0x51)
    /* 2BCEC 8003BCEC 21083000 */  addu       $at, $at, $s0
    /* 2BCF0 8003BCF0 D1FE22A0 */  sb         $v0, %lo(towner + 0x51)($at)
    /* 2BCF4 8003BCF4 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 2BCF8 8003BCF8 0C000524 */   addiu     $a1, $zero, 0xC
  .L8003BCFC:
    /* 2BCFC 8003BCFC 1280043C */  lui        $a0, %hi(gbMaxPlayers)
    /* 2BD00 8003BD00 A2B98490 */  lbu        $a0, %lo(gbMaxPlayers)($a0)
    /* 2BD04 8003BD04 01000224 */  addiu      $v0, $zero, 0x1
    /* 2BD08 8003BD08 75008214 */  bne        $a0, $v0, .L8003BEE0
    /* 2BD0C 8003BD0C 40101200 */   sll       $v0, $s2, 1
    /* 2BD10 8003BD10 21105200 */  addu       $v0, $v0, $s2
    /* 2BD14 8003BD14 80100200 */  sll        $v0, $v0, 2
    /* 2BD18 8003BD18 21105200 */  addu       $v0, $v0, $s2
    /* 2BD1C 8003BD1C 00110200 */  sll        $v0, $v0, 4
    /* 2BD20 8003BD20 23105200 */  subu       $v0, $v0, $s2
    /* 2BD24 8003BD24 80100200 */  sll        $v0, $v0, 2
    /* 2BD28 8003BD28 21105200 */  addu       $v0, $v0, $s2
    /* 2BD2C 8003BD2C C0100200 */  sll        $v0, $v0, 3
    /* 2BD30 8003BD30 0E80013C */  lui        $at, %hi(plr + 0x169)
    /* 2BD34 8003BD34 21082200 */  addu       $at, $at, $v0
    /* 2BD38 8003BD38 A1A62290 */  lbu        $v0, %lo(plr + 0x169)($at)
    /* 2BD3C 8003BD3C 00000000 */  nop
    /* 2BD40 8003BD40 67004010 */  beqz       $v0, .L8003BEE0
    /* 2BD44 8003BD44 00000000 */   nop
    /* 2BD48 8003BD48 0E80053C */  lui        $a1, %hi(quests + 0x8E)
    /* 2BD4C 8003BD4C CEDAA524 */  addiu      $a1, $a1, %lo(quests + 0x8E)
    /* 2BD50 8003BD50 0000A290 */  lbu        $v0, 0x0($a1)
    /* 2BD54 8003BD54 00000000 */  nop
    /* 2BD58 8003BD58 FF004330 */  andi       $v1, $v0, 0xFF
    /* 2BD5C 8003BD5C 60006010 */  beqz       $v1, .L8003BEE0
    /* 2BD60 8003BD60 FFFF4224 */   addiu     $v0, $v0, -0x1
    /* 2BD64 8003BD64 0200422C */  sltiu      $v0, $v0, 0x2
    /* 2BD68 8003BD68 29004010 */  beqz       $v0, .L8003BE10
    /* 2BD6C 8003BD6C 00000000 */   nop
    /* 2BD70 8003BD70 0E80023C */  lui        $v0, %hi(quests + 0x9C)
    /* 2BD74 8003BD74 DCDA4290 */  lbu        $v0, %lo(quests + 0x9C)($v0)
    /* 2BD78 8003BD78 00000000 */  nop
    /* 2BD7C 8003BD7C 24004014 */  bnez       $v0, .L8003BE10
    /* 2BD80 8003BD80 40101300 */   sll       $v0, $s3, 1
    /* 2BD84 8003BD84 21105300 */  addu       $v0, $v0, $s3
    /* 2BD88 8003BD88 00110200 */  sll        $v0, $v0, 4
    /* 2BD8C 8003BD8C 21105300 */  addu       $v0, $v0, $s3
    /* 2BD90 8003BD90 80800200 */  sll        $s0, $v0, 2
    /* 2BD94 8003BD94 0D80013C */  lui        $at, %hi(towner + 0x51)
    /* 2BD98 8003BD98 21083000 */  addu       $at, $at, $s0
    /* 2BD9C 8003BD9C D1FE2290 */  lbu        $v0, %lo(towner + 0x51)($at)
    /* 2BDA0 8003BDA0 00000000 */  nop
    /* 2BDA4 8003BDA4 1A004014 */  bnez       $v0, .L8003BE10
    /* 2BDA8 8003BDA8 01001124 */   addiu     $s1, $zero, 0x1
    /* 2BDAC 8003BDAC 0E80013C */  lui        $at, %hi(quests + 0x9C)
    /* 2BDB0 8003BDB0 DCDA31A0 */  sb         $s1, %lo(quests + 0x9C)($at)
    /* 2BDB4 8003BDB4 06006414 */  bne        $v1, $a0, .L8003BDD0
    /* 2BDB8 8003BDB8 96000224 */   addiu     $v0, $zero, 0x96
    /* 2BDBC 8003BDBC 02000224 */  addiu      $v0, $zero, 0x2
    /* 2BDC0 8003BDC0 0E80013C */  lui        $at, %hi(quests + 0x9B)
    /* 2BDC4 8003BDC4 DBDA31A0 */  sb         $s1, %lo(quests + 0x9B)($at)
    /* 2BDC8 8003BDC8 0000A2A0 */  sb         $v0, 0x0($a1)
    /* 2BDCC 8003BDCC 96000224 */  addiu      $v0, $zero, 0x96
  .L8003BDD0:
    /* 2BDD0 8003BDD0 0E80013C */  lui        $at, %hi(quests + 0x9D)
    /* 2BDD4 8003BDD4 DDDA31A0 */  sb         $s1, %lo(quests + 0x9D)($at)
    /* 2BDD8 8003BDD8 0D80013C */  lui        $at, %hi(towner + 0x4C)
    /* 2BDDC 8003BDDC 21083000 */  addu       $at, $at, $s0
    /* 2BDE0 8003BDE0 CCFE22AC */  sw         $v0, %lo(towner + 0x4C)($at)
    /* 2BDE4 8003BDE4 0D80013C */  lui        $at, %hi(towner + 0x88)
    /* 2BDE8 8003BDE8 21083000 */  addu       $at, $at, $s0
    /* 2BDEC 8003BDEC 08FF32AC */  sw         $s2, %lo(towner + 0x88)($at)
    /* 2BDF0 8003BDF0 1E37010C */  jal        InitQTextMsg__Fi
    /* 2BDF4 8003BDF4 0C000424 */   addiu     $a0, $zero, 0xC
    /* 2BDF8 8003BDF8 01000424 */  addiu      $a0, $zero, 0x1
    /* 2BDFC 8003BDFC 0D80013C */  lui        $at, %hi(towner + 0x51)
    /* 2BE00 8003BE00 21083000 */  addu       $at, $at, $s0
    /* 2BE04 8003BE04 D1FE31A0 */  sb         $s1, %lo(towner + 0x51)($at)
    /* 2BE08 8003BE08 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 2BE0C 8003BE0C 07000524 */   addiu     $a1, $zero, 0x7
  .L8003BE10:
    /* 2BE10 8003BE10 0E80033C */  lui        $v1, %hi(quests + 0x9C)
    /* 2BE14 8003BE14 DCDA6390 */  lbu        $v1, %lo(quests + 0x9C)($v1)
    /* 2BE18 8003BE18 01000224 */  addiu      $v0, $zero, 0x1
    /* 2BE1C 8003BE1C 30006214 */  bne        $v1, $v0, .L8003BEE0
    /* 2BE20 8003BE20 21204002 */   addu      $a0, $s2, $zero
    /* 2BE24 8003BE24 0C000524 */  addiu      $a1, $zero, 0xC
    /* 2BE28 8003BE28 DAED000C */  jal        PlrHasItem__FiiRi
    /* 2BE2C 8003BE2C 1800A627 */   addiu     $a2, $sp, 0x18
    /* 2BE30 8003BE30 2B004010 */  beqz       $v0, .L8003BEE0
    /* 2BE34 8003BE34 40101300 */   sll       $v0, $s3, 1
    /* 2BE38 8003BE38 21105300 */  addu       $v0, $v0, $s3
    /* 2BE3C 8003BE3C 00110200 */  sll        $v0, $v0, 4
    /* 2BE40 8003BE40 21105300 */  addu       $v0, $v0, $s3
    /* 2BE44 8003BE44 80800200 */  sll        $s0, $v0, 2
    /* 2BE48 8003BE48 0D80013C */  lui        $at, %hi(towner + 0x51)
    /* 2BE4C 8003BE4C 21083000 */  addu       $at, $at, $s0
    /* 2BE50 8003BE50 D1FE2290 */  lbu        $v0, %lo(towner + 0x51)($at)
    /* 2BE54 8003BE54 00000000 */  nop
    /* 2BE58 8003BE58 21004014 */  bnez       $v0, .L8003BEE0
    /* 2BE5C 8003BE5C 03000224 */   addiu     $v0, $zero, 0x3
    /* 2BE60 8003BE60 1800A58F */  lw         $a1, 0x18($sp)
    /* 2BE64 8003BE64 0E80013C */  lui        $at, %hi(quests + 0x8E)
    /* 2BE68 8003BE68 CEDA22A0 */  sb         $v0, %lo(quests + 0x8E)($at)
    /* 2BE6C 8003BE6C 0E80013C */  lui        $at, %hi(quests + 0x9B)
    /* 2BE70 8003BE70 DBDA22A0 */  sb         $v0, %lo(quests + 0x9B)($at)
    /* 2BE74 8003BE74 BF75050C */  jal        func_8015D6FC
    /* 2BE78 8003BE78 21204002 */   addu      $a0, $s2, $zero
    /* 2BE7C 8003BE7C 05000424 */  addiu      $a0, $zero, 0x5
    /* 2BE80 8003BE80 0D80013C */  lui        $at, %hi(towner + 0xC)
    /* 2BE84 8003BE84 21083000 */  addu       $at, $at, $s0
    /* 2BE88 8003BE88 8CFE268C */  lw         $a2, %lo(towner + 0xC)($at)
    /* 2BE8C 8003BE8C 0D80013C */  lui        $at, %hi(towner + 0x8)
    /* 2BE90 8003BE90 21083000 */  addu       $at, $at, $s0
    /* 2BE94 8003BE94 88FE258C */  lw         $a1, %lo(towner + 0x8)($at)
    /* 2BE98 8003BE98 8812010C */  jal        CreateItem__Fiii
    /* 2BE9C 8003BE9C 0100C624 */   addiu     $a2, $a2, 0x1
    /* 2BEA0 8003BEA0 96000224 */  addiu      $v0, $zero, 0x96
    /* 2BEA4 8003BEA4 0D80013C */  lui        $at, %hi(towner + 0x4C)
    /* 2BEA8 8003BEA8 21083000 */  addu       $at, $at, $s0
    /* 2BEAC 8003BEAC CCFE22AC */  sw         $v0, %lo(towner + 0x4C)($at)
    /* 2BEB0 8003BEB0 0D80013C */  lui        $at, %hi(towner + 0x88)
    /* 2BEB4 8003BEB4 21083000 */  addu       $at, $at, $s0
    /* 2BEB8 8003BEB8 08FF32AC */  sw         $s2, %lo(towner + 0x88)($at)
    /* 2BEBC 8003BEBC 1E37010C */  jal        InitQTextMsg__Fi
    /* 2BEC0 8003BEC0 0D000424 */   addiu     $a0, $zero, 0xD
    /* 2BEC4 8003BEC4 01000424 */  addiu      $a0, $zero, 0x1
    /* 2BEC8 8003BEC8 01000224 */  addiu      $v0, $zero, 0x1
    /* 2BECC 8003BECC 0D80013C */  lui        $at, %hi(towner + 0x51)
    /* 2BED0 8003BED0 21083000 */  addu       $at, $at, $s0
    /* 2BED4 8003BED4 D1FE22A0 */  sb         $v0, %lo(towner + 0x51)($at)
    /* 2BED8 8003BED8 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 2BEDC 8003BEDC 07000524 */   addiu     $a1, $zero, 0x7
  .L8003BEE0:
    /* 2BEE0 8003BEE0 1280023C */  lui        $v0, %hi(qtextflag)
    /* 2BEE4 8003BEE4 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 2BEE8 8003BEE8 00000000 */  nop
    /* 2BEEC 8003BEEC 08044014 */  bnez       $v0, .L8003CF10
    /* 2BEF0 8003BEF0 A0000424 */   addiu     $a0, $zero, 0xA0
    /* 2BEF4 8003BEF4 56EE000C */  jal        TownerTalk__Fii
    /* 2BEF8 8003BEF8 21286002 */   addu      $a1, $s3, $zero
    /* 2BEFC 8003BEFC A0108293 */  lbu        $v0, %gp_rel(storeflag)($gp)
    /* 2BF00 8003BF00 00000000 */  nop
    /* 2BF04 8003BF04 02044010 */  beqz       $v0, .L8003CF10
    /* 2BF08 8003BF08 00000000 */   nop
    /* 2BF0C 8003BF0C 5BBE010C */  jal        StartStore__Fc
    /* 2BF10 8003BF10 15000424 */   addiu     $a0, $zero, 0x15
    /* 2BF14 8003BF14 C4F30008 */  j          .L8003CF10
    /* 2BF18 8003BF18 00000000 */   nop
  .L8003BF1C:
    /* 2BF1C 8003BF1C E2E7000C */  jal        GetActiveTowner__Fi
    /* 2BF20 8003BF20 02000424 */   addiu     $a0, $zero, 0x2
    /* 2BF24 8003BF24 AC006216 */  bne        $s3, $v0, .L8003C1D8
    /* 2BF28 8003BF28 02000224 */   addiu     $v0, $zero, 0x2
    /* 2BF2C 8003BF2C 0E80033C */  lui        $v1, %hi(quests + 0x7A)
    /* 2BF30 8003BF30 BADA6390 */  lbu        $v1, %lo(quests + 0x7A)($v1)
    /* 2BF34 8003BF34 00000000 */  nop
    /* 2BF38 8003BF38 58006214 */  bne        $v1, $v0, .L8003C09C
    /* 2BF3C 8003BF3C 03000224 */   addiu     $v0, $zero, 0x3
    /* 2BF40 8003BF40 0E80033C */  lui        $v1, %hi(quests + 0x87)
    /* 2BF44 8003BF44 C7DA6390 */  lbu        $v1, %lo(quests + 0x87)($v1)
    /* 2BF48 8003BF48 01000224 */  addiu      $v0, $zero, 0x1
    /* 2BF4C 8003BF4C 51006214 */  bne        $v1, $v0, .L8003C094
    /* 2BF50 8003BF50 03000224 */   addiu     $v0, $zero, 0x3
    /* 2BF54 8003BF54 96000224 */  addiu      $v0, $zero, 0x96
    /* 2BF58 8003BF58 0D80013C */  lui        $at, %hi(towner + 0x4C)
    /* 2BF5C 8003BF5C 21083100 */  addu       $at, $at, $s1
    /* 2BF60 8003BF60 CCFE22AC */  sw         $v0, %lo(towner + 0x4C)($at)
    /* 2BF64 8003BF64 01000224 */  addiu      $v0, $zero, 0x1
    /* 2BF68 8003BF68 0D80013C */  lui        $at, %hi(towner + 0x88)
    /* 2BF6C 8003BF6C 21083100 */  addu       $at, $at, $s1
    /* 2BF70 8003BF70 08FF32AC */  sw         $s2, %lo(towner + 0x88)($at)
    /* 2BF74 8003BF74 0E80013C */  lui        $at, %hi(quests + 0x87)
    /* 2BF78 8003BF78 C7DA22A0 */  sb         $v0, %lo(quests + 0x87)($at)
    /* 2BF7C 8003BF7C 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 2BF80 8003BF80 21083400 */  addu       $at, $at, $s4
    /* 2BF84 8003BF84 2EA62280 */  lb         $v0, %lo(plr + 0xF6)($at)
    /* 2BF88 8003BF88 00000000 */  nop
    /* 2BF8C 8003BF8C 08004014 */  bnez       $v0, .L8003BFB0
    /* 2BF90 8003BF90 40101200 */   sll       $v0, $s2, 1
    /* 2BF94 8003BF94 CDF3000C */  jal        effect_is_playing__Fi
    /* 2BF98 8003BF98 D3020424 */   addiu     $a0, $zero, 0x2D3
    /* 2BF9C 8003BF9C FF004230 */  andi       $v0, $v0, 0xFF
    /* 2BFA0 8003BFA0 03004014 */  bnez       $v0, .L8003BFB0
    /* 2BFA4 8003BFA4 40101200 */   sll       $v0, $s2, 1
    /* 2BFA8 8003BFA8 15F00008 */  j          .L8003C054
    /* 2BFAC 8003BFAC D3020424 */   addiu     $a0, $zero, 0x2D3
  .L8003BFB0:
    /* 2BFB0 8003BFB0 21105200 */  addu       $v0, $v0, $s2
    /* 2BFB4 8003BFB4 80100200 */  sll        $v0, $v0, 2
    /* 2BFB8 8003BFB8 21105200 */  addu       $v0, $v0, $s2
    /* 2BFBC 8003BFBC 00110200 */  sll        $v0, $v0, 4
    /* 2BFC0 8003BFC0 23105200 */  subu       $v0, $v0, $s2
    /* 2BFC4 8003BFC4 80100200 */  sll        $v0, $v0, 2
    /* 2BFC8 8003BFC8 21105200 */  addu       $v0, $v0, $s2
    /* 2BFCC 8003BFCC C0100200 */  sll        $v0, $v0, 3
    /* 2BFD0 8003BFD0 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 2BFD4 8003BFD4 21082200 */  addu       $at, $at, $v0
    /* 2BFD8 8003BFD8 2EA62380 */  lb         $v1, %lo(plr + 0xF6)($at)
    /* 2BFDC 8003BFDC 01000224 */  addiu      $v0, $zero, 0x1
    /* 2BFE0 8003BFE0 08006214 */  bne        $v1, $v0, .L8003C004
    /* 2BFE4 8003BFE4 40101200 */   sll       $v0, $s2, 1
    /* 2BFE8 8003BFE8 CDF3000C */  jal        effect_is_playing__Fi
    /* 2BFEC 8003BFEC 6B020424 */   addiu     $a0, $zero, 0x26B
    /* 2BFF0 8003BFF0 FF004230 */  andi       $v0, $v0, 0xFF
    /* 2BFF4 8003BFF4 03004014 */  bnez       $v0, .L8003C004
    /* 2BFF8 8003BFF8 40101200 */   sll       $v0, $s2, 1
    /* 2BFFC 8003BFFC 15F00008 */  j          .L8003C054
    /* 2C000 8003C000 6B020424 */   addiu     $a0, $zero, 0x26B
  .L8003C004:
    /* 2C004 8003C004 21105200 */  addu       $v0, $v0, $s2
    /* 2C008 8003C008 80100200 */  sll        $v0, $v0, 2
    /* 2C00C 8003C00C 21105200 */  addu       $v0, $v0, $s2
    /* 2C010 8003C010 00110200 */  sll        $v0, $v0, 4
    /* 2C014 8003C014 23105200 */  subu       $v0, $v0, $s2
    /* 2C018 8003C018 80100200 */  sll        $v0, $v0, 2
    /* 2C01C 8003C01C 21105200 */  addu       $v0, $v0, $s2
    /* 2C020 8003C020 C0100200 */  sll        $v0, $v0, 3
    /* 2C024 8003C024 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 2C028 8003C028 21082200 */  addu       $at, $at, $v0
    /* 2C02C 8003C02C 2EA62380 */  lb         $v1, %lo(plr + 0xF6)($at)
    /* 2C030 8003C030 02000224 */  addiu      $v0, $zero, 0x2
    /* 2C034 8003C034 0A006214 */  bne        $v1, $v0, .L8003C060
    /* 2C038 8003C038 40101300 */   sll       $v0, $s3, 1
    /* 2C03C 8003C03C CDF3000C */  jal        effect_is_playing__Fi
    /* 2C040 8003C040 03020424 */   addiu     $a0, $zero, 0x203
    /* 2C044 8003C044 FF004230 */  andi       $v0, $v0, 0xFF
    /* 2C048 8003C048 05004014 */  bnez       $v0, .L8003C060
    /* 2C04C 8003C04C 40101300 */   sll       $v0, $s3, 1
    /* 2C050 8003C050 03020424 */  addiu      $a0, $zero, 0x203
  .L8003C054:
    /* 2C054 8003C054 C6F5000C */  jal        PlaySFX__Fi
    /* 2C058 8003C058 00000000 */   nop
    /* 2C05C 8003C05C 40101300 */  sll        $v0, $s3, 1
  .L8003C060:
    /* 2C060 8003C060 21105300 */  addu       $v0, $v0, $s3
    /* 2C064 8003C064 00110200 */  sll        $v0, $v0, 4
    /* 2C068 8003C068 21105300 */  addu       $v0, $v0, $s3
    /* 2C06C 8003C06C 80100200 */  sll        $v0, $v0, 2
    /* 2C070 8003C070 01000324 */  addiu      $v1, $zero, 0x1
    /* 2C074 8003C074 0D80013C */  lui        $at, %hi(towner + 0x51)
    /* 2C078 8003C078 21082200 */  addu       $at, $at, $v0
    /* 2C07C 8003C07C D1FE23A0 */  sb         $v1, %lo(towner + 0x51)($at)
    /* 2C080 8003C080 01000424 */  addiu      $a0, $zero, 0x1
    /* 2C084 8003C084 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 2C088 8003C088 06000524 */   addiu     $a1, $zero, 0x6
    /* 2C08C 8003C08C C4F30008 */  j          .L8003CF10
    /* 2C090 8003C090 00000000 */   nop
  .L8003C094:
    /* 2C094 8003C094 0E80033C */  lui        $v1, %hi(quests + 0x7A)
    /* 2C098 8003C098 BADA6390 */  lbu        $v1, %lo(quests + 0x7A)($v1)
  .L8003C09C:
    /* 2C09C 8003C09C 00000000 */  nop
    /* 2C0A0 8003C0A0 1C006214 */  bne        $v1, $v0, .L8003C114
    /* 2C0A4 8003C0A4 01000224 */   addiu     $v0, $zero, 0x1
    /* 2C0A8 8003C0A8 0E80033C */  lui        $v1, %hi(quests + 0x87)
    /* 2C0AC 8003C0AC C7DA6390 */  lbu        $v1, %lo(quests + 0x87)($v1)
    /* 2C0B0 8003C0B0 00000000 */  nop
    /* 2C0B4 8003C0B4 17006214 */  bne        $v1, $v0, .L8003C114
    /* 2C0B8 8003C0B8 01000424 */   addiu     $a0, $zero, 0x1
    /* 2C0BC 8003C0BC 01000224 */  addiu      $v0, $zero, 0x1
    /* 2C0C0 8003C0C0 40181300 */  sll        $v1, $s3, 1
    /* 2C0C4 8003C0C4 21187300 */  addu       $v1, $v1, $s3
    /* 2C0C8 8003C0C8 00190300 */  sll        $v1, $v1, 4
    /* 2C0CC 8003C0CC 21187300 */  addu       $v1, $v1, $s3
    /* 2C0D0 8003C0D0 80180300 */  sll        $v1, $v1, 2
    /* 2C0D4 8003C0D4 96000624 */  addiu      $a2, $zero, 0x96
    /* 2C0D8 8003C0D8 0E80013C */  lui        $at, %hi(quests + 0x87)
    /* 2C0DC 8003C0DC C7DA22A0 */  sb         $v0, %lo(quests + 0x87)($at)
    /* 2C0E0 8003C0E0 0D80013C */  lui        $at, %hi(towner + 0x4C)
    /* 2C0E4 8003C0E4 21082300 */  addu       $at, $at, $v1
    /* 2C0E8 8003C0E8 CCFE26AC */  sw         $a2, %lo(towner + 0x4C)($at)
    /* 2C0EC 8003C0EC 0D80013C */  lui        $at, %hi(towner + 0x88)
    /* 2C0F0 8003C0F0 21082300 */  addu       $at, $at, $v1
    /* 2C0F4 8003C0F4 08FF32AC */  sw         $s2, %lo(towner + 0x88)($at)
    /* 2C0F8 8003C0F8 0D80013C */  lui        $at, %hi(towner + 0x51)
    /* 2C0FC 8003C0FC 21082300 */  addu       $at, $at, $v1
    /* 2C100 8003C100 D1FE22A0 */  sb         $v0, %lo(towner + 0x51)($at)
    /* 2C104 8003C104 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 2C108 8003C108 06000524 */   addiu     $a1, $zero, 0x6
    /* 2C10C 8003C10C C4F30008 */  j          .L8003CF10
    /* 2C110 8003C110 00000000 */   nop
  .L8003C114:
    /* 2C114 8003C114 0E80053C */  lui        $a1, %hi(quests + 0x7A)
    /* 2C118 8003C118 BADAA524 */  addiu      $a1, $a1, %lo(quests + 0x7A)
    /* 2C11C 8003C11C 0000A390 */  lbu        $v1, 0x0($a1)
    /* 2C120 8003C120 01000224 */  addiu      $v0, $zero, 0x1
    /* 2C124 8003C124 08006210 */  beq        $v1, $v0, .L8003C148
    /* 2C128 8003C128 02000224 */   addiu     $v0, $zero, 0x2
    /* 2C12C 8003C12C 78036214 */  bne        $v1, $v0, .L8003CF10
    /* 2C130 8003C130 00000000 */   nop
    /* 2C134 8003C134 0E80023C */  lui        $v0, %hi(quests + 0x87)
    /* 2C138 8003C138 C7DA4290 */  lbu        $v0, %lo(quests + 0x87)($v0)
    /* 2C13C 8003C13C 00000000 */  nop
    /* 2C140 8003C140 73034014 */  bnez       $v0, .L8003CF10
    /* 2C144 8003C144 00000000 */   nop
  .L8003C148:
    /* 2C148 8003C148 02000224 */  addiu      $v0, $zero, 0x2
    /* 2C14C 8003C14C 01001124 */  addiu      $s1, $zero, 0x1
    /* 2C150 8003C150 0000A2A0 */  sb         $v0, 0x0($a1)
    /* 2C154 8003C154 3F000224 */  addiu      $v0, $zero, 0x3F
    /* 2C158 8003C158 40801300 */  sll        $s0, $s3, 1
    /* 2C15C 8003C15C 21801302 */  addu       $s0, $s0, $s3
    /* 2C160 8003C160 00811000 */  sll        $s0, $s0, 4
    /* 2C164 8003C164 21801302 */  addu       $s0, $s0, $s3
    /* 2C168 8003C168 80801000 */  sll        $s0, $s0, 2
    /* 2C16C 8003C16C 0E80013C */  lui        $at, %hi(quests + 0x86)
    /* 2C170 8003C170 C6DA22A0 */  sb         $v0, %lo(quests + 0x86)($at)
    /* 2C174 8003C174 32000224 */  addiu      $v0, $zero, 0x32
    /* 2C178 8003C178 0E80013C */  lui        $at, %hi(quests + 0x89)
    /* 2C17C 8003C17C C9DA31A0 */  sb         $s1, %lo(quests + 0x89)($at)
    /* 2C180 8003C180 0E80013C */  lui        $at, %hi(quests + 0x87)
    /* 2C184 8003C184 C7DA31A0 */  sb         $s1, %lo(quests + 0x87)($at)
    /* 2C188 8003C188 0D80013C */  lui        $at, %hi(towner + 0x4C)
    /* 2C18C 8003C18C 21083000 */  addu       $at, $at, $s0
    /* 2C190 8003C190 CCFE22AC */  sw         $v0, %lo(towner + 0x4C)($at)
    /* 2C194 8003C194 03000224 */  addiu      $v0, $zero, 0x3
    /* 2C198 8003C198 0D80013C */  lui        $at, %hi(towner + 0x88)
    /* 2C19C 8003C19C 21083000 */  addu       $at, $at, $s0
    /* 2C1A0 8003C1A0 08FF32AC */  sw         $s2, %lo(towner + 0x88)($at)
    /* 2C1A4 8003C1A4 0D80013C */  lui        $at, %hi(towner + 0x8C)
    /* 2C1A8 8003C1A8 21083000 */  addu       $at, $at, $s0
    /* 2C1AC 8003C1AC 0CFF22AC */  sw         $v0, %lo(towner + 0x8C)($at)
    /* 2C1B0 8003C1B0 1E37010C */  jal        InitQTextMsg__Fi
    /* 2C1B4 8003C1B4 3F000424 */   addiu     $a0, $zero, 0x3F
    /* 2C1B8 8003C1B8 01000424 */  addiu      $a0, $zero, 0x1
    /* 2C1BC 8003C1BC 0D80013C */  lui        $at, %hi(towner + 0x51)
    /* 2C1C0 8003C1C0 21083000 */  addu       $at, $at, $s0
    /* 2C1C4 8003C1C4 D1FE31A0 */  sb         $s1, %lo(towner + 0x51)($at)
    /* 2C1C8 8003C1C8 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 2C1CC 8003C1CC 06000524 */   addiu     $a1, $zero, 0x6
    /* 2C1D0 8003C1D0 C4F30008 */  j          .L8003CF10
    /* 2C1D4 8003C1D4 00000000 */   nop
  .L8003C1D8:
    /* 2C1D8 8003C1D8 E2E7000C */  jal        GetActiveTowner__Fi
    /* 2C1DC 8003C1DC 21200000 */   addu      $a0, $zero, $zero
    /* 2C1E0 8003C1E0 FD006216 */  bne        $s3, $v0, .L8003C5D8
    /* 2C1E4 8003C1E4 01000224 */   addiu     $v0, $zero, 0x1
    /* 2C1E8 8003C1E8 1280043C */  lui        $a0, %hi(gbMaxPlayers)
    /* 2C1EC 8003C1EC A2B98490 */  lbu        $a0, %lo(gbMaxPlayers)($a0)
    /* 2C1F0 8003C1F0 00000000 */  nop
    /* 2C1F4 8003C1F4 E9008214 */  bne        $a0, $v0, .L8003C59C
    /* 2C1F8 8003C1F8 00000000 */   nop
    /* 2C1FC 8003C1FC 0E80013C */  lui        $at, %hi(plr + 0x16A)
    /* 2C200 8003C200 21083400 */  addu       $at, $at, $s4
    /* 2C204 8003C204 A2A62290 */  lbu        $v0, %lo(plr + 0x16A)($at)
    /* 2C208 8003C208 00000000 */  nop
    /* 2C20C 8003C20C 5E004010 */  beqz       $v0, .L8003C388
    /* 2C210 8003C210 00000000 */   nop
    /* 2C214 8003C214 0E80053C */  lui        $a1, %hi(quests + 0x2)
    /* 2C218 8003C218 42DAA524 */  addiu      $a1, $a1, %lo(quests + 0x2)
    /* 2C21C 8003C21C 0000A390 */  lbu        $v1, 0x0($a1)
    /* 2C220 8003C220 00000000 */  nop
    /* 2C224 8003C224 59006010 */  beqz       $v1, .L8003C38C
    /* 2C228 8003C228 40101200 */   sll       $v0, $s2, 1
    /* 2C22C 8003C22C 0E80023C */  lui        $v0, %hi(quests + 0x10)
    /* 2C230 8003C230 50DA4290 */  lbu        $v0, %lo(quests + 0x10)($v0)
    /* 2C234 8003C234 00000000 */  nop
    /* 2C238 8003C238 1A004014 */  bnez       $v0, .L8003C2A4
    /* 2C23C 8003C23C 01001024 */   addiu     $s0, $zero, 0x1
    /* 2C240 8003C240 0E80013C */  lui        $at, %hi(quests + 0x10)
    /* 2C244 8003C244 50DA30A0 */  sb         $s0, %lo(quests + 0x10)($at)
    /* 2C248 8003C248 0E80013C */  lui        $at, %hi(quests + 0x11)
    /* 2C24C 8003C24C 51DA30A0 */  sb         $s0, %lo(quests + 0x11)($at)
    /* 2C250 8003C250 06006414 */  bne        $v1, $a0, .L8003C26C
    /* 2C254 8003C254 96000224 */   addiu     $v0, $zero, 0x96
    /* 2C258 8003C258 02000224 */  addiu      $v0, $zero, 0x2
    /* 2C25C 8003C25C 0000A2A0 */  sb         $v0, 0x0($a1)
    /* 2C260 8003C260 0E80013C */  lui        $at, %hi(quests + 0xF)
    /* 2C264 8003C264 4FDA30A0 */  sb         $s0, %lo(quests + 0xF)($at)
    /* 2C268 8003C268 96000224 */  addiu      $v0, $zero, 0x96
  .L8003C26C:
    /* 2C26C 8003C26C 0D80013C */  lui        $at, %hi(towner + 0x4C)
    /* 2C270 8003C270 21083100 */  addu       $at, $at, $s1
    /* 2C274 8003C274 CCFE22AC */  sw         $v0, %lo(towner + 0x4C)($at)
    /* 2C278 8003C278 0D80013C */  lui        $at, %hi(towner + 0x88)
    /* 2C27C 8003C27C 21083100 */  addu       $at, $at, $s1
    /* 2C280 8003C280 08FF32AC */  sw         $s2, %lo(towner + 0x88)($at)
    /* 2C284 8003C284 1E37010C */  jal        InitQTextMsg__Fi
    /* 2C288 8003C288 73000424 */   addiu     $a0, $zero, 0x73
    /* 2C28C 8003C28C 01000424 */  addiu      $a0, $zero, 0x1
    /* 2C290 8003C290 0D80013C */  lui        $at, %hi(towner + 0x51)
    /* 2C294 8003C294 21083100 */  addu       $at, $at, $s1
    /* 2C298 8003C298 D1FE30A0 */  sb         $s0, %lo(towner + 0x51)($at)
    /* 2C29C 8003C29C 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 2C2A0 8003C2A0 21280000 */   addu      $a1, $zero, $zero
  .L8003C2A4:
    /* 2C2A4 8003C2A4 0E80113C */  lui        $s1, %hi(quests + 0x10)
    /* 2C2A8 8003C2A8 50DA3126 */  addiu      $s1, $s1, %lo(quests + 0x10)
    /* 2C2AC 8003C2AC 00002392 */  lbu        $v1, 0x0($s1)
    /* 2C2B0 8003C2B0 01000224 */  addiu      $v0, $zero, 0x1
    /* 2C2B4 8003C2B4 35006214 */  bne        $v1, $v0, .L8003C38C
    /* 2C2B8 8003C2B8 40101200 */   sll       $v0, $s2, 1
    /* 2C2BC 8003C2BC 21204002 */  addu       $a0, $s2, $zero
    /* 2C2C0 8003C2C0 09000524 */  addiu      $a1, $zero, 0x9
    /* 2C2C4 8003C2C4 DAED000C */  jal        PlrHasItem__FiiRi
    /* 2C2C8 8003C2C8 1800A627 */   addiu     $a2, $sp, 0x18
    /* 2C2CC 8003C2CC 2E004010 */  beqz       $v0, .L8003C388
    /* 2C2D0 8003C2D0 40101300 */   sll       $v0, $s3, 1
    /* 2C2D4 8003C2D4 21105300 */  addu       $v0, $v0, $s3
    /* 2C2D8 8003C2D8 00110200 */  sll        $v0, $v0, 4
    /* 2C2DC 8003C2DC 21105300 */  addu       $v0, $v0, $s3
    /* 2C2E0 8003C2E0 80800200 */  sll        $s0, $v0, 2
    /* 2C2E4 8003C2E4 0D80013C */  lui        $at, %hi(towner + 0x51)
    /* 2C2E8 8003C2E8 21083000 */  addu       $at, $at, $s0
    /* 2C2EC 8003C2EC D1FE2290 */  lbu        $v0, %lo(towner + 0x51)($at)
    /* 2C2F0 8003C2F0 00000000 */  nop
    /* 2C2F4 8003C2F4 25004014 */  bnez       $v0, .L8003C38C
    /* 2C2F8 8003C2F8 40101200 */   sll       $v0, $s2, 1
    /* 2C2FC 8003C2FC 1800A58F */  lw         $a1, 0x18($sp)
    /* 2C300 8003C300 03000224 */  addiu      $v0, $zero, 0x3
    /* 2C304 8003C304 0E80013C */  lui        $at, %hi(quests + 0x2)
    /* 2C308 8003C308 42DA22A0 */  sb         $v0, %lo(quests + 0x2)($at)
    /* 2C30C 8003C30C 02000224 */  addiu      $v0, $zero, 0x2
    /* 2C310 8003C310 000022A2 */  sb         $v0, 0x0($s1)
    /* 2C314 8003C314 0E80013C */  lui        $at, %hi(quests + 0xF)
    /* 2C318 8003C318 4FDA22A0 */  sb         $v0, %lo(quests + 0xF)($at)
    /* 2C31C 8003C31C BF75050C */  jal        func_8015D6FC
    /* 2C320 8003C320 21204002 */   addu      $a0, $s2, $zero
    /* 2C324 8003C324 02000424 */  addiu      $a0, $zero, 0x2
    /* 2C328 8003C328 0D80013C */  lui        $at, %hi(towner + 0xC)
    /* 2C32C 8003C32C 21083000 */  addu       $at, $at, $s0
    /* 2C330 8003C330 8CFE268C */  lw         $a2, %lo(towner + 0xC)($at)
    /* 2C334 8003C334 0D80013C */  lui        $at, %hi(towner + 0x8)
    /* 2C338 8003C338 21083000 */  addu       $at, $at, $s0
    /* 2C33C 8003C33C 88FE258C */  lw         $a1, %lo(towner + 0x8)($at)
    /* 2C340 8003C340 8812010C */  jal        CreateItem__Fiii
    /* 2C344 8003C344 0100C624 */   addiu     $a2, $a2, 0x1
    /* 2C348 8003C348 96000224 */  addiu      $v0, $zero, 0x96
    /* 2C34C 8003C34C 0D80013C */  lui        $at, %hi(towner + 0x4C)
    /* 2C350 8003C350 21083000 */  addu       $at, $at, $s0
    /* 2C354 8003C354 CCFE22AC */  sw         $v0, %lo(towner + 0x4C)($at)
    /* 2C358 8003C358 0D80013C */  lui        $at, %hi(towner + 0x88)
    /* 2C35C 8003C35C 21083000 */  addu       $at, $at, $s0
    /* 2C360 8003C360 08FF32AC */  sw         $s2, %lo(towner + 0x88)($at)
    /* 2C364 8003C364 1E37010C */  jal        InitQTextMsg__Fi
    /* 2C368 8003C368 75000424 */   addiu     $a0, $zero, 0x75
    /* 2C36C 8003C36C 01000424 */  addiu      $a0, $zero, 0x1
    /* 2C370 8003C370 01000224 */  addiu      $v0, $zero, 0x1
    /* 2C374 8003C374 0D80013C */  lui        $at, %hi(towner + 0x51)
    /* 2C378 8003C378 21083000 */  addu       $at, $at, $s0
    /* 2C37C 8003C37C D1FE22A0 */  sb         $v0, %lo(towner + 0x51)($at)
    /* 2C380 8003C380 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 2C384 8003C384 21280000 */   addu      $a1, $zero, $zero
  .L8003C388:
    /* 2C388 8003C388 40101200 */  sll        $v0, $s2, 1
  .L8003C38C:
    /* 2C38C 8003C38C 21105200 */  addu       $v0, $v0, $s2
    /* 2C390 8003C390 80100200 */  sll        $v0, $v0, 2
    /* 2C394 8003C394 21105200 */  addu       $v0, $v0, $s2
    /* 2C398 8003C398 00110200 */  sll        $v0, $v0, 4
    /* 2C39C 8003C39C 23105200 */  subu       $v0, $v0, $s2
    /* 2C3A0 8003C3A0 80100200 */  sll        $v0, $v0, 2
    /* 2C3A4 8003C3A4 21105200 */  addu       $v0, $v0, $s2
    /* 2C3A8 8003C3A8 C0100200 */  sll        $v0, $v0, 3
    /* 2C3AC 8003C3AC 0E80013C */  lui        $at, %hi(plr + 0x16F)
    /* 2C3B0 8003C3B0 21082200 */  addu       $at, $at, $v0
    /* 2C3B4 8003C3B4 A7A62290 */  lbu        $v0, %lo(plr + 0x16F)($at)
    /* 2C3B8 8003C3B8 00000000 */  nop
    /* 2C3BC 8003C3BC 77004010 */  beqz       $v0, .L8003C59C
    /* 2C3C0 8003C3C0 00000000 */   nop
    /* 2C3C4 8003C3C4 0E80063C */  lui        $a2, %hi(quests + 0xCA)
    /* 2C3C8 8003C3C8 0ADBC624 */  addiu      $a2, $a2, %lo(quests + 0xCA)
    /* 2C3CC 8003C3CC 0000C290 */  lbu        $v0, 0x0($a2)
    /* 2C3D0 8003C3D0 00000000 */  nop
    /* 2C3D4 8003C3D4 FF004530 */  andi       $a1, $v0, 0xFF
    /* 2C3D8 8003C3D8 7000A010 */  beqz       $a1, .L8003C59C
    /* 2C3DC 8003C3DC FFFF4224 */   addiu     $v0, $v0, -0x1
    /* 2C3E0 8003C3E0 0200422C */  sltiu      $v0, $v0, 0x2
    /* 2C3E4 8003C3E4 36004010 */  beqz       $v0, .L8003C4C0
    /* 2C3E8 8003C3E8 00000000 */   nop
    /* 2C3EC 8003C3EC 0E80023C */  lui        $v0, %hi(quests + 0xD8)
    /* 2C3F0 8003C3F0 18DB4290 */  lbu        $v0, %lo(quests + 0xD8)($v0)
    /* 2C3F4 8003C3F4 00000000 */  nop
    /* 2C3F8 8003C3F8 31004014 */  bnez       $v0, .L8003C4C0
    /* 2C3FC 8003C3FC 40101300 */   sll       $v0, $s3, 1
    /* 2C400 8003C400 21105300 */  addu       $v0, $v0, $s3
    /* 2C404 8003C404 00110200 */  sll        $v0, $v0, 4
    /* 2C408 8003C408 21105300 */  addu       $v0, $v0, $s3
    /* 2C40C 8003C40C 80800200 */  sll        $s0, $v0, 2
    /* 2C410 8003C410 0D80013C */  lui        $at, %hi(towner + 0x51)
    /* 2C414 8003C414 21083000 */  addu       $at, $at, $s0
    /* 2C418 8003C418 D1FE2290 */  lbu        $v0, %lo(towner + 0x51)($at)
    /* 2C41C 8003C41C 00000000 */  nop
    /* 2C420 8003C420 27004014 */  bnez       $v0, .L8003C4C0
    /* 2C424 8003C424 02000424 */   addiu     $a0, $zero, 0x2
    /* 2C428 8003C428 0E80033C */  lui        $v1, %hi(quests + 0x10)
    /* 2C42C 8003C42C 50DA6390 */  lbu        $v1, %lo(quests + 0x10)($v1)
    /* 2C430 8003C430 00000000 */  nop
    /* 2C434 8003C434 08006410 */  beq        $v1, $a0, .L8003C458
    /* 2C438 8003C438 01001124 */   addiu     $s1, $zero, 0x1
    /* 2C43C 8003C43C 0E80023C */  lui        $v0, %hi(quests + 0x2)
    /* 2C440 8003C440 42DA4290 */  lbu        $v0, %lo(quests + 0x2)($v0)
    /* 2C444 8003C444 00000000 */  nop
    /* 2C448 8003C448 1D004414 */  bne        $v0, $a0, .L8003C4C0
    /* 2C44C 8003C44C 01000224 */   addiu     $v0, $zero, 0x1
    /* 2C450 8003C450 1B006214 */  bne        $v1, $v0, .L8003C4C0
    /* 2C454 8003C454 00000000 */   nop
  .L8003C458:
    /* 2C458 8003C458 01000224 */  addiu      $v0, $zero, 0x1
    /* 2C45C 8003C45C 0E80013C */  lui        $at, %hi(quests + 0xD8)
    /* 2C460 8003C460 18DB31A0 */  sb         $s1, %lo(quests + 0xD8)($at)
    /* 2C464 8003C464 0E80013C */  lui        $at, %hi(quests + 0xD9)
    /* 2C468 8003C468 19DB31A0 */  sb         $s1, %lo(quests + 0xD9)($at)
    /* 2C46C 8003C46C 0600A214 */  bne        $a1, $v0, .L8003C488
    /* 2C470 8003C470 96000224 */   addiu     $v0, $zero, 0x96
    /* 2C474 8003C474 02000224 */  addiu      $v0, $zero, 0x2
    /* 2C478 8003C478 0000C2A0 */  sb         $v0, 0x0($a2)
    /* 2C47C 8003C47C 0E80013C */  lui        $at, %hi(quests + 0xD7)
    /* 2C480 8003C480 17DB31A0 */  sb         $s1, %lo(quests + 0xD7)($at)
    /* 2C484 8003C484 96000224 */  addiu      $v0, $zero, 0x96
  .L8003C488:
    /* 2C488 8003C488 0D80013C */  lui        $at, %hi(towner + 0x4C)
    /* 2C48C 8003C48C 21083000 */  addu       $at, $at, $s0
    /* 2C490 8003C490 CCFE22AC */  sw         $v0, %lo(towner + 0x4C)($at)
    /* 2C494 8003C494 0D80013C */  lui        $at, %hi(towner + 0x88)
    /* 2C498 8003C498 21083000 */  addu       $at, $at, $s0
    /* 2C49C 8003C49C 08FF32AC */  sw         $s2, %lo(towner + 0x88)($at)
    /* 2C4A0 8003C4A0 1E37010C */  jal        InitQTextMsg__Fi
    /* 2C4A4 8003C4A4 58000424 */   addiu     $a0, $zero, 0x58
    /* 2C4A8 8003C4A8 01000424 */  addiu      $a0, $zero, 0x1
    /* 2C4AC 8003C4AC 0D80013C */  lui        $at, %hi(towner + 0x51)
    /* 2C4B0 8003C4B0 21083000 */  addu       $at, $at, $s0
    /* 2C4B4 8003C4B4 D1FE31A0 */  sb         $s1, %lo(towner + 0x51)($at)
    /* 2C4B8 8003C4B8 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 2C4BC 8003C4BC 21280000 */   addu      $a1, $zero, $zero
  .L8003C4C0:
    /* 2C4C0 8003C4C0 0E80113C */  lui        $s1, %hi(quests + 0xD8)
    /* 2C4C4 8003C4C4 18DB3126 */  addiu      $s1, $s1, %lo(quests + 0xD8)
    /* 2C4C8 8003C4C8 00002392 */  lbu        $v1, 0x0($s1)
    /* 2C4CC 8003C4CC 01000224 */  addiu      $v0, $zero, 0x1
    /* 2C4D0 8003C4D0 32006214 */  bne        $v1, $v0, .L8003C59C
    /* 2C4D4 8003C4D4 21204002 */   addu      $a0, $s2, $zero
    /* 2C4D8 8003C4D8 10000524 */  addiu      $a1, $zero, 0x10
    /* 2C4DC 8003C4DC DAED000C */  jal        PlrHasItem__FiiRi
    /* 2C4E0 8003C4E0 1800A627 */   addiu     $a2, $sp, 0x18
    /* 2C4E4 8003C4E4 2D004010 */  beqz       $v0, .L8003C59C
    /* 2C4E8 8003C4E8 40101300 */   sll       $v0, $s3, 1
    /* 2C4EC 8003C4EC 21105300 */  addu       $v0, $v0, $s3
    /* 2C4F0 8003C4F0 00110200 */  sll        $v0, $v0, 4
    /* 2C4F4 8003C4F4 21105300 */  addu       $v0, $v0, $s3
    /* 2C4F8 8003C4F8 80800200 */  sll        $s0, $v0, 2
    /* 2C4FC 8003C4FC 0D80013C */  lui        $at, %hi(towner + 0x51)
    /* 2C500 8003C500 21083000 */  addu       $at, $at, $s0
    /* 2C504 8003C504 D1FE2290 */  lbu        $v0, %lo(towner + 0x51)($at)
    /* 2C508 8003C508 00000000 */  nop
    /* 2C50C 8003C50C 23004014 */  bnez       $v0, .L8003C59C
    /* 2C510 8003C510 03000224 */   addiu     $v0, $zero, 0x3
    /* 2C514 8003C514 1800A58F */  lw         $a1, 0x18($sp)
    /* 2C518 8003C518 0E80013C */  lui        $at, %hi(quests + 0xCA)
    /* 2C51C 8003C51C 0ADB22A0 */  sb         $v0, %lo(quests + 0xCA)($at)
    /* 2C520 8003C520 02000224 */  addiu      $v0, $zero, 0x2
    /* 2C524 8003C524 000022A2 */  sb         $v0, 0x0($s1)
    /* 2C528 8003C528 0E80013C */  lui        $at, %hi(quests + 0xD7)
    /* 2C52C 8003C52C 17DB22A0 */  sb         $v0, %lo(quests + 0xD7)($at)
    /* 2C530 8003C530 BF75050C */  jal        func_8015D6FC
    /* 2C534 8003C534 21204002 */   addu      $a0, $s2, $zero
    /* 2C538 8003C538 08000424 */  addiu      $a0, $zero, 0x8
    /* 2C53C 8003C53C 0D80013C */  lui        $at, %hi(towner + 0xC)
    /* 2C540 8003C540 21083000 */  addu       $at, $at, $s0
    /* 2C544 8003C544 8CFE268C */  lw         $a2, %lo(towner + 0xC)($at)
    /* 2C548 8003C548 0D80013C */  lui        $at, %hi(towner + 0x8)
    /* 2C54C 8003C54C 21083000 */  addu       $at, $at, $s0
    /* 2C550 8003C550 88FE258C */  lw         $a1, %lo(towner + 0x8)($at)
    /* 2C554 8003C554 8812010C */  jal        CreateItem__Fiii
    /* 2C558 8003C558 0100C624 */   addiu     $a2, $a2, 0x1
    /* 2C55C 8003C55C 96000224 */  addiu      $v0, $zero, 0x96
    /* 2C560 8003C560 0D80013C */  lui        $at, %hi(towner + 0x4C)
    /* 2C564 8003C564 21083000 */  addu       $at, $at, $s0
    /* 2C568 8003C568 CCFE22AC */  sw         $v0, %lo(towner + 0x4C)($at)
    /* 2C56C 8003C56C 0D80013C */  lui        $at, %hi(towner + 0x88)
    /* 2C570 8003C570 21083000 */  addu       $at, $at, $s0
    /* 2C574 8003C574 08FF32AC */  sw         $s2, %lo(towner + 0x88)($at)
    /* 2C578 8003C578 1E37010C */  jal        InitQTextMsg__Fi
    /* 2C57C 8003C57C 5A000424 */   addiu     $a0, $zero, 0x5A
    /* 2C580 8003C580 01000424 */  addiu      $a0, $zero, 0x1
    /* 2C584 8003C584 01000224 */  addiu      $v0, $zero, 0x1
    /* 2C588 8003C588 0D80013C */  lui        $at, %hi(towner + 0x51)
    /* 2C58C 8003C58C 21083000 */  addu       $at, $at, $s0
    /* 2C590 8003C590 D1FE22A0 */  sb         $v0, %lo(towner + 0x51)($at)
    /* 2C594 8003C594 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 2C598 8003C598 0A000524 */   addiu     $a1, $zero, 0xA
  .L8003C59C:
    /* 2C59C 8003C59C 1280023C */  lui        $v0, %hi(qtextflag)
    /* 2C5A0 8003C5A0 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 2C5A4 8003C5A4 00000000 */  nop
    /* 2C5A8 8003C5A8 59024014 */  bnez       $v0, .L8003CF10
    /* 2C5AC 8003C5AC BC000424 */   addiu     $a0, $zero, 0xBC
    /* 2C5B0 8003C5B0 56EE000C */  jal        TownerTalk__Fii
    /* 2C5B4 8003C5B4 21286002 */   addu      $a1, $s3, $zero
    /* 2C5B8 8003C5B8 A0108293 */  lbu        $v0, %gp_rel(storeflag)($gp)
    /* 2C5BC 8003C5BC 00000000 */  nop
    /* 2C5C0 8003C5C0 53024010 */  beqz       $v0, .L8003CF10
    /* 2C5C4 8003C5C4 00000000 */   nop
    /* 2C5C8 8003C5C8 5BBE010C */  jal        StartStore__Fc
    /* 2C5CC 8003C5CC 01000424 */   addiu     $a0, $zero, 0x1
    /* 2C5D0 8003C5D0 C4F30008 */  j          .L8003CF10
    /* 2C5D4 8003C5D4 00000000 */   nop
  .L8003C5D8:
    /* 2C5D8 8003C5D8 E2E7000C */  jal        GetActiveTowner__Fi
    /* 2C5DC 8003C5DC 06000424 */   addiu     $a0, $zero, 0x6
    /* 2C5E0 8003C5E0 BC006216 */  bne        $s3, $v0, .L8003C8D4
    /* 2C5E4 8003C5E4 01000224 */   addiu     $v0, $zero, 0x1
    /* 2C5E8 8003C5E8 0E80103C */  lui        $s0, %hi(quests + 0x16)
    /* 2C5EC 8003C5EC 56DA1026 */  addiu      $s0, $s0, %lo(quests + 0x16)
    /* 2C5F0 8003C5F0 00000392 */  lbu        $v1, 0x0($s0)
    /* 2C5F4 8003C5F4 00000000 */  nop
    /* 2C5F8 8003C5F8 1F006214 */  bne        $v1, $v0, .L8003C678
    /* 2C5FC 8003C5FC 21204002 */   addu      $a0, $s2, $zero
    /* 2C600 8003C600 13000524 */  addiu      $a1, $zero, 0x13
    /* 2C604 8003C604 DAED000C */  jal        PlrHasItem__FiiRi
    /* 2C608 8003C608 1800A627 */   addiu     $a2, $sp, 0x18
    /* 2C60C 8003C60C 1A004010 */  beqz       $v0, .L8003C678
    /* 2C610 8003C610 00000000 */   nop
    /* 2C614 8003C614 1800A58F */  lw         $a1, 0x18($sp)
    /* 2C618 8003C618 BF75050C */  jal        func_8015D6FC
    /* 2C61C 8003C61C 21204002 */   addu      $a0, $s2, $zero
    /* 2C620 8003C620 02000224 */  addiu      $v0, $zero, 0x2
    /* 2C624 8003C624 000002A2 */  sb         $v0, 0x0($s0)
    /* 2C628 8003C628 01001024 */  addiu      $s0, $zero, 0x1
    /* 2C62C 8003C62C 0E80013C */  lui        $at, %hi(quests + 0x23)
    /* 2C630 8003C630 63DA22A0 */  sb         $v0, %lo(quests + 0x23)($at)
    /* 2C634 8003C634 96000224 */  addiu      $v0, $zero, 0x96
    /* 2C638 8003C638 0E80013C */  lui        $at, %hi(quests + 0x25)
    /* 2C63C 8003C63C 65DA30A0 */  sb         $s0, %lo(quests + 0x25)($at)
    /* 2C640 8003C640 0D80013C */  lui        $at, %hi(towner + 0x4C)
    /* 2C644 8003C644 21083100 */  addu       $at, $at, $s1
    /* 2C648 8003C648 CCFE22AC */  sw         $v0, %lo(towner + 0x4C)($at)
    /* 2C64C 8003C64C 0D80013C */  lui        $at, %hi(towner + 0x88)
    /* 2C650 8003C650 21083100 */  addu       $at, $at, $s1
    /* 2C654 8003C654 08FF32AC */  sw         $s2, %lo(towner + 0x88)($at)
    /* 2C658 8003C658 1E37010C */  jal        InitQTextMsg__Fi
    /* 2C65C 8003C65C 80000424 */   addiu     $a0, $zero, 0x80
    /* 2C660 8003C660 01000424 */  addiu      $a0, $zero, 0x1
    /* 2C664 8003C664 0D80013C */  lui        $at, %hi(towner + 0x51)
    /* 2C668 8003C668 21083100 */  addu       $at, $at, $s1
    /* 2C66C 8003C66C D1FE30A0 */  sb         $s0, %lo(towner + 0x51)($at)
    /* 2C670 8003C670 24F20008 */  j          .L8003C890
    /* 2C674 8003C674 01000524 */   addiu     $a1, $zero, 0x1
  .L8003C678:
    /* 2C678 8003C678 0E80143C */  lui        $s4, %hi(quests + 0x16)
    /* 2C67C 8003C67C 56DA9426 */  addiu      $s4, $s4, %lo(quests + 0x16)
    /* 2C680 8003C680 00008392 */  lbu        $v1, 0x0($s4)
    /* 2C684 8003C684 02000224 */  addiu      $v0, $zero, 0x2
    /* 2C688 8003C688 83006214 */  bne        $v1, $v0, .L8003C898
    /* 2C68C 8003C68C 00000000 */   nop
    /* 2C690 8003C690 0E80023C */  lui        $v0, %hi(quests + 0x23)
    /* 2C694 8003C694 63DA4290 */  lbu        $v0, %lo(quests + 0x23)($v0)
    /* 2C698 8003C698 00000000 */  nop
    /* 2C69C 8003C69C FEFF4224 */  addiu      $v0, $v0, -0x2
    /* 2C6A0 8003C6A0 0300422C */  sltiu      $v0, $v0, 0x3
    /* 2C6A4 8003C6A4 38004010 */  beqz       $v0, .L8003C788
    /* 2C6A8 8003C6A8 21204002 */   addu      $a0, $s2, $zero
    /* 2C6AC 8003C6AC 11000524 */  addiu      $a1, $zero, 0x11
    /* 2C6B0 8003C6B0 DAED000C */  jal        PlrHasItem__FiiRi
    /* 2C6B4 8003C6B4 1800A627 */   addiu     $a2, $sp, 0x18
    /* 2C6B8 8003C6B8 1E004010 */  beqz       $v0, .L8003C734
    /* 2C6BC 8003C6BC 81000224 */   addiu     $v0, $zero, 0x81
    /* 2C6C0 8003C6C0 1800A58F */  lw         $a1, 0x18($sp)
    /* 2C6C4 8003C6C4 BF75050C */  jal        func_8015D6FC
    /* 2C6C8 8003C6C8 21204002 */   addu      $a0, $s2, $zero
    /* 2C6CC 8003C6CC 05000224 */  addiu      $v0, $zero, 0x5
    /* 2C6D0 8003C6D0 0E80013C */  lui        $at, %hi(quests + 0x23)
    /* 2C6D4 8003C6D4 63DA22A0 */  sb         $v0, %lo(quests + 0x23)($at)
    /* 2C6D8 8003C6D8 7B000224 */  addiu      $v0, $zero, 0x7B
    /* 2C6DC 8003C6DC 0D80013C */  lui        $at, %hi(Qtalklist + 0x44)
    /* 2C6E0 8003C6E0 04FC22AC */  sw         $v0, %lo(Qtalklist + 0x44)($at)
    /* 2C6E4 8003C6E4 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 2C6E8 8003C6E8 40801300 */  sll        $s0, $s3, 1
    /* 2C6EC 8003C6EC 21801302 */  addu       $s0, $s0, $s3
    /* 2C6F0 8003C6F0 00811000 */  sll        $s0, $s0, 4
    /* 2C6F4 8003C6F4 21801302 */  addu       $s0, $s0, $s3
    /* 2C6F8 8003C6F8 80801000 */  sll        $s0, $s0, 2
    /* 2C6FC 8003C6FC 0D80013C */  lui        $at, %hi(Qtalklist + 0x184)
    /* 2C700 8003C700 44FD22AC */  sw         $v0, %lo(Qtalklist + 0x184)($at)
    /* 2C704 8003C704 96000224 */  addiu      $v0, $zero, 0x96
    /* 2C708 8003C708 0D80013C */  lui        $at, %hi(towner + 0x4C)
    /* 2C70C 8003C70C 21083000 */  addu       $at, $at, $s0
    /* 2C710 8003C710 CCFE22AC */  sw         $v0, %lo(towner + 0x4C)($at)
    /* 2C714 8003C714 82000224 */  addiu      $v0, $zero, 0x82
    /* 2C718 8003C718 0D80013C */  lui        $at, %hi(towner + 0x88)
    /* 2C71C 8003C71C 21083000 */  addu       $at, $at, $s0
    /* 2C720 8003C720 08FF32AC */  sw         $s2, %lo(towner + 0x88)($at)
    /* 2C724 8003C724 0E80013C */  lui        $at, %hi(quests + 0x22)
    /* 2C728 8003C728 62DA22A0 */  sb         $v0, %lo(quests + 0x22)($at)
    /* 2C72C 8003C72C 1CF20008 */  j          .L8003C870
    /* 2C730 8003C730 82000424 */   addiu     $a0, $zero, 0x82
  .L8003C734:
    /* 2C734 8003C734 0E80033C */  lui        $v1, %hi(quests + 0x22)
    /* 2C738 8003C738 62DA6390 */  lbu        $v1, %lo(quests + 0x22)($v1)
    /* 2C73C 8003C73C 00000000 */  nop
    /* 2C740 8003C740 55006210 */  beq        $v1, $v0, .L8003C898
    /* 2C744 8003C744 40801300 */   sll       $s0, $s3, 1
    /* 2C748 8003C748 21801302 */  addu       $s0, $s0, $s3
    /* 2C74C 8003C74C 00811000 */  sll        $s0, $s0, 4
    /* 2C750 8003C750 21801302 */  addu       $s0, $s0, $s3
    /* 2C754 8003C754 80801000 */  sll        $s0, $s0, 2
    /* 2C758 8003C758 96000224 */  addiu      $v0, $zero, 0x96
    /* 2C75C 8003C75C 0D80013C */  lui        $at, %hi(towner + 0x4C)
    /* 2C760 8003C760 21083000 */  addu       $at, $at, $s0
    /* 2C764 8003C764 CCFE22AC */  sw         $v0, %lo(towner + 0x4C)($at)
    /* 2C768 8003C768 81000224 */  addiu      $v0, $zero, 0x81
    /* 2C76C 8003C76C 0D80013C */  lui        $at, %hi(towner + 0x88)
    /* 2C770 8003C770 21083000 */  addu       $at, $at, $s0
    /* 2C774 8003C774 08FF32AC */  sw         $s2, %lo(towner + 0x88)($at)
    /* 2C778 8003C778 0E80013C */  lui        $at, %hi(quests + 0x22)
    /* 2C77C 8003C77C 62DA22A0 */  sb         $v0, %lo(quests + 0x22)($at)
    /* 2C780 8003C780 1CF20008 */  j          .L8003C870
    /* 2C784 8003C784 81000424 */   addiu     $a0, $zero, 0x81
  .L8003C788:
    /* 2C788 8003C788 14000524 */  addiu      $a1, $zero, 0x14
    /* 2C78C 8003C78C DAED000C */  jal        PlrHasItem__FiiRi
    /* 2C790 8003C790 1800A627 */   addiu     $a2, $sp, 0x18
    /* 2C794 8003C794 21884000 */  addu       $s1, $v0, $zero
    /* 2C798 8003C798 1B002012 */  beqz       $s1, .L8003C808
    /* 2C79C 8003C79C 40801300 */   sll       $s0, $s3, 1
    /* 2C7A0 8003C7A0 21801302 */  addu       $s0, $s0, $s3
    /* 2C7A4 8003C7A4 00811000 */  sll        $s0, $s0, 4
    /* 2C7A8 8003C7A8 21801302 */  addu       $s0, $s0, $s3
    /* 2C7AC 8003C7AC 80801000 */  sll        $s0, $s0, 2
    /* 2C7B0 8003C7B0 96000224 */  addiu      $v0, $zero, 0x96
    /* 2C7B4 8003C7B4 0D80013C */  lui        $at, %hi(towner + 0x4C)
    /* 2C7B8 8003C7B8 21083000 */  addu       $at, $at, $s0
    /* 2C7BC 8003C7BC CCFE22AC */  sw         $v0, %lo(towner + 0x4C)($at)
    /* 2C7C0 8003C7C0 0D80013C */  lui        $at, %hi(towner + 0x88)
    /* 2C7C4 8003C7C4 21083000 */  addu       $at, $at, $s0
    /* 2C7C8 8003C7C8 08FF32AC */  sw         $s2, %lo(towner + 0x88)($at)
    /* 2C7CC 8003C7CC 1E37010C */  jal        InitQTextMsg__Fi
    /* 2C7D0 8003C7D0 84000424 */   addiu     $a0, $zero, 0x84
    /* 2C7D4 8003C7D4 01000424 */  addiu      $a0, $zero, 0x1
    /* 2C7D8 8003C7D8 03000224 */  addiu      $v0, $zero, 0x3
    /* 2C7DC 8003C7DC 01000324 */  addiu      $v1, $zero, 0x1
    /* 2C7E0 8003C7E0 000082A2 */  sb         $v0, 0x0($s4)
    /* 2C7E4 8003C7E4 0D80013C */  lui        $at, %hi(towner + 0x51)
    /* 2C7E8 8003C7E8 21083000 */  addu       $at, $at, $s0
    /* 2C7EC 8003C7EC D1FE23A0 */  sb         $v1, %lo(towner + 0x51)($at)
    /* 2C7F0 8003C7F0 2E002286 */  lh         $v0, 0x2E($s1)
    /* 2C7F4 8003C7F4 0D80013C */  lui        $at, %hi(AllItemsUseable)
    /* 2C7F8 8003C7F8 21082200 */  addu       $at, $at, $v0
    /* 2C7FC 8003C7FC 401B23A0 */  sb         $v1, %lo(AllItemsUseable)($at)
    /* 2C800 8003C800 24F20008 */  j          .L8003C890
    /* 2C804 8003C804 01000524 */   addiu     $a1, $zero, 0x1
  .L8003C808:
    /* 2C808 8003C808 21204002 */  addu       $a0, $s2, $zero
    /* 2C80C 8003C80C 12000524 */  addiu      $a1, $zero, 0x12
    /* 2C810 8003C810 DAED000C */  jal        PlrHasItem__FiiRi
    /* 2C814 8003C814 1800A627 */   addiu     $a2, $sp, 0x18
    /* 2C818 8003C818 1F004010 */  beqz       $v0, .L8003C898
    /* 2C81C 8003C81C 83000224 */   addiu     $v0, $zero, 0x83
    /* 2C820 8003C820 0E80033C */  lui        $v1, %hi(quests + 0x24)
    /* 2C824 8003C824 64DA6390 */  lbu        $v1, %lo(quests + 0x24)($v1)
    /* 2C828 8003C828 00000000 */  nop
    /* 2C82C 8003C82C 1A006210 */  beq        $v1, $v0, .L8003C898
    /* 2C830 8003C830 83000424 */   addiu     $a0, $zero, 0x83
    /* 2C834 8003C834 40801300 */  sll        $s0, $s3, 1
    /* 2C838 8003C838 21801302 */  addu       $s0, $s0, $s3
    /* 2C83C 8003C83C 00811000 */  sll        $s0, $s0, 4
    /* 2C840 8003C840 21801302 */  addu       $s0, $s0, $s3
    /* 2C844 8003C844 80801000 */  sll        $s0, $s0, 2
    /* 2C848 8003C848 96000224 */  addiu      $v0, $zero, 0x96
    /* 2C84C 8003C84C 0D80013C */  lui        $at, %hi(towner + 0x4C)
    /* 2C850 8003C850 21083000 */  addu       $at, $at, $s0
    /* 2C854 8003C854 CCFE22AC */  sw         $v0, %lo(towner + 0x4C)($at)
    /* 2C858 8003C858 83000224 */  addiu      $v0, $zero, 0x83
    /* 2C85C 8003C85C 0D80013C */  lui        $at, %hi(towner + 0x88)
    /* 2C860 8003C860 21083000 */  addu       $at, $at, $s0
    /* 2C864 8003C864 08FF32AC */  sw         $s2, %lo(towner + 0x88)($at)
    /* 2C868 8003C868 0E80013C */  lui        $at, %hi(quests + 0x24)
    /* 2C86C 8003C86C 64DA22A0 */  sb         $v0, %lo(quests + 0x24)($at)
  .L8003C870:
    /* 2C870 8003C870 1E37010C */  jal        InitQTextMsg__Fi
    /* 2C874 8003C874 00000000 */   nop
    /* 2C878 8003C878 01000424 */  addiu      $a0, $zero, 0x1
    /* 2C87C 8003C87C 01000524 */  addiu      $a1, $zero, 0x1
    /* 2C880 8003C880 01000224 */  addiu      $v0, $zero, 0x1
    /* 2C884 8003C884 0D80013C */  lui        $at, %hi(towner + 0x51)
    /* 2C888 8003C888 21083000 */  addu       $at, $at, $s0
    /* 2C88C 8003C88C D1FE22A0 */  sb         $v0, %lo(towner + 0x51)($at)
  .L8003C890:
    /* 2C890 8003C890 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 2C894 8003C894 00000000 */   nop
  .L8003C898:
    /* 2C898 8003C898 1280023C */  lui        $v0, %hi(qtextflag)
    /* 2C89C 8003C89C 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 2C8A0 8003C8A0 00000000 */  nop
    /* 2C8A4 8003C8A4 9A014014 */  bnez       $v0, .L8003CF10
    /* 2C8A8 8003C8A8 D4000424 */   addiu     $a0, $zero, 0xD4
    /* 2C8AC 8003C8AC 56EE000C */  jal        TownerTalk__Fii
    /* 2C8B0 8003C8B0 21286002 */   addu      $a1, $s3, $zero
    /* 2C8B4 8003C8B4 A0108293 */  lbu        $v0, %gp_rel(storeflag)($gp)
    /* 2C8B8 8003C8B8 00000000 */  nop
    /* 2C8BC 8003C8BC 94014010 */  beqz       $v0, .L8003CF10
    /* 2C8C0 8003C8C0 00000000 */   nop
    /* 2C8C4 8003C8C4 5BBE010C */  jal        StartStore__Fc
    /* 2C8C8 8003C8C8 05000424 */   addiu     $a0, $zero, 0x5
    /* 2C8CC 8003C8CC C4F30008 */  j          .L8003CF10
    /* 2C8D0 8003C8D0 00000000 */   nop
  .L8003C8D4:
    /* 2C8D4 8003C8D4 E2E7000C */  jal        GetActiveTowner__Fi
    /* 2C8D8 8003C8D8 07000424 */   addiu     $a0, $zero, 0x7
    /* 2C8DC 8003C8DC 10006216 */  bne        $s3, $v0, .L8003C920
    /* 2C8E0 8003C8E0 00000000 */   nop
    /* 2C8E4 8003C8E4 1280023C */  lui        $v0, %hi(qtextflag)
    /* 2C8E8 8003C8E8 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 2C8EC 8003C8EC 00000000 */  nop
    /* 2C8F0 8003C8F0 87014014 */  bnez       $v0, .L8003CF10
    /* 2C8F4 8003C8F4 B3000424 */   addiu     $a0, $zero, 0xB3
    /* 2C8F8 8003C8F8 56EE000C */  jal        TownerTalk__Fii
    /* 2C8FC 8003C8FC 21286002 */   addu      $a1, $s3, $zero
    /* 2C900 8003C900 A0108293 */  lbu        $v0, %gp_rel(storeflag)($gp)
    /* 2C904 8003C904 00000000 */  nop
    /* 2C908 8003C908 81014010 */  beqz       $v0, .L8003CF10
    /* 2C90C 8003C90C 00000000 */   nop
    /* 2C910 8003C910 5BBE010C */  jal        StartStore__Fc
    /* 2C914 8003C914 17000424 */   addiu     $a0, $zero, 0x17
    /* 2C918 8003C918 C4F30008 */  j          .L8003CF10
    /* 2C91C 8003C91C 00000000 */   nop
  .L8003C920:
    /* 2C920 8003C920 E2E7000C */  jal        GetActiveTowner__Fi
    /* 2C924 8003C924 05000424 */   addiu     $a0, $zero, 0x5
    /* 2C928 8003C928 10006216 */  bne        $s3, $v0, .L8003C96C
    /* 2C92C 8003C92C 00000000 */   nop
    /* 2C930 8003C930 1280023C */  lui        $v0, %hi(qtextflag)
    /* 2C934 8003C934 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 2C938 8003C938 00000000 */  nop
    /* 2C93C 8003C93C 74014014 */  bnez       $v0, .L8003CF10
    /* 2C940 8003C940 C8000424 */   addiu     $a0, $zero, 0xC8
    /* 2C944 8003C944 56EE000C */  jal        TownerTalk__Fii
    /* 2C948 8003C948 21286002 */   addu      $a1, $s3, $zero
    /* 2C94C 8003C94C A0108293 */  lbu        $v0, %gp_rel(storeflag)($gp)
    /* 2C950 8003C950 00000000 */  nop
    /* 2C954 8003C954 6E014010 */  beqz       $v0, .L8003CF10
    /* 2C958 8003C958 00000000 */   nop
    /* 2C95C 8003C95C 5BBE010C */  jal        StartStore__Fc
    /* 2C960 8003C960 16000424 */   addiu     $a0, $zero, 0x16
    /* 2C964 8003C964 C4F30008 */  j          .L8003CF10
    /* 2C968 8003C968 00000000 */   nop
  .L8003C96C:
    /* 2C96C 8003C96C E2E7000C */  jal        GetActiveTowner__Fi
    /* 2C970 8003C970 01000424 */   addiu     $a0, $zero, 0x1
    /* 2C974 8003C974 98006216 */  bne        $s3, $v0, .L8003CBD8
    /* 2C978 8003C978 01000224 */   addiu     $v0, $zero, 0x1
    /* 2C97C 8003C97C 1280033C */  lui        $v1, %hi(gbMaxPlayers)
    /* 2C980 8003C980 A2B96390 */  lbu        $v1, %lo(gbMaxPlayers)($v1)
    /* 2C984 8003C984 00000000 */  nop
    /* 2C988 8003C988 84006214 */  bne        $v1, $v0, .L8003CB9C
    /* 2C98C 8003C98C 02000224 */   addiu     $v0, $zero, 0x2
    /* 2C990 8003C990 0E80033C */  lui        $v1, %hi(quests + 0x16)
    /* 2C994 8003C994 56DA6390 */  lbu        $v1, %lo(quests + 0x16)($v1)
    /* 2C998 8003C998 00000000 */  nop
    /* 2C99C 8003C99C 25006214 */  bne        $v1, $v0, .L8003CA34
    /* 2C9A0 8003C9A0 40101200 */   sll       $v0, $s2, 1
    /* 2C9A4 8003C9A4 0E80033C */  lui        $v1, %hi(quests + 0x22)
    /* 2C9A8 8003C9A8 62DA6390 */  lbu        $v1, %lo(quests + 0x22)($v1)
    /* 2C9AC 8003C9AC 82000224 */  addiu      $v0, $zero, 0x82
    /* 2C9B0 8003C9B0 20006214 */  bne        $v1, $v0, .L8003CA34
    /* 2C9B4 8003C9B4 40101200 */   sll       $v0, $s2, 1
    /* 2C9B8 8003C9B8 21204002 */  addu       $a0, $s2, $zero
    /* 2C9BC 8003C9BC 12000524 */  addiu      $a1, $zero, 0x12
    /* 2C9C0 8003C9C0 DAED000C */  jal        PlrHasItem__FiiRi
    /* 2C9C4 8003C9C4 1800A627 */   addiu     $a2, $sp, 0x18
    /* 2C9C8 8003C9C8 74004010 */  beqz       $v0, .L8003CB9C
    /* 2C9CC 8003C9CC 00000000 */   nop
    /* 2C9D0 8003C9D0 1800A58F */  lw         $a1, 0x18($sp)
    /* 2C9D4 8003C9D4 BF75050C */  jal        func_8015D6FC
    /* 2C9D8 8003C9D8 21204002 */   addu      $a0, $s2, $zero
    /* 2C9DC 8003C9DC 14000424 */  addiu      $a0, $zero, 0x14
    /* 2C9E0 8003C9E0 0D80013C */  lui        $at, %hi(towner + 0x8)
    /* 2C9E4 8003C9E4 21083100 */  addu       $at, $at, $s1
    /* 2C9E8 8003C9E8 88FE258C */  lw         $a1, %lo(towner + 0x8)($at)
    /* 2C9EC 8003C9EC 0D80013C */  lui        $at, %hi(towner + 0xC)
    /* 2C9F0 8003C9F0 21083100 */  addu       $at, $at, $s1
    /* 2C9F4 8003C9F4 8CFE268C */  lw         $a2, %lo(towner + 0xC)($at)
    /* 2C9F8 8003C9F8 21380000 */  addu       $a3, $zero, $zero
    /* 2C9FC 8003C9FC 1000A0AF */  sw         $zero, 0x10($sp)
    /* 2CA00 8003CA00 8214010C */  jal        SpawnQuestItem__Fiiiii
    /* 2CA04 8003CA04 0100C624 */   addiu     $a2, $a2, 0x1
    /* 2CA08 8003CA08 1E37010C */  jal        InitQTextMsg__Fi
    /* 2CA0C 8003CA0C 7C000424 */   addiu     $a0, $zero, 0x7C
    /* 2CA10 8003CA10 01000424 */  addiu      $a0, $zero, 0x1
    /* 2CA14 8003CA14 07000224 */  addiu      $v0, $zero, 0x7
    /* 2CA18 8003CA18 0E80013C */  lui        $at, %hi(quests + 0x23)
    /* 2CA1C 8003CA1C 63DA22A0 */  sb         $v0, %lo(quests + 0x23)($at)
    /* 2CA20 8003CA20 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 2CA24 8003CA24 0D80013C */  lui        $at, %hi(Qtalklist + 0x44)
    /* 2CA28 8003CA28 04FC22AC */  sw         $v0, %lo(Qtalklist + 0x44)($at)
    /* 2CA2C 8003CA2C E5F20008 */  j          .L8003CB94
    /* 2CA30 8003CA30 01000524 */   addiu     $a1, $zero, 0x1
  .L8003CA34:
    /* 2CA34 8003CA34 21105200 */  addu       $v0, $v0, $s2
    /* 2CA38 8003CA38 80100200 */  sll        $v0, $v0, 2
    /* 2CA3C 8003CA3C 21105200 */  addu       $v0, $v0, $s2
    /* 2CA40 8003CA40 00110200 */  sll        $v0, $v0, 4
    /* 2CA44 8003CA44 23105200 */  subu       $v0, $v0, $s2
    /* 2CA48 8003CA48 80100200 */  sll        $v0, $v0, 2
    /* 2CA4C 8003CA4C 21105200 */  addu       $v0, $v0, $s2
    /* 2CA50 8003CA50 C0100200 */  sll        $v0, $v0, 3
    /* 2CA54 8003CA54 0E80013C */  lui        $at, %hi(plr + 0x167)
    /* 2CA58 8003CA58 21082200 */  addu       $at, $at, $v0
    /* 2CA5C 8003CA5C 9FA62290 */  lbu        $v0, %lo(plr + 0x167)($at)
    /* 2CA60 8003CA60 00000000 */  nop
    /* 2CA64 8003CA64 4D004010 */  beqz       $v0, .L8003CB9C
    /* 2CA68 8003CA68 40101300 */   sll       $v0, $s3, 1
    /* 2CA6C 8003CA6C 21105300 */  addu       $v0, $v0, $s3
    /* 2CA70 8003CA70 00110200 */  sll        $v0, $v0, 4
    /* 2CA74 8003CA74 21105300 */  addu       $v0, $v0, $s3
    /* 2CA78 8003CA78 80880200 */  sll        $s1, $v0, 2
    /* 2CA7C 8003CA7C 0D80013C */  lui        $at, %hi(towner + 0x51)
    /* 2CA80 8003CA80 21083100 */  addu       $at, $at, $s1
    /* 2CA84 8003CA84 D1FE2290 */  lbu        $v0, %lo(towner + 0x51)($at)
    /* 2CA88 8003CA88 00000000 */  nop
    /* 2CA8C 8003CA8C 43004014 */  bnez       $v0, .L8003CB9C
    /* 2CA90 8003CA90 01000224 */   addiu     $v0, $zero, 0x1
    /* 2CA94 8003CA94 0E80053C */  lui        $a1, %hi(quests + 0x106)
    /* 2CA98 8003CA98 46DBA524 */  addiu      $a1, $a1, %lo(quests + 0x106)
    /* 2CA9C 8003CA9C 0000A390 */  lbu        $v1, 0x0($a1)
    /* 2CAA0 8003CAA0 00000000 */  nop
    /* 2CAA4 8003CAA4 1A006214 */  bne        $v1, $v0, .L8003CB10
    /* 2CAA8 8003CAA8 03000224 */   addiu     $v0, $zero, 0x3
    /* 2CAAC 8003CAAC 02000224 */  addiu      $v0, $zero, 0x2
    /* 2CAB0 8003CAB0 01001024 */  addiu      $s0, $zero, 0x1
    /* 2CAB4 8003CAB4 0000A2A0 */  sb         $v0, 0x0($a1)
    /* 2CAB8 8003CAB8 27000224 */  addiu      $v0, $zero, 0x27
    /* 2CABC 8003CABC 0E80013C */  lui        $at, %hi(quests + 0x112)
    /* 2CAC0 8003CAC0 52DB22A0 */  sb         $v0, %lo(quests + 0x112)($at)
    /* 2CAC4 8003CAC4 96000224 */  addiu      $v0, $zero, 0x96
    /* 2CAC8 8003CAC8 0E80013C */  lui        $at, %hi(quests + 0x115)
    /* 2CACC 8003CACC 55DB30A0 */  sb         $s0, %lo(quests + 0x115)($at)
  .L8003CAD0:
    /* 2CAD0 8003CAD0 0E80013C */  lui        $at, %hi(quests + 0x113)
    /* 2CAD4 8003CAD4 53DB30A0 */  sb         $s0, %lo(quests + 0x113)($at)
    /* 2CAD8 8003CAD8 0D80013C */  lui        $at, %hi(towner + 0x4C)
    /* 2CADC 8003CADC 21083100 */  addu       $at, $at, $s1
    /* 2CAE0 8003CAE0 CCFE22AC */  sw         $v0, %lo(towner + 0x4C)($at)
    /* 2CAE4 8003CAE4 0D80013C */  lui        $at, %hi(towner + 0x88)
    /* 2CAE8 8003CAE8 21083100 */  addu       $at, $at, $s1
    /* 2CAEC 8003CAEC 08FF32AC */  sw         $s2, %lo(towner + 0x88)($at)
    /* 2CAF0 8003CAF0 1E37010C */  jal        InitQTextMsg__Fi
    /* 2CAF4 8003CAF4 27000424 */   addiu     $a0, $zero, 0x27
    /* 2CAF8 8003CAF8 01000424 */  addiu      $a0, $zero, 0x1
    /* 2CAFC 8003CAFC 0D80013C */  lui        $at, %hi(towner + 0x51)
    /* 2CB00 8003CB00 21083100 */  addu       $at, $at, $s1
    /* 2CB04 8003CB04 D1FE30A0 */  sb         $s0, %lo(towner + 0x51)($at)
    /* 2CB08 8003CB08 E5F20008 */  j          .L8003CB94
    /* 2CB0C 8003CB0C 0D000524 */   addiu     $a1, $zero, 0xD
  .L8003CB10:
    /* 2CB10 8003CB10 22006214 */  bne        $v1, $v0, .L8003CB9C
    /* 2CB14 8003CB14 02000224 */   addiu     $v0, $zero, 0x2
    /* 2CB18 8003CB18 0E80033C */  lui        $v1, %hi(quests + 0x113)
    /* 2CB1C 8003CB1C 53DB6390 */  lbu        $v1, %lo(quests + 0x113)($v1)
    /* 2CB20 8003CB20 00000000 */  nop
    /* 2CB24 8003CB24 1D006210 */  beq        $v1, $v0, .L8003CB9C
    /* 2CB28 8003CB28 02000224 */   addiu     $v0, $zero, 0x2
    /* 2CB2C 8003CB2C 0E80013C */  lui        $at, %hi(quests + 0x113)
    /* 2CB30 8003CB30 53DB22A0 */  sb         $v0, %lo(quests + 0x113)($at)
    /* 2CB34 8003CB34 96000224 */  addiu      $v0, $zero, 0x96
    /* 2CB38 8003CB38 0D80013C */  lui        $at, %hi(towner + 0x4C)
    /* 2CB3C 8003CB3C 21083100 */  addu       $at, $at, $s1
    /* 2CB40 8003CB40 CCFE22AC */  sw         $v0, %lo(towner + 0x4C)($at)
    /* 2CB44 8003CB44 0D80013C */  lui        $at, %hi(towner + 0x88)
    /* 2CB48 8003CB48 21083100 */  addu       $at, $at, $s1
    /* 2CB4C 8003CB4C 08FF32AC */  sw         $s2, %lo(towner + 0x88)($at)
    /* 2CB50 8003CB50 1E37010C */  jal        InitQTextMsg__Fi
    /* 2CB54 8003CB54 29000424 */   addiu     $a0, $zero, 0x29
    /* 2CB58 8003CB58 04000424 */  addiu      $a0, $zero, 0x4
    /* 2CB5C 8003CB5C 0D80013C */  lui        $at, %hi(towner + 0xC)
    /* 2CB60 8003CB60 21083100 */  addu       $at, $at, $s1
    /* 2CB64 8003CB64 8CFE268C */  lw         $a2, %lo(towner + 0xC)($at)
    /* 2CB68 8003CB68 0D80013C */  lui        $at, %hi(towner + 0x8)
    /* 2CB6C 8003CB6C 21083100 */  addu       $at, $at, $s1
    /* 2CB70 8003CB70 88FE258C */  lw         $a1, %lo(towner + 0x8)($at)
    /* 2CB74 8003CB74 8812010C */  jal        CreateItem__Fiii
    /* 2CB78 8003CB78 0100C624 */   addiu     $a2, $a2, 0x1
    /* 2CB7C 8003CB7C 01000424 */  addiu      $a0, $zero, 0x1
    /* 2CB80 8003CB80 0D000524 */  addiu      $a1, $zero, 0xD
    /* 2CB84 8003CB84 01000224 */  addiu      $v0, $zero, 0x1
    /* 2CB88 8003CB88 0D80013C */  lui        $at, %hi(towner + 0x51)
    /* 2CB8C 8003CB8C 21083100 */  addu       $at, $at, $s1
    /* 2CB90 8003CB90 D1FE22A0 */  sb         $v0, %lo(towner + 0x51)($at)
  .L8003CB94:
    /* 2CB94 8003CB94 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 2CB98 8003CB98 00000000 */   nop
  .L8003CB9C:
    /* 2CB9C 8003CB9C 1280023C */  lui        $v0, %hi(qtextflag)
    /* 2CBA0 8003CBA0 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 2CBA4 8003CBA4 00000000 */  nop
    /* 2CBA8 8003CBA8 D9004014 */  bnez       $v0, .L8003CF10
    /* 2CBAC 8003CBAC A9000424 */   addiu     $a0, $zero, 0xA9
    /* 2CBB0 8003CBB0 56EE000C */  jal        TownerTalk__Fii
    /* 2CBB4 8003CBB4 21286002 */   addu      $a1, $s3, $zero
    /* 2CBB8 8003CBB8 A0108293 */  lbu        $v0, %gp_rel(storeflag)($gp)
    /* 2CBBC 8003CBBC 00000000 */  nop
    /* 2CBC0 8003CBC0 D3004010 */  beqz       $v0, .L8003CF10
    /* 2CBC4 8003CBC4 00000000 */   nop
    /* 2CBC8 8003CBC8 5BBE010C */  jal        StartStore__Fc
    /* 2CBCC 8003CBCC 0E000424 */   addiu     $a0, $zero, 0xE
    /* 2CBD0 8003CBD0 C4F30008 */  j          .L8003CF10
    /* 2CBD4 8003CBD4 00000000 */   nop
  .L8003CBD8:
    /* 2CBD8 8003CBD8 E2E7000C */  jal        GetActiveTowner__Fi
    /* 2CBDC 8003CBDC 08000424 */   addiu     $a0, $zero, 0x8
    /* 2CBE0 8003CBE0 10006216 */  bne        $s3, $v0, .L8003CC24
    /* 2CBE4 8003CBE4 00000000 */   nop
    /* 2CBE8 8003CBE8 1280023C */  lui        $v0, %hi(qtextflag)
    /* 2CBEC 8003CBEC 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 2CBF0 8003CBF0 00000000 */  nop
    /* 2CBF4 8003CBF4 C6004014 */  bnez       $v0, .L8003CF10
    /* 2CBF8 8003CBF8 E0000424 */   addiu     $a0, $zero, 0xE0
    /* 2CBFC 8003CBFC 56EE000C */  jal        TownerTalk__Fii
    /* 2CC00 8003CC00 21286002 */   addu      $a1, $s3, $zero
    /* 2CC04 8003CC04 A0108293 */  lbu        $v0, %gp_rel(storeflag)($gp)
    /* 2CC08 8003CC08 00000000 */  nop
    /* 2CC0C 8003CC0C C0004010 */  beqz       $v0, .L8003CF10
    /* 2CC10 8003CC10 00000000 */   nop
    /* 2CC14 8003CC14 5BBE010C */  jal        StartStore__Fc
    /* 2CC18 8003CC18 0C000424 */   addiu     $a0, $zero, 0xC
    /* 2CC1C 8003CC1C C4F30008 */  j          .L8003CF10
    /* 2CC20 8003CC20 00000000 */   nop
  .L8003CC24:
    /* 2CC24 8003CC24 E2E7000C */  jal        GetActiveTowner__Fi
    /* 2CC28 8003CC28 04000424 */   addiu     $a0, $zero, 0x4
    /* 2CC2C 8003CC2C A7006216 */  bne        $s3, $v0, .L8003CECC
    /* 2CC30 8003CC30 40101300 */   sll       $v0, $s3, 1
    /* 2CC34 8003CC34 1280033C */  lui        $v1, %hi(gbMaxPlayers)
    /* 2CC38 8003CC38 A2B96390 */  lbu        $v1, %lo(gbMaxPlayers)($v1)
    /* 2CC3C 8003CC3C 01000224 */  addiu      $v0, $zero, 0x1
    /* 2CC40 8003CC40 4E006214 */  bne        $v1, $v0, .L8003CD7C
    /* 2CC44 8003CC44 00000000 */   nop
    /* 2CC48 8003CC48 0E80143C */  lui        $s4, %hi(quests + 0x12E)
    /* 2CC4C 8003CC4C 6EDB9426 */  addiu      $s4, $s4, %lo(quests + 0x12E)
    /* 2CC50 8003CC50 00008292 */  lbu        $v0, 0x0($s4)
    /* 2CC54 8003CC54 00000000 */  nop
    /* 2CC58 8003CC58 1F004314 */  bne        $v0, $v1, .L8003CCD8
    /* 2CC5C 8003CC5C 21204002 */   addu      $a0, $s2, $zero
    /* 2CC60 8003CC60 21000524 */  addiu      $a1, $zero, 0x21
    /* 2CC64 8003CC64 DAED000C */  jal        PlrHasItem__FiiRi
    /* 2CC68 8003CC68 1800A627 */   addiu     $a2, $sp, 0x18
    /* 2CC6C 8003CC6C 1A004010 */  beqz       $v0, .L8003CCD8
    /* 2CC70 8003CC70 00000000 */   nop
    /* 2CC74 8003CC74 1800A58F */  lw         $a1, 0x18($sp)
    /* 2CC78 8003CC78 BF75050C */  jal        func_8015D6FC
    /* 2CC7C 8003CC7C 21204002 */   addu      $a0, $s2, $zero
    /* 2CC80 8003CC80 02001024 */  addiu      $s0, $zero, 0x2
    /* 2CC84 8003CC84 96000224 */  addiu      $v0, $zero, 0x96
    /* 2CC88 8003CC88 0E80013C */  lui        $at, %hi(quests + 0x13B)
    /* 2CC8C 8003CC8C 7BDB30A0 */  sb         $s0, %lo(quests + 0x13B)($at)
    /* 2CC90 8003CC90 0D80013C */  lui        $at, %hi(towner + 0x4C)
    /* 2CC94 8003CC94 21083100 */  addu       $at, $at, $s1
    /* 2CC98 8003CC98 CCFE22AC */  sw         $v0, %lo(towner + 0x4C)($at)
    /* 2CC9C 8003CC9C 0D80013C */  lui        $at, %hi(towner + 0x88)
    /* 2CCA0 8003CCA0 21083100 */  addu       $at, $at, $s1
    /* 2CCA4 8003CCA4 08FF32AC */  sw         $s2, %lo(towner + 0x88)($at)
    /* 2CCA8 8003CCA8 1E37010C */  jal        InitQTextMsg__Fi
    /* 2CCAC 8003CCAC 17000424 */   addiu     $a0, $zero, 0x17
    /* 2CCB0 8003CCB0 01000424 */  addiu      $a0, $zero, 0x1
    /* 2CCB4 8003CCB4 01000224 */  addiu      $v0, $zero, 0x1
    /* 2CCB8 8003CCB8 0D80013C */  lui        $at, %hi(towner + 0x51)
    /* 2CCBC 8003CCBC 21083100 */  addu       $at, $at, $s1
    /* 2CCC0 8003CCC0 D1FE22A0 */  sb         $v0, %lo(towner + 0x51)($at)
    /* 2CCC4 8003CCC4 000090A2 */  sb         $s0, 0x0($s4)
    /* 2CCC8 8003CCC8 0E80013C */  lui        $at, %hi(quests + 0x13D)
    /* 2CCCC 8003CCCC 7DDB22A0 */  sb         $v0, %lo(quests + 0x13D)($at)
    /* 2CCD0 8003CCD0 58F30008 */  j          .L8003CD60
    /* 2CCD4 8003CCD4 0F000524 */   addiu     $a1, $zero, 0xF
  .L8003CCD8:
    /* 2CCD8 8003CCD8 0E80033C */  lui        $v1, %hi(quests + 0x12E)
    /* 2CCDC 8003CCDC 6EDB6390 */  lbu        $v1, %lo(quests + 0x12E)($v1)
    /* 2CCE0 8003CCE0 03000224 */  addiu      $v0, $zero, 0x3
    /* 2CCE4 8003CCE4 20006214 */  bne        $v1, $v0, .L8003CD68
    /* 2CCE8 8003CCE8 07000224 */   addiu     $v0, $zero, 0x7
    /* 2CCEC 8003CCEC 0E80033C */  lui        $v1, %hi(quests + 0x13B)
    /* 2CCF0 8003CCF0 7BDB6390 */  lbu        $v1, %lo(quests + 0x13B)($v1)
    /* 2CCF4 8003CCF4 00000000 */  nop
    /* 2CCF8 8003CCF8 1B006214 */  bne        $v1, $v0, .L8003CD68
    /* 2CCFC 8003CCFC 08000224 */   addiu     $v0, $zero, 0x8
    /* 2CD00 8003CD00 40801300 */  sll        $s0, $s3, 1
    /* 2CD04 8003CD04 21801302 */  addu       $s0, $s0, $s3
    /* 2CD08 8003CD08 00811000 */  sll        $s0, $s0, 4
    /* 2CD0C 8003CD0C 21801302 */  addu       $s0, $s0, $s3
    /* 2CD10 8003CD10 80801000 */  sll        $s0, $s0, 2
    /* 2CD14 8003CD14 0E80013C */  lui        $at, %hi(quests + 0x13B)
    /* 2CD18 8003CD18 7BDB22A0 */  sb         $v0, %lo(quests + 0x13B)($at)
    /* 2CD1C 8003CD1C 96000224 */  addiu      $v0, $zero, 0x96
    /* 2CD20 8003CD20 0D80013C */  lui        $at, %hi(towner + 0x4C)
    /* 2CD24 8003CD24 21083000 */  addu       $at, $at, $s0
    /* 2CD28 8003CD28 CCFE22AC */  sw         $v0, %lo(towner + 0x4C)($at)
    /* 2CD2C 8003CD2C 0D80013C */  lui        $at, %hi(towner + 0x88)
    /* 2CD30 8003CD30 21083000 */  addu       $at, $at, $s0
    /* 2CD34 8003CD34 08FF32AC */  sw         $s2, %lo(towner + 0x88)($at)
    /* 2CD38 8003CD38 1E37010C */  jal        InitQTextMsg__Fi
    /* 2CD3C 8003CD3C 19000424 */   addiu     $a0, $zero, 0x19
    /* 2CD40 8003CD40 01000424 */  addiu      $a0, $zero, 0x1
    /* 2CD44 8003CD44 0F000524 */  addiu      $a1, $zero, 0xF
    /* 2CD48 8003CD48 01000224 */  addiu      $v0, $zero, 0x1
    /* 2CD4C 8003CD4C 0D80013C */  lui        $at, %hi(towner + 0x51)
    /* 2CD50 8003CD50 21083000 */  addu       $at, $at, $s0
    /* 2CD54 8003CD54 D1FE22A0 */  sb         $v0, %lo(towner + 0x51)($at)
    /* 2CD58 8003CD58 0E80013C */  lui        $at, %hi(quests + 0x75)
    /* 2CD5C 8003CD5C B5DA22A0 */  sb         $v0, %lo(quests + 0x75)($at)
  .L8003CD60:
    /* 2CD60 8003CD60 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 2CD64 8003CD64 00000000 */   nop
  .L8003CD68:
    /* 2CD68 8003CD68 1280033C */  lui        $v1, %hi(gbMaxPlayers)
    /* 2CD6C 8003CD6C A2B96390 */  lbu        $v1, %lo(gbMaxPlayers)($v1)
    /* 2CD70 8003CD70 01000224 */  addiu      $v0, $zero, 0x1
    /* 2CD74 8003CD74 46006210 */  beq        $v1, $v0, .L8003CE90
    /* 2CD78 8003CD78 00000000 */   nop
  .L8003CD7C:
    /* 2CD7C 8003CD7C 0E80033C */  lui        $v1, %hi(quests + 0x12E)
    /* 2CD80 8003CD80 6EDB6390 */  lbu        $v1, %lo(quests + 0x12E)($v1)
    /* 2CD84 8003CD84 02000224 */  addiu      $v0, $zero, 0x2
    /* 2CD88 8003CD88 1D006214 */  bne        $v1, $v0, .L8003CE00
    /* 2CD8C 8003CD8C 03000224 */   addiu     $v0, $zero, 0x3
    /* 2CD90 8003CD90 0E80023C */  lui        $v0, %hi(quests + 0x13D)
    /* 2CD94 8003CD94 7DDB4290 */  lbu        $v0, %lo(quests + 0x13D)($v0)
    /* 2CD98 8003CD98 00000000 */  nop
    /* 2CD9C 8003CD9C 18004014 */  bnez       $v0, .L8003CE00
    /* 2CDA0 8003CDA0 03000224 */   addiu     $v0, $zero, 0x3
    /* 2CDA4 8003CDA4 40801300 */  sll        $s0, $s3, 1
    /* 2CDA8 8003CDA8 21801302 */  addu       $s0, $s0, $s3
    /* 2CDAC 8003CDAC 00811000 */  sll        $s0, $s0, 4
    /* 2CDB0 8003CDB0 21801302 */  addu       $s0, $s0, $s3
    /* 2CDB4 8003CDB4 80801000 */  sll        $s0, $s0, 2
    /* 2CDB8 8003CDB8 96000224 */  addiu      $v0, $zero, 0x96
    /* 2CDBC 8003CDBC 0D80013C */  lui        $at, %hi(towner + 0x4C)
    /* 2CDC0 8003CDC0 21083000 */  addu       $at, $at, $s0
    /* 2CDC4 8003CDC4 CCFE22AC */  sw         $v0, %lo(towner + 0x4C)($at)
    /* 2CDC8 8003CDC8 0D80013C */  lui        $at, %hi(towner + 0x88)
    /* 2CDCC 8003CDCC 21083000 */  addu       $at, $at, $s0
    /* 2CDD0 8003CDD0 08FF32AC */  sw         $s2, %lo(towner + 0x88)($at)
    /* 2CDD4 8003CDD4 1E37010C */  jal        InitQTextMsg__Fi
    /* 2CDD8 8003CDD8 17000424 */   addiu     $a0, $zero, 0x17
    /* 2CDDC 8003CDDC 01000424 */  addiu      $a0, $zero, 0x1
    /* 2CDE0 8003CDE0 01000224 */  addiu      $v0, $zero, 0x1
    /* 2CDE4 8003CDE4 0D80013C */  lui        $at, %hi(towner + 0x51)
    /* 2CDE8 8003CDE8 21083000 */  addu       $at, $at, $s0
    /* 2CDEC 8003CDEC D1FE22A0 */  sb         $v0, %lo(towner + 0x51)($at)
    /* 2CDF0 8003CDF0 0E80013C */  lui        $at, %hi(quests + 0x13D)
    /* 2CDF4 8003CDF4 7DDB22A0 */  sb         $v0, %lo(quests + 0x13D)($at)
    /* 2CDF8 8003CDF8 A2F30008 */  j          .L8003CE88
    /* 2CDFC 8003CDFC 0F000524 */   addiu     $a1, $zero, 0xF
  .L8003CE00:
    /* 2CE00 8003CE00 23006214 */  bne        $v1, $v0, .L8003CE90
    /* 2CE04 8003CE04 07000224 */   addiu     $v0, $zero, 0x7
    /* 2CE08 8003CE08 0E80033C */  lui        $v1, %hi(quests + 0x13B)
    /* 2CE0C 8003CE0C 7BDB6390 */  lbu        $v1, %lo(quests + 0x13B)($v1)
    /* 2CE10 8003CE10 00000000 */  nop
    /* 2CE14 8003CE14 1E006214 */  bne        $v1, $v0, .L8003CE90
    /* 2CE18 8003CE18 08000224 */   addiu     $v0, $zero, 0x8
    /* 2CE1C 8003CE1C 40801300 */  sll        $s0, $s3, 1
    /* 2CE20 8003CE20 21801302 */  addu       $s0, $s0, $s3
    /* 2CE24 8003CE24 00811000 */  sll        $s0, $s0, 4
    /* 2CE28 8003CE28 21801302 */  addu       $s0, $s0, $s3
    /* 2CE2C 8003CE2C 80801000 */  sll        $s0, $s0, 2
    /* 2CE30 8003CE30 0E80013C */  lui        $at, %hi(quests + 0x13B)
    /* 2CE34 8003CE34 7BDB22A0 */  sb         $v0, %lo(quests + 0x13B)($at)
    /* 2CE38 8003CE38 96000224 */  addiu      $v0, $zero, 0x96
    /* 2CE3C 8003CE3C 0D80013C */  lui        $at, %hi(towner + 0x4C)
    /* 2CE40 8003CE40 21083000 */  addu       $at, $at, $s0
    /* 2CE44 8003CE44 CCFE22AC */  sw         $v0, %lo(towner + 0x4C)($at)
    /* 2CE48 8003CE48 0D80013C */  lui        $at, %hi(towner + 0x88)
    /* 2CE4C 8003CE4C 21083000 */  addu       $at, $at, $s0
    /* 2CE50 8003CE50 08FF32AC */  sw         $s2, %lo(towner + 0x88)($at)
    /* 2CE54 8003CE54 1E37010C */  jal        InitQTextMsg__Fi
    /* 2CE58 8003CE58 19000424 */   addiu     $a0, $zero, 0x19
    /* 2CE5C 8003CE5C 01000424 */  addiu      $a0, $zero, 0x1
    /* 2CE60 8003CE60 01001124 */  addiu      $s1, $zero, 0x1
    /* 2CE64 8003CE64 0D80013C */  lui        $at, %hi(towner + 0x51)
    /* 2CE68 8003CE68 21083000 */  addu       $at, $at, $s0
    /* 2CE6C 8003CE6C D1FE31A0 */  sb         $s1, %lo(towner + 0x51)($at)
    /* 2CE70 8003CE70 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 2CE74 8003CE74 0F000524 */   addiu     $a1, $zero, 0xF
    /* 2CE78 8003CE78 01000424 */  addiu      $a0, $zero, 0x1
    /* 2CE7C 8003CE7C 05000524 */  addiu      $a1, $zero, 0x5
    /* 2CE80 8003CE80 0E80013C */  lui        $at, %hi(quests + 0x75)
    /* 2CE84 8003CE84 B5DA31A0 */  sb         $s1, %lo(quests + 0x75)($at)
  .L8003CE88:
    /* 2CE88 8003CE88 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 2CE8C 8003CE8C 00000000 */   nop
  .L8003CE90:
    /* 2CE90 8003CE90 1280023C */  lui        $v0, %hi(qtextflag)
    /* 2CE94 8003CE94 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 2CE98 8003CE98 00000000 */  nop
    /* 2CE9C 8003CE9C 1C004014 */  bnez       $v0, .L8003CF10
    /* 2CEA0 8003CEA0 96000424 */   addiu     $a0, $zero, 0x96
    /* 2CEA4 8003CEA4 56EE000C */  jal        TownerTalk__Fii
    /* 2CEA8 8003CEA8 21286002 */   addu      $a1, $s3, $zero
    /* 2CEAC 8003CEAC A0108293 */  lbu        $v0, %gp_rel(storeflag)($gp)
    /* 2CEB0 8003CEB0 00000000 */  nop
    /* 2CEB4 8003CEB4 16004010 */  beqz       $v0, .L8003CF10
    /* 2CEB8 8003CEB8 00000000 */   nop
    /* 2CEBC 8003CEBC 5BBE010C */  jal        StartStore__Fc
    /* 2CEC0 8003CEC0 0F000424 */   addiu     $a0, $zero, 0xF
    /* 2CEC4 8003CEC4 C4F30008 */  j          .L8003CF10
    /* 2CEC8 8003CEC8 00000000 */   nop
  .L8003CECC:
    /* 2CECC 8003CECC 21105300 */  addu       $v0, $v0, $s3
    /* 2CED0 8003CED0 00110200 */  sll        $v0, $v0, 4
    /* 2CED4 8003CED4 21105300 */  addu       $v0, $v0, $s3
    /* 2CED8 8003CED8 80100200 */  sll        $v0, $v0, 2
    /* 2CEDC 8003CEDC 0D80013C */  lui        $at, %hi(towner + 0x4)
    /* 2CEE0 8003CEE0 21082200 */  addu       $at, $at, $v0
    /* 2CEE4 8003CEE4 84FE238C */  lw         $v1, %lo(towner + 0x4)($at)
    /* 2CEE8 8003CEE8 09000224 */  addiu      $v0, $zero, 0x9
    /* 2CEEC 8003CEEC 08006214 */  bne        $v1, $v0, .L8003CF10
    /* 2CEF0 8003CEF0 00000000 */   nop
    /* 2CEF4 8003CEF4 1280023C */  lui        $v0, %hi(qtextflag)
    /* 2CEF8 8003CEF8 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 2CEFC 8003CEFC 00000000 */  nop
    /* 2CF00 8003CF00 03004014 */  bnez       $v0, .L8003CF10
    /* 2CF04 8003CF04 00000000 */   nop
    /* 2CF08 8003CF08 0FEE000C */  jal        CowSFX__Fi
    /* 2CF0C 8003CF0C 21204002 */   addu      $a0, $s2, $zero
  .L8003CF10:
    /* 2CF10 8003CF10 3400BF8F */  lw         $ra, 0x34($sp)
    /* 2CF14 8003CF14 3000B48F */  lw         $s4, 0x30($sp)
    /* 2CF18 8003CF18 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 2CF1C 8003CF1C 2800B28F */  lw         $s2, 0x28($sp)
    /* 2CF20 8003CF20 2400B18F */  lw         $s1, 0x24($sp)
    /* 2CF24 8003CF24 2000B08F */  lw         $s0, 0x20($sp)
    /* 2CF28 8003CF28 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 2CF2C 8003CF2C 0800E003 */  jr         $ra
    /* 2CF30 8003CF30 00000000 */   nop
endlabel TalkToTowner__Fii
