.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitCARD2, 0xC

glabel InitCARD2
    /* A92C 8001A92C B0000A24 */  addiu      $t2, $zero, 0xB0
    /* A930 8001A930 08004001 */  jr         $t2
    /* A934 8001A934 4A000924 */   addiu     $t1, $zero, 0x4A
endlabel InitCARD2
    /* A938 8001A938 00000000 */  nop
