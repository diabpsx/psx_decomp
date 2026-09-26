.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching stop_mdec_audio, 0x24

glabel stop_mdec_audio
    /* 1DCE4 801578DC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1DCE8 801578E0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1DCEC 801578E4 21200000 */  addu       $a0, $zero, $zero
    /* 1DCF0 801578E8 C362000C */  jal        SpuSetKey
    /* 1DCF4 801578EC 03000524 */   addiu     $a1, $zero, 0x3
    /* 1DCF8 801578F0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1DCFC 801578F4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1DD00 801578F8 0800E003 */  jr         $ra
    /* 1DD04 801578FC 00000000 */   nop
endlabel stop_mdec_audio
