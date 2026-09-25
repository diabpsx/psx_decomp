.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CdDataSync, 0x20

glabel CdDataSync
    /* B298 8001B298 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* B29C 8001B29C 1000BFAF */  sw         $ra, 0x10($sp)
    /* B2A0 8001B2A0 D971000C */  jal        CD_datasync
    /* B2A4 8001B2A4 00000000 */   nop
    /* B2A8 8001B2A8 1000BF8F */  lw         $ra, 0x10($sp)
    /* B2AC 8001B2AC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* B2B0 8001B2B0 0800E003 */  jr         $ra
    /* B2B4 8001B2B4 00000000 */   nop
endlabel CdDataSync
