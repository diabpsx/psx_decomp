.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _bu_init, 0xC

glabel _bu_init
    /* 194C 8001194C A0000A24 */  addiu      $t2, $zero, 0xA0
    /* 1950 80011950 08004001 */  jr         $t2
    /* 1954 80011954 70000924 */   addiu     $t1, $zero, 0x70
endlabel _bu_init
    /* 1958 80011958 00000000 */  nop
