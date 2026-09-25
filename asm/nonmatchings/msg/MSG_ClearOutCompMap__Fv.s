.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MSG_ClearOutCompMap__Fv, 0x28

glabel MSG_ClearOutCompMap__Fv
    /* 428FC 800528FC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 42900 80052900 1000BFAF */  sw         $ra, 0x10($sp)
    /* 42904 80052904 0D80043C */  lui        $a0, %hi(GameMaps)
    /* 42908 80052908 4C708424 */  addiu      $a0, $a0, %lo(GameMaps)
    /* 4290C 8005290C C105020C */  jal        Init__13CompLevelMaps
    /* 42910 80052910 00000000 */   nop
    /* 42914 80052914 1000BF8F */  lw         $ra, 0x10($sp)
    /* 42918 80052918 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 4291C 8005291C 0800E003 */  jr         $ra
    /* 42920 80052920 00000000 */   nop
endlabel MSG_ClearOutCompMap__Fv
