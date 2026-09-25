.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetLineG2, 0x14

glabel SetLineG2
    /* 338C 8001338C 04000224 */  addiu      $v0, $zero, 0x4
    /* 3390 80013390 030082A0 */  sb         $v0, 0x3($a0)
    /* 3394 80013394 50000224 */  addiu      $v0, $zero, 0x50
    /* 3398 80013398 0800E003 */  jr         $ra
    /* 339C 8001339C 070082A0 */   sb        $v0, 0x7($a0)
endlabel SetLineG2
