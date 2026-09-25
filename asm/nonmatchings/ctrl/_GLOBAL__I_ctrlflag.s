.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _GLOBAL__I_ctrlflag, 0x28

glabel _GLOBAL__I_ctrlflag
    /* 8DB00 8009DB00 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8DB04 8009DB04 1000BFAF */  sw         $ra, 0x10($sp)
    /* 8DB08 8009DB08 1280043C */  lui        $a0, %hi(D_8011CDF0)
    /* 8DB0C 8009DB0C F0CD8424 */  addiu      $a0, $a0, %lo(D_8011CDF0)
    /* 8DB10 8009DB10 0A77020C */  jal        __6Dialog_8009dc28
    /* 8DB14 8009DB14 00000000 */   nop
    /* 8DB18 8009DB18 1000BF8F */  lw         $ra, 0x10($sp)
    /* 8DB1C 8009DB1C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 8DB20 8009DB20 0800E003 */  jr         $ra
    /* 8DB24 8009DB24 00000000 */   nop
endlabel _GLOBAL__I_ctrlflag
