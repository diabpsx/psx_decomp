.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetLineF3, 0x20

glabel SetLineF3
    /* 33A0 800133A0 5555033C */  lui        $v1, (0x55555555 >> 16)
    /* 33A4 800133A4 55556334 */  ori        $v1, $v1, (0x55555555 & 0xFFFF)
    /* 33A8 800133A8 05000224 */  addiu      $v0, $zero, 0x5
    /* 33AC 800133AC 030082A0 */  sb         $v0, 0x3($a0)
    /* 33B0 800133B0 48000224 */  addiu      $v0, $zero, 0x48
    /* 33B4 800133B4 070082A0 */  sb         $v0, 0x7($a0)
    /* 33B8 800133B8 0800E003 */  jr         $ra
    /* 33BC 800133BC 140083AC */   sw        $v1, 0x14($a0)
endlabel SetLineF3
