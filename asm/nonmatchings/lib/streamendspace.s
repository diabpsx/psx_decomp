.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching streamendspace, 0x38

glabel streamendspace
    /* 1EFF0 8002EFF0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1EFF4 8002EFF4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1EFF8 8002EFF8 1400BFAF */  sw         $ra, 0x14($sp)
    /* 1EFFC 8002EFFC A2BB000C */  jal        releasechunks
    /* 1F000 8002F000 21808000 */   addu      $s0, $a0, $zero
    /* 1F004 8002F004 0800038E */  lw         $v1, 0x8($s0)
    /* 1F008 8002F008 0C00028E */  lw         $v0, 0xC($s0)
    /* 1F00C 8002F00C 00000000 */  nop
    /* 1F010 8002F010 23106200 */  subu       $v0, $v1, $v0
    /* 1F014 8002F014 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1F018 8002F018 1000B08F */  lw         $s0, 0x10($sp)
    /* 1F01C 8002F01C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1F020 8002F020 0800E003 */  jr         $ra
    /* 1F024 8002F024 00000000 */   nop
endlabel streamendspace
