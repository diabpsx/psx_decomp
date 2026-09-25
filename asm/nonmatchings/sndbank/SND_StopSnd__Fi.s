.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SND_StopSnd__Fi, 0x34

glabel SND_StopSnd__Fi
    /* 8A6B8 8009A6B8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8A6BC 8009A6BC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 8A6C0 8009A6C0 01000524 */  addiu      $a1, $zero, 0x1
    /* 8A6C4 8009A6C4 04288500 */  sllv       $a1, $a1, $a0
    /* 8A6C8 8009A6C8 9B61000C */  jal        SpuSetReverbVoice
    /* 8A6CC 8009A6CC 21200000 */   addu      $a0, $zero, $zero
    /* 8A6D0 8009A6D0 21200000 */  addu       $a0, $zero, $zero
    /* 8A6D4 8009A6D4 C362000C */  jal        SpuSetKey
    /* 8A6D8 8009A6D8 FFFF0524 */   addiu     $a1, $zero, -0x1
    /* 8A6DC 8009A6DC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 8A6E0 8009A6E0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 8A6E4 8009A6E4 0800E003 */  jr         $ra
    /* 8A6E8 8009A6E8 00000000 */   nop
endlabel SND_StopSnd__Fi
