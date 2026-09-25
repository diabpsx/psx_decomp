.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PAD_init, 0x98

glabel PAD_init
    /* 1B28 80011B28 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 1B2C 80011B2C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1B30 80011B30 21808000 */  addu       $s0, $a0, $zero
    /* 1B34 80011B34 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1B38 80011B38 2188A000 */  addu       $s1, $a1, $zero
    /* 1B3C 80011B3C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1B40 80011B40 2190C000 */  addu       $s2, $a2, $zero
    /* 1B44 80011B44 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1B48 80011B48 2000BFAF */  sw         $ra, 0x20($sp)
    /* 1B4C 80011B4C FB47000C */  jal        _remove_ChgclrPAD
    /* 1B50 80011B50 2198E000 */   addu      $s3, $a3, $zero
    /* 1B54 80011B54 6346000C */  jal        EnterCriticalSection
    /* 1B58 80011B58 00000000 */   nop
    /* 1B5C 80011B5C A947000C */  jal        _patch_pad
    /* 1B60 80011B60 00000000 */   nop
    /* 1B64 80011B64 6746000C */  jal        ExitCriticalSection
    /* 1B68 80011B68 00000000 */   nop
    /* 1B6C 80011B6C 9346000C */  jal        ChangeClearPAD
    /* 1B70 80011B70 21200000 */   addu      $a0, $zero, $zero
    /* 1B74 80011B74 3047000C */  jal        func_80011CC0
    /* 1B78 80011B78 00000000 */   nop
    /* 1B7C 80011B7C 21200002 */  addu       $a0, $s0, $zero
    /* 1B80 80011B80 21282002 */  addu       $a1, $s1, $zero
    /* 1B84 80011B84 21304002 */  addu       $a2, $s2, $zero
    /* 1B88 80011B88 9347000C */  jal        PAD_init2
    /* 1B8C 80011B8C 21386002 */   addu      $a3, $s3, $zero
    /* 1B90 80011B90 D247000C */  jal        _send_pad
    /* 1B94 80011B94 00000000 */   nop
    /* 1B98 80011B98 01000224 */  addiu      $v0, $zero, 0x1
    /* 1B9C 80011B9C 0B80013C */  lui        $at, %hi(D_800B42BC)
    /* 1BA0 80011BA0 BC4222AC */  sw         $v0, %lo(D_800B42BC)($at)
    /* 1BA4 80011BA4 2000BF8F */  lw         $ra, 0x20($sp)
    /* 1BA8 80011BA8 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 1BAC 80011BAC 1800B28F */  lw         $s2, 0x18($sp)
    /* 1BB0 80011BB0 1400B18F */  lw         $s1, 0x14($sp)
    /* 1BB4 80011BB4 1000B08F */  lw         $s0, 0x10($sp)
    /* 1BB8 80011BB8 0800E003 */  jr         $ra
    /* 1BBC 80011BBC 2800BD27 */   addiu     $sp, $sp, 0x28
endlabel PAD_init
