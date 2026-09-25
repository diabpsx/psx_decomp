.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FlushCache, 0xC

glabel FlushCache
    /* 193C 8001193C A0000A24 */  addiu      $t2, $zero, 0xA0
    /* 1940 80011940 08004001 */  jr         $t2
    /* 1944 80011944 44000924 */   addiu     $t1, $zero, 0x44
endlabel FlushCache
    /* 1948 80011948 00000000 */  nop
