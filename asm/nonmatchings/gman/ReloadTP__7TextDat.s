.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ReloadTP__7TextDat, 0x40

glabel ReloadTP__7TextDat
    /* 81EF0 80091EF0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 81EF4 80091EF4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 81EF8 80091EF8 21808000 */  addu       $s0, $a0, $zero
    /* 81EFC 80091EFC 1400BFAF */  sw         $ra, 0x14($sp)
    /* 81F00 80091F00 4800048E */  lw         $a0, 0x48($s0)
    /* 81F04 80091F04 EF54020C */  jal        HasTp__C13CTextFileInfo
    /* 81F08 80091F08 00000000 */   nop
    /* 81F0C 80091F0C 03004010 */  beqz       $v0, .L80091F1C
    /* 81F10 80091F10 00000000 */   nop
    /* 81F14 80091F14 8648020C */  jal        StreamLoadTP__7TextDat
    /* 81F18 80091F18 21200002 */   addu      $a0, $s0, $zero
  .L80091F1C:
    /* 81F1C 80091F1C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 81F20 80091F20 1000B08F */  lw         $s0, 0x10($sp)
    /* 81F24 80091F24 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 81F28 80091F28 0800E003 */  jr         $ra
    /* 81F2C 80091F2C 00000000 */   nop
endlabel ReloadTP__7TextDat
