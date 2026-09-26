.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckIfTrig__Fii, 0x1A8

glabel CheckIfTrig__Fii
    /* 5200 8013EDF8 1280023C */  lui        $v0, %hi(numtrigs)
    /* 5204 8013EDFC 78BB428C */  lw         $v0, %lo(numtrigs)($v0)
    /* 5208 8013EE00 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 520C 8013EE04 2800B4AF */  sw         $s4, 0x28($sp)
    /* 5210 8013EE08 21A08000 */  addu       $s4, $a0, $zero
    /* 5214 8013EE0C 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 5218 8013EE10 21A8A000 */  addu       $s5, $a1, $zero
    /* 521C 8013EE14 2400B3AF */  sw         $s3, 0x24($sp)
    /* 5220 8013EE18 21980000 */  addu       $s3, $zero, $zero
    /* 5224 8013EE1C 3000BFAF */  sw         $ra, 0x30($sp)
    /* 5228 8013EE20 2000B2AF */  sw         $s2, 0x20($sp)
    /* 522C 8013EE24 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 5230 8013EE28 21004018 */  blez       $v0, .L8013EEB0
    /* 5234 8013EE2C 1800B0AF */   sw        $s0, 0x18($sp)
    /* 5238 8013EE30 0E80113C */  lui        $s1, %hi(trigs + 0x4)
    /* 523C 8013EE34 D0333126 */  addiu      $s1, $s1, %lo(trigs + 0x4)
    /* 5240 8013EE38 21900000 */  addu       $s2, $zero, $zero
  .L8013EE3C:
    /* 5244 8013EE3C 0E80013C */  lui        $at, %hi(trigs)
    /* 5248 8013EE40 21083200 */  addu       $at, $at, $s2
    /* 524C 8013EE44 CC33248C */  lw         $a0, %lo(trigs)($at)
    /* 5250 8013EE48 00000000 */  nop
    /* 5254 8013EE4C 05008416 */  bne        $s4, $a0, .L8013EE64
    /* 5258 8013EE50 21800000 */   addu      $s0, $zero, $zero
    /* 525C 8013EE54 0000228E */  lw         $v0, 0x0($s1)
    /* 5260 8013EE58 00000000 */  nop
    /* 5264 8013EE5C 4600A212 */  beq        $s5, $v0, .L8013EF78
    /* 5268 8013EE60 01000224 */   addiu     $v0, $zero, 0x1
  .L8013EE64:
    /* 526C 8013EE64 6D41000C */  jal        abs
    /* 5270 8013EE68 23209400 */   subu      $a0, $a0, $s4
    /* 5274 8013EE6C 02004228 */  slti       $v0, $v0, 0x2
    /* 5278 8013EE70 05004010 */  beqz       $v0, .L8013EE88
    /* 527C 8013EE74 00000000 */   nop
    /* 5280 8013EE78 0000248E */  lw         $a0, 0x0($s1)
    /* 5284 8013EE7C 6D41000C */  jal        abs
    /* 5288 8013EE80 23209500 */   subu      $a0, $a0, $s5
    /* 528C 8013EE84 02005028 */  slti       $s0, $v0, 0x2
  .L8013EE88:
    /* 5290 8013EE88 3B000016 */  bnez       $s0, .L8013EF78
    /* 5294 8013EE8C 01000224 */   addiu     $v0, $zero, 0x1
    /* 5298 8013EE90 10003126 */  addiu      $s1, $s1, 0x10
    /* 529C 8013EE94 1280023C */  lui        $v0, %hi(numtrigs)
    /* 52A0 8013EE98 78BB428C */  lw         $v0, %lo(numtrigs)($v0)
    /* 52A4 8013EE9C 01007326 */  addiu      $s3, $s3, 0x1
    /* 52A8 8013EEA0 2A106202 */  slt        $v0, $s3, $v0
    /* 52AC 8013EEA4 E5FF4014 */  bnez       $v0, .L8013EE3C
    /* 52B0 8013EEA8 10005226 */   addiu     $s2, $s2, 0x10
    /* 52B4 8013EEAC 21980000 */  addu       $s3, $zero, $zero
  .L8013EEB0:
    /* 52B8 8013EEB0 0E80123C */  lui        $s2, %hi(quests + 0x8)
    /* 52BC 8013EEB4 48DA5226 */  addiu      $s2, $s2, %lo(quests + 0x8)
    /* 52C0 8013EEB8 21880000 */  addu       $s1, $zero, $zero
  .L8013EEBC:
    /* 52C4 8013EEBC 1280033C */  lui        $v1, %hi(currlevel)
    /* 52C8 8013EEC0 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 52CC 8013EEC4 0E80013C */  lui        $at, %hi(quests)
    /* 52D0 8013EEC8 21083100 */  addu       $at, $at, $s1
    /* 52D4 8013EECC 40DA2290 */  lbu        $v0, %lo(quests)($at)
    /* 52D8 8013EED0 00000000 */  nop
    /* 52DC 8013EED4 22006214 */  bne        $v1, $v0, .L8013EF60
    /* 52E0 8013EED8 00000000 */   nop
    /* 52E4 8013EEDC 0E80013C */  lui        $at, %hi(quests + 0xC)
    /* 52E8 8013EEE0 21083100 */  addu       $at, $at, $s1
    /* 52EC 8013EEE4 4CDA2290 */  lbu        $v0, %lo(quests + 0xC)($at)
    /* 52F0 8013EEE8 00000000 */  nop
    /* 52F4 8013EEEC 1C004010 */  beqz       $v0, .L8013EF60
    /* 52F8 8013EEF0 00000000 */   nop
    /* 52FC 8013EEF4 0E80013C */  lui        $at, %hi(quests + 0x2)
    /* 5300 8013EEF8 21083100 */  addu       $at, $at, $s1
    /* 5304 8013EEFC 42DA2290 */  lbu        $v0, %lo(quests + 0x2)($at)
    /* 5308 8013EF00 00000000 */  nop
    /* 530C 8013EF04 16004010 */  beqz       $v0, .L8013EF60
    /* 5310 8013EF08 00000000 */   nop
    /* 5314 8013EF0C 0E80013C */  lui        $at, %hi(quests + 0x4)
    /* 5318 8013EF10 21083100 */  addu       $at, $at, $s1
    /* 531C 8013EF14 44DA248C */  lw         $a0, %lo(quests + 0x4)($at)
    /* 5320 8013EF18 00000000 */  nop
    /* 5324 8013EF1C 05008416 */  bne        $s4, $a0, .L8013EF34
    /* 5328 8013EF20 21800000 */   addu      $s0, $zero, $zero
    /* 532C 8013EF24 0000428E */  lw         $v0, 0x0($s2)
    /* 5330 8013EF28 00000000 */  nop
    /* 5334 8013EF2C 1200A212 */  beq        $s5, $v0, .L8013EF78
    /* 5338 8013EF30 01000224 */   addiu     $v0, $zero, 0x1
  .L8013EF34:
    /* 533C 8013EF34 6D41000C */  jal        abs
    /* 5340 8013EF38 23209400 */   subu      $a0, $a0, $s4
    /* 5344 8013EF3C 02004228 */  slti       $v0, $v0, 0x2
    /* 5348 8013EF40 05004010 */  beqz       $v0, .L8013EF58
    /* 534C 8013EF44 00000000 */   nop
    /* 5350 8013EF48 0000448E */  lw         $a0, 0x0($s2)
    /* 5354 8013EF4C 6D41000C */  jal        abs
    /* 5358 8013EF50 23209500 */   subu      $a0, $a0, $s5
    /* 535C 8013EF54 02005028 */  slti       $s0, $v0, 0x2
  .L8013EF58:
    /* 5360 8013EF58 07000016 */  bnez       $s0, .L8013EF78
    /* 5364 8013EF5C 01000224 */   addiu     $v0, $zero, 0x1
  .L8013EF60:
    /* 5368 8013EF60 14005226 */  addiu      $s2, $s2, 0x14
    /* 536C 8013EF64 01007326 */  addiu      $s3, $s3, 0x1
    /* 5370 8013EF68 1000622A */  slti       $v0, $s3, 0x10
    /* 5374 8013EF6C D3FF4014 */  bnez       $v0, .L8013EEBC
    /* 5378 8013EF70 14003126 */   addiu     $s1, $s1, 0x14
    /* 537C 8013EF74 21100000 */  addu       $v0, $zero, $zero
  .L8013EF78:
    /* 5380 8013EF78 3000BF8F */  lw         $ra, 0x30($sp)
    /* 5384 8013EF7C 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 5388 8013EF80 2800B48F */  lw         $s4, 0x28($sp)
    /* 538C 8013EF84 2400B38F */  lw         $s3, 0x24($sp)
    /* 5390 8013EF88 2000B28F */  lw         $s2, 0x20($sp)
    /* 5394 8013EF8C 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 5398 8013EF90 1800B08F */  lw         $s0, 0x18($sp)
    /* 539C 8013EF94 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 53A0 8013EF98 0800E003 */  jr         $ra
    /* 53A4 8013EF9C 00000000 */   nop
endlabel CheckIfTrig__Fii
