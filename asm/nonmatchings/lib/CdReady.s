.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CdReady, 0x20

glabel CdReady
    /* AE10 8001AE10 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* AE14 8001AE14 1000BFAF */  sw         $ra, 0x10($sp)
    /* AE18 8001AE18 066F000C */  jal        CD_ready
    /* AE1C 8001AE1C 00000000 */   nop
    /* AE20 8001AE20 1000BF8F */  lw         $ra, 0x10($sp)
    /* AE24 8001AE24 1800BD27 */  addiu      $sp, $sp, 0x18
    /* AE28 8001AE28 0800E003 */  jr         $ra
    /* AE2C 8001AE2C 00000000 */   nop
endlabel CdReady
