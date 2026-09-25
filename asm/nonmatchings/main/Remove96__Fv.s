.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Remove96__Fv, 0x38

glabel Remove96__Fv
    /* 73128 80083128 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 7312C 8008312C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 73130 80083130 0280013C */  lui        $at, %hi(initpsxcdrom + 0x1C)
    /* 73134 80083134 607220AC */  sw         $zero, %lo(initpsxcdrom + 0x1C)($at)
    /* 73138 80083138 6346000C */  jal        EnterCriticalSection
    /* 7313C 8008313C 00000000 */   nop
    /* 73140 80083140 4F46000C */  jal        FlushCache
    /* 73144 80083144 00000000 */   nop
    /* 73148 80083148 6746000C */  jal        ExitCriticalSection
    /* 7314C 8008314C 00000000 */   nop
    /* 73150 80083150 1000BF8F */  lw         $ra, 0x10($sp)
    /* 73154 80083154 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 73158 80083158 0800E003 */  jr         $ra
    /* 7315C 8008315C 00000000 */   nop
endlabel Remove96__Fv
