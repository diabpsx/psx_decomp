.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching OperateObject__FP12PlayerStructiUc, 0x44

glabel OperateObject__FP12PlayerStructiUc
    /* 56AC0 80066AC0 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 56AC4 80066AC4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 56AC8 80066AC8 2188A000 */  addu       $s1, $a1, $zero
    /* 56ACC 80066ACC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 56AD0 80066AD0 1800BFAF */  sw         $ra, 0x18($sp)
    /* 56AD4 80066AD4 787F010C */  jal        plrind__FP12PlayerStruct
    /* 56AD8 80066AD8 2180C000 */   addu      $s0, $a2, $zero
    /* 56ADC 80066ADC 21204000 */  addu       $a0, $v0, $zero
    /* 56AE0 80066AE0 21282002 */  addu       $a1, $s1, $zero
    /* 56AE4 80066AE4 8C76010C */  jal        OperateObject__FiiUc
    /* 56AE8 80066AE8 FF000632 */   andi      $a2, $s0, 0xFF
    /* 56AEC 80066AEC 1800BF8F */  lw         $ra, 0x18($sp)
    /* 56AF0 80066AF0 1400B18F */  lw         $s1, 0x14($sp)
    /* 56AF4 80066AF4 1000B08F */  lw         $s0, 0x10($sp)
    /* 56AF8 80066AF8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 56AFC 80066AFC 0800E003 */  jr         $ra
    /* 56B00 80066B00 00000000 */   nop
endlabel OperateObject__FP12PlayerStructiUc
