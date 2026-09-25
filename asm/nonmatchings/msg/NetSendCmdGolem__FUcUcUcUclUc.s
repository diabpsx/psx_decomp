.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching NetSendCmdGolem__FUcUcUcUclUc, 0x4C

glabel NetSendCmdGolem__FUcUcUcUclUc
    /* 3F6F8 8004F6F8 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 3F6FC 8004F6FC 3000A28F */  lw         $v0, 0x30($sp)
    /* 3F700 8004F700 3400A893 */  lbu        $t0, 0x34($sp)
    /* 3F704 8004F704 5A000324 */  addiu      $v1, $zero, 0x5A
    /* 3F708 8004F708 1100A4A3 */  sb         $a0, 0x11($sp)
    /* 3F70C 8004F70C 1000A427 */  addiu      $a0, $sp, 0x10
    /* 3F710 8004F710 1200A5A3 */  sb         $a1, 0x12($sp)
    /* 3F714 8004F714 08000524 */  addiu      $a1, $zero, 0x8
    /* 3F718 8004F718 1800BFAF */  sw         $ra, 0x18($sp)
    /* 3F71C 8004F71C 1000A3A3 */  sb         $v1, 0x10($sp)
    /* 3F720 8004F720 1300A6A3 */  sb         $a2, 0x13($sp)
    /* 3F724 8004F724 1400A7A3 */  sb         $a3, 0x14($sp)
    /* 3F728 8004F728 1600A2A7 */  sh         $v0, 0x16($sp)
    /* 3F72C 8004F72C E94A010C */  jal        NetSendLoPri__FPCUcUc
    /* 3F730 8004F730 1500A8A3 */   sb        $t0, 0x15($sp)
    /* 3F734 8004F734 1800BF8F */  lw         $ra, 0x18($sp)
    /* 3F738 8004F738 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 3F73C 8004F73C 0800E003 */  jr         $ra
    /* 3F740 8004F740 00000000 */   nop
endlabel NetSendCmdGolem__FUcUcUcUclUc
