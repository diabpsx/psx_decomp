.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching reservememblocka, 0x88

glabel reservememblocka
    /* 1A660 8002A660 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 1A664 8002A664 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1A668 8002A668 21808000 */  addu       $s0, $a0, $zero
    /* 1A66C 8002A66C 1423848F */  lw         $a0, %gp_rel(_lv)($gp)
    /* 1A670 8002A670 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1A674 8002A674 2188A000 */  addu       $s1, $a1, $zero
    /* 1A678 8002A678 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1A67C 8002A67C 2190C000 */  addu       $s2, $a2, $zero
    /* 1A680 8002A680 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1A684 8002A684 2198E000 */  addu       $s3, $a3, $zero
    /* 1A688 8002A688 03008010 */  beqz       $a0, .L8002A698
    /* 1A68C 8002A68C 2000BFAF */   sw        $ra, 0x20($sp)
    /* 1A690 8002A690 E8BD000C */  jal        locksemaphore
    /* 1A694 8002A694 00000000 */   nop
  .L8002A698:
    /* 1A698 8002A698 21200002 */  addu       $a0, $s0, $zero
    /* 1A69C 8002A69C 21282002 */  addu       $a1, $s1, $zero
    /* 1A6A0 8002A6A0 21304002 */  addu       $a2, $s2, $zero
    /* 1A6A4 8002A6A4 BAA9000C */  jal        reservememblockai
    /* 1A6A8 8002A6A8 21386002 */   addu      $a3, $s3, $zero
    /* 1A6AC 8002A6AC 1423848F */  lw         $a0, %gp_rel(_lv)($gp)
    /* 1A6B0 8002A6B0 00000000 */  nop
    /* 1A6B4 8002A6B4 03008010 */  beqz       $a0, .L8002A6C4
    /* 1A6B8 8002A6B8 21804000 */   addu      $s0, $v0, $zero
    /* 1A6BC 8002A6BC F3BD000C */  jal        unlocksemaphore
    /* 1A6C0 8002A6C0 00000000 */   nop
  .L8002A6C4:
    /* 1A6C4 8002A6C4 21100002 */  addu       $v0, $s0, $zero
    /* 1A6C8 8002A6C8 2000BF8F */  lw         $ra, 0x20($sp)
    /* 1A6CC 8002A6CC 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 1A6D0 8002A6D0 1800B28F */  lw         $s2, 0x18($sp)
    /* 1A6D4 8002A6D4 1400B18F */  lw         $s1, 0x14($sp)
    /* 1A6D8 8002A6D8 1000B08F */  lw         $s0, 0x10($sp)
    /* 1A6DC 8002A6DC 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 1A6E0 8002A6E0 0800E003 */  jr         $ra
    /* 1A6E4 8002A6E4 00000000 */   nop
endlabel reservememblocka
