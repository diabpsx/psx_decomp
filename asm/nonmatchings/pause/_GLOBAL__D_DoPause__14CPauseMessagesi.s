.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _GLOBAL__D_DoPause__14CPauseMessagesi, 0x28

glabel _GLOBAL__D_DoPause__14CPauseMessagesi
    /* 792E8 800892E8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 792EC 800892EC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 792F0 800892F0 1280043C */  lui        $a0, %hi(D_8011CBC0)
    /* 792F4 800892F4 C0CB8424 */  addiu      $a0, $a0, %lo(D_8011CBC0)
    /* 792F8 800892F8 FD24020C */  jal        ___6Dialog_800893f4
    /* 792FC 800892FC 02000524 */   addiu     $a1, $zero, 0x2
    /* 79300 80089300 1000BF8F */  lw         $ra, 0x10($sp)
    /* 79304 80089304 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 79308 80089308 0800E003 */  jr         $ra
    /* 7930C 8008930C 00000000 */   nop
endlabel _GLOBAL__D_DoPause__14CPauseMessagesi
