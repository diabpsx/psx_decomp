.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetPolyF3, 0x14

glabel SetPolyF3
    /* 324C 8001324C 04000224 */  addiu      $v0, $zero, 0x4
    /* 3250 80013250 030082A0 */  sb         $v0, 0x3($a0)
    /* 3254 80013254 20000224 */  addiu      $v0, $zero, 0x20
    /* 3258 80013258 0800E003 */  jr         $ra
    /* 325C 8001325C 070082A0 */   sb        $v0, 0x7($a0)
endlabel SetPolyF3
