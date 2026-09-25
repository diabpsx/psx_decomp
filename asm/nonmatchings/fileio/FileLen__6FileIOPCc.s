.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FileLen__6FileIOPCc, 0x64

glabel FileLen__6FileIOPCc
    /* 75A90 80085A90 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 75A94 80085A94 1000B0AF */  sw         $s0, 0x10($sp)
    /* 75A98 80085A98 21808000 */  addu       $s0, $a0, $zero
    /* 75A9C 80085A9C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 75AA0 80085AA0 0B80113C */  lui        $s1, %hi(_6FileIO_FileToLoad)
    /* 75AA4 80085AA4 70793126 */  addiu      $s1, $s1, %lo(_6FileIO_FileToLoad)
    /* 75AA8 80085AA8 1800BFAF */  sw         $ra, 0x18($sp)
    /* 75AAC 80085AAC 7E17020C */  jal        FindFile__6FileIOPCcPc
    /* 75AB0 80085AB0 21302002 */   addu      $a2, $s1, $zero
    /* 75AB4 80085AB4 01004238 */  xori       $v0, $v0, 0x1
    /* 75AB8 80085AB8 08004014 */  bnez       $v0, .L80085ADC
    /* 75ABC 80085ABC FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 75AC0 80085AC0 1000028E */  lw         $v0, 0x10($s0)
    /* 75AC4 80085AC4 21282002 */  addu       $a1, $s1, $zero
    /* 75AC8 80085AC8 20004484 */  lh         $a0, 0x20($v0)
    /* 75ACC 80085ACC 2400428C */  lw         $v0, 0x24($v0)
    /* 75AD0 80085AD0 00000000 */  nop
    /* 75AD4 80085AD4 09F84000 */  jalr       $v0
    /* 75AD8 80085AD8 21200402 */   addu      $a0, $s0, $a0
  .L80085ADC:
    /* 75ADC 80085ADC 1800BF8F */  lw         $ra, 0x18($sp)
    /* 75AE0 80085AE0 1400B18F */  lw         $s1, 0x14($sp)
    /* 75AE4 80085AE4 1000B08F */  lw         $s0, 0x10($sp)
    /* 75AE8 80085AE8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 75AEC 80085AEC 0800E003 */  jr         $ra
    /* 75AF0 80085AF0 00000000 */   nop
endlabel FileLen__6FileIOPCc
