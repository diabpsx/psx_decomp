.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StartTAP, 0x20

glabel StartTAP
    /* FCDC 8001FCDC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* FCE0 8001FCE0 1400BFAF */  sw         $ra, 0x14($sp)
    /* FCE4 8001FCE4 F77E000C */  jal        func_8001FBDC
    /* FCE8 8001FCE8 00000000 */   nop
    /* FCEC 8001FCEC 1400BF8F */  lw         $ra, 0x14($sp)
    /* FCF0 8001FCF0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* FCF4 8001FCF4 0800E003 */  jr         $ra
    /* FCF8 8001FCF8 00000000 */   nop
endlabel StartTAP
