.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching getb__FUs, 0x10

glabel getb__FUs
    /* 9D87C 800AD87C FF7F8230 */  andi       $v0, $a0, 0x7FFF
    /* 9D880 800AD880 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 9D884 800AD884 0800E003 */  jr         $ra
    /* 9D888 800AD888 FFFF4230 */   andi      $v0, $v0, 0xFFFF
endlabel getb__FUs
