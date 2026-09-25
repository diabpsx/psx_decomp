.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetLineG3, 0x20

glabel SetLineG3
    /* 33C0 800133C0 5555033C */  lui        $v1, (0x55555555 >> 16)
    /* 33C4 800133C4 55556334 */  ori        $v1, $v1, (0x55555555 & 0xFFFF)
    /* 33C8 800133C8 07000224 */  addiu      $v0, $zero, 0x7
    /* 33CC 800133CC 030082A0 */  sb         $v0, 0x3($a0)
    /* 33D0 800133D0 58000224 */  addiu      $v0, $zero, 0x58
    /* 33D4 800133D4 070082A0 */  sb         $v0, 0x7($a0)
    /* 33D8 800133D8 0800E003 */  jr         $ra
    /* 33DC 800133DC 1C0083AC */   sw        $v1, 0x1C($a0)
endlabel SetLineG3
