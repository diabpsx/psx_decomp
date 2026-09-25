.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _GLOBAL__I_gplayer, 0x28

glabel _GLOBAL__I_gplayer
    /* 94220 800A4220 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 94224 800A4224 1000BFAF */  sw         $ra, 0x10($sp)
    /* 94228 800A4228 1280043C */  lui        $a0, %hi(D_8011D040)
    /* 9422C 800A422C 40D08424 */  addiu      $a0, $a0, %lo(D_8011D040)
    /* 94230 800A4230 A890020C */  jal        __6Dialog_800a42a0
    /* 94234 800A4234 00000000 */   nop
    /* 94238 800A4238 1000BF8F */  lw         $ra, 0x10($sp)
    /* 9423C 800A423C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 94240 800A4240 0800E003 */  jr         $ra
    /* 94244 800A4244 00000000 */   nop
endlabel _GLOBAL__I_gplayer
