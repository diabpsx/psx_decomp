.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _GLOBAL__D_gplayer, 0x28

glabel _GLOBAL__D_gplayer
    /* 941F8 800A41F8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 941FC 800A41FC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 94200 800A4200 1280043C */  lui        $a0, %hi(D_8011D040)
    /* 94204 800A4204 40D08424 */  addiu      $a0, $a0, %lo(D_8011D040)
    /* 94208 800A4208 9E90020C */  jal        ___6Dialog_800a4278
    /* 9420C 800A420C 02000524 */   addiu     $a1, $zero, 0x2
    /* 94210 800A4210 1000BF8F */  lw         $ra, 0x10($sp)
    /* 94214 800A4214 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 94218 800A4218 0800E003 */  jr         $ra
    /* 9421C 800A421C 00000000 */   nop
endlabel _GLOBAL__D_gplayer
