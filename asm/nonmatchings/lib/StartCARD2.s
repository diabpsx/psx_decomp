.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StartCARD2, 0xC

glabel StartCARD2
    /* A93C 8001A93C B0000A24 */  addiu      $t2, $zero, 0xB0
    /* A940 8001A940 08004001 */  jr         $t2
    /* A944 8001A944 4B000924 */   addiu     $t1, $zero, 0x4B
endlabel StartCARD2
    /* A948 8001A948 00000000 */  nop
