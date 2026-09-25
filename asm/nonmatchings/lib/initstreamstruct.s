.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching initstreamstruct, 0x20

glabel initstreamstruct
    /* 1CDBC 8002CDBC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1CDC0 8002CDC0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1CDC4 8002CDC4 05B3000C */  jal        initstreamstructa
    /* 1CDC8 8002CDC8 01000724 */   addiu     $a3, $zero, 0x1
    /* 1CDCC 8002CDCC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1CDD0 8002CDD0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1CDD4 8002CDD4 0800E003 */  jr         $ra
    /* 1CDD8 8002CDD8 00000000 */   nop
endlabel initstreamstruct
