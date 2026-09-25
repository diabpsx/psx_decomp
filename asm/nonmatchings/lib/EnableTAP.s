.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching EnableTAP, 0x20

glabel EnableTAP
    /* FD3C 8001FD3C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* FD40 8001FD40 1400BFAF */  sw         $ra, 0x14($sp)
    /* FD44 8001FD44 287F000C */  jal        func_8001FCA0
    /* FD48 8001FD48 00000000 */   nop
    /* FD4C 8001FD4C 1400BF8F */  lw         $ra, 0x14($sp)
    /* FD50 8001FD50 1800BD27 */  addiu      $sp, $sp, 0x18
    /* FD54 8001FD54 0800E003 */  jr         $ra
    /* FD58 8001FD58 00000000 */   nop
endlabel EnableTAP
