.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TeleStart__FP12PlayerStruct, 0x28

glabel TeleStart__FP12PlayerStruct
    /* 56A14 80066A14 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 56A18 80066A18 1000BFAF */  sw         $ra, 0x10($sp)
    /* 56A1C 80066A1C 787F010C */  jal        plrind__FP12PlayerStruct
    /* 56A20 80066A20 00000000 */   nop
    /* 56A24 80066A24 D380020C */  jal        TeleStart__Fi
    /* 56A28 80066A28 21204000 */   addu      $a0, $v0, $zero
    /* 56A2C 80066A2C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 56A30 80066A30 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 56A34 80066A34 0800E003 */  jr         $ra
    /* 56A38 80066A38 00000000 */   nop
endlabel TeleStart__FP12PlayerStruct
