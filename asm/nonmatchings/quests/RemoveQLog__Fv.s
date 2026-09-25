.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RemoveQLog__Fv, 0xB8

glabel RemoveQLog__Fv
    /* 58FC0 80068FC0 A9128293 */  lbu        $v0, %gp_rel(questlog)($gp)
    /* 58FC4 80068FC4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 58FC8 80068FC8 27004010 */  beqz       $v0, .L80069068
    /* 58FCC 80068FCC 1000BFAF */   sw        $ra, 0x10($sp)
    /* 58FD0 80068FD0 E16E020C */  jal        GLUE_SetShowGameScreenFlag__Fb
    /* 58FD4 80068FD4 01000424 */   addiu     $a0, $zero, 0x1
    /* 58FD8 80068FD8 1280023C */  lui        $v0, %hi(Qfromoptions)
    /* 58FDC 80068FDC 28B24290 */  lbu        $v0, %lo(Qfromoptions)($v0)
    /* 58FE0 80068FE0 00000000 */  nop
    /* 58FE4 80068FE4 0C004010 */  beqz       $v0, .L80069018
    /* 58FE8 80068FE8 FFFF4224 */   addiu     $v0, $v0, -0x1
    /* 58FEC 80068FEC 1280013C */  lui        $at, %hi(options_pad)
    /* 58FF0 80068FF0 50B222AC */  sw         $v0, %lo(options_pad)($at)
    /* 58FF4 80068FF4 EE80000C */  jal        TSK_Sleep
    /* 58FF8 80068FF8 01000424 */   addiu     $a0, $zero, 0x1
    /* 58FFC 80068FFC 03000224 */  addiu      $v0, $zero, 0x3
    /* 59000 80069000 1280013C */  lui        $at, %hi(Qfromoptions)
    /* 59004 80069004 28B222A0 */  sb         $v0, %lo(Qfromoptions)($at)
    /* 59008 80069008 73AA020C */  jal        ToggleOptions__Fv
    /* 5900C 8006900C 00000000 */   nop
    /* 59010 80069010 19A40108 */  j          .L80069064
    /* 59014 80069014 00000000 */   nop
  .L80069018:
    /* 59018 80069018 05000424 */  addiu      $a0, $zero, 0x5
    /* 5901C 8006901C 21280000 */  addu       $a1, $zero, $zero
    /* 59020 80069020 21300000 */  addu       $a2, $zero, $zero
    /* 59024 80069024 53EB010C */  jal        PostGamePad__Fiiii
    /* 59028 80069028 21380000 */   addu      $a3, $zero, $zero
    /* 5902C 8006902C E86E020C */  jal        GLUE_SetHomingScrollFlag__Fb
    /* 59030 80069030 01000424 */   addiu     $a0, $zero, 0x1
    /* 59034 80069034 1280023C */  lui        $v0, %hi(qtextflag)
    /* 59038 80069038 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 5903C 8006903C 00000000 */  nop
    /* 59040 80069040 08004014 */  bnez       $v0, .L80069064
    /* 59044 80069044 00000000 */   nop
    /* 59048 80069048 9E6E020C */  jal        GLUE_ResumeGame__Fv
    /* 5904C 8006904C 00000000 */   nop
    /* 59050 80069050 EC6E020C */  jal        GLUE_SetShowPanelFlag__Fb
    /* 59054 80069054 01000424 */   addiu     $a0, $zero, 0x1
    /* 59058 80069058 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 5905C 8006905C 1280013C */  lui        $at, %hi(options_pad)
    /* 59060 80069060 50B222AC */  sw         $v0, %lo(options_pad)($at)
  .L80069064:
    /* 59064 80069064 A91280A3 */  sb         $zero, %gp_rel(questlog)($gp)
  .L80069068:
    /* 59068 80069068 1000BF8F */  lw         $ra, 0x10($sp)
    /* 5906C 8006906C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 59070 80069070 0800E003 */  jr         $ra
    /* 59074 80069074 00000000 */   nop
endlabel RemoveQLog__Fv
