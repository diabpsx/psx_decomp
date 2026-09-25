.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching NetSendCmdLoc__FUcUcUcUc, 0x30

glabel NetSendCmdLoc__FUcUcUcUc
    /* 3F744 8004F744 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 3F748 8004F748 1000A427 */  addiu      $a0, $sp, 0x10
    /* 3F74C 8004F74C 1000A5A3 */  sb         $a1, 0x10($sp)
    /* 3F750 8004F750 03000524 */  addiu      $a1, $zero, 0x3
    /* 3F754 8004F754 1800BFAF */  sw         $ra, 0x18($sp)
    /* 3F758 8004F758 1100A6A3 */  sb         $a2, 0x11($sp)
    /* 3F75C 8004F75C E94A010C */  jal        NetSendLoPri__FPCUcUc
    /* 3F760 8004F760 1200A7A3 */   sb        $a3, 0x12($sp)
    /* 3F764 8004F764 1800BF8F */  lw         $ra, 0x18($sp)
    /* 3F768 8004F768 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 3F76C 8004F76C 0800E003 */  jr         $ra
    /* 3F770 8004F770 00000000 */   nop
endlabel NetSendCmdLoc__FUcUcUcUc
