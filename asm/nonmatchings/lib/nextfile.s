.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching nextfile, 0xC

glabel nextfile
    /* 1A1C 80011A1C B0000A24 */  addiu      $t2, $zero, 0xB0
    /* 1A20 80011A20 08004001 */  jr         $t2
    /* 1A24 80011A24 43000924 */   addiu     $t1, $zero, 0x43
endlabel nextfile
    /* 1A28 80011A28 00000000 */  nop
