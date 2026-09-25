.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching elapsedticks, 0x34

glabel elapsedticks
    /* 2005C 8003005C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 20060 80030060 1000B0AF */  sw         $s0, 0x10($sp)
    /* 20064 80030064 801E908F */  lw         $s0, %gp_rel(tickval)($gp)
    /* 20068 80030068 1400BFAF */  sw         $ra, 0x14($sp)
    /* 2006C 8003006C 08C0000C */  jal        gettick
    /* 20070 80030070 00000000 */   nop
    /* 20074 80030074 801E82AF */  sw         $v0, %gp_rel(tickval)($gp)
    /* 20078 80030078 23105000 */  subu       $v0, $v0, $s0
    /* 2007C 8003007C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 20080 80030080 1000B08F */  lw         $s0, 0x10($sp)
    /* 20084 80030084 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 20088 80030088 0800E003 */  jr         $ra
    /* 2008C 8003008C 00000000 */   nop
endlabel elapsedticks
