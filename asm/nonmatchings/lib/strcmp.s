.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching strcmp, 0xC

glabel strcmp
    /* 9DFC 80019DFC A0000A24 */  addiu      $t2, $zero, 0xA0
    /* 9E00 80019E00 08004001 */  jr         $t2
    /* 9E04 80019E04 17000924 */   addiu     $t1, $zero, 0x17
endlabel strcmp
    /* 9E08 80019E08 00000000 */  nop
