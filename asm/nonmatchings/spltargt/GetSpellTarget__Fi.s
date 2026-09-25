.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetSpellTarget__Fi, 0x20

glabel GetSpellTarget__Fi
    /* 9FE90 800AFE90 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 9FE94 800AFE94 1000BFAF */  sw         $ra, 0x10($sp)
    /* 9FE98 800AFE98 4BEB010C */  jal        GetGamePad__Fi
    /* 9FE9C 800AFE9C 00000000 */   nop
    /* 9FEA0 800AFEA0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 9FEA4 800AFEA4 04004224 */  addiu      $v0, $v0, 0x4
    /* 9FEA8 800AFEA8 0800E003 */  jr         $ra
    /* 9FEAC 800AFEAC 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel GetSpellTarget__Fi
