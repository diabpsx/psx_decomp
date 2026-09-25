.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching setstreamcrc, 0x1C

glabel setstreamcrc
    /* 1F35C 8002F35C 781D838F */  lw         $v1, %gp_rel(cdms)($gp)
    /* 1F360 8002F360 00000000 */  nop
    /* 1F364 8002F364 02006010 */  beqz       $v1, .L8002F370
    /* 1F368 8002F368 01000224 */   addiu     $v0, $zero, 0x1
    /* 1F36C 8002F36C 300062AC */  sw         $v0, 0x30($v1)
  .L8002F370:
    /* 1F370 8002F370 0800E003 */  jr         $ra
    /* 1F374 8002F374 00000000 */   nop
endlabel setstreamcrc
