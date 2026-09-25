.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching format, 0xC

glabel format
    /* 19FC 800119FC B0000A24 */  addiu      $t2, $zero, 0xB0
    /* 1A00 80011A00 08004001 */  jr         $t2
    /* 1A04 80011A04 41000924 */   addiu     $t1, $zero, 0x41
endlabel format
    /* 1A08 80011A08 00000000 */  nop
