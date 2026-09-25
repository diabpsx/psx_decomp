.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CdGetSector2, 0x20

glabel CdGetSector2
    /* B254 8001B254 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* B258 8001B258 1000BFAF */  sw         $ra, 0x10($sp)
    /* B25C 8001B25C 7372000C */  jal        CD_getsector2
    /* B260 8001B260 00000000 */   nop
    /* B264 8001B264 1000BF8F */  lw         $ra, 0x10($sp)
    /* B268 8001B268 0100422C */  sltiu      $v0, $v0, 0x1
    /* B26C 8001B26C 0800E003 */  jr         $ra
    /* B270 8001B270 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel CdGetSector2
