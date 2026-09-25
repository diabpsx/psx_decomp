.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _GLOBAL__I_DrawLevelUpFlag, 0x3C

glabel _GLOBAL__I_DrawLevelUpFlag
    /* 27578 80037578 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2757C 8003757C AC0E838F */  lw         $v1, %gp_rel(D_8011B62C)($gp)
    /* 27580 80037580 1380043C */  lui        $a0, %hi(D_8012EA88)
    /* 27584 80037584 88EA8424 */  addiu      $a0, $a0, %lo(D_8012EA88)
    /* 27588 80037588 1000BFAF */  sw         $ra, 0x10($sp)
    /* 2758C 8003758C C0100300 */  sll        $v0, $v1, 3
    /* 27590 80037590 21104300 */  addu       $v0, $v0, $v1
    /* 27594 80037594 80004224 */  addiu      $v0, $v0, 0x80
    /* 27598 80037598 EC1F82AF */  sw         $v0, %gp_rel(D_8011C76C)($gp)
    /* 2759C 8003759C 9BDD000C */  jal        __6Dialog
    /* 275A0 800375A0 00000000 */   nop
    /* 275A4 800375A4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 275A8 800375A8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 275AC 800375AC 0800E003 */  jr         $ra
    /* 275B0 800375B0 00000000 */   nop
endlabel _GLOBAL__I_DrawLevelUpFlag
