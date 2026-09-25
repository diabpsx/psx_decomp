.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching NetSendCmdLocParam1__FUcUcUcUcUs, 0x38

glabel NetSendCmdLocParam1__FUcUcUcUcUs
    /* 3F774 8004F774 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 3F778 8004F778 3000A297 */  lhu        $v0, 0x30($sp)
    /* 3F77C 8004F77C 1000A427 */  addiu      $a0, $sp, 0x10
    /* 3F780 8004F780 1000A5A3 */  sb         $a1, 0x10($sp)
    /* 3F784 8004F784 06000524 */  addiu      $a1, $zero, 0x6
    /* 3F788 8004F788 1800BFAF */  sw         $ra, 0x18($sp)
    /* 3F78C 8004F78C 1100A6A3 */  sb         $a2, 0x11($sp)
    /* 3F790 8004F790 1200A7A3 */  sb         $a3, 0x12($sp)
    /* 3F794 8004F794 E94A010C */  jal        NetSendLoPri__FPCUcUc
    /* 3F798 8004F798 1400A2A7 */   sh        $v0, 0x14($sp)
    /* 3F79C 8004F79C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 3F7A0 8004F7A0 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 3F7A4 8004F7A4 0800E003 */  jr         $ra
    /* 3F7A8 8004F7A8 00000000 */   nop
endlabel NetSendCmdLocParam1__FUcUcUcUcUs
