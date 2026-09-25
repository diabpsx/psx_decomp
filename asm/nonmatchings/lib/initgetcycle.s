.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching initgetcycle, 0x74

glabel initgetcycle
    /* 1FB38 8002FB38 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1FB3C 8002FB3C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1FB40 8002FB40 6346000C */  jal        EnterCriticalSection
    /* 1FB44 8002FB44 00000000 */   nop
    /* 1FB48 8002FB48 0380053C */  lui        $a1, %hi(getcycleint)
    /* 1FB4C 8002FB4C D8FAA524 */  addiu      $a1, $a1, %lo(getcycleint)
    /* 1FB50 8002FB50 AB48000C */  jal        InterruptCallback
    /* 1FB54 8002FB54 05000424 */   addiu     $a0, $zero, 0x5
    /* 1FB58 8002FB58 0380043C */  lui        $a0, %hi(restoregetcycle)
    /* 1FB5C 8002FB5C 14FB8424 */  addiu      $a0, $a0, %lo(restoregetcycle)
    /* 1FB60 8002FB60 B6BD000C */  jal        addexit
    /* 1FB64 8002FB64 00000000 */   nop
    /* 1FB68 8002FB68 00F2043C */  lui        $a0, (0xF2000001 >> 16)
    /* 1FB6C 8002FB6C 01008434 */  ori        $a0, $a0, (0xF2000001 & 0xFFFF)
    /* 1FB70 8002FB70 FFFF0534 */  ori        $a1, $zero, 0xFFFF
    /* 1FB74 8002FB74 FF83000C */  jal        SetRCnt
    /* 1FB78 8002FB78 00100624 */   addiu     $a2, $zero, 0x1000
    /* 1FB7C 8002FB7C 58020224 */  addiu      $v0, $zero, 0x258
    /* 1FB80 8002FB80 00F2043C */  lui        $a0, (0xF2000001 >> 16)
    /* 1FB84 8002FB84 801F013C */  lui        $at, (0x1F801114 >> 16)
    /* 1FB88 8002FB88 141122AC */  sw         $v0, (0x1F801114 & 0xFFFF)($at)
    /* 1FB8C 8002FB8C 3484000C */  jal        StartRCnt
    /* 1FB90 8002FB90 01008434 */   ori       $a0, $a0, (0xF2000001 & 0xFFFF)
    /* 1FB94 8002FB94 6746000C */  jal        ExitCriticalSection
    /* 1FB98 8002FB98 00000000 */   nop
    /* 1FB9C 8002FB9C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1FBA0 8002FBA0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1FBA4 8002FBA4 0800E003 */  jr         $ra
    /* 1FBA8 8002FBA8 00000000 */   nop
endlabel initgetcycle
