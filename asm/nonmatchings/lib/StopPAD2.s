.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StopPAD2, 0xC

glabel StopPAD2
    /* 1E3C 80011E3C B0000A24 */  addiu      $t2, $zero, 0xB0
    /* 1E40 80011E40 08004001 */  jr         $t2
    /* 1E44 80011E44 14000924 */   addiu     $t1, $zero, 0x14
endlabel StopPAD2
    /* 1E48 80011E48 00000000 */  nop
