.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching NetSendCmdDelItem__FUcUc, 0x30

glabel NetSendCmdDelItem__FUcUc
    /* 3FD98 8004FD98 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 3FD9C 8004FD9C 31000224 */  addiu      $v0, $zero, 0x31
    /* 3FDA0 8004FDA0 1000A427 */  addiu      $a0, $sp, 0x10
    /* 3FDA4 8004FDA4 1100A5A3 */  sb         $a1, 0x11($sp)
    /* 3FDA8 8004FDA8 02000524 */  addiu      $a1, $zero, 0x2
    /* 3FDAC 8004FDAC 1800BFAF */  sw         $ra, 0x18($sp)
    /* 3FDB0 8004FDB0 E94A010C */  jal        NetSendLoPri__FPCUcUc
    /* 3FDB4 8004FDB4 1000A2A3 */   sb        $v0, 0x10($sp)
    /* 3FDB8 8004FDB8 1800BF8F */  lw         $ra, 0x18($sp)
    /* 3FDBC 8004FDBC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 3FDC0 8004FDC0 0800E003 */  jr         $ra
    /* 3FDC4 8004FDC4 00000000 */   nop
endlabel NetSendCmdDelItem__FUcUc
