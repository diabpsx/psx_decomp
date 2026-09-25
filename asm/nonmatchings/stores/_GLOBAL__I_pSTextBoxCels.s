.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _GLOBAL__I_pSTextBoxCels, 0x28

glabel _GLOBAL__I_pSTextBoxCels
    /* 64350 80074350 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 64354 80074354 1000BFAF */  sw         $ra, 0x10($sp)
    /* 64358 80074358 0E80043C */  lui        $a0, %hi(SBack)
    /* 6435C 8007435C 04E38424 */  addiu      $a0, $a0, %lo(SBack)
    /* 64360 80074360 FCD0010C */  jal        __6Dialog_800743f0
    /* 64364 80074364 00000000 */   nop
    /* 64368 80074368 1000BF8F */  lw         $ra, 0x10($sp)
    /* 6436C 8007436C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 64370 80074370 0800E003 */  jr         $ra
    /* 64374 80074374 00000000 */   nop
endlabel _GLOBAL__I_pSTextBoxCels
