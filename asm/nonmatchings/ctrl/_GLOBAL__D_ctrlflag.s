.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _GLOBAL__D_ctrlflag, 0x28

glabel _GLOBAL__D_ctrlflag
    /* 8DAD8 8009DAD8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8DADC 8009DADC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 8DAE0 8009DAE0 1280043C */  lui        $a0, %hi(D_8011CDF0)
    /* 8DAE4 8009DAE4 F0CD8424 */  addiu      $a0, $a0, %lo(D_8011CDF0)
    /* 8DAE8 8009DAE8 0077020C */  jal        ___6Dialog_8009dc00
    /* 8DAEC 8009DAEC 02000524 */   addiu     $a1, $zero, 0x2
    /* 8DAF0 8009DAF0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 8DAF4 8009DAF4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 8DAF8 8009DAF8 0800E003 */  jr         $ra
    /* 8DAFC 8009DAFC 00000000 */   nop
endlabel _GLOBAL__D_ctrlflag
