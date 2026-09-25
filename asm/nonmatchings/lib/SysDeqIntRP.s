.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SysDeqIntRP, 0xC

glabel SysDeqIntRP
    /* 1E6C 80011E6C C0000A24 */  addiu      $t2, $zero, 0xC0
    /* 1E70 80011E70 08004001 */  jr         $t2
    /* 1E74 80011E74 03000924 */   addiu     $t1, $zero, 0x3
endlabel SysDeqIntRP
    /* 1E78 80011E78 00000000 */  nop
