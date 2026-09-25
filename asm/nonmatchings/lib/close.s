.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching close, 0xC

glabel close
    /* 19EC 800119EC B0000A24 */  addiu      $t2, $zero, 0xB0
    /* 19F0 800119F0 08004001 */  jr         $t2
    /* 19F4 800119F4 36000924 */   addiu     $t1, $zero, 0x36
endlabel close
    /* 19F8 800119F8 00000000 */  nop
