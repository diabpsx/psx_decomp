.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetSpellLevel__FP12PlayerStructi, 0x34

glabel GetSpellLevel__FP12PlayerStructi
    /* 56818 80066818 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 5681C 8006681C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 56820 80066820 1400BFAF */  sw         $ra, 0x14($sp)
    /* 56824 80066824 787F010C */  jal        plrind__FP12PlayerStruct
    /* 56828 80066828 2180A000 */   addu      $s0, $a1, $zero
    /* 5682C 8006682C 21204000 */  addu       $a0, $v0, $zero
    /* 56830 80066830 0FE9040C */  jal        func_8013A43C
    /* 56834 80066834 21280002 */   addu      $a1, $s0, $zero
    /* 56838 80066838 1400BF8F */  lw         $ra, 0x14($sp)
    /* 5683C 8006683C 1000B08F */  lw         $s0, 0x10($sp)
    /* 56840 80066840 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 56844 80066844 0800E003 */  jr         $ra
    /* 56848 80066848 00000000 */   nop
endlabel GetSpellLevel__FP12PlayerStructi
