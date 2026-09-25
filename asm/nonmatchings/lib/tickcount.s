.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching tickcount, 0x2C

glabel tickcount
    /* 20030 80030030 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 20034 80030034 1000B0AF */  sw         $s0, 0x10($sp)
    /* 20038 80030038 1400BFAF */  sw         $ra, 0x14($sp)
    /* 2003C 8003003C 08C0000C */  jal        gettick
    /* 20040 80030040 21808000 */   addu      $s0, $a0, $zero
    /* 20044 80030044 23105000 */  subu       $v0, $v0, $s0
    /* 20048 80030048 1400BF8F */  lw         $ra, 0x14($sp)
    /* 2004C 8003004C 1000B08F */  lw         $s0, 0x10($sp)
    /* 20050 80030050 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 20054 80030054 0800E003 */  jr         $ra
    /* 20058 80030058 00000000 */   nop
endlabel tickcount
