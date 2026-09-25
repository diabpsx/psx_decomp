.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawSTextTSK__FP4TASK, 0x108

glabel DrawSTextTSK__FP4TASK
    /* 5FDA4 8006FDA4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 5FDA8 8006FDA8 01000224 */  addiu      $v0, $zero, 0x1
    /* 5FDAC 8006FDAC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 5FDB0 8006FDB0 331382A3 */  sb         $v0, %gp_rel(InStoreFlag)($gp)
    /* 5FDB4 8006FDB4 E86E020C */  jal        GLUE_SetHomingScrollFlag__Fb
    /* 5FDB8 8006FDB8 21200000 */   addu      $a0, $zero, $zero
    /* 5FDBC 8006FDBC EC6E020C */  jal        GLUE_SetShowPanelFlag__Fb
    /* 5FDC0 8006FDC0 21200000 */   addu      $a0, $zero, $zero
    /* 5FDC4 8006FDC4 896E020C */  jal        GLUE_SuspendGame__Fv
    /* 5FDC8 8006FDC8 00000000 */   nop
    /* 5FDCC 8006FDCC 60138283 */  lb         $v0, %gp_rel(stextflag)($gp)
    /* 5FDD0 8006FDD0 00000000 */  nop
    /* 5FDD4 8006FDD4 1D004010 */  beqz       $v0, .L8006FE4C
    /* 5FDD8 8006FDD8 00000000 */   nop
  .L8006FDDC:
    /* 5FDDC 8006FDDC C16E020C */  jal        GLUE_Finished__Fv
    /* 5FDE0 8006FDE0 00000000 */   nop
    /* 5FDE4 8006FDE4 01004238 */  xori       $v0, $v0, 0x1
    /* 5FDE8 8006FDE8 18004010 */  beqz       $v0, .L8006FE4C
    /* 5FDEC 8006FDEC 00000000 */   nop
    /* 5FDF0 8006FDF0 1280023C */  lui        $v0, %hi(qtextflag)
    /* 5FDF4 8006FDF4 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 5FDF8 8006FDF8 00000000 */  nop
    /* 5FDFC 8006FDFC 0D004014 */  bnez       $v0, .L8006FE34
    /* 5FE00 8006FE00 00000000 */   nop
    /* 5FE04 8006FE04 1280023C */  lui        $v0, %hi(CDWAIT)
    /* 5FE08 8006FE08 ECAD428C */  lw         $v0, %lo(CDWAIT)($v0)
    /* 5FE0C 8006FE0C 00000000 */  nop
    /* 5FE10 8006FE10 08004014 */  bnez       $v0, .L8006FE34
    /* 5FE14 8006FE14 00000000 */   nop
    /* 5FE18 8006FE18 1280023C */  lui        $v0, %hi(TextPtr)
    /* 5FE1C 8006FE1C F4BB428C */  lw         $v0, %lo(TextPtr)($v0)
    /* 5FE20 8006FE20 00000000 */  nop
    /* 5FE24 8006FE24 03004010 */  beqz       $v0, .L8006FE34
    /* 5FE28 8006FE28 00000000 */   nop
    /* 5FE2C 8006FE2C ABBF010C */  jal        DoThatDrawSText__Fv
    /* 5FE30 8006FE30 00000000 */   nop
  .L8006FE34:
    /* 5FE34 8006FE34 EE80000C */  jal        TSK_Sleep
    /* 5FE38 8006FE38 01000424 */   addiu     $a0, $zero, 0x1
    /* 5FE3C 8006FE3C 60138283 */  lb         $v0, %gp_rel(stextflag)($gp)
    /* 5FE40 8006FE40 00000000 */  nop
    /* 5FE44 8006FE44 E5FF4014 */  bnez       $v0, .L8006FDDC
    /* 5FE48 8006FE48 00000000 */   nop
  .L8006FE4C:
    /* 5FE4C 8006FE4C 1280023C */  lui        $v0, %hi(qtextflag)
    /* 5FE50 8006FE50 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 5FE54 8006FE54 00000000 */  nop
    /* 5FE58 8006FE58 05004014 */  bnez       $v0, .L8006FE70
    /* 5FE5C 8006FE5C 00000000 */   nop
    /* 5FE60 8006FE60 ABBF010C */  jal        DoThatDrawSText__Fv
    /* 5FE64 8006FE64 00000000 */   nop
    /* 5FE68 8006FE68 1280023C */  lui        $v0, %hi(qtextflag)
    /* 5FE6C 8006FE6C 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
  .L8006FE70:
    /* 5FE70 8006FE70 331380A3 */  sb         $zero, %gp_rel(InStoreFlag)($gp)
    /* 5FE74 8006FE74 09004014 */  bnez       $v0, .L8006FE9C
    /* 5FE78 8006FE78 00000000 */   nop
    /* 5FE7C 8006FE7C 9E6E020C */  jal        GLUE_ResumeGame__Fv
    /* 5FE80 8006FE80 00000000 */   nop
    /* 5FE84 8006FE84 EC6E020C */  jal        GLUE_SetShowPanelFlag__Fb
    /* 5FE88 8006FE88 01000424 */   addiu     $a0, $zero, 0x1
    /* 5FE8C 8006FE8C E86E020C */  jal        GLUE_SetHomingScrollFlag__Fb
    /* 5FE90 8006FE90 01000424 */   addiu     $a0, $zero, 0x1
    /* 5FE94 8006FE94 1280013C */  lui        $at, %hi(PauseMode)
    /* 5FE98 8006FE98 A4B720A0 */  sb         $zero, %lo(PauseMode)($at)
  .L8006FE9C:
    /* 5FE9C 8006FE9C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 5FEA0 8006FEA0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 5FEA4 8006FEA4 0800E003 */  jr         $ra
    /* 5FEA8 8006FEA8 00000000 */   nop
endlabel DrawSTextTSK__FP4TASK
