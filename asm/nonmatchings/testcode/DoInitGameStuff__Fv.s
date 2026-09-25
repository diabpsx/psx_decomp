.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DoInitGameStuff__Fv, 0x34

glabel DoInitGameStuff__Fv
    /* 6B19C 8007B19C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 6B1A0 8007B1A0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 6B1A4 8007B1A4 84EC010C */  jal        GRL_InitGwin__Fv
    /* 6B1A8 8007B1A8 00000000 */   nop
    /* 6B1AC 8007B1AC AEE7000C */  jal        alloc_plr__Fv
    /* 6B1B0 8007B1B0 00000000 */   nop
    /* 6B1B4 8007B1B4 01000424 */  addiu      $a0, $zero, 0x1
    /* 6B1B8 8007B1B8 52E0000C */  jal        LittleStart__FUcUc
    /* 6B1BC 8007B1BC 01000524 */   addiu     $a1, $zero, 0x1
    /* 6B1C0 8007B1C0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 6B1C4 8007B1C4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 6B1C8 8007B1C8 0800E003 */  jr         $ra
    /* 6B1CC 8007B1CC 00000000 */   nop
endlabel DoInitGameStuff__Fv
