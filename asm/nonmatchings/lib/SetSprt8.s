.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetSprt8, 0x14

glabel SetSprt8
    /* 32EC 800132EC 03000224 */  addiu      $v0, $zero, 0x3
    /* 32F0 800132F0 030082A0 */  sb         $v0, 0x3($a0)
    /* 32F4 800132F4 74000224 */  addiu      $v0, $zero, 0x74
    /* 32F8 800132F8 0800E003 */  jr         $ra
    /* 32FC 800132FC 070082A0 */   sb        $v0, 0x7($a0)
endlabel SetSprt8
