.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddDead__FP9CacheInfoP8map_infoii, 0x8C

glabel AddDead__FP9CacheInfoP8map_infoii
    /* 80968 80090968 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 8096C 8009096C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 80970 80090970 21888000 */  addu       $s1, $a0, $zero
    /* 80974 80090974 1800B2AF */  sw         $s2, 0x18($sp)
    /* 80978 80090978 2190C000 */  addu       $s2, $a2, $zero
    /* 8097C 8009097C 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 80980 80090980 2198E000 */  addu       $s3, $a3, $zero
    /* 80984 80090984 21204002 */  addu       $a0, $s2, $zero
    /* 80988 80090988 21286002 */  addu       $a1, $s3, $zero
    /* 8098C 8009098C 2000BFAF */  sw         $ra, 0x20($sp)
    /* 80990 80090990 E80A020C */  jal        GetdDead__Fii
    /* 80994 80090994 1000B0AF */   sw        $s0, 0x10($sp)
    /* 80998 80090998 FF005030 */  andi       $s0, $v0, 0xFF
    /* 8099C 8009099C 1000022A */  slti       $v0, $s0, 0x10
    /* 809A0 800909A0 05004014 */  bnez       $v0, .L800909B8
    /* 809A4 800909A4 21200000 */   addu      $a0, $zero, $zero
    /* 809A8 800909A8 1180053C */  lui        $a1, %hi(D_8011054C)
    /* 809AC 800909AC 4C05A524 */  addiu      $a1, $a1, %lo(D_8011054C)
    /* 809B0 800909B0 A583000C */  jal        DBG_Error
    /* 809B4 800909B4 96080624 */   addiu     $a2, $zero, 0x896
  .L800909B8:
    /* 809B8 800909B8 03000016 */  bnez       $s0, .L800909C8
    /* 809BC 800909BC 01000224 */   addiu     $v0, $zero, 0x1
    /* 809C0 800909C0 75420208 */  j          .L800909D4
    /* 809C4 800909C4 21100000 */   addu      $v0, $zero, $zero
  .L800909C8:
    /* 809C8 800909C8 010032A2 */  sb         $s2, 0x1($s1)
    /* 809CC 800909CC 020033A2 */  sb         $s3, 0x2($s1)
    /* 809D0 800909D0 000030A2 */  sb         $s0, 0x0($s1)
  .L800909D4:
    /* 809D4 800909D4 2000BF8F */  lw         $ra, 0x20($sp)
    /* 809D8 800909D8 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 809DC 800909DC 1800B28F */  lw         $s2, 0x18($sp)
    /* 809E0 800909E0 1400B18F */  lw         $s1, 0x14($sp)
    /* 809E4 800909E4 1000B08F */  lw         $s0, 0x10($sp)
    /* 809E8 800909E8 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 809EC 800909EC 0800E003 */  jr         $ra
    /* 809F0 800909F0 00000000 */   nop
endlabel AddDead__FP9CacheInfoP8map_infoii
