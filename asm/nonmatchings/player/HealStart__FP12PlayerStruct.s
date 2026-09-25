.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching HealStart__FP12PlayerStruct, 0x28

glabel HealStart__FP12PlayerStruct
    /* 56954 80066954 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 56958 80066958 1000BFAF */  sw         $ra, 0x10($sp)
    /* 5695C 8006695C 787F010C */  jal        plrind__FP12PlayerStruct
    /* 56960 80066960 00000000 */   nop
    /* 56964 80066964 B880020C */  jal        HealStart__Fi
    /* 56968 80066968 21204000 */   addu      $a0, $v0, $zero
    /* 5696C 8006696C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 56970 80066970 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 56974 80066974 0800E003 */  jr         $ra
    /* 56978 80066978 00000000 */   nop
endlabel HealStart__FP12PlayerStruct
