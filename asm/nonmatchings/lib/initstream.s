.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching initstream, 0x20

glabel initstream
    /* 1CEE0 8002CEE0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1CEE4 8002CEE4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1CEE8 8002CEE8 77B3000C */  jal        initstreama
    /* 1CEEC 8002CEEC 01000724 */   addiu     $a3, $zero, 0x1
    /* 1CEF0 8002CEF0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1CEF4 8002CEF4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1CEF8 8002CEF8 0800E003 */  jr         $ra
    /* 1CEFC 8002CEFC 00000000 */   nop
endlabel initstream
