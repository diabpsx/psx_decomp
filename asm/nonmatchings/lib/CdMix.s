.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CdMix, 0x20

glabel CdMix
    /* B214 8001B214 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* B218 8001B218 1000BFAF */  sw         $ra, 0x10($sp)
    /* B21C 8001B21C BB70000C */  jal        CD_vol
    /* B220 8001B220 00000000 */   nop
    /* B224 8001B224 1000BF8F */  lw         $ra, 0x10($sp)
    /* B228 8001B228 01000224 */  addiu      $v0, $zero, 0x1
    /* B22C 8001B22C 0800E003 */  jr         $ra
    /* B230 8001B230 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel CdMix
