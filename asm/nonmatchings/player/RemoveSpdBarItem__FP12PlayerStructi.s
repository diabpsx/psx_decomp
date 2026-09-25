.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RemoveSpdBarItem__FP12PlayerStructi, 0x34

glabel RemoveSpdBarItem__FP12PlayerStructi
    /* 568B4 800668B4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 568B8 800668B8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 568BC 800668BC 1400BFAF */  sw         $ra, 0x14($sp)
    /* 568C0 800668C0 787F010C */  jal        plrind__FP12PlayerStruct
    /* 568C4 800668C4 2180A000 */   addu      $s0, $a1, $zero
    /* 568C8 800668C8 21204000 */  addu       $a0, $v0, $zero
    /* 568CC 800668CC 6B76050C */  jal        func_8015D9AC
    /* 568D0 800668D0 21280002 */   addu      $a1, $s0, $zero
    /* 568D4 800668D4 1400BF8F */  lw         $ra, 0x14($sp)
    /* 568D8 800668D8 1000B08F */  lw         $s0, 0x10($sp)
    /* 568DC 800668DC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 568E0 800668E0 0800E003 */  jr         $ra
    /* 568E4 800668E4 00000000 */   nop
endlabel RemoveSpdBarItem__FP12PlayerStructi
