.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching filesizea, 0x48

glabel filesizea
    /* 18FBC 80028FBC D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 18FC0 80028FC0 1000A5AF */  sw         $a1, 0x10($sp)
    /* 18FC4 80028FC4 1800A527 */  addiu      $a1, $sp, 0x18
    /* 18FC8 80028FC8 1C00A627 */  addiu      $a2, $sp, 0x1C
    /* 18FCC 80028FCC 2800BFAF */  sw         $ra, 0x28($sp)
    /* 18FD0 80028FD0 86A2000C */  jal        openhandlea
    /* 18FD4 80028FD4 2000A727 */   addiu     $a3, $sp, 0x20
    /* 18FD8 80028FD8 1800A48F */  lw         $a0, 0x18($sp)
    /* 18FDC 80028FDC 00000000 */  nop
    /* 18FE0 80028FE0 03008010 */  beqz       $a0, .L80028FF0
    /* 18FE4 80028FE4 00000000 */   nop
    /* 18FE8 80028FE8 76A3000C */  jal        libclosehandle
    /* 18FEC 80028FEC 00000000 */   nop
  .L80028FF0:
    /* 18FF0 80028FF0 2000A28F */  lw         $v0, 0x20($sp)
    /* 18FF4 80028FF4 2800BF8F */  lw         $ra, 0x28($sp)
    /* 18FF8 80028FF8 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 18FFC 80028FFC 0800E003 */  jr         $ra
    /* 19000 80029000 00000000 */   nop
endlabel filesizea
