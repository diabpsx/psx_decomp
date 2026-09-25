.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _96_remove, 0xC

glabel _96_remove
    /* 2944 80012944 A0000A24 */  addiu      $t2, $zero, 0xA0
    /* 2948 80012948 08004001 */  jr         $t2
    /* 294C 8001294C 72000924 */   addiu     $t1, $zero, 0x72
endlabel _96_remove
    /* 2950 80012950 00000000 */  nop
    /* 2954 80012954 00000000 */  nop
    /* 2958 80012958 00000000 */  nop
