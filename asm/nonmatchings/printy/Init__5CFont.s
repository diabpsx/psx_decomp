.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Init__5CFont, 0x34

glabel Init__5CFont
    /* 7AD40 8008AD40 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 7AD44 8008AD44 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7AD48 8008AD48 21808000 */  addu       $s0, $a0, $zero
    /* 7AD4C 8008AD4C 1400BFAF */  sw         $ra, 0x14($sp)
    /* 7AD50 8008AD50 0000048E */  lw         $a0, 0x0($s0)
    /* 7AD54 8008AD54 044F020C */  jal        GM_UseTexData__Fi
    /* 7AD58 8008AD58 00000000 */   nop
    /* 7AD5C 8008AD5C 140202AE */  sw         $v0, 0x214($s0)
    /* 7AD60 8008AD60 1400BF8F */  lw         $ra, 0x14($sp)
    /* 7AD64 8008AD64 1000B08F */  lw         $s0, 0x10($sp)
    /* 7AD68 8008AD68 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 7AD6C 8008AD6C 0800E003 */  jr         $ra
    /* 7AD70 8008AD70 00000000 */   nop
endlabel Init__5CFont
