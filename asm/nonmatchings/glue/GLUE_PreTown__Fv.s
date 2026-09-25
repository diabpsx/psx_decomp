.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GLUE_PreTown__Fv, 0x30

glabel GLUE_PreTown__Fv
    /* 8BACC 8009BACC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8BAD0 8009BAD0 4A000524 */  addiu      $a1, $zero, 0x4A
    /* 8BAD4 8009BAD4 21300000 */  addu       $a2, $zero, $zero
    /* 8BAD8 8009BAD8 1280043C */  lui        $a0, %hi(ghMainWnd)
    /* 8BADC 8009BADC 88B7848C */  lw         $a0, %lo(ghMainWnd)($a0)
    /* 8BAE0 8009BAE0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 8BAE4 8009BAE4 95EC010C */  jal        GRL_PostMessage__FUlUilUl
    /* 8BAE8 8009BAE8 21380000 */   addu      $a3, $zero, $zero
    /* 8BAEC 8009BAEC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 8BAF0 8009BAF0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 8BAF4 8009BAF4 0800E003 */  jr         $ra
    /* 8BAF8 8009BAF8 00000000 */   nop
endlabel GLUE_PreTown__Fv
