.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching main, 0x50

glabel main
    /* 10E04 80020E04 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 10E08 80020E08 1000BFAF */  sw         $ra, 0x10($sp)
    /* 10E0C 80020E0C F243000C */  jal        __main
    /* 10E10 80020E10 00000000 */   nop
    /* 10E14 80020E14 7884000C */  jal        GSYS_InitMachine
    /* 10E18 80020E18 00000000 */   nop
    /* 10E1C 80020E1C 0185000C */  jal        GAL_InitModule
    /* 10E20 80020E20 00000000 */   nop
    /* 10E24 80020E24 FB82000C */  jal        TICK_InitModule
    /* 10E28 80020E28 00000000 */   nop
    /* 10E2C 80020E2C 2683000C */  jal        GU_InitModule
    /* 10E30 80020E30 00000000 */   nop
    /* 10E34 80020E34 580C020C */  jal        AppMain
    /* 10E38 80020E38 00000000 */   nop
  .L80020E3C:
    /* 10E3C 80020E3C 8F830008 */  j          .L80020E3C
    /* 10E40 80020E40 00000000 */   nop
    /* 10E44 80020E44 1000BF8F */  lw         $ra, 0x10($sp)
    /* 10E48 80020E48 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 10E4C 80020E4C 0800E003 */  jr         $ra
    /* 10E50 80020E50 00000000 */   nop
endlabel main
