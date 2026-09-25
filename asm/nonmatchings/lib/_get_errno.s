.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _get_errno, 0xC

glabel _get_errno
    /* 1A3C 80011A3C B0000A24 */  addiu      $t2, $zero, 0xB0
    /* 1A40 80011A40 08004001 */  jr         $t2
    /* 1A44 80011A44 54000924 */   addiu     $t1, $zero, 0x54
endlabel _get_errno
    /* 1A48 80011A48 00000000 */  nop
