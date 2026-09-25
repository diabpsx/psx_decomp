.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SendTAP, 0x20

glabel SendTAP
    /* FD1C 8001FD1C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* FD20 8001FD20 1400BFAF */  sw         $ra, 0x14($sp)
    /* FD24 8001FD24 EF7E000C */  jal        func_8001FBBC
    /* FD28 8001FD28 00000000 */   nop
    /* FD2C 8001FD2C 1400BF8F */  lw         $ra, 0x14($sp)
    /* FD30 8001FD30 1800BD27 */  addiu      $sp, $sp, 0x18
    /* FD34 8001FD34 0800E003 */  jr         $ra
    /* FD38 8001FD38 00000000 */   nop
endlabel SendTAP
