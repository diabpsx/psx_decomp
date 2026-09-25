.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetPolyG3, 0x14

glabel SetPolyG3
    /* 3274 80013274 06000224 */  addiu      $v0, $zero, 0x6
    /* 3278 80013278 030082A0 */  sb         $v0, 0x3($a0)
    /* 327C 8001327C 30000224 */  addiu      $v0, $zero, 0x30
    /* 3280 80013280 0800E003 */  jr         $ra
    /* 3284 80013284 070082A0 */   sb        $v0, 0x7($a0)
endlabel SetPolyG3
