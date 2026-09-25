.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CalculateGold__FP12PlayerStruct, 0x28

glabel CalculateGold__FP12PlayerStruct
    /* 569A4 800669A4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 569A8 800669A8 1000BFAF */  sw         $ra, 0x10($sp)
    /* 569AC 800669AC 787F010C */  jal        plrind__FP12PlayerStruct
    /* 569B0 800669B0 00000000 */   nop
    /* 569B4 800669B4 D982050C */  jal        func_80160B64
    /* 569B8 800669B8 21204000 */   addu      $a0, $v0, $zero
    /* 569BC 800669BC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 569C0 800669C0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 569C4 800669C4 0800E003 */  jr         $ra
    /* 569C8 800669C8 00000000 */   nop
endlabel CalculateGold__FP12PlayerStruct
