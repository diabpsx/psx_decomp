.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching free, 0xC

glabel free
    /* 9E3C 80019E3C A0000A24 */  addiu      $t2, $zero, 0xA0
    /* 9E40 80019E40 08004001 */  jr         $t2
    /* 9E44 80019E44 34000924 */   addiu     $t1, $zero, 0x34
endlabel free
    /* 9E48 80019E48 00000000 */  nop
