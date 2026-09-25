.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ChangeClearRCnt, 0xC

glabel ChangeClearRCnt
    /* 226C 8001226C C0000A24 */  addiu      $t2, $zero, 0xC0
    /* 2270 80012270 08004001 */  jr         $t2
    /* 2274 80012274 0A000924 */   addiu     $t1, $zero, 0xA
endlabel ChangeClearRCnt
    /* 2278 80012278 00000000 */  nop
