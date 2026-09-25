.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawChrTSK__FP4TASK, 0x110

glabel DrawChrTSK__FP4TASK
    /* 25B48 80035B48 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 25B4C 80035B4C 21200000 */  addu       $a0, $zero, $zero
    /* 25B50 80035B50 1400BFAF */  sw         $ra, 0x14($sp)
    /* 25B54 80035B54 E86E020C */  jal        GLUE_SetHomingScrollFlag__Fb
    /* 25B58 80035B58 1000B0AF */   sw        $s0, 0x10($sp)
    /* 25B5C 80035B5C E16E020C */  jal        GLUE_SetShowGameScreenFlag__Fb
    /* 25B60 80035B60 21200000 */   addu      $a0, $zero, $zero
    /* 25B64 80035B64 EC6E020C */  jal        GLUE_SetShowPanelFlag__Fb
    /* 25B68 80035B68 21200000 */   addu      $a0, $zero, $zero
    /* 25B6C 80035B6C 896E020C */  jal        GLUE_SuspendGame__Fv
    /* 25B70 80035B70 00000000 */   nop
    /* 25B74 80035B74 EEF3000C */  jal        stream_pause__Fv
    /* 25B78 80035B78 00000000 */   nop
    /* 25B7C 80035B7C 02000424 */  addiu      $a0, $zero, 0x2
    /* 25B80 80035B80 21280000 */  addu       $a1, $zero, $zero
    /* 25B84 80035B84 21300000 */  addu       $a2, $zero, $zero
    /* 25B88 80035B88 53EB010C */  jal        PostGamePad__Fiiii
    /* 25B8C 80035B8C 21380000 */   addu      $a3, $zero, $zero
    /* 25B90 80035B90 1280103C */  lui        $s0, %hi(myplr)
    /* 25B94 80035B94 08BA108E */  lw         $s0, %lo(myplr)($s0)
    /* 25B98 80035B98 1280023C */  lui        $v0, %hi(options_pad)
    /* 25B9C 80035B9C 50B2428C */  lw         $v0, %lo(options_pad)($v0)
    /* 25BA0 80035BA0 1280013C */  lui        $at, %hi(myplr)
    /* 25BA4 80035BA4 08BA22AC */  sw         $v0, %lo(myplr)($at)
    /* 25BA8 80035BA8 F4D60008 */  j          .L80035BD0
    /* 25BAC 80035BAC 02000424 */   addiu     $a0, $zero, 0x2
  .L80035BB0:
    /* 25BB0 80035BB0 1280023C */  lui        $v0, %hi(options_pad)
    /* 25BB4 80035BB4 50B2428C */  lw         $v0, %lo(options_pad)($v0)
    /* 25BB8 80035BB8 00000000 */  nop
    /* 25BBC 80035BBC 0B004004 */  bltz       $v0, .L80035BEC
    /* 25BC0 80035BC0 21280000 */   addu      $a1, $zero, $zero
    /* 25BC4 80035BC4 A6D5000C */  jal        DrawChr__Fv
    /* 25BC8 80035BC8 00000000 */   nop
    /* 25BCC 80035BCC 01000424 */  addiu      $a0, $zero, 0x1
  .L80035BD0:
    /* 25BD0 80035BD0 EE80000C */  jal        TSK_Sleep
    /* 25BD4 80035BD4 00000000 */   nop
    /* 25BD8 80035BD8 400F8293 */  lbu        $v0, %gp_rel(chrflag)($gp)
    /* 25BDC 80035BDC 00000000 */  nop
    /* 25BE0 80035BE0 F3FF4014 */  bnez       $v0, .L80035BB0
    /* 25BE4 80035BE4 05000424 */   addiu     $a0, $zero, 0x5
    /* 25BE8 80035BE8 21280000 */  addu       $a1, $zero, $zero
  .L80035BEC:
    /* 25BEC 80035BEC 21300000 */  addu       $a2, $zero, $zero
    /* 25BF0 80035BF0 1280013C */  lui        $at, %hi(myplr)
    /* 25BF4 80035BF4 08BA30AC */  sw         $s0, %lo(myplr)($at)
    /* 25BF8 80035BF8 53EB010C */  jal        PostGamePad__Fiiii
    /* 25BFC 80035BFC 21380000 */   addu      $a3, $zero, $zero
    /* 25C00 80035C00 01000224 */  addiu      $v0, $zero, 0x1
    /* 25C04 80035C04 1280013C */  lui        $at, %hi(PauseMode)
    /* 25C08 80035C08 A4B722A0 */  sb         $v0, %lo(PauseMode)($at)
    /* 25C0C 80035C0C EE80000C */  jal        TSK_Sleep
    /* 25C10 80035C10 02000424 */   addiu     $a0, $zero, 0x2
    /* 25C14 80035C14 1280013C */  lui        $at, %hi(PauseMode)
    /* 25C18 80035C18 A4B720A0 */  sb         $zero, %lo(PauseMode)($at)
    /* 25C1C 80035C1C 07F4000C */  jal        stream_resume__Fv
    /* 25C20 80035C20 00000000 */   nop
    /* 25C24 80035C24 9E6E020C */  jal        GLUE_ResumeGame__Fv
    /* 25C28 80035C28 00000000 */   nop
    /* 25C2C 80035C2C EC6E020C */  jal        GLUE_SetShowPanelFlag__Fb
    /* 25C30 80035C30 01000424 */   addiu     $a0, $zero, 0x1
    /* 25C34 80035C34 E16E020C */  jal        GLUE_SetShowGameScreenFlag__Fb
    /* 25C38 80035C38 01000424 */   addiu     $a0, $zero, 0x1
    /* 25C3C 80035C3C E86E020C */  jal        GLUE_SetHomingScrollFlag__Fb
    /* 25C40 80035C40 01000424 */   addiu     $a0, $zero, 0x1
    /* 25C44 80035C44 1400BF8F */  lw         $ra, 0x14($sp)
    /* 25C48 80035C48 1000B08F */  lw         $s0, 0x10($sp)
    /* 25C4C 80035C4C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 25C50 80035C50 0800E003 */  jr         $ra
    /* 25C54 80035C54 00000000 */   nop
endlabel DrawChrTSK__FP4TASK
