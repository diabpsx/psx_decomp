.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PhaseStart__FP12PlayerStruct, 0x28

glabel PhaseStart__FP12PlayerStruct
    /* 56A3C 80066A3C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 56A40 80066A40 1000BFAF */  sw         $ra, 0x10($sp)
    /* 56A44 80066A44 787F010C */  jal        plrind__FP12PlayerStruct
    /* 56A48 80066A48 00000000 */   nop
    /* 56A4C 80066A4C 0E81020C */  jal        PhaseStart__Fi
    /* 56A50 80066A50 21204000 */   addu      $a0, $v0, $zero
    /* 56A54 80066A54 1000BF8F */  lw         $ra, 0x10($sp)
    /* 56A58 80066A58 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 56A5C 80066A5C 0800E003 */  jr         $ra
    /* 56A60 80066A60 00000000 */   nop
endlabel PhaseStart__FP12PlayerStruct
