.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ReturnFromException, 0xC

glabel ReturnFromException
    /* 295C 8001295C B0000A24 */  addiu      $t2, $zero, 0xB0
    /* 2960 80012960 08004001 */  jr         $t2
    /* 2964 80012964 17000924 */   addiu     $t1, $zero, 0x17
endlabel ReturnFromException
    /* 2968 80012968 00000000 */  nop
