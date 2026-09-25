.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching puts, 0xC

glabel puts
    /* 9DD4 80019DD4 B0000A24 */  addiu      $t2, $zero, 0xB0
    /* 9DD8 80019DD8 08004001 */  jr         $t2
    /* 9DDC 80019DDC 3F000924 */   addiu     $t1, $zero, 0x3F
endlabel puts
    /* 9DE0 80019DE0 00000000 */  nop
    /* 9DE4 80019DE4 00000000 */  nop
    /* 9DE8 80019DE8 00000000 */  nop
