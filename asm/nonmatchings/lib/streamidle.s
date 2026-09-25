.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching streamidle, 0x3C

glabel streamidle
    /* 1F280 8002F280 781D848F */  lw         $a0, %gp_rel(cdms)($gp)
    /* 1F284 8002F284 00000000 */  nop
    /* 1F288 8002F288 0A008010 */  beqz       $a0, .L8002F2B4
    /* 1F28C 8002F28C 01000224 */   addiu     $v0, $zero, 0x1
    /* 1F290 8002F290 2000838C */  lw         $v1, 0x20($a0)
    /* 1F294 8002F294 07000224 */  addiu      $v0, $zero, 0x7
    /* 1F298 8002F298 06006214 */  bne        $v1, $v0, .L8002F2B4
    /* 1F29C 8002F29C 21100000 */   addu      $v0, $zero, $zero
    /* 1F2A0 8002F2A0 7800828C */  lw         $v0, 0x78($a0)
    /* 1F2A4 8002F2A4 00000000 */  nop
    /* 1F2A8 8002F2A8 02004014 */  bnez       $v0, .L8002F2B4
    /* 1F2AC 8002F2AC 21100000 */   addu      $v0, $zero, $zero
    /* 1F2B0 8002F2B0 01000224 */  addiu      $v0, $zero, 0x1
  .L8002F2B4:
    /* 1F2B4 8002F2B4 0800E003 */  jr         $ra
    /* 1F2B8 8002F2B8 00000000 */   nop
endlabel streamidle
