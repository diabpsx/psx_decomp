.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching NetSendCmdReq2__FUcUcUcPC9TCmdGItem, 0x60

glabel NetSendCmdReq2__FUcUcUcPC9TCmdGItem
    /* 3FB08 8004FB08 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 3FB0C 8004FB0C 0000E28C */  lw         $v0, 0x0($a3)
    /* 3FB10 8004FB10 0400E38C */  lw         $v1, 0x4($a3)
    /* 3FB14 8004FB14 0800E88C */  lw         $t0, 0x8($a3)
    /* 3FB18 8004FB18 0C00E98C */  lw         $t1, 0xC($a3)
    /* 3FB1C 8004FB1C 0000A2AF */  sw         $v0, 0x0($sp)
    /* 3FB20 8004FB20 0400A3AF */  sw         $v1, 0x4($sp)
    /* 3FB24 8004FB24 0800A8AF */  sw         $t0, 0x8($sp)
    /* 3FB28 8004FB28 0C00A9AF */  sw         $t1, 0xC($sp)
    /* 3FB2C 8004FB2C 1000E28C */  lw         $v0, 0x10($a3)
    /* 3FB30 8004FB30 1400E38C */  lw         $v1, 0x14($a3)
    /* 3FB34 8004FB34 1800E88C */  lw         $t0, 0x18($a3)
    /* 3FB38 8004FB38 1C00E98C */  lw         $t1, 0x1C($a3)
    /* 3FB3C 8004FB3C 1000A2AF */  sw         $v0, 0x10($sp)
    /* 3FB40 8004FB40 1400A3AF */  sw         $v1, 0x14($sp)
    /* 3FB44 8004FB44 1800A8AF */  sw         $t0, 0x18($sp)
    /* 3FB48 8004FB48 1C00A9AF */  sw         $t1, 0x1C($sp)
    /* 3FB4C 8004FB4C 01000224 */  addiu      $v0, $zero, 0x1
    /* 3FB50 8004FB50 0000A4A3 */  sb         $a0, 0x0($sp)
    /* 3FB54 8004FB54 0200A6A3 */  sb         $a2, 0x2($sp)
    /* 3FB58 8004FB58 0100A5A3 */  sb         $a1, 0x1($sp)
    /* 3FB5C 8004FB5C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 3FB60 8004FB60 0800E003 */  jr         $ra
    /* 3FB64 8004FB64 00000000 */   nop
endlabel NetSendCmdReq2__FUcUcUcPC9TCmdGItem
