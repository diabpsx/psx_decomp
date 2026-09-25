.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitAllMaps__13CompLevelMaps, 0x54

glabel InitAllMaps__13CompLevelMaps
    /* 71734 80081734 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 71738 80081738 1800B2AF */  sw         $s2, 0x18($sp)
    /* 7173C 8008173C 21908000 */  addu       $s2, $a0, $zero
    /* 71740 80081740 1400B1AF */  sw         $s1, 0x14($sp)
    /* 71744 80081744 21880000 */  addu       $s1, $zero, $zero
    /* 71748 80081748 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7174C 8008174C 04001024 */  addiu      $s0, $zero, 0x4
    /* 71750 80081750 1C00BFAF */  sw         $ra, 0x1C($sp)
  .L80081754:
    /* 71754 80081754 AA06020C */  jal        Init__4AMap
    /* 71758 80081758 21205002 */   addu      $a0, $s2, $s0
    /* 7175C 8008175C 01003126 */  addiu      $s1, $s1, 0x1
    /* 71760 80081760 1600222A */  slti       $v0, $s1, 0x16
    /* 71764 80081764 FBFF4014 */  bnez       $v0, .L80081754
    /* 71768 80081768 10001026 */   addiu     $s0, $s0, 0x10
    /* 7176C 8008176C 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 71770 80081770 1800B28F */  lw         $s2, 0x18($sp)
    /* 71774 80081774 1400B18F */  lw         $s1, 0x14($sp)
    /* 71778 80081778 1000B08F */  lw         $s0, 0x10($sp)
    /* 7177C 8008177C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 71780 80081780 0800E003 */  jr         $ra
    /* 71784 80081784 00000000 */   nop
endlabel InitAllMaps__13CompLevelMaps
