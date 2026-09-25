.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching NetSendCmdDamage__FUcUcUl, 0x34

glabel NetSendCmdDamage__FUcUcUl
    /* 3FEF8 8004FEF8 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 3FEFC 8004FEFC 32000224 */  addiu      $v0, $zero, 0x32
    /* 3FF00 8004FF00 1000A427 */  addiu      $a0, $sp, 0x10
    /* 3FF04 8004FF04 1100A5A3 */  sb         $a1, 0x11($sp)
    /* 3FF08 8004FF08 08000524 */  addiu      $a1, $zero, 0x8
    /* 3FF0C 8004FF0C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 3FF10 8004FF10 1000A2A3 */  sb         $v0, 0x10($sp)
    /* 3FF14 8004FF14 E94A010C */  jal        NetSendLoPri__FPCUcUc
    /* 3FF18 8004FF18 1400A6AF */   sw        $a2, 0x14($sp)
    /* 3FF1C 8004FF1C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 3FF20 8004FF20 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 3FF24 8004FF24 0800E003 */  jr         $ra
    /* 3FF28 8004FF28 00000000 */   nop
endlabel NetSendCmdDamage__FUcUcUl
