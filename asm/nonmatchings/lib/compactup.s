.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching compactup, 0x54

glabel compactup
    /* 1BB50 8002BB50 1280043C */  lui        $a0, %hi(_lv)
    /* 1BB54 8002BB54 94CA848C */  lw         $a0, %lo(_lv)($a0)
    /* 1BB58 8002BB58 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1BB5C 8002BB5C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1BB60 8002BB60 E8BD000C */  jal        locksemaphore
    /* 1BB64 8002BB64 00000000 */   nop
    /* 1BB68 8002BB68 1280023C */  lui        $v0, %hi(defaultmc)
    /* 1BB6C 8002BB6C A0C4428C */  lw         $v0, %lo(defaultmc)($v0)
    /* 1BB70 8002BB70 00000000 */  nop
    /* 1BB74 8002BB74 0400448C */  lw         $a0, 0x4($v0)
    /* 1BB78 8002BB78 0000458C */  lw         $a1, 0x0($v0)
    /* 1BB7C 8002BB7C E9AE000C */  jal        compactupi
    /* 1BB80 8002BB80 00000000 */   nop
    /* 1BB84 8002BB84 1280043C */  lui        $a0, %hi(_lv)
    /* 1BB88 8002BB88 94CA848C */  lw         $a0, %lo(_lv)($a0)
    /* 1BB8C 8002BB8C F3BD000C */  jal        unlocksemaphore
    /* 1BB90 8002BB90 00000000 */   nop
    /* 1BB94 8002BB94 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1BB98 8002BB98 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1BB9C 8002BB9C 0800E003 */  jr         $ra
    /* 1BBA0 8002BBA0 00000000 */   nop
endlabel compactup
