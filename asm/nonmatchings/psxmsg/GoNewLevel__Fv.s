.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GoNewLevel__Fv, 0x48

glabel GoNewLevel__Fv
    /* 8733C 8009733C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 87340 80097340 1000BFAF */  sw         $ra, 0x10($sp)
    /* 87344 80097344 5F5D020C */  jal        LevelToLevelInit__Fv
    /* 87348 80097348 00000000 */   nop
    /* 8734C 8009734C FC05848F */  lw         $a0, %gp_rel(D_8011AD7C)($gp)
    /* 87350 80097350 D692020C */  jal        PutUpCutScreen__Fi
    /* 87354 80097354 00000000 */   nop
    /* 87358 80097358 EBDF000C */  jal        FreeGameMem__Fv
    /* 8735C 8009735C 00000000 */   nop
    /* 87360 80097360 0955020C */  jal        OVR_LoadPregame__Fv
    /* 87364 80097364 00000000 */   nop
    /* 87368 80097368 01000424 */  addiu      $a0, $zero, 0x1
    /* 8736C 8009736C 9CE4000C */  jal        LoadGameLevel__FUci
    /* 87370 80097370 21280000 */   addu      $a1, $zero, $zero
    /* 87374 80097374 1000BF8F */  lw         $ra, 0x10($sp)
    /* 87378 80097378 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 8737C 8009737C 0800E003 */  jr         $ra
    /* 87380 80097380 00000000 */   nop
endlabel GoNewLevel__Fv
