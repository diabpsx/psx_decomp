.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitCARD, 0x6C

glabel InitCARD
    /* A85C 8001A85C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* A860 8001A860 1000B0AF */  sw         $s0, 0x10($sp)
    /* A864 8001A864 21808000 */  addu       $s0, $a0, $zero
    /* A868 8001A868 1400BFAF */  sw         $ra, 0x14($sp)
    /* A86C 8001A86C 9346000C */  jal        ChangeClearPAD
    /* A870 8001A870 21200000 */   addu      $a0, $zero, $zero
    /* A874 8001A874 6346000C */  jal        EnterCriticalSection
    /* A878 8001A878 00000000 */   nop
    /* A87C 8001A87C C646000C */  jal        ReadInitPadFlag
    /* A880 8001A880 00000000 */   nop
    /* A884 8001A884 02004014 */  bnez       $v0, .L8001A890
    /* A888 8001A888 00000000 */   nop
    /* A88C 8001A88C 21800000 */  addu       $s0, $zero, $zero
  .L8001A890:
    /* A890 8001A890 4B6A000C */  jal        InitCARD2
    /* A894 8001A894 21200002 */   addu      $a0, $s0, $zero
    /* A898 8001A898 BE6A000C */  jal        _copy_memcard_patch
    /* A89C 8001A89C 00000000 */   nop
    /* A8A0 8001A8A0 7D6A000C */  jal        _patch_card
    /* A8A4 8001A8A4 00000000 */   nop
    /* A8A8 8001A8A8 A26A000C */  jal        _patch_card2
    /* A8AC 8001A8AC 00000000 */   nop
    /* A8B0 8001A8B0 6746000C */  jal        ExitCriticalSection
    /* A8B4 8001A8B4 00000000 */   nop
    /* A8B8 8001A8B8 1400BF8F */  lw         $ra, 0x14($sp)
    /* A8BC 8001A8BC 1000B08F */  lw         $s0, 0x10($sp)
    /* A8C0 8001A8C0 0800E003 */  jr         $ra
    /* A8C4 8001A8C4 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel InitCARD
