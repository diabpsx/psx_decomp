.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching OVR_LoadFmv__Fv, 0x28

glabel OVR_LoadFmv__Fv
    /* 8549C 8009549C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 854A0 800954A0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 854A4 800954A4 1280043C */  lui        $a0, %hi(D_8011CC58)
    /* 854A8 800954A8 58CC8424 */  addiu      $a0, $a0, %lo(D_8011CC58)
    /* 854AC 800954AC 9D55020C */  jal        LoadOver__FR7Overlay
    /* 854B0 800954B0 00000000 */   nop
    /* 854B4 800954B4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 854B8 800954B8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 854BC 800954BC 0800E003 */  jr         $ra
    /* 854C0 800954C0 00000000 */   nop
endlabel OVR_LoadFmv__Fv
