.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching findcontainingmemblocka, 0xEC

glabel findcontainingmemblocka
    /* 1BA24 8002BA24 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1BA28 8002BA28 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1BA2C 8002BA2C 21408000 */  addu       $t0, $a0, $zero
    /* 1BA30 8002BA30 21480000 */  addu       $t1, $zero, $zero
    /* 1BA34 8002BA34 21300000 */  addu       $a2, $zero, $zero
  .L8002BA38:
    /* 1BA38 8002BA38 1380013C */  lui        $at, %hi(D_80137A34)
    /* 1BA3C 8002BA3C 21082600 */  addu       $at, $at, $a2
    /* 1BA40 8002BA40 347A228C */  lw         $v0, %lo(D_80137A34)($at)
    /* 1BA44 8002BA44 00000000 */  nop
    /* 1BA48 8002BA48 1B004010 */  beqz       $v0, .L8002BAB8
    /* 1BA4C 8002BA4C 21384000 */   addu      $a3, $v0, $zero
    /* 1BA50 8002BA50 1380013C */  lui        $at, %hi(memclass)
    /* 1BA54 8002BA54 21082600 */  addu       $at, $at, $a2
    /* 1BA58 8002BA58 307A238C */  lw         $v1, %lo(memclass)($at)
  .L8002BA5C:
    /* 1BA5C 8002BA5C 00000000 */  nop
    /* 1BA60 8002BA60 2000638C */  lw         $v1, 0x20($v1)
    /* 1BA64 8002BA64 00000000 */  nop
    /* 1BA68 8002BA68 0000648C */  lw         $a0, 0x0($v1)
    /* 1BA6C 8002BA6C 00000000 */  nop
    /* 1BA70 8002BA70 2B100401 */  sltu       $v0, $t0, $a0
    /* 1BA74 8002BA74 07004014 */  bnez       $v0, .L8002BA94
    /* 1BA78 8002BA78 00000000 */   nop
    /* 1BA7C 8002BA7C 1400628C */  lw         $v0, 0x14($v1)
    /* 1BA80 8002BA80 00000000 */  nop
    /* 1BA84 8002BA84 21108200 */  addu       $v0, $a0, $v0
    /* 1BA88 8002BA88 2B100201 */  sltu       $v0, $t0, $v0
    /* 1BA8C 8002BA8C 03004014 */  bnez       $v0, .L8002BA9C
    /* 1BA90 8002BA90 00000000 */   nop
  .L8002BA94:
    /* 1BA94 8002BA94 F1FF6714 */  bne        $v1, $a3, .L8002BA5C
    /* 1BA98 8002BA98 00000000 */   nop
  .L8002BA9C:
    /* 1BA9C 8002BA9C 1800628C */  lw         $v0, 0x18($v1)
    /* 1BAA0 8002BAA0 00000000 */  nop
    /* 1BAA4 8002BAA4 00804230 */  andi       $v0, $v0, 0x8000
    /* 1BAA8 8002BAA8 04004014 */  bnez       $v0, .L8002BABC
    /* 1BAAC 8002BAAC 01002925 */   addiu     $t1, $t1, 0x1
    /* 1BAB0 8002BAB0 C0AE0008 */  j          .L8002BB00
    /* 1BAB4 8002BAB4 21106000 */   addu      $v0, $v1, $zero
  .L8002BAB8:
    /* 1BAB8 8002BAB8 01002925 */  addiu      $t1, $t1, 0x1
  .L8002BABC:
    /* 1BABC 8002BABC 10002229 */  slti       $v0, $t1, 0x10
    /* 1BAC0 8002BAC0 DDFF4014 */  bnez       $v0, .L8002BA38
    /* 1BAC4 8002BAC4 1800C624 */   addiu     $a2, $a2, 0x18
    /* 1BAC8 8002BAC8 0D00A010 */  beqz       $a1, .L8002BB00
    /* 1BACC 8002BACC 21100000 */   addu      $v0, $zero, $zero
    /* 1BAD0 8002BAD0 1180023C */  lui        $v0, %hi(D_8010F3D4)
    /* 1BAD4 8002BAD4 D4F34224 */  addiu      $v0, $v0, %lo(D_8010F3D4)
    /* 1BAD8 8002BAD8 1280013C */  lui        $at, %hi(abortfile)
    /* 1BADC 8002BADC B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1BAE0 8002BAE0 DE060224 */  addiu      $v0, $zero, 0x6DE
    /* 1BAE4 8002BAE4 1180043C */  lui        $a0, %hi(D_8010F92C)
    /* 1BAE8 8002BAE8 2CF98424 */  addiu      $a0, $a0, %lo(D_8010F92C)
    /* 1BAEC 8002BAEC 1280013C */  lui        $at, %hi(abortline)
    /* 1BAF0 8002BAF0 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1BAF4 8002BAF4 0F95000C */  jal        abortmessage
    /* 1BAF8 8002BAF8 21280001 */   addu      $a1, $t0, $zero
    /* 1BAFC 8002BAFC 21100000 */  addu       $v0, $zero, $zero
  .L8002BB00:
    /* 1BB00 8002BB00 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1BB04 8002BB04 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1BB08 8002BB08 0800E003 */  jr         $ra
    /* 1BB0C 8002BB0C 00000000 */   nop
endlabel findcontainingmemblocka
