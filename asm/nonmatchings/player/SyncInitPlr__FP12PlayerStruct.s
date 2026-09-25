.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SyncInitPlr__FP12PlayerStruct, 0x30

glabel SyncInitPlr__FP12PlayerStruct
    /* 55B9C 80065B9C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 55BA0 80065BA0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 55BA4 80065BA4 1400BFAF */  sw         $ra, 0x14($sp)
    /* 55BA8 80065BA8 957F010C */  jal        SetPlrAnims__FP12PlayerStruct
    /* 55BAC 80065BAC 21808000 */   addu      $s0, $a0, $zero
    /* 55BB0 80065BB0 AD96010C */  jal        SyncInitPlrPos__FP12PlayerStruct
    /* 55BB4 80065BB4 21200002 */   addu      $a0, $s0, $zero
    /* 55BB8 80065BB8 1400BF8F */  lw         $ra, 0x14($sp)
    /* 55BBC 80065BBC 1000B08F */  lw         $s0, 0x10($sp)
    /* 55BC0 80065BC0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 55BC4 80065BC4 0800E003 */  jr         $ra
    /* 55BC8 80065BC8 00000000 */   nop
endlabel SyncInitPlr__FP12PlayerStruct
