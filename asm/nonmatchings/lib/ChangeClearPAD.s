.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ChangeClearPAD, 0xC

glabel ChangeClearPAD
    /* 1A4C 80011A4C B0000A24 */  addiu      $t2, $zero, 0xB0
    /* 1A50 80011A50 08004001 */  jr         $t2
    /* 1A54 80011A54 5B000924 */   addiu     $t1, $zero, 0x5B
endlabel ChangeClearPAD
    /* 1A58 80011A58 00000000 */  nop
