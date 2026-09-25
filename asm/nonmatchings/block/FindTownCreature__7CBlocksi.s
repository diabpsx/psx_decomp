.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FindTownCreature__7CBlocksi, 0x74

glabel FindTownCreature__7CBlocksi
    /* 7D614 8008D614 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 7D618 8008D618 1800B2AF */  sw         $s2, 0x18($sp)
    /* 7D61C 8008D61C 2190A000 */  addu       $s2, $a1, $zero
    /* 7D620 8008D620 1400B1AF */  sw         $s1, 0x14($sp)
    /* 7D624 8008D624 21880000 */  addu       $s1, $zero, $zero
    /* 7D628 8008D628 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 7D62C 8008D62C FFFF1324 */  addiu      $s3, $zero, -0x1
    /* 7D630 8008D630 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7D634 8008D634 0C80103C */  lui        $s0, %hi(TownConv)
    /* 7D638 8008D638 808B1026 */  addiu      $s0, $s0, %lo(TownConv)
    /* 7D63C 8008D63C 2000BFAF */  sw         $ra, 0x20($sp)
  .L8008D640:
    /* 7D640 8008D640 0A00222E */  sltiu      $v0, $s1, 0xA
    /* 7D644 8008D644 07004010 */  beqz       $v0, .L8008D664
    /* 7D648 8008D648 21200002 */   addu      $a0, $s0, $zero
    /* 7D64C 8008D64C F946020C */  jal        GetCreature__14TownToCreaturei
    /* 7D650 8008D650 21284002 */   addu      $a1, $s2, $zero
    /* 7D654 8008D654 04005314 */  bne        $v0, $s3, .L8008D668
    /* 7D658 8008D658 02001026 */   addiu     $s0, $s0, 0x2
    /* 7D65C 8008D65C 90350208 */  j          .L8008D640
    /* 7D660 8008D660 01003126 */   addiu     $s1, $s1, 0x1
  .L8008D664:
    /* 7D664 8008D664 FFFF0224 */  addiu      $v0, $zero, -0x1
  .L8008D668:
    /* 7D668 8008D668 2000BF8F */  lw         $ra, 0x20($sp)
    /* 7D66C 8008D66C 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 7D670 8008D670 1800B28F */  lw         $s2, 0x18($sp)
    /* 7D674 8008D674 1400B18F */  lw         $s1, 0x14($sp)
    /* 7D678 8008D678 1000B08F */  lw         $s0, 0x10($sp)
    /* 7D67C 8008D67C 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 7D680 8008D680 0800E003 */  jr         $ra
    /* 7D684 8008D684 00000000 */   nop
endlabel FindTownCreature__7CBlocksi
