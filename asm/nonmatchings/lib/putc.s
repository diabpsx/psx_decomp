.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching putc, 0xC

glabel putc
    /* 15D6C 80025D6C B0000A24 */  addiu      $t2, $zero, 0xB0
    /* 15D70 80025D70 08004001 */  jr         $t2
    /* 15D74 80025D74 3B000924 */   addiu     $t1, $zero, 0x3B
endlabel putc
    /* 15D78 80025D78 00000000 */  nop
