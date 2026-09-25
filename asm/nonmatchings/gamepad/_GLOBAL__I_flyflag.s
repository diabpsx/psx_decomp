.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _GLOBAL__I_flyflag, 0x38

glabel _GLOBAL__I_flyflag
    /* 6B0A0 8007B0A0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 6B0A4 8007B0A4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 6B0A8 8007B0A8 1380043C */  lui        $a0, %hi(D_8012FB68)
    /* 6B0AC 8007B0AC 68FB8424 */  addiu      $a0, $a0, %lo(D_8012FB68)
    /* 6B0B0 8007B0B0 5FE1010C */  jal        __7GamePadi
    /* 6B0B4 8007B0B4 21280000 */   addu      $a1, $zero, $zero
    /* 6B0B8 8007B0B8 1380043C */  lui        $a0, %hi(D_8012FC48)
    /* 6B0BC 8007B0BC 48FC8424 */  addiu      $a0, $a0, %lo(D_8012FC48)
    /* 6B0C0 8007B0C0 5FE1010C */  jal        __7GamePadi
    /* 6B0C4 8007B0C4 01000524 */   addiu     $a1, $zero, 0x1
    /* 6B0C8 8007B0C8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 6B0CC 8007B0CC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 6B0D0 8007B0D0 0800E003 */  jr         $ra
    /* 6B0D4 8007B0D4 00000000 */   nop
endlabel _GLOBAL__I_flyflag
