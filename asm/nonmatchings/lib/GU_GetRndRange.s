.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GU_GetRndRange, 0x3C

glabel GU_GetRndRange
    /* 10DA4 80020DA4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 10DA8 80020DA8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 10DAC 80020DAC 1400BFAF */  sw         $ra, 0x14($sp)
    /* 10DB0 80020DB0 3D83000C */  jal        GU_GetRnd
    /* 10DB4 80020DB4 21808000 */   addu      $s0, $a0, $zero
    /* 10DB8 80020DB8 1B005000 */  divu       $zero, $v0, $s0
    /* 10DBC 80020DBC 02000016 */  bnez       $s0, .L80020DC8
    /* 10DC0 80020DC0 00000000 */   nop
    /* 10DC4 80020DC4 0D000700 */  break      7
  .L80020DC8:
    /* 10DC8 80020DC8 10100000 */  mfhi       $v0
    /* 10DCC 80020DCC 1400BF8F */  lw         $ra, 0x14($sp)
    /* 10DD0 80020DD0 1000B08F */  lw         $s0, 0x10($sp)
    /* 10DD4 80020DD4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 10DD8 80020DD8 0800E003 */  jr         $ra
    /* 10DDC 80020DDC 00000000 */   nop
endlabel GU_GetRndRange
