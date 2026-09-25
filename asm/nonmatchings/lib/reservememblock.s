.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching reservememblock, 0x20

glabel reservememblock
    /* 1A590 8002A590 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1A594 8002A594 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1A598 8002A598 98A9000C */  jal        reservememblocka
    /* 1A59C 8002A59C 01000724 */   addiu     $a3, $zero, 0x1
    /* 1A5A0 8002A5A0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1A5A4 8002A5A4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1A5A8 8002A5A8 0800E003 */  jr         $ra
    /* 1A5AC 8002A5AC 00000000 */   nop
endlabel reservememblock
