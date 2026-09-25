.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GPU_cw, 0xC

glabel GPU_cw
    /* 664C 8001664C A0000A24 */  addiu      $t2, $zero, 0xA0
    /* 6650 80016650 08004001 */  jr         $t2
    /* 6654 80016654 49000924 */   addiu     $t1, $zero, 0x49
endlabel GPU_cw
    /* 6658 80016658 00000000 */  nop
