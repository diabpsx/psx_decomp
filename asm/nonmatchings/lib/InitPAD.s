.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitPAD, 0x98

glabel InitPAD
    /* 1BC0 80011BC0 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 1BC4 80011BC4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1BC8 80011BC8 21808000 */  addu       $s0, $a0, $zero
    /* 1BCC 80011BCC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1BD0 80011BD0 2188A000 */  addu       $s1, $a1, $zero
    /* 1BD4 80011BD4 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1BD8 80011BD8 2190C000 */  addu       $s2, $a2, $zero
    /* 1BDC 80011BDC 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1BE0 80011BE0 2000BFAF */  sw         $ra, 0x20($sp)
    /* 1BE4 80011BE4 FB47000C */  jal        _remove_ChgclrPAD
    /* 1BE8 80011BE8 2198E000 */   addu      $s3, $a3, $zero
    /* 1BEC 80011BEC 6346000C */  jal        EnterCriticalSection
    /* 1BF0 80011BF0 00000000 */   nop
    /* 1BF4 80011BF4 A947000C */  jal        _patch_pad
    /* 1BF8 80011BF8 00000000 */   nop
    /* 1BFC 80011BFC 6746000C */  jal        ExitCriticalSection
    /* 1C00 80011C00 00000000 */   nop
    /* 1C04 80011C04 9346000C */  jal        ChangeClearPAD
    /* 1C08 80011C08 21200000 */   addu      $a0, $zero, $zero
    /* 1C0C 80011C0C 3047000C */  jal        func_80011CC0
    /* 1C10 80011C10 00000000 */   nop
    /* 1C14 80011C14 21200002 */  addu       $a0, $s0, $zero
    /* 1C18 80011C18 21282002 */  addu       $a1, $s1, $zero
    /* 1C1C 80011C1C 21304002 */  addu       $a2, $s2, $zero
    /* 1C20 80011C20 8747000C */  jal        InitPAD2
    /* 1C24 80011C24 21386002 */   addu      $a3, $s3, $zero
    /* 1C28 80011C28 D247000C */  jal        _send_pad
    /* 1C2C 80011C2C 00000000 */   nop
    /* 1C30 80011C30 01000224 */  addiu      $v0, $zero, 0x1
    /* 1C34 80011C34 0B80013C */  lui        $at, %hi(D_800B42BC)
    /* 1C38 80011C38 BC4222AC */  sw         $v0, %lo(D_800B42BC)($at)
    /* 1C3C 80011C3C 2000BF8F */  lw         $ra, 0x20($sp)
    /* 1C40 80011C40 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 1C44 80011C44 1800B28F */  lw         $s2, 0x18($sp)
    /* 1C48 80011C48 1400B18F */  lw         $s1, 0x14($sp)
    /* 1C4C 80011C4C 1000B08F */  lw         $s0, 0x10($sp)
    /* 1C50 80011C50 0800E003 */  jr         $ra
    /* 1C54 80011C54 2800BD27 */   addiu     $sp, $sp, 0x28
endlabel InitPAD
