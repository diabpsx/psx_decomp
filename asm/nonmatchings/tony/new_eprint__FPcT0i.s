.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching new_eprint__FPcT0i, 0x34

glabel new_eprint__FPcT0i
    /* 8B340 8009B340 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8B344 8009B344 1000BFAF */  sw         $ra, 0x10($sp)
    /* 8B348 8009B348 21388000 */  addu       $a3, $a0, $zero
    /* 8B34C 8009B34C 1180043C */  lui        $a0, %hi(D_80110AE8)
    /* 8B350 8009B350 E80A8424 */  addiu      $a0, $a0, %lo(D_80110AE8)
    /* 8B354 8009B354 9367000C */  jal        printf
    /* 8B358 8009B358 00000000 */   nop
    /* 8B35C 8009B35C 9983000C */  jal        DBG_Halt
    /* 8B360 8009B360 00000000 */   nop
    /* 8B364 8009B364 1000BF8F */  lw         $ra, 0x10($sp)
    /* 8B368 8009B368 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 8B36C 8009B36C 0800E003 */  jr         $ra
    /* 8B370 8009B370 00000000 */   nop
endlabel new_eprint__FPcT0i
