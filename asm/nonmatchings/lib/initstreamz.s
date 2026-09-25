.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching initstreamz, 0x20

glabel initstreamz
    /* 1CEC0 8002CEC0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1CEC4 8002CEC4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1CEC8 8002CEC8 77B3000C */  jal        initstreama
    /* 1CECC 8002CECC 21380000 */   addu      $a3, $zero, $zero
    /* 1CED0 8002CED0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1CED4 8002CED4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1CED8 8002CED8 0800E003 */  jr         $ra
    /* 1CEDC 8002CEDC 00000000 */   nop
endlabel initstreamz
