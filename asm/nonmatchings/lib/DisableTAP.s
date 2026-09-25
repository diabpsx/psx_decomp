.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DisableTAP, 0x20

glabel DisableTAP
    /* FD5C 8001FD5C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* FD60 8001FD60 1400BFAF */  sw         $ra, 0x14($sp)
    /* FD64 8001FD64 2C7F000C */  jal        func_8001FCB0
    /* FD68 8001FD68 00000000 */   nop
    /* FD6C 8001FD6C 1400BF8F */  lw         $ra, 0x14($sp)
    /* FD70 8001FD70 1800BD27 */  addiu      $sp, $sp, 0x18
    /* FD74 8001FD74 0800E003 */  jr         $ra
    /* FD78 8001FD78 00000000 */   nop
endlabel DisableTAP
