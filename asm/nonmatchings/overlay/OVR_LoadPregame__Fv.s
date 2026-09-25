.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching OVR_LoadPregame__Fv, 0x28

glabel OVR_LoadPregame__Fv
    /* 85424 80095424 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 85428 80095428 1000BFAF */  sw         $ra, 0x10($sp)
    /* 8542C 8009542C 1280043C */  lui        $a0, %hi(D_8011CC38)
    /* 85430 80095430 38CC8424 */  addiu      $a0, $a0, %lo(D_8011CC38)
    /* 85434 80095434 9D55020C */  jal        LoadOver__FR7Overlay
    /* 85438 80095438 00000000 */   nop
    /* 8543C 8009543C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 85440 80095440 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 85444 80095444 0800E003 */  jr         $ra
    /* 85448 80095448 00000000 */   nop
endlabel OVR_LoadPregame__Fv
