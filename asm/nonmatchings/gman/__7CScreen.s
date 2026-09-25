.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __7CScreen, 0x34

glabel __7CScreen
    /* 8485C 8009485C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 84860 80094860 1000B0AF */  sw         $s0, 0x10($sp)
    /* 84864 80094864 1400BFAF */  sw         $ra, 0x14($sp)
    /* 84868 80094868 9547020C */  jal        __7TextDat
    /* 8486C 8009486C 21808000 */   addu      $s0, $a0, $zero
    /* 84870 80094870 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 84874 80094874 700002AE */  sw         $v0, 0x70($s0)
    /* 84878 80094878 21100002 */  addu       $v0, $s0, $zero
    /* 8487C 8009487C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 84880 80094880 1000B08F */  lw         $s0, 0x10($sp)
    /* 84884 80094884 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 84888 80094888 0800E003 */  jr         $ra
    /* 8488C 8009488C 00000000 */   nop
endlabel __7CScreen
