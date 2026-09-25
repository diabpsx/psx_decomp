.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GSYS_SetStackAndJump, 0x3C

glabel GSYS_SetStackAndJump
    /* 1117C 8002117C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 11180 80021180 1400B1AF */  sw         $s1, 0x14($sp)
    /* 11184 80021184 2188A000 */  addu       $s1, $a1, $zero
    /* 11188 80021188 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1118C 8002118C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 11190 80021190 6B46000C */  jal        SetSp
    /* 11194 80021194 2180C000 */   addu      $s0, $a2, $zero
    /* 11198 80021198 09F82002 */  jalr       $s1
    /* 1119C 8002119C 21200002 */   addu      $a0, $s0, $zero
    /* 111A0 800211A0 1800BF8F */  lw         $ra, 0x18($sp)
    /* 111A4 800211A4 1400B18F */  lw         $s1, 0x14($sp)
    /* 111A8 800211A8 1000B08F */  lw         $s0, 0x10($sp)
    /* 111AC 800211AC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 111B0 800211B0 0800E003 */  jr         $ra
    /* 111B4 800211B4 00000000 */   nop
endlabel GSYS_SetStackAndJump
