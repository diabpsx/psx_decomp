.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TICK_GetAge, 0x2C

glabel TICK_GetAge
    /* 10C4C 80020C4C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 10C50 80020C50 1000B0AF */  sw         $s0, 0x10($sp)
    /* 10C54 80020C54 1400BFAF */  sw         $ra, 0x14($sp)
    /* 10C58 80020C58 0783000C */  jal        TICK_Get
    /* 10C5C 80020C5C 21808000 */   addu      $s0, $a0, $zero
    /* 10C60 80020C60 23105000 */  subu       $v0, $v0, $s0
    /* 10C64 80020C64 1400BF8F */  lw         $ra, 0x14($sp)
    /* 10C68 80020C68 1000B08F */  lw         $s0, 0x10($sp)
    /* 10C6C 80020C6C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 10C70 80020C70 0800E003 */  jr         $ra
    /* 10C74 80020C74 00000000 */   nop
endlabel TICK_GetAge
