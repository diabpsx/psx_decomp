.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetPolyF4, 0x14

glabel SetPolyF4
    /* 329C 8001329C 05000224 */  addiu      $v0, $zero, 0x5
    /* 32A0 800132A0 030082A0 */  sb         $v0, 0x3($a0)
    /* 32A4 800132A4 28000224 */  addiu      $v0, $zero, 0x28
    /* 32A8 800132A8 0800E003 */  jr         $ra
    /* 32AC 800132AC 070082A0 */   sb        $v0, 0x7($a0)
endlabel SetPolyF4
