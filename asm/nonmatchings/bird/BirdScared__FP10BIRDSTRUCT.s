.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BirdScared__FP10BIRDSTRUCT, 0x12C

glabel BirdScared__FP10BIRDSTRUCT
    /* 9B9F8 800AB9F8 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 9B9FC 800AB9FC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 9BA00 800ABA00 21808000 */  addu       $s0, $a0, $zero
    /* 9BA04 800ABA04 1400B1AF */  sw         $s1, 0x14($sp)
    /* 9BA08 800ABA08 1800BFAF */  sw         $ra, 0x18($sp)
    /* 9BA0C 800ABA0C C9AE020C */  jal        GetPerch__FP10BIRDSTRUCT
    /* 9BA10 800ABA10 21880000 */   addu      $s1, $zero, $zero
    /* 9BA14 800ABA14 21204000 */  addu       $a0, $v0, $zero
    /* 9BA18 800ABA18 12000382 */  lb         $v1, 0x12($s0)
    /* 9BA1C 800ABA1C 01000224 */  addiu      $v0, $zero, 0x1
    /* 9BA20 800ABA20 0D006214 */  bne        $v1, $v0, .L800ABA58
    /* 9BA24 800ABA24 00000000 */   nop
    /* 9BA28 800ABA28 0000028E */  lw         $v0, 0x0($s0)
    /* 9BA2C 800ABA2C 00000000 */  nop
    /* 9BA30 800ABA30 09004014 */  bnez       $v0, .L800ABA58
    /* 9BA34 800ABA34 40100400 */   sll       $v0, $a0, 1
    /* 9BA38 800ABA38 1280013C */  lui        $at, %hi(D_8011B2A0)
    /* 9BA3C 800ABA3C 21082200 */  addu       $at, $at, $v0
    /* 9BA40 800ABA40 A0B22480 */  lb         $a0, %lo(D_8011B2A0)($at)
    /* 9BA44 800ABA44 1280013C */  lui        $at, %hi(D_8011B2A1)
    /* 9BA48 800ABA48 21082200 */  addu       $at, $at, $v0
    /* 9BA4C 800ABA4C A1B22580 */  lb         $a1, %lo(D_8011B2A1)($at)
    /* 9BA50 800ABA50 98AE0208 */  j          .L800ABA60
    /* 9BA54 800ABA54 00000000 */   nop
  .L800ABA58:
    /* 9BA58 800ABA58 08000482 */  lb         $a0, 0x8($s0)
    /* 9BA5C 800ABA5C 09000582 */  lb         $a1, 0x9($s0)
  .L800ABA60:
    /* 9BA60 800ABA60 44AE020C */  jal        CheckDist__Fii
    /* 9BA64 800ABA64 00000000 */   nop
    /* 9BA68 800ABA68 21204000 */  addu       $a0, $v0, $zero
    /* 9BA6C 800ABA6C 26008010 */  beqz       $a0, .L800ABB08
    /* 9BA70 800ABA70 FFFF8424 */   addiu     $a0, $a0, -0x1
    /* 9BA74 800ABA74 40100400 */  sll        $v0, $a0, 1
    /* 9BA78 800ABA78 21104400 */  addu       $v0, $v0, $a0
    /* 9BA7C 800ABA7C 80100200 */  sll        $v0, $v0, 2
    /* 9BA80 800ABA80 21104400 */  addu       $v0, $v0, $a0
    /* 9BA84 800ABA84 00110200 */  sll        $v0, $v0, 4
    /* 9BA88 800ABA88 23104400 */  subu       $v0, $v0, $a0
    /* 9BA8C 800ABA8C 80100200 */  sll        $v0, $v0, 2
    /* 9BA90 800ABA90 21104400 */  addu       $v0, $v0, $a0
    /* 9BA94 800ABA94 C0100200 */  sll        $v0, $v0, 3
    /* 9BA98 800ABA98 0E80033C */  lui        $v1, %hi(plr)
    /* 9BA9C 800ABA9C 38A56324 */  addiu      $v1, $v1, %lo(plr)
    /* 9BAA0 800ABAA0 21284300 */  addu       $a1, $v0, $v1
    /* 9BAA4 800ABAA4 80300400 */  sll        $a2, $a0, 2
    /* 9BAA8 800ABAA8 1280013C */  lui        $at, %hi(D_8011C720)
    /* 9BAAC 800ABAAC 21082600 */  addu       $at, $at, $a2
    /* 9BAB0 800ABAB0 20C7238C */  lw         $v1, %lo(D_8011C720)($at)
    /* 9BAB4 800ABAB4 2800A28C */  lw         $v0, 0x28($a1)
    /* 9BAB8 800ABAB8 00000000 */  nop
    /* 9BABC 800ABABC 08006214 */  bne        $v1, $v0, .L800ABAE0
    /* 9BAC0 800ABAC0 00000000 */   nop
    /* 9BAC4 800ABAC4 1280013C */  lui        $at, %hi(D_8011C728)
    /* 9BAC8 800ABAC8 21082600 */  addu       $at, $at, $a2
    /* 9BACC 800ABACC 28C7238C */  lw         $v1, %lo(D_8011C728)($at)
    /* 9BAD0 800ABAD0 2C00A28C */  lw         $v0, 0x2C($a1)
    /* 9BAD4 800ABAD4 00000000 */  nop
    /* 9BAD8 800ABAD8 02006210 */  beq        $v1, $v0, .L800ABAE4
    /* 9BADC 800ABADC 00000000 */   nop
  .L800ABAE0:
    /* 9BAE0 800ABAE0 01009124 */  addiu      $s1, $a0, 0x1
  .L800ABAE4:
    /* 9BAE4 800ABAE4 2800A28C */  lw         $v0, 0x28($a1)
    /* 9BAE8 800ABAE8 80180400 */  sll        $v1, $a0, 2
    /* 9BAEC 800ABAEC 1280013C */  lui        $at, %hi(D_8011C720)
    /* 9BAF0 800ABAF0 21082300 */  addu       $at, $at, $v1
    /* 9BAF4 800ABAF4 20C722AC */  sw         $v0, %lo(D_8011C720)($at)
    /* 9BAF8 800ABAF8 2C00A28C */  lw         $v0, 0x2C($a1)
    /* 9BAFC 800ABAFC 1280013C */  lui        $at, %hi(D_8011C728)
    /* 9BB00 800ABB00 21082300 */  addu       $at, $at, $v1
    /* 9BB04 800ABB04 28C722AC */  sw         $v0, %lo(D_8011C728)($at)
  .L800ABB08:
    /* 9BB08 800ABB08 21102002 */  addu       $v0, $s1, $zero
    /* 9BB0C 800ABB0C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 9BB10 800ABB10 1400B18F */  lw         $s1, 0x14($sp)
    /* 9BB14 800ABB14 1000B08F */  lw         $s0, 0x10($sp)
    /* 9BB18 800ABB18 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 9BB1C 800ABB1C 0800E003 */  jr         $ra
    /* 9BB20 800ABB20 00000000 */   nop
endlabel BirdScared__FP10BIRDSTRUCT
