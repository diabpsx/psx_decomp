.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CreatePlrItems__FP12PlayerStruct, 0x28

glabel CreatePlrItems__FP12PlayerStruct
    /* 56778 80066778 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 5677C 8006677C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 56780 80066780 787F010C */  jal        plrind__FP12PlayerStruct
    /* 56784 80066784 00000000 */   nop
    /* 56788 80066788 ABFF000C */  jal        CreatePlrItems__Fi
    /* 5678C 8006678C 21204000 */   addu      $a0, $v0, $zero
    /* 56790 80066790 1000BF8F */  lw         $ra, 0x10($sp)
    /* 56794 80066794 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 56798 80066798 0800E003 */  jr         $ra
    /* 5679C 8006679C 00000000 */   nop
endlabel CreatePlrItems__FP12PlayerStruct
