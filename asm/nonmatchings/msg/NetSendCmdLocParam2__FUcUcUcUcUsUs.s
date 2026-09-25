.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching NetSendCmdLocParam2__FUcUcUcUcUsUs, 0x40

glabel NetSendCmdLocParam2__FUcUcUcUcUsUs
    /* 3F7AC 8004F7AC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 3F7B0 8004F7B0 3000A297 */  lhu        $v0, 0x30($sp)
    /* 3F7B4 8004F7B4 3400A397 */  lhu        $v1, 0x34($sp)
    /* 3F7B8 8004F7B8 1000A427 */  addiu      $a0, $sp, 0x10
    /* 3F7BC 8004F7BC 1000A5A3 */  sb         $a1, 0x10($sp)
    /* 3F7C0 8004F7C0 08000524 */  addiu      $a1, $zero, 0x8
    /* 3F7C4 8004F7C4 1800BFAF */  sw         $ra, 0x18($sp)
    /* 3F7C8 8004F7C8 1100A6A3 */  sb         $a2, 0x11($sp)
    /* 3F7CC 8004F7CC 1200A7A3 */  sb         $a3, 0x12($sp)
    /* 3F7D0 8004F7D0 1400A2A7 */  sh         $v0, 0x14($sp)
    /* 3F7D4 8004F7D4 E94A010C */  jal        NetSendLoPri__FPCUcUc
    /* 3F7D8 8004F7D8 1600A3A7 */   sh        $v1, 0x16($sp)
    /* 3F7DC 8004F7DC 1800BF8F */  lw         $ra, 0x18($sp)
    /* 3F7E0 8004F7E0 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 3F7E4 8004F7E4 0800E003 */  jr         $ra
    /* 3F7E8 8004F7E8 00000000 */   nop
endlabel NetSendCmdLocParam2__FUcUcUcUcUsUs
