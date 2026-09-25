.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching setstreamtopup, 0x18

glabel setstreamtopup
    /* 19114 80029114 02008014 */  bnez       $a0, .L80029120
    /* 19118 80029118 01000224 */   addiu     $v0, $zero, 0x1
    /* 1911C 8002911C E81C82AF */  sw         $v0, %gp_rel(streamtoppedupflag)($gp)
  .L80029120:
    /* 19120 80029120 C42284AF */  sw         $a0, %gp_rel(streamtopupfunc)($gp)
    /* 19124 80029124 0800E003 */  jr         $ra
    /* 19128 80029128 00000000 */   nop
endlabel setstreamtopup
