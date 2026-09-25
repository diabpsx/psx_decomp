.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CdDataCallback, 0x24

glabel CdDataCallback
    /* B274 8001B274 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* B278 8001B278 1000BFAF */  sw         $ra, 0x10($sp)
    /* B27C 8001B27C 21288000 */  addu       $a1, $a0, $zero
    /* B280 8001B280 B748000C */  jal        DMACallback
    /* B284 8001B284 03000424 */   addiu     $a0, $zero, 0x3
    /* B288 8001B288 1000BF8F */  lw         $ra, 0x10($sp)
    /* B28C 8001B28C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* B290 8001B290 0800E003 */  jr         $ra
    /* B294 8001B294 00000000 */   nop
endlabel CdDataCallback
