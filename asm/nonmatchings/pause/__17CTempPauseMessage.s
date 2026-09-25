.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __17CTempPauseMessage, 0x44

glabel __17CTempPauseMessage
    /* 79338 80089338 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 7933C 8008933C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 79340 80089340 1400BFAF */  sw         $ra, 0x14($sp)
    /* 79344 80089344 EC24020C */  jal        __14CPauseMessages
    /* 79348 80089348 21808000 */   addu      $s0, $a0, $zero
    /* 7934C 8008934C 21200000 */  addu       $a0, $zero, $zero
    /* 79350 80089350 1180023C */  lui        $v0, %hi(_vt_17CTempPauseMessage)
    /* 79354 80089354 D0034224 */  addiu      $v0, $v0, %lo(_vt_17CTempPauseMessage)
    /* 79358 80089358 044F020C */  jal        GM_UseTexData__Fi
    /* 7935C 8008935C 040002AE */   sw        $v0, 0x4($s0)
    /* 79360 80089360 080002AE */  sw         $v0, 0x8($s0)
    /* 79364 80089364 21100002 */  addu       $v0, $s0, $zero
    /* 79368 80089368 1400BF8F */  lw         $ra, 0x14($sp)
    /* 7936C 8008936C 1000B08F */  lw         $s0, 0x10($sp)
    /* 79370 80089370 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 79374 80089374 0800E003 */  jr         $ra
    /* 79378 80089378 00000000 */   nop
endlabel __17CTempPauseMessage
