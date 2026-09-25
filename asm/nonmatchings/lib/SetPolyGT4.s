.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetPolyGT4, 0x14

glabel SetPolyGT4
    /* 32D8 800132D8 0C000224 */  addiu      $v0, $zero, 0xC
    /* 32DC 800132DC 030082A0 */  sb         $v0, 0x3($a0)
    /* 32E0 800132E0 3C000224 */  addiu      $v0, $zero, 0x3C
    /* 32E4 800132E4 0800E003 */  jr         $ra
    /* 32E8 800132E8 070082A0 */   sb        $v0, 0x7($a0)
endlabel SetPolyGT4
