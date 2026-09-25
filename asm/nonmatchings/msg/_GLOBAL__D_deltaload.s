.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _GLOBAL__D_deltaload, 0x28

glabel _GLOBAL__D_deltaload
    /* 42924 80052924 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 42928 80052928 1000BFAF */  sw         $ra, 0x10($sp)
    /* 4292C 8005292C 0D80043C */  lui        $a0, %hi(GameMaps)
    /* 42930 80052930 4C708424 */  addiu      $a0, $a0, %lo(GameMaps)
    /* 42934 80052934 9D05020C */  jal        ___13CompLevelMaps
    /* 42938 80052938 02000524 */   addiu     $a1, $zero, 0x2
    /* 4293C 8005293C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 42940 80052940 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 42944 80052944 0800E003 */  jr         $ra
    /* 42948 80052948 00000000 */   nop
endlabel _GLOBAL__D_deltaload
