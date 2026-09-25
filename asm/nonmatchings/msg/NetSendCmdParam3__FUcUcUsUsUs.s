.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching NetSendCmdParam3__FUcUcUsUsUs, 0x38

glabel NetSendCmdParam3__FUcUcUsUsUs
    /* 3F890 8004F890 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 3F894 8004F894 3000A297 */  lhu        $v0, 0x30($sp)
    /* 3F898 8004F898 1000A427 */  addiu      $a0, $sp, 0x10
    /* 3F89C 8004F89C 1000A5A3 */  sb         $a1, 0x10($sp)
    /* 3F8A0 8004F8A0 08000524 */  addiu      $a1, $zero, 0x8
    /* 3F8A4 8004F8A4 1800BFAF */  sw         $ra, 0x18($sp)
    /* 3F8A8 8004F8A8 1200A6A7 */  sh         $a2, 0x12($sp)
    /* 3F8AC 8004F8AC 1400A7A7 */  sh         $a3, 0x14($sp)
    /* 3F8B0 8004F8B0 E94A010C */  jal        NetSendLoPri__FPCUcUc
    /* 3F8B4 8004F8B4 1600A2A7 */   sh        $v0, 0x16($sp)
    /* 3F8B8 8004F8B8 1800BF8F */  lw         $ra, 0x18($sp)
    /* 3F8BC 8004F8BC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 3F8C0 8004F8C0 0800E003 */  jr         $ra
    /* 3F8C4 8004F8C4 00000000 */   nop
endlabel NetSendCmdParam3__FUcUcUsUsUs
