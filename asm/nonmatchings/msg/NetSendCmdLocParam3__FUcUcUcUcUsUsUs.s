.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching NetSendCmdLocParam3__FUcUcUcUcUsUsUs, 0x48

glabel NetSendCmdLocParam3__FUcUcUcUcUsUsUs
    /* 3F7EC 8004F7EC D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 3F7F0 8004F7F0 3800A297 */  lhu        $v0, 0x38($sp)
    /* 3F7F4 8004F7F4 3C00A397 */  lhu        $v1, 0x3C($sp)
    /* 3F7F8 8004F7F8 4000A497 */  lhu        $a0, 0x40($sp)
    /* 3F7FC 8004F7FC 1000A5A3 */  sb         $a1, 0x10($sp)
    /* 3F800 8004F800 0A000524 */  addiu      $a1, $zero, 0xA
    /* 3F804 8004F804 2000BFAF */  sw         $ra, 0x20($sp)
    /* 3F808 8004F808 1100A6A3 */  sb         $a2, 0x11($sp)
    /* 3F80C 8004F80C 1200A7A3 */  sb         $a3, 0x12($sp)
    /* 3F810 8004F810 1800A4A7 */  sh         $a0, 0x18($sp)
    /* 3F814 8004F814 1000A427 */  addiu      $a0, $sp, 0x10
    /* 3F818 8004F818 1400A2A7 */  sh         $v0, 0x14($sp)
    /* 3F81C 8004F81C E94A010C */  jal        NetSendLoPri__FPCUcUc
    /* 3F820 8004F820 1600A3A7 */   sh        $v1, 0x16($sp)
    /* 3F824 8004F824 2000BF8F */  lw         $ra, 0x20($sp)
    /* 3F828 8004F828 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 3F82C 8004F82C 0800E003 */  jr         $ra
    /* 3F830 8004F830 00000000 */   nop
endlabel NetSendCmdLocParam3__FUcUcUcUcUsUsUs
