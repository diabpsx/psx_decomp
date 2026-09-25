.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetPolyFT3, 0x14

glabel SetPolyFT3
    /* 3260 80013260 07000224 */  addiu      $v0, $zero, 0x7
    /* 3264 80013264 030082A0 */  sb         $v0, 0x3($a0)
    /* 3268 80013268 24000224 */  addiu      $v0, $zero, 0x24
    /* 326C 8001326C 0800E003 */  jr         $ra
    /* 3270 80013270 070082A0 */   sb        $v0, 0x7($a0)
endlabel SetPolyFT3
