.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SPU_OnceOnlyInit__Fv, 0x38

glabel SPU_OnceOnlyInit__Fv
    /* 8A224 8009A224 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8A228 8009A228 1000BFAF */  sw         $ra, 0x10($sp)
    /* 8A22C 8009A22C 9768020C */  jal        SPU_Init__Fv
    /* 8A230 8009A230 00000000 */   nop
    /* 8A234 8009A234 00800434 */  ori        $a0, $zero, 0x8000
    /* 8A238 8009A238 0A80053C */  lui        $a1, %hi(SND_Monitor__FP4TASK)
    /* 8A23C 8009A23C 98A1A524 */  addiu      $a1, $a1, %lo(SND_Monitor__FP4TASK)
    /* 8A240 8009A240 00040624 */  addiu      $a2, $zero, 0x400
    /* 8A244 8009A244 0480000C */  jal        TSK_AddTask
    /* 8A248 8009A248 21380000 */   addu      $a3, $zero, $zero
    /* 8A24C 8009A24C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 8A250 8009A250 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 8A254 8009A254 0800E003 */  jr         $ra
    /* 8A258 8009A258 00000000 */   nop
endlabel SPU_OnceOnlyInit__Fv
