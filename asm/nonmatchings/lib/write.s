.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching write, 0xC

glabel write
    /* 19DC 800119DC B0000A24 */  addiu      $t2, $zero, 0xB0
    /* 19E0 800119E0 08004001 */  jr         $t2
    /* 19E4 800119E4 35000924 */   addiu     $t1, $zero, 0x35
endlabel write
    /* 19E8 800119E8 00000000 */  nop
