.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DaveL__Fv, 0x28

glabel DaveL__Fv
    /* 8E3FC 8009E3FC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8E400 8009E400 1000BFAF */  sw         $ra, 0x10($sp)
    /* 8E404 8009E404 0A80043C */  lui        $a0, %hi(DaveLDummyPoll__Fv)
    /* 8E408 8009E408 F4E38424 */  addiu      $a0, $a0, %lo(DaveLDummyPoll__Fv)
    /* 8E40C 8009E40C B883000C */  jal        DBG_SetPollRoutine
    /* 8E410 8009E410 00000000 */   nop
    /* 8E414 8009E414 1000BF8F */  lw         $ra, 0x10($sp)
    /* 8E418 8009E418 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 8E41C 8009E41C 0800E003 */  jr         $ra
    /* 8E420 8009E420 00000000 */   nop
endlabel DaveL__Fv
