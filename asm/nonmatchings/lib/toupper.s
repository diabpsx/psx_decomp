.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching toupper, 0xC

glabel toupper
    /* 185A4 800285A4 A0000A24 */  addiu      $t2, $zero, 0xA0
    /* 185A8 800285A8 08004001 */  jr         $t2
    /* 185AC 800285AC 25000924 */   addiu     $t1, $zero, 0x25
endlabel toupper
    /* 185B0 800285B0 00000000 */  nop
