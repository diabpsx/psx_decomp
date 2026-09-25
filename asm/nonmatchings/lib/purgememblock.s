.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching purgememblock, 0x44

glabel purgememblock
    /* 1AF0C 8002AF0C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1AF10 8002AF10 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1AF14 8002AF14 21808000 */  addu       $s0, $a0, $zero
    /* 1AF18 8002AF18 1423848F */  lw         $a0, %gp_rel(_lv)($gp)
    /* 1AF1C 8002AF1C 1400BFAF */  sw         $ra, 0x14($sp)
    /* 1AF20 8002AF20 E8BD000C */  jal        locksemaphore
    /* 1AF24 8002AF24 00000000 */   nop
    /* 1AF28 8002AF28 D4AB000C */  jal        purgememblocki
    /* 1AF2C 8002AF2C 21200002 */   addu      $a0, $s0, $zero
    /* 1AF30 8002AF30 1423848F */  lw         $a0, %gp_rel(_lv)($gp)
    /* 1AF34 8002AF34 F3BD000C */  jal        unlocksemaphore
    /* 1AF38 8002AF38 00000000 */   nop
    /* 1AF3C 8002AF3C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1AF40 8002AF40 1000B08F */  lw         $s0, 0x10($sp)
    /* 1AF44 8002AF44 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1AF48 8002AF48 0800E003 */  jr         $ra
    /* 1AF4C 8002AF4C 00000000 */   nop
endlabel purgememblock
