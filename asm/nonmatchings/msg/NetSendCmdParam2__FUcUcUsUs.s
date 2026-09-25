.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching NetSendCmdParam2__FUcUcUsUs, 0x30

glabel NetSendCmdParam2__FUcUcUsUs
    /* 3F860 8004F860 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 3F864 8004F864 1000A427 */  addiu      $a0, $sp, 0x10
    /* 3F868 8004F868 1000A5A3 */  sb         $a1, 0x10($sp)
    /* 3F86C 8004F86C 06000524 */  addiu      $a1, $zero, 0x6
    /* 3F870 8004F870 1800BFAF */  sw         $ra, 0x18($sp)
    /* 3F874 8004F874 1200A6A7 */  sh         $a2, 0x12($sp)
    /* 3F878 8004F878 E94A010C */  jal        NetSendLoPri__FPCUcUc
    /* 3F87C 8004F87C 1400A7A7 */   sh        $a3, 0x14($sp)
    /* 3F880 8004F880 1800BF8F */  lw         $ra, 0x18($sp)
    /* 3F884 8004F884 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 3F888 8004F888 0800E003 */  jr         $ra
    /* 3F88C 8004F88C 00000000 */   nop
endlabel NetSendCmdParam2__FUcUcUsUs
