.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitTAP, 0x20

glabel InitTAP
    /* FCBC 8001FCBC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* FCC0 8001FCC0 1400BFAF */  sw         $ra, 0x14($sp)
    /* FCC4 8001FCC4 C57E000C */  jal        func_8001FB14
    /* FCC8 8001FCC8 00000000 */   nop
    /* FCCC 8001FCCC 1400BF8F */  lw         $ra, 0x14($sp)
    /* FCD0 8001FCD0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* FCD4 8001FCD4 0800E003 */  jr         $ra
    /* FCD8 8001FCD8 00000000 */   nop
endlabel InitTAP
