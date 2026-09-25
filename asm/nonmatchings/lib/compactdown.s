.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching compactdown, 0x54

glabel compactdown
    /* 1BD1C 8002BD1C 1280043C */  lui        $a0, %hi(_lv)
    /* 1BD20 8002BD20 94CA848C */  lw         $a0, %lo(_lv)($a0)
    /* 1BD24 8002BD24 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1BD28 8002BD28 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1BD2C 8002BD2C E8BD000C */  jal        locksemaphore
    /* 1BD30 8002BD30 00000000 */   nop
    /* 1BD34 8002BD34 1280023C */  lui        $v0, %hi(defaultmc)
    /* 1BD38 8002BD38 A0C4428C */  lw         $v0, %lo(defaultmc)($v0)
    /* 1BD3C 8002BD3C 00000000 */  nop
    /* 1BD40 8002BD40 0000448C */  lw         $a0, 0x0($v0)
    /* 1BD44 8002BD44 0400458C */  lw         $a1, 0x4($v0)
    /* 1BD48 8002BD48 5CAF000C */  jal        compactdowni
    /* 1BD4C 8002BD4C 00000000 */   nop
    /* 1BD50 8002BD50 1280043C */  lui        $a0, %hi(_lv)
    /* 1BD54 8002BD54 94CA848C */  lw         $a0, %lo(_lv)($a0)
    /* 1BD58 8002BD58 F3BD000C */  jal        unlocksemaphore
    /* 1BD5C 8002BD5C 00000000 */   nop
    /* 1BD60 8002BD60 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1BD64 8002BD64 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1BD68 8002BD68 0800E003 */  jr         $ra
    /* 1BD6C 8002BD6C 00000000 */   nop
endlabel compactdown
