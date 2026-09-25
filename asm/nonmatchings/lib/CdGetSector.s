.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CdGetSector, 0x20

glabel CdGetSector
    /* B234 8001B234 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* B238 8001B238 1000BFAF */  sw         $ra, 0x10($sp)
    /* B23C 8001B23C 3372000C */  jal        CD_getsector
    /* B240 8001B240 00000000 */   nop
    /* B244 8001B244 1000BF8F */  lw         $ra, 0x10($sp)
    /* B248 8001B248 0100422C */  sltiu      $v0, $v0, 0x1
    /* B24C 8001B24C 0800E003 */  jr         $ra
    /* B250 8001B250 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel CdGetSector
