.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetSprt, 0x14

glabel SetSprt
    /* 3314 80013314 04000224 */  addiu      $v0, $zero, 0x4
    /* 3318 80013318 030082A0 */  sb         $v0, 0x3($a0)
    /* 331C 8001331C 64000224 */  addiu      $v0, $zero, 0x64
    /* 3320 80013320 0800E003 */  jr         $ra
    /* 3324 80013324 070082A0 */   sb        $v0, 0x7($a0)
endlabel SetSprt
