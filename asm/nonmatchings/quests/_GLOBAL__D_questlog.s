.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _GLOBAL__D_questlog, 0x28

glabel _GLOBAL__D_questlog
    /* 591EC 800691EC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 591F0 800691F0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 591F4 800691F4 1380043C */  lui        $a0, %hi(D_8012EE38)
    /* 591F8 800691F8 38EE8424 */  addiu      $a0, $a0, %lo(D_8012EE38)
    /* 591FC 800691FC 9BA4010C */  jal        ___6Dialog_8006926c
    /* 59200 80069200 02000524 */   addiu     $a1, $zero, 0x2
    /* 59204 80069204 1000BF8F */  lw         $ra, 0x10($sp)
    /* 59208 80069208 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 5920C 8006920C 0800E003 */  jr         $ra
    /* 59210 80069210 00000000 */   nop
endlabel _GLOBAL__D_questlog
