.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching open, 0xC

glabel open
    /* 19BC 800119BC B0000A24 */  addiu      $t2, $zero, 0xB0
    /* 19C0 800119C0 08004001 */  jr         $t2
    /* 19C4 800119C4 32000924 */   addiu     $t1, $zero, 0x32
endlabel open
    /* 19C8 800119C8 00000000 */  nop
