.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DoMemCardFromInGame__Fv, 0x28

glabel DoMemCardFromInGame__Fv
    /* 29F60 80039F60 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 29F64 80039F64 1000BFAF */  sw         $ra, 0x10($sp)
    /* 29F68 80039F68 3155020C */  jal        OVR_LoadMemcard__Fv
    /* 29F6C 80039F6C 00000000 */   nop
    /* 29F70 80039F70 1D55020C */  jal        OVR_LoadGame__Fv
    /* 29F74 80039F74 00000000 */   nop
    /* 29F78 80039F78 1000BF8F */  lw         $ra, 0x10($sp)
    /* 29F7C 80039F7C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 29F80 80039F80 0800E003 */  jr         $ra
    /* 29F84 80039F84 00000000 */   nop
endlabel DoMemCardFromInGame__Fv
