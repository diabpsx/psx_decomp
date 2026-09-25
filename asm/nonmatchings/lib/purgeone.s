.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching purgeone, 0x48

glabel purgeone
    /* 1B140 8002B140 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1B144 8002B144 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1B148 8002B148 21808000 */  addu       $s0, $a0, $zero
    /* 1B14C 8002B14C 1423848F */  lw         $a0, %gp_rel(_lv)($gp)
    /* 1B150 8002B150 1400BFAF */  sw         $ra, 0x14($sp)
    /* 1B154 8002B154 E8BD000C */  jal        locksemaphore
    /* 1B158 8002B158 00000000 */   nop
    /* 1B15C 8002B15C 62AC000C */  jal        purgeonei
    /* 1B160 8002B160 21200002 */   addu      $a0, $s0, $zero
    /* 1B164 8002B164 1423848F */  lw         $a0, %gp_rel(_lv)($gp)
    /* 1B168 8002B168 F3BD000C */  jal        unlocksemaphore
    /* 1B16C 8002B16C 21804000 */   addu      $s0, $v0, $zero
    /* 1B170 8002B170 21100002 */  addu       $v0, $s0, $zero
    /* 1B174 8002B174 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1B178 8002B178 1000B08F */  lw         $s0, 0x10($sp)
    /* 1B17C 8002B17C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1B180 8002B180 0800E003 */  jr         $ra
    /* 1B184 8002B184 00000000 */   nop
endlabel purgeone
