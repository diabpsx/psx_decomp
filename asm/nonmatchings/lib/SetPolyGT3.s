.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetPolyGT3, 0x14

glabel SetPolyGT3
    /* 3288 80013288 09000224 */  addiu      $v0, $zero, 0x9
    /* 328C 8001328C 030082A0 */  sb         $v0, 0x3($a0)
    /* 3290 80013290 34000224 */  addiu      $v0, $zero, 0x34
    /* 3294 80013294 0800E003 */  jr         $ra
    /* 3298 80013298 070082A0 */   sb        $v0, 0x7($a0)
endlabel SetPolyGT3
