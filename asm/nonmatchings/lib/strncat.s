.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching strncat, 0xC

glabel strncat
    /* 9DEC 80019DEC A0000A24 */  addiu      $t2, $zero, 0xA0
    /* 9DF0 80019DF0 08004001 */  jr         $t2
    /* 9DF4 80019DF4 16000924 */   addiu     $t1, $zero, 0x16
endlabel strncat
    /* 9DF8 80019DF8 00000000 */  nop
