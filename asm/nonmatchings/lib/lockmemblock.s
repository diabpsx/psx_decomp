.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching lockmemblock, 0x48

glabel lockmemblock
    /* 1B7DC 8002B7DC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1B7E0 8002B7E0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1B7E4 8002B7E4 21808000 */  addu       $s0, $a0, $zero
    /* 1B7E8 8002B7E8 1423848F */  lw         $a0, %gp_rel(_lv)($gp)
    /* 1B7EC 8002B7EC 1400BFAF */  sw         $ra, 0x14($sp)
    /* 1B7F0 8002B7F0 E8BD000C */  jal        locksemaphore
    /* 1B7F4 8002B7F4 00000000 */   nop
    /* 1B7F8 8002B7F8 1800028E */  lw         $v0, 0x18($s0)
    /* 1B7FC 8002B7FC 1423848F */  lw         $a0, %gp_rel(_lv)($gp)
    /* 1B800 8002B800 EFFF0324 */  addiu      $v1, $zero, -0x11
    /* 1B804 8002B804 24104300 */  and        $v0, $v0, $v1
    /* 1B808 8002B808 F3BD000C */  jal        unlocksemaphore
    /* 1B80C 8002B80C 180002AE */   sw        $v0, 0x18($s0)
    /* 1B810 8002B810 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1B814 8002B814 1000B08F */  lw         $s0, 0x10($sp)
    /* 1B818 8002B818 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1B81C 8002B81C 0800E003 */  jr         $ra
    /* 1B820 8002B820 00000000 */   nop
endlabel lockmemblock
