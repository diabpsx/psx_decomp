.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawQuestLogTSK__FP4TASK, 0xD8

glabel DrawQuestLogTSK__FP4TASK
    /* 58C68 80068C68 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 58C6C 80068C6C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 58C70 80068C70 E16E020C */  jal        GLUE_SetShowGameScreenFlag__Fb
    /* 58C74 80068C74 21200000 */   addu      $a0, $zero, $zero
    /* 58C78 80068C78 EC6E020C */  jal        GLUE_SetShowPanelFlag__Fb
    /* 58C7C 80068C7C 21200000 */   addu      $a0, $zero, $zero
    /* 58C80 80068C80 896E020C */  jal        GLUE_SuspendGame__Fv
    /* 58C84 80068C84 00000000 */   nop
    /* 58C88 80068C88 D7F3000C */  jal        stream_stop__Fv
    /* 58C8C 80068C8C 00000000 */   nop
    /* 58C90 80068C90 32A30108 */  j          .L80068CC8
    /* 58C94 80068C94 00000000 */   nop
  .L80068C98:
    /* 58C98 80068C98 1280023C */  lui        $v0, %hi(qtextflag)
    /* 58C9C 80068C9C 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 58CA0 80068CA0 00000000 */  nop
    /* 58CA4 80068CA4 08004014 */  bnez       $v0, .L80068CC8
    /* 58CA8 80068CA8 00000000 */   nop
    /* 58CAC 80068CAC 1280023C */  lui        $v0, %hi(CDWAIT)
    /* 58CB0 80068CB0 ECAD428C */  lw         $v0, %lo(CDWAIT)($v0)
    /* 58CB4 80068CB4 00000000 */  nop
    /* 58CB8 80068CB8 03004014 */  bnez       $v0, .L80068CC8
    /* 58CBC 80068CBC 00000000 */   nop
    /* 58CC0 80068CC0 9CA2010C */  jal        DrawQuestLog__Fv
    /* 58CC4 80068CC4 00000000 */   nop
  .L80068CC8:
    /* 58CC8 80068CC8 EE80000C */  jal        TSK_Sleep
    /* 58CCC 80068CCC 01000424 */   addiu     $a0, $zero, 0x1
    /* 58CD0 80068CD0 A9128293 */  lbu        $v0, %gp_rel(questlog)($gp)
    /* 58CD4 80068CD4 00000000 */  nop
    /* 58CD8 80068CD8 EFFF4014 */  bnez       $v0, .L80068C98
    /* 58CDC 80068CDC 00000000 */   nop
    /* 58CE0 80068CE0 1280023C */  lui        $v0, %hi(Qfromoptions)
    /* 58CE4 80068CE4 28B24290 */  lbu        $v0, %lo(Qfromoptions)($v0)
    /* 58CE8 80068CE8 00000000 */  nop
    /* 58CEC 80068CEC 03004014 */  bnez       $v0, .L80068CFC
    /* 58CF0 80068CF0 00000000 */   nop
    /* 58CF4 80068CF4 F0A3010C */  jal        RemoveQLog__Fv
    /* 58CF8 80068CF8 00000000 */   nop
  .L80068CFC:
    /* 58CFC 80068CFC 1280023C */  lui        $v0, %hi(qtextflag)
    /* 58D00 80068D00 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 58D04 80068D04 00000000 */  nop
    /* 58D08 80068D08 07004014 */  bnez       $v0, .L80068D28
    /* 58D0C 80068D0C 00000000 */   nop
    /* 58D10 80068D10 E16E020C */  jal        GLUE_SetShowGameScreenFlag__Fb
    /* 58D14 80068D14 01000424 */   addiu     $a0, $zero, 0x1
    /* 58D18 80068D18 E86E020C */  jal        GLUE_SetHomingScrollFlag__Fb
    /* 58D1C 80068D1C 01000424 */   addiu     $a0, $zero, 0x1
    /* 58D20 80068D20 E16E020C */  jal        GLUE_SetShowGameScreenFlag__Fb
    /* 58D24 80068D24 01000424 */   addiu     $a0, $zero, 0x1
  .L80068D28:
    /* 58D28 80068D28 1280013C */  lui        $at, %hi(Qfromoptions)
    /* 58D2C 80068D2C 28B220A0 */  sb         $zero, %lo(Qfromoptions)($at)
    /* 58D30 80068D30 1000BF8F */  lw         $ra, 0x10($sp)
    /* 58D34 80068D34 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 58D38 80068D38 0800E003 */  jr         $ra
    /* 58D3C 80068D3C 00000000 */   nop
endlabel DrawQuestLogTSK__FP4TASK
