.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching streamreader, 0x4C

glabel streamreader
    /* 1D968 8002D968 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1D96C 8002D96C 1180023C */  lui        $v0, %hi(D_8010FAF8)
    /* 1D970 8002D970 F8FA4224 */  addiu      $v0, $v0, %lo(D_8010FAF8)
    /* 1D974 8002D974 1280013C */  lui        $at, %hi(abortfile)
    /* 1D978 8002D978 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1D97C 8002D97C 19070224 */  addiu      $v0, $zero, 0x719
    /* 1D980 8002D980 1180043C */  lui        $a0, %hi(D_8010FD38)
    /* 1D984 8002D984 38FD8424 */  addiu      $a0, $a0, %lo(D_8010FD38)
    /* 1D988 8002D988 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1D98C 8002D98C 1280013C */  lui        $at, %hi(abortline)
    /* 1D990 8002D990 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1D994 8002D994 0F95000C */  jal        abortmessage
    /* 1D998 8002D998 00000000 */   nop
    /* 1D99C 8002D99C 3FB6000C */  jal        PSXistreamreader
    /* 1D9A0 8002D9A0 00000000 */   nop
    /* 1D9A4 8002D9A4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1D9A8 8002D9A8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1D9AC 8002D9AC 0800E003 */  jr         $ra
    /* 1D9B0 8002D9B0 00000000 */   nop
endlabel streamreader
