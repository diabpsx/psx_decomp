.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching tony__Fv, 0x40

glabel tony__Fv
    /* 8B9CC 8009B9CC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8B9D0 8009B9D0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 8B9D4 8009B9D4 0A80043C */  lui        $a0, %hi(new_eprint__FPcT0i)
    /* 8B9D8 8009B9D8 40B38424 */  addiu      $a0, $a0, %lo(new_eprint__FPcT0i)
    /* 8B9DC 8009B9DC B283000C */  jal        DBG_SetErrorFunc
    /* 8B9E0 8009B9E0 00000000 */   nop
    /* 8B9E4 8009B9E4 0A80043C */  lui        $a0, %hi(TonysDummyPoll__Fv)
    /* 8B9E8 8009B9E8 2CB88424 */  addiu      $a0, $a0, %lo(TonysDummyPoll__Fv)
    /* 8B9EC 8009B9EC B883000C */  jal        DBG_SetPollRoutine
    /* 8B9F0 8009B9F0 00000000 */   nop
    /* 8B9F4 8009B9F4 196E020C */  jal        ClearTonyPoll__Fv
    /* 8B9F8 8009B9F8 00000000 */   nop
    /* 8B9FC 8009B9FC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 8BA00 8009BA00 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 8BA04 8009BA04 0800E003 */  jr         $ra
    /* 8BA08 8009BA08 00000000 */   nop
endlabel tony__Fv
