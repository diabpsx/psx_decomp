.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _96_init, 0xC

glabel _96_init
    /* 18F5C 80028F5C A0000A24 */  addiu      $t2, $zero, 0xA0
    /* 18F60 80028F60 08004001 */  jr         $t2
    /* 18F64 80028F64 71000924 */   addiu     $t1, $zero, 0x71
endlabel _96_init
    /* 18F68 80028F68 00000000 */  nop
