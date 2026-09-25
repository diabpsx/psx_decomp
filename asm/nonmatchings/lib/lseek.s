.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching lseek, 0xC

glabel lseek
    /* 18F6C 80028F6C B0000A24 */  addiu      $t2, $zero, 0xB0
    /* 18F70 80028F70 08004001 */  jr         $t2
    /* 18F74 80028F74 33000924 */   addiu     $t1, $zero, 0x33
endlabel lseek
    /* 18F78 80028F78 00000000 */  nop
