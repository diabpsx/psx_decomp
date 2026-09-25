.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching initstreamstructz, 0x20

glabel initstreamstructz
    /* 1CD9C 8002CD9C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1CDA0 8002CDA0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1CDA4 8002CDA4 05B3000C */  jal        initstreamstructa
    /* 1CDA8 8002CDA8 21380000 */   addu      $a3, $zero, $zero
    /* 1CDAC 8002CDAC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1CDB0 8002CDB0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1CDB4 8002CDB4 0800E003 */  jr         $ra
    /* 1CDB8 8002CDB8 00000000 */   nop
endlabel initstreamstructz
