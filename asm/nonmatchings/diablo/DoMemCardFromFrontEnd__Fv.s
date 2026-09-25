.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DoMemCardFromFrontEnd__Fv, 0x28

glabel DoMemCardFromFrontEnd__Fv
    /* 29F38 80039F38 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 29F3C 80039F3C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 29F40 80039F40 3155020C */  jal        OVR_LoadMemcard__Fv
    /* 29F44 80039F44 00000000 */   nop
    /* 29F48 80039F48 1355020C */  jal        OVR_LoadFrontend__Fv
    /* 29F4C 80039F4C 00000000 */   nop
    /* 29F50 80039F50 1000BF8F */  lw         $ra, 0x10($sp)
    /* 29F54 80039F54 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 29F58 80039F58 0800E003 */  jr         $ra
    /* 29F5C 80039F5C 00000000 */   nop
endlabel DoMemCardFromFrontEnd__Fv
