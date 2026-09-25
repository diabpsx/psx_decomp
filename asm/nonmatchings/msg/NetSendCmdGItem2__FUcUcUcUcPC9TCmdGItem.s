.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching NetSendCmdGItem2__FUcUcUcUcPC9TCmdGItem, 0x84

glabel NetSendCmdGItem2__FUcUcUcUcPC9TCmdGItem
    /* 3FA84 8004FA84 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 3FA88 8004FA88 4800A28F */  lw         $v0, 0x48($sp)
    /* 3FA8C 8004FA8C FF008430 */  andi       $a0, $a0, 0xFF
    /* 3FA90 8004FA90 3000BFAF */  sw         $ra, 0x30($sp)
    /* 3FA94 8004FA94 0000438C */  lw         $v1, 0x0($v0)
    /* 3FA98 8004FA98 0400488C */  lw         $t0, 0x4($v0)
    /* 3FA9C 8004FA9C 0800498C */  lw         $t1, 0x8($v0)
    /* 3FAA0 8004FAA0 0C004A8C */  lw         $t2, 0xC($v0)
    /* 3FAA4 8004FAA4 1000A3AF */  sw         $v1, 0x10($sp)
    /* 3FAA8 8004FAA8 1400A8AF */  sw         $t0, 0x14($sp)
    /* 3FAAC 8004FAAC 1800A9AF */  sw         $t1, 0x18($sp)
    /* 3FAB0 8004FAB0 1C00AAAF */  sw         $t2, 0x1C($sp)
    /* 3FAB4 8004FAB4 1000438C */  lw         $v1, 0x10($v0)
    /* 3FAB8 8004FAB8 1400488C */  lw         $t0, 0x14($v0)
    /* 3FABC 8004FABC 1800498C */  lw         $t1, 0x18($v0)
    /* 3FAC0 8004FAC0 1C004A8C */  lw         $t2, 0x1C($v0)
    /* 3FAC4 8004FAC4 2000A3AF */  sw         $v1, 0x20($sp)
    /* 3FAC8 8004FAC8 2400A8AF */  sw         $t0, 0x24($sp)
    /* 3FACC 8004FACC 2800A9AF */  sw         $t1, 0x28($sp)
    /* 3FAD0 8004FAD0 2C00AAAF */  sw         $t2, 0x2C($sp)
    /* 3FAD4 8004FAD4 1000A227 */  addiu      $v0, $sp, 0x10
    /* 3FAD8 8004FAD8 1000A5A3 */  sb         $a1, 0x10($sp)
    /* 3FADC 8004FADC 1200A7A3 */  sb         $a3, 0x12($sp)
    /* 3FAE0 8004FAE0 05008014 */  bnez       $a0, .L8004FAF8
    /* 3FAE4 8004FAE4 1100A6A3 */   sb        $a2, 0x11($sp)
    /* 3FAE8 8004FAE8 2C00A0AF */  sw         $zero, 0x2C($sp)
    /* 3FAEC 8004FAEC 21204000 */  addu       $a0, $v0, $zero
    /* 3FAF0 8004FAF0 E94A010C */  jal        NetSendLoPri__FPCUcUc
    /* 3FAF4 8004FAF4 20000524 */   addiu     $a1, $zero, 0x20
  .L8004FAF8:
    /* 3FAF8 8004FAF8 3000BF8F */  lw         $ra, 0x30($sp)
    /* 3FAFC 8004FAFC 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 3FB00 8004FB00 0800E003 */  jr         $ra
    /* 3FB04 8004FB04 00000000 */   nop
endlabel NetSendCmdGItem2__FUcUcUcUcPC9TCmdGItem
