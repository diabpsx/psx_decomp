.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching NetSendCmdExtra__FPC9TCmdGItem, 0x70

glabel NetSendCmdExtra__FPC9TCmdGItem
    /* 3FB68 8004FB68 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 3FB6C 8004FB6C 3000BFAF */  sw         $ra, 0x30($sp)
    /* 3FB70 8004FB70 0000828C */  lw         $v0, 0x0($a0)
    /* 3FB74 8004FB74 0400838C */  lw         $v1, 0x4($a0)
    /* 3FB78 8004FB78 0800858C */  lw         $a1, 0x8($a0)
    /* 3FB7C 8004FB7C 0C00868C */  lw         $a2, 0xC($a0)
    /* 3FB80 8004FB80 1000A2AF */  sw         $v0, 0x10($sp)
    /* 3FB84 8004FB84 1400A3AF */  sw         $v1, 0x14($sp)
    /* 3FB88 8004FB88 1800A5AF */  sw         $a1, 0x18($sp)
    /* 3FB8C 8004FB8C 1C00A6AF */  sw         $a2, 0x1C($sp)
    /* 3FB90 8004FB90 1000828C */  lw         $v0, 0x10($a0)
    /* 3FB94 8004FB94 1400838C */  lw         $v1, 0x14($a0)
    /* 3FB98 8004FB98 1800858C */  lw         $a1, 0x18($a0)
    /* 3FB9C 8004FB9C 1C00868C */  lw         $a2, 0x1C($a0)
    /* 3FBA0 8004FBA0 2000A2AF */  sw         $v0, 0x20($sp)
    /* 3FBA4 8004FBA4 2400A3AF */  sw         $v1, 0x24($sp)
    /* 3FBA8 8004FBA8 2800A5AF */  sw         $a1, 0x28($sp)
    /* 3FBAC 8004FBAC 2C00A6AF */  sw         $a2, 0x2C($sp)
    /* 3FBB0 8004FBB0 55000224 */  addiu      $v0, $zero, 0x55
    /* 3FBB4 8004FBB4 1000A427 */  addiu      $a0, $sp, 0x10
    /* 3FBB8 8004FBB8 20000524 */  addiu      $a1, $zero, 0x20
    /* 3FBBC 8004FBBC 1000A2A3 */  sb         $v0, 0x10($sp)
    /* 3FBC0 8004FBC0 E94A010C */  jal        NetSendLoPri__FPCUcUc
    /* 3FBC4 8004FBC4 2C00A0AF */   sw        $zero, 0x2C($sp)
    /* 3FBC8 8004FBC8 3000BF8F */  lw         $ra, 0x30($sp)
    /* 3FBCC 8004FBCC 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 3FBD0 8004FBD0 0800E003 */  jr         $ra
    /* 3FBD4 8004FBD4 00000000 */   nop
endlabel NetSendCmdExtra__FPC9TCmdGItem
