.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching OVR_LoadFrontend__Fv, 0x28

glabel OVR_LoadFrontend__Fv
    /* 8544C 8009544C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 85450 80095450 1000BFAF */  sw         $ra, 0x10($sp)
    /* 85454 80095454 1280043C */  lui        $a0, %hi(D_8011CC28)
    /* 85458 80095458 28CC8424 */  addiu      $a0, $a0, %lo(D_8011CC28)
    /* 8545C 8009545C 9D55020C */  jal        LoadOver__FR7Overlay
    /* 85460 80095460 00000000 */   nop
    /* 85464 80095464 1000BF8F */  lw         $ra, 0x10($sp)
    /* 85468 80095468 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 8546C 8009546C 0800E003 */  jr         $ra
    /* 85470 80095470 00000000 */   nop
endlabel OVR_LoadFrontend__Fv
