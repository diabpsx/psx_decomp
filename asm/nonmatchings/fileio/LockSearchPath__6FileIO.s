.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LockSearchPath__6FileIO, 0x58

glabel LockSearchPath__6FileIO
    /* 75FB4 80085FB4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 75FB8 80085FB8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 75FBC 80085FBC 1400BFAF */  sw         $ra, 0x14($sp)
    /* 75FC0 80085FC0 1918020C */  jal        SearchPathExists__6FileIO
    /* 75FC4 80085FC4 21808000 */   addu      $s0, $a0, $zero
    /* 75FC8 80085FC8 0B004010 */  beqz       $v0, .L80085FF8
    /* 75FCC 80085FCC 00000000 */   nop
    /* 75FD0 80085FD0 0800048E */  lw         $a0, 0x8($s0)
    /* 75FD4 80085FD4 DD85000C */  jal        GAL_Lock
    /* 75FD8 80085FD8 00000000 */   nop
    /* 75FDC 80085FDC 06004014 */  bnez       $v0, .L80085FF8
    /* 75FE0 80085FE0 0C0002AE */   sw        $v0, 0xC($s0)
    /* 75FE4 80085FE4 21200000 */  addu       $a0, $zero, $zero
    /* 75FE8 80085FE8 1180053C */  lui        $a1, %hi(D_801100E0)
    /* 75FEC 80085FEC E000A524 */  addiu      $a1, $a1, %lo(D_801100E0)
    /* 75FF0 80085FF0 A583000C */  jal        DBG_Error
    /* 75FF4 80085FF4 1E010624 */   addiu     $a2, $zero, 0x11E
  .L80085FF8:
    /* 75FF8 80085FF8 1400BF8F */  lw         $ra, 0x14($sp)
    /* 75FFC 80085FFC 1000B08F */  lw         $s0, 0x10($sp)
    /* 76000 80086000 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 76004 80086004 0800E003 */  jr         $ra
    /* 76008 80086008 00000000 */   nop
endlabel LockSearchPath__6FileIO
