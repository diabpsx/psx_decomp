.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FreeGameMem__Fv, 0x38

glabel FreeGameMem__Fv
    /* 27FAC 80037FAC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 27FB0 80037FB0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 27FB4 80037FB4 94DF010C */  jal        music_stop__Fv
    /* 27FB8 80037FB8 00000000 */   nop
    /* 27FBC 80037FBC D04D010C */  jal        FreeObjectGFX__Fv
    /* 27FC0 80037FC0 00000000 */   nop
    /* 27FC4 80037FC4 75F4000C */  jal        FreeMonsterSnd__Fv
    /* 27FC8 80037FC8 00000000 */   nop
    /* 27FCC 80037FCC 19EC000C */  jal        FreeTownerGFX__Fv
    /* 27FD0 80037FD0 00000000 */   nop
    /* 27FD4 80037FD4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 27FD8 80037FD8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 27FDC 80037FDC 0800E003 */  jr         $ra
    /* 27FE0 80037FE0 00000000 */   nop
endlabel FreeGameMem__Fv
