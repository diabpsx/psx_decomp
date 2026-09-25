.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetPlayerPosBlocks__7CBlocksiii, 0xA0

glabel SetPlayerPosBlocks__7CBlocksiii
    /* 817BC 800917BC D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 817C0 800917C0 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 817C4 800917C4 21988000 */  addu       $s3, $a0, $zero
    /* 817C8 800917C8 1800B2AF */  sw         $s2, 0x18($sp)
    /* 817CC 800917CC 2190A000 */  addu       $s2, $a1, $zero
    /* 817D0 800917D0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 817D4 800917D4 2180C000 */  addu       $s0, $a2, $zero
    /* 817D8 800917D8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 817DC 800917DC 2188E000 */  addu       $s1, $a3, $zero
    /* 817E0 800917E0 0200422E */  sltiu      $v0, $s2, 0x2
    /* 817E4 800917E4 06004014 */  bnez       $v0, .L80091800
    /* 817E8 800917E8 2000BFAF */   sw        $ra, 0x20($sp)
    /* 817EC 800917EC 21200000 */  addu       $a0, $zero, $zero
    /* 817F0 800917F0 1180053C */  lui        $a1, %hi(D_8011054C)
    /* 817F4 800917F4 4C05A524 */  addiu      $a1, $a1, %lo(D_8011054C)
    /* 817F8 800917F8 A583000C */  jal        DBG_Error
    /* 817FC 800917FC 8F0A0624 */   addiu     $a2, $zero, 0xA8F
  .L80091800:
    /* 81800 80091800 A800628E */  lw         $v0, 0xA8($s3)
    /* 81804 80091804 00000000 */  nop
    /* 81808 80091808 03004014 */  bnez       $v0, .L80091818
    /* 8180C 8009180C 80101200 */   sll       $v0, $s2, 2
    /* 81810 80091810 F0FF1026 */  addiu      $s0, $s0, -0x10
    /* 81814 80091814 F0FF3126 */  addiu      $s1, $s1, -0x10
  .L80091818:
    /* 81818 80091818 21105300 */  addu       $v0, $v0, $s3
    /* 8181C 8009181C C21F1000 */  srl        $v1, $s0, 31
    /* 81820 80091820 21180302 */  addu       $v1, $s0, $v1
    /* 81824 80091824 43180300 */  sra        $v1, $v1, 1
    /* 81828 80091828 D80043AC */  sw         $v1, 0xD8($v0)
    /* 8182C 8009182C C21F1100 */  srl        $v1, $s1, 31
    /* 81830 80091830 21182302 */  addu       $v1, $s1, $v1
    /* 81834 80091834 43180300 */  sra        $v1, $v1, 1
    /* 81838 80091838 E00043AC */  sw         $v1, 0xE0($v0)
    /* 8183C 8009183C 2000BF8F */  lw         $ra, 0x20($sp)
    /* 81840 80091840 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 81844 80091844 1800B28F */  lw         $s2, 0x18($sp)
    /* 81848 80091848 1400B18F */  lw         $s1, 0x14($sp)
    /* 8184C 8009184C 1000B08F */  lw         $s0, 0x10($sp)
    /* 81850 80091850 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 81854 80091854 0800E003 */  jr         $ra
    /* 81858 80091858 00000000 */   nop
endlabel SetPlayerPosBlocks__7CBlocksiii
