.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching NetSendCmd__FUcUc, 0x28

glabel NetSendCmd__FUcUc
    /* 3F6D0 8004F6D0 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 3F6D4 8004F6D4 1000A427 */  addiu      $a0, $sp, 0x10
    /* 3F6D8 8004F6D8 1000A5A3 */  sb         $a1, 0x10($sp)
    /* 3F6DC 8004F6DC 1800BFAF */  sw         $ra, 0x18($sp)
    /* 3F6E0 8004F6E0 E94A010C */  jal        NetSendLoPri__FPCUcUc
    /* 3F6E4 8004F6E4 01000524 */   addiu     $a1, $zero, 0x1
    /* 3F6E8 8004F6E8 1800BF8F */  lw         $ra, 0x18($sp)
    /* 3F6EC 8004F6EC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 3F6F0 8004F6F0 0800E003 */  jr         $ra
    /* 3F6F4 8004F6F4 00000000 */   nop
endlabel NetSendCmd__FUcUc
