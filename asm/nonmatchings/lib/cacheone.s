.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching cacheone, 0x50

glabel cacheone
    /* 19DD0 80029DD0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 19DD4 80029DD4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 19DD8 80029DD8 21808000 */  addu       $s0, $a0, $zero
    /* 19DDC 80029DDC 1280043C */  lui        $a0, %hi(_lv)
    /* 19DE0 80029DE0 94CA848C */  lw         $a0, %lo(_lv)($a0)
    /* 19DE4 80029DE4 1400BFAF */  sw         $ra, 0x14($sp)
    /* 19DE8 80029DE8 E8BD000C */  jal        locksemaphore
    /* 19DEC 80029DEC 00000000 */   nop
    /* 19DF0 80029DF0 88A7000C */  jal        cacheonei
    /* 19DF4 80029DF4 21200002 */   addu      $a0, $s0, $zero
    /* 19DF8 80029DF8 1280043C */  lui        $a0, %hi(_lv)
    /* 19DFC 80029DFC 94CA848C */  lw         $a0, %lo(_lv)($a0)
    /* 19E00 80029E00 F3BD000C */  jal        unlocksemaphore
    /* 19E04 80029E04 21804000 */   addu      $s0, $v0, $zero
    /* 19E08 80029E08 21100002 */  addu       $v0, $s0, $zero
    /* 19E0C 80029E0C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 19E10 80029E10 1000B08F */  lw         $s0, 0x10($sp)
    /* 19E14 80029E14 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 19E18 80029E18 0800E003 */  jr         $ra
    /* 19E1C 80029E1C 00000000 */   nop
endlabel cacheone
