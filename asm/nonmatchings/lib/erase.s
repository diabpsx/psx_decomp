.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching erase, 0xC

glabel erase
    /* 1A2C 80011A2C B0000A24 */  addiu      $t2, $zero, 0xB0
    /* 1A30 80011A30 08004001 */  jr         $t2
    /* 1A34 80011A34 45000924 */   addiu     $t1, $zero, 0x45
endlabel erase
    /* 1A38 80011A38 00000000 */  nop
