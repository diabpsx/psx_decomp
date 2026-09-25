.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching unlockmemblock, 0x44

glabel unlockmemblock
    /* 1B824 8002B824 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1B828 8002B828 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1B82C 8002B82C 21808000 */  addu       $s0, $a0, $zero
    /* 1B830 8002B830 1423848F */  lw         $a0, %gp_rel(_lv)($gp)
    /* 1B834 8002B834 1400BFAF */  sw         $ra, 0x14($sp)
    /* 1B838 8002B838 E8BD000C */  jal        locksemaphore
    /* 1B83C 8002B83C 00000000 */   nop
    /* 1B840 8002B840 1800028E */  lw         $v0, 0x18($s0)
    /* 1B844 8002B844 1423848F */  lw         $a0, %gp_rel(_lv)($gp)
    /* 1B848 8002B848 10004234 */  ori        $v0, $v0, 0x10
    /* 1B84C 8002B84C F3BD000C */  jal        unlocksemaphore
    /* 1B850 8002B850 180002AE */   sw        $v0, 0x18($s0)
    /* 1B854 8002B854 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1B858 8002B858 1000B08F */  lw         $s0, 0x10($sp)
    /* 1B85C 8002B85C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1B860 8002B860 0800E003 */  jr         $ra
    /* 1B864 8002B864 00000000 */   nop
endlabel unlockmemblock
