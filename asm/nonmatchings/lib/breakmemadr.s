.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching breakmemadr, 0x34

glabel breakmemadr
    /* 1B868 8002B868 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1B86C 8002B86C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1B870 8002B870 1400BFAF */  sw         $ra, 0x14($sp)
    /* 1B874 8002B874 B1AB000C */  jal        findmemblock
    /* 1B878 8002B878 2180A000 */   addu      $s0, $a1, $zero
    /* 1B87C 8002B87C 21204000 */  addu       $a0, $v0, $zero
    /* 1B880 8002B880 27AE000C */  jal        breakmemblock
    /* 1B884 8002B884 21280002 */   addu      $a1, $s0, $zero
    /* 1B888 8002B888 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1B88C 8002B88C 1000B08F */  lw         $s0, 0x10($sp)
    /* 1B890 8002B890 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1B894 8002B894 0800E003 */  jr         $ra
    /* 1B898 8002B898 00000000 */   nop
endlabel breakmemadr
