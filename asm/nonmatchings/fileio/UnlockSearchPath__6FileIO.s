.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching UnlockSearchPath__6FileIO, 0x58

glabel UnlockSearchPath__6FileIO
    /* 7600C 8008600C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 76010 80086010 1000B0AF */  sw         $s0, 0x10($sp)
    /* 76014 80086014 1400BFAF */  sw         $ra, 0x14($sp)
    /* 76018 80086018 1918020C */  jal        SearchPathExists__6FileIO
    /* 7601C 8008601C 21808000 */   addu      $s0, $a0, $zero
    /* 76020 80086020 0B004010 */  beqz       $v0, .L80086050
    /* 76024 80086024 00000000 */   nop
    /* 76028 80086028 0800048E */  lw         $a0, 0x8($s0)
    /* 7602C 8008602C F785000C */  jal        GAL_Unlock
    /* 76030 80086030 00000000 */   nop
    /* 76034 80086034 FF004230 */  andi       $v0, $v0, 0xFF
    /* 76038 80086038 05004014 */  bnez       $v0, .L80086050
    /* 7603C 8008603C 21200000 */   addu      $a0, $zero, $zero
    /* 76040 80086040 1180053C */  lui        $a1, %hi(D_801100E0)
    /* 76044 80086044 E000A524 */  addiu      $a1, $a1, %lo(D_801100E0)
    /* 76048 80086048 A583000C */  jal        DBG_Error
    /* 7604C 8008604C 2B010624 */   addiu     $a2, $zero, 0x12B
  .L80086050:
    /* 76050 80086050 1400BF8F */  lw         $ra, 0x14($sp)
    /* 76054 80086054 1000B08F */  lw         $s0, 0x10($sp)
    /* 76058 80086058 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 7605C 8008605C 0800E003 */  jr         $ra
    /* 76060 80086060 00000000 */   nop
endlabel UnlockSearchPath__6FileIO
