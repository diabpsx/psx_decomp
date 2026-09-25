.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching NetSendCmdParam1__FUcUcUs, 0x2C

glabel NetSendCmdParam1__FUcUcUs
    /* 3F834 8004F834 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 3F838 8004F838 1000A427 */  addiu      $a0, $sp, 0x10
    /* 3F83C 8004F83C 1000A5A3 */  sb         $a1, 0x10($sp)
    /* 3F840 8004F840 04000524 */  addiu      $a1, $zero, 0x4
    /* 3F844 8004F844 1800BFAF */  sw         $ra, 0x18($sp)
    /* 3F848 8004F848 E94A010C */  jal        NetSendLoPri__FPCUcUc
    /* 3F84C 8004F84C 1200A6A7 */   sh        $a2, 0x12($sp)
    /* 3F850 8004F850 1800BF8F */  lw         $ra, 0x18($sp)
    /* 3F854 8004F854 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 3F858 8004F858 0800E003 */  jr         $ra
    /* 3F85C 8004F85C 00000000 */   nop
endlabel NetSendCmdParam1__FUcUcUs
