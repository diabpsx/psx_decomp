.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching OVR_LoadGame__Fv, 0x28

glabel OVR_LoadGame__Fv
    /* 85474 80095474 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 85478 80095478 1000BFAF */  sw         $ra, 0x10($sp)
    /* 8547C 8009547C 1280043C */  lui        $a0, %hi(D_8011CC48)
    /* 85480 80095480 48CC8424 */  addiu      $a0, $a0, %lo(D_8011CC48)
    /* 85484 80095484 9D55020C */  jal        LoadOver__FR7Overlay
    /* 85488 80095488 00000000 */   nop
    /* 8548C 8009548C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 85490 80095490 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 85494 80095494 0800E003 */  jr         $ra
    /* 85498 80095498 00000000 */   nop
endlabel OVR_LoadGame__Fv
