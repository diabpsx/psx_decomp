.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _GLOBAL__I_deltaload, 0x60

glabel _GLOBAL__I_deltaload
    /* 4294C 8005294C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 42950 80052950 1000BFAF */  sw         $ra, 0x10($sp)
    /* 42954 80052954 1280043C */  lui        $a0, %hi(CompNoComp)
    /* 42958 80052958 80B98424 */  addiu      $a0, $a0, %lo(CompNoComp)
    /* 4295C 8005295C 874A010C */  jal        __6NoComp
    /* 42960 80052960 00000000 */   nop
    /* 42964 80052964 1280043C */  lui        $a0, %hi(CompPakComp)
    /* 42968 80052968 84B98424 */  addiu      $a0, $a0, %lo(CompPakComp)
    /* 4296C 8005296C 794A010C */  jal        __7PakComp
    /* 42970 80052970 00000000 */   nop
    /* 42974 80052974 1280043C */  lui        $a0, %hi(CompCrunchComp)
    /* 42978 80052978 88B98424 */  addiu      $a0, $a0, %lo(CompCrunchComp)
    /* 4297C 8005297C 6B4A010C */  jal        __10CrunchComp
    /* 42980 80052980 00000000 */   nop
    /* 42984 80052984 0D80043C */  lui        $a0, %hi(GameMaps)
    /* 42988 80052988 4C708424 */  addiu      $a0, $a0, %lo(GameMaps)
    /* 4298C 8005298C 1280053C */  lui        $a1, %hi(CompPakComp)
    /* 42990 80052990 84B9A524 */  addiu      $a1, $a1, %lo(CompPakComp)
    /* 42994 80052994 8205020C */  jal        __13CompLevelMapsRC9CompClass
    /* 42998 80052998 00000000 */   nop
    /* 4299C 8005299C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 429A0 800529A0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 429A4 800529A4 0800E003 */  jr         $ra
    /* 429A8 800529A8 00000000 */   nop
endlabel _GLOBAL__I_deltaload
