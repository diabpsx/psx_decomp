.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetTownerGPtrs__FPUcPPUc, 0x20

glabel SetTownerGPtrs__FPUcPPUc
    /* 29FDC 80039FDC 07000224 */  addiu      $v0, $zero, 0x7
    /* 29FE0 80039FE0 1C00A524 */  addiu      $a1, $a1, 0x1C
  .L80039FE4:
    /* 29FE4 80039FE4 0000A4AC */  sw         $a0, 0x0($a1)
    /* 29FE8 80039FE8 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 29FEC 80039FEC FDFF4104 */  bgez       $v0, .L80039FE4
    /* 29FF0 80039FF0 FCFFA524 */   addiu     $a1, $a1, -0x4
    /* 29FF4 80039FF4 0800E003 */  jr         $ra
    /* 29FF8 80039FF8 00000000 */   nop
endlabel SetTownerGPtrs__FPUcPPUc
