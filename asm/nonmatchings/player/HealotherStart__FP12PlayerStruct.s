.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching HealotherStart__FP12PlayerStruct, 0x28

glabel HealotherStart__FP12PlayerStruct
    /* 5697C 8006697C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 56980 80066980 1000BFAF */  sw         $ra, 0x10($sp)
    /* 56984 80066984 787F010C */  jal        plrind__FP12PlayerStruct
    /* 56988 80066988 00000000 */   nop
    /* 5698C 8006698C C580020C */  jal        HealotherStart__Fi
    /* 56990 80066990 21204000 */   addu      $a0, $v0, $zero
    /* 56994 80066994 1000BF8F */  lw         $ra, 0x10($sp)
    /* 56998 80066998 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 5699C 8006699C 0800E003 */  jr         $ra
    /* 569A0 800669A0 00000000 */   nop
endlabel HealotherStart__FP12PlayerStruct
