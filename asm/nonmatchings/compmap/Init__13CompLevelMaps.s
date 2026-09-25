.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Init__13CompLevelMaps, 0x30

glabel Init__13CompLevelMaps
    /* 71704 80081704 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 71708 80081708 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7170C 8008170C 1400BFAF */  sw         $ra, 0x14($sp)
    /* 71710 80081710 CD05020C */  jal        InitAllMaps__13CompLevelMaps
    /* 71714 80081714 21808000 */   addu      $s0, $a0, $zero
    /* 71718 80081718 680100AE */  sw         $zero, 0x168($s0)
    /* 7171C 8008171C 6C0100AE */  sw         $zero, 0x16C($s0)
    /* 71720 80081720 1400BF8F */  lw         $ra, 0x14($sp)
    /* 71724 80081724 1000B08F */  lw         $s0, 0x10($sp)
    /* 71728 80081728 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 7172C 8008172C 0800E003 */  jr         $ra
    /* 71730 80081730 00000000 */   nop
endlabel Init__13CompLevelMaps
