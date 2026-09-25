.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching firstfile, 0xC

glabel firstfile
    /* 1A0C 80011A0C B0000A24 */  addiu      $t2, $zero, 0xB0
    /* 1A10 80011A10 08004001 */  jr         $t2
    /* 1A14 80011A14 42000924 */   addiu     $t1, $zero, 0x42
endlabel firstfile
    /* 1A18 80011A18 00000000 */  nop
