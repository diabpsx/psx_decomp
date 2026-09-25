.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetLightFX__FiisssUcUcUc, 0x6C

glabel SetLightFX__FiisssUcUcUc
    /* 3BD40 8004BD40 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 3BD44 8004BD44 00340600 */  sll        $a2, $a2, 16
    /* 3BD48 8004BD48 03340600 */  sra        $a2, $a2, 16
    /* 3BD4C 8004BD4C 003C0700 */  sll        $a3, $a3, 16
    /* 3BD50 8004BD50 2800A88F */  lw         $t0, 0x28($sp)
    /* 3BD54 8004BD54 3000A393 */  lbu        $v1, 0x30($sp)
    /* 3BD58 8004BD58 3400A993 */  lbu        $t1, 0x34($sp)
    /* 3BD5C 8004BD5C 2C00A293 */  lbu        $v0, 0x2C($sp)
    /* 3BD60 8004BD60 033C0700 */  sra        $a3, $a3, 16
    /* 3BD64 8004BD64 682086AF */  sw         $a2, %gp_rel(D_8011C7E8)($gp)
    /* 3BD68 8004BD68 1000BFAF */  sw         $ra, 0x10($sp)
    /* 3BD6C 8004BD6C 702087AF */  sw         $a3, %gp_rel(D_8011C7F0)($gp)
    /* 3BD70 8004BD70 00120200 */  sll        $v0, $v0, 8
    /* 3BD74 8004BD74 001A0300 */  sll        $v1, $v1, 8
    /* 3BD78 8004BD78 004A0900 */  sll        $t1, $t1, 8
    /* 3BD7C 8004BD7C 00440800 */  sll        $t0, $t0, 16
    /* 3BD80 8004BD80 03440800 */  sra        $t0, $t0, 16
    /* 3BD84 8004BD84 642082AF */  sw         $v0, %gp_rel(D_8011C7E4)($gp)
    /* 3BD88 8004BD88 6C2083AF */  sw         $v1, %gp_rel(D_8011C7EC)($gp)
    /* 3BD8C 8004BD8C 742089AF */  sw         $t1, %gp_rel(D_8011C7F4)($gp)
    /* 3BD90 8004BD90 782088AF */  sw         $t0, %gp_rel(D_8011C7F8)($gp)
    /* 3BD94 8004BD94 BA34010C */  jal        AddLight__Fiii
    /* 3BD98 8004BD98 70600624 */   addiu     $a2, $zero, 0x6070
    /* 3BD9C 8004BD9C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 3BDA0 8004BDA0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 3BDA4 8004BDA4 0800E003 */  jr         $ra
    /* 3BDA8 8004BDA8 00000000 */   nop
endlabel SetLightFX__FiisssUcUcUc
