.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetSprt16, 0x14

glabel SetSprt16
    /* 3300 80013300 03000224 */  addiu      $v0, $zero, 0x3
    /* 3304 80013304 030082A0 */  sb         $v0, 0x3($a0)
    /* 3308 80013308 7C000224 */  addiu      $v0, $zero, 0x7C
    /* 330C 8001330C 0800E003 */  jr         $ra
    /* 3310 80013310 070082A0 */   sb        $v0, 0x7($a0)
endlabel SetSprt16
