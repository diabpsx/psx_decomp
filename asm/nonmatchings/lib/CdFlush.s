.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CdFlush, 0x20

glabel CdFlush
    /* AD54 8001AD54 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* AD58 8001AD58 1000BFAF */  sw         $ra, 0x10($sp)
    /* AD5C 8001AD5C DD70000C */  jal        CD_flush
    /* AD60 8001AD60 00000000 */   nop
    /* AD64 8001AD64 1000BF8F */  lw         $ra, 0x10($sp)
    /* AD68 8001AD68 1800BD27 */  addiu      $sp, $sp, 0x18
    /* AD6C 8001AD6C 0800E003 */  jr         $ra
    /* AD70 8001AD70 00000000 */   nop
endlabel CdFlush
