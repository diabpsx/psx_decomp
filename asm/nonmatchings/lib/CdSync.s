.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CdSync, 0x20

glabel CdSync
    /* ADF0 8001ADF0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* ADF4 8001ADF4 1000BFAF */  sw         $ra, 0x10($sp)
    /* ADF8 8001ADF8 666E000C */  jal        CD_sync
    /* ADFC 8001ADFC 00000000 */   nop
    /* AE00 8001AE00 1000BF8F */  lw         $ra, 0x10($sp)
    /* AE04 8001AE04 1800BD27 */  addiu      $sp, $sp, 0x18
    /* AE08 8001AE08 0800E003 */  jr         $ra
    /* AE0C 8001AE0C 00000000 */   nop
endlabel CdSync
