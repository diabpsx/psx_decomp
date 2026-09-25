.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ReleaseDLevel__FP6DLevel, 0x2C

glabel ReleaseDLevel__FP6DLevel
    /* 428D0 800528D0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 428D4 800528D4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 428D8 800528D8 21288000 */  addu       $a1, $a0, $zero
    /* 428DC 800528DC 0D80043C */  lui        $a0, %hi(GameMaps)
    /* 428E0 800528E0 4C708424 */  addiu      $a0, $a0, %lo(GameMaps)
    /* 428E4 800528E4 0106020C */  jal        ReleaseMap__13CompLevelMapsP6DLevel
    /* 428E8 800528E8 00000000 */   nop
    /* 428EC 800528EC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 428F0 800528F0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 428F4 800528F4 0800E003 */  jr         $ra
    /* 428F8 800528F8 00000000 */   nop
endlabel ReleaseDLevel__FP6DLevel
