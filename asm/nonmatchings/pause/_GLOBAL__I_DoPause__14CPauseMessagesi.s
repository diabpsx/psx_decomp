.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _GLOBAL__I_DoPause__14CPauseMessagesi, 0x28

glabel _GLOBAL__I_DoPause__14CPauseMessagesi
    /* 79310 80089310 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 79314 80089314 1000BFAF */  sw         $ra, 0x10($sp)
    /* 79318 80089318 1280043C */  lui        $a0, %hi(D_8011CBC0)
    /* 7931C 8008931C C0CB8424 */  addiu      $a0, $a0, %lo(D_8011CBC0)
    /* 79320 80089320 0725020C */  jal        __6Dialog_8008941c
    /* 79324 80089324 00000000 */   nop
    /* 79328 80089328 1000BF8F */  lw         $ra, 0x10($sp)
    /* 7932C 8008932C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 79330 80089330 0800E003 */  jr         $ra
    /* 79334 80089334 00000000 */   nop
endlabel _GLOBAL__I_DoPause__14CPauseMessagesi
