.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching memchr, 0xC

glabel memchr
    /* A6EC 8001A6EC A0000A24 */  addiu      $t2, $zero, 0xA0
    /* A6F0 8001A6F0 08004001 */  jr         $t2
    /* A6F4 8001A6F4 2E000924 */   addiu     $t1, $zero, 0x2E
endlabel memchr
    /* A6F8 8001A6F8 00000000 */  nop
