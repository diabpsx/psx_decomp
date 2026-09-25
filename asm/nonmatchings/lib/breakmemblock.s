.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching breakmemblock, 0x50

glabel breakmemblock
    /* 1B89C 8002B89C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1B8A0 8002B8A0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1B8A4 8002B8A4 21808000 */  addu       $s0, $a0, $zero
    /* 1B8A8 8002B8A8 1423848F */  lw         $a0, %gp_rel(_lv)($gp)
    /* 1B8AC 8002B8AC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1B8B0 8002B8B0 1800BFAF */  sw         $ra, 0x18($sp)
    /* 1B8B4 8002B8B4 E8BD000C */  jal        locksemaphore
    /* 1B8B8 8002B8B8 2188A000 */   addu      $s1, $a1, $zero
    /* 1B8BC 8002B8BC 21200002 */  addu       $a0, $s0, $zero
    /* 1B8C0 8002B8C0 3BAE000C */  jal        breakmemblocki
    /* 1B8C4 8002B8C4 21282002 */   addu      $a1, $s1, $zero
    /* 1B8C8 8002B8C8 1423848F */  lw         $a0, %gp_rel(_lv)($gp)
    /* 1B8CC 8002B8CC F3BD000C */  jal        unlocksemaphore
    /* 1B8D0 8002B8D0 00000000 */   nop
    /* 1B8D4 8002B8D4 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1B8D8 8002B8D8 1400B18F */  lw         $s1, 0x14($sp)
    /* 1B8DC 8002B8DC 1000B08F */  lw         $s0, 0x10($sp)
    /* 1B8E0 8002B8E0 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1B8E4 8002B8E4 0800E003 */  jr         $ra
    /* 1B8E8 8002B8E8 00000000 */   nop
endlabel breakmemblock
