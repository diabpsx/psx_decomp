.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GU_InitModule, 0x2C

glabel GU_InitModule
    /* 10C98 80020C98 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 10C9C 80020C9C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 10CA0 80020CA0 0B80043C */  lui        $a0, %hi(DefaultRnd)
    /* 10CA4 80020CA4 5C638424 */  addiu      $a0, $a0, %lo(DefaultRnd)
    /* 10CA8 80020CA8 3183000C */  jal        GU_SetRndSeed
    /* 10CAC 80020CAC 00000000 */   nop
    /* 10CB0 80020CB0 01000234 */  ori        $v0, $zero, 0x1
    /* 10CB4 80020CB4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 10CB8 80020CB8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 10CBC 80020CBC 0800E003 */  jr         $ra
    /* 10CC0 80020CC0 00000000 */   nop
endlabel GU_InitModule
