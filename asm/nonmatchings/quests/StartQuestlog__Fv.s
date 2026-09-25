.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StartQuestlog__Fv, 0x134

glabel StartQuestlog__Fv
    /* 58D40 80068D40 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 58D44 80068D44 AC12828F */  lw         $v0, %gp_rel(ALLQUESTS)($gp)
    /* 58D48 80068D48 1800BFAF */  sw         $ra, 0x18($sp)
    /* 58D4C 80068D4C EC1280AF */  sw         $zero, %gp_rel(numqlines)($gp)
    /* 58D50 80068D50 1D004018 */  blez       $v0, .L80068DC8
    /* 58D54 80068D54 21280000 */   addu      $a1, $zero, $zero
    /* 58D58 80068D58 02000824 */  addiu      $t0, $zero, 0x2
    /* 58D5C 80068D5C 1380073C */  lui        $a3, %hi(D_8012EDF8)
    /* 58D60 80068D60 F8EDE724 */  addiu      $a3, $a3, %lo(D_8012EDF8)
    /* 58D64 80068D64 21304000 */  addu       $a2, $v0, $zero
    /* 58D68 80068D68 21200000 */  addu       $a0, $zero, $zero
  .L80068D6C:
    /* 58D6C 80068D6C 0E80013C */  lui        $at, %hi(quests + 0x2)
    /* 58D70 80068D70 21082400 */  addu       $at, $at, $a0
    /* 58D74 80068D74 42DA2290 */  lbu        $v0, %lo(quests + 0x2)($at)
    /* 58D78 80068D78 00000000 */  nop
    /* 58D7C 80068D7C 0E004814 */  bne        $v0, $t0, .L80068DB8
    /* 58D80 80068D80 00000000 */   nop
    /* 58D84 80068D84 0E80013C */  lui        $at, %hi(quests + 0x11)
    /* 58D88 80068D88 21082400 */  addu       $at, $at, $a0
    /* 58D8C 80068D8C 51DA2290 */  lbu        $v0, %lo(quests + 0x11)($at)
    /* 58D90 80068D90 00000000 */  nop
    /* 58D94 80068D94 08004010 */  beqz       $v0, .L80068DB8
    /* 58D98 80068D98 00000000 */   nop
    /* 58D9C 80068D9C EC12838F */  lw         $v1, %gp_rel(numqlines)($gp)
    /* 58DA0 80068DA0 00000000 */  nop
    /* 58DA4 80068DA4 80100300 */  sll        $v0, $v1, 2
    /* 58DA8 80068DA8 21104700 */  addu       $v0, $v0, $a3
    /* 58DAC 80068DAC 01006324 */  addiu      $v1, $v1, 0x1
    /* 58DB0 80068DB0 000045AC */  sw         $a1, 0x0($v0)
    /* 58DB4 80068DB4 EC1283AF */  sw         $v1, %gp_rel(numqlines)($gp)
  .L80068DB8:
    /* 58DB8 80068DB8 0100A524 */  addiu      $a1, $a1, 0x1
    /* 58DBC 80068DBC 2A10A600 */  slt        $v0, $a1, $a2
    /* 58DC0 80068DC0 EAFF4014 */  bnez       $v0, .L80068D6C
    /* 58DC4 80068DC4 14008424 */   addiu     $a0, $a0, 0x14
  .L80068DC8:
    /* 58DC8 80068DC8 EC12838F */  lw         $v1, %gp_rel(numqlines)($gp)
    /* 58DCC 80068DCC 00000000 */  nop
    /* 58DD0 80068DD0 07006228 */  slti       $v0, $v1, 0x7
    /* 58DD4 80068DD4 06004010 */  beqz       $v0, .L80068DF0
    /* 58DD8 80068DD8 07000224 */   addiu     $v0, $zero, 0x7
    /* 58DDC 80068DDC 23104300 */  subu       $v0, $v0, $v1
    /* 58DE0 80068DE0 43100200 */  sra        $v0, $v0, 1
    /* 58DE4 80068DE4 40100200 */  sll        $v0, $v0, 1
    /* 58DE8 80068DE8 7DA30108 */  j          .L80068DF4
    /* 58DEC 80068DEC 06004224 */   addiu     $v0, $v0, 0x6
  .L80068DF0:
    /* 58DF0 80068DF0 06000224 */  addiu      $v0, $zero, 0x6
  .L80068DF4:
    /* 58DF4 80068DF4 F01282AF */  sw         $v0, %gp_rel(qtopline)($gp)
    /* 58DF8 80068DF8 EC12828F */  lw         $v0, %gp_rel(numqlines)($gp)
    /* 58DFC 80068DFC 00000000 */  nop
    /* 58E00 80068E00 04004010 */  beqz       $v0, .L80068E14
    /* 58E04 80068E04 00000000 */   nop
    /* 58E08 80068E08 F012828F */  lw         $v0, %gp_rel(qtopline)($gp)
    /* 58E0C 80068E0C 00000000 */  nop
    /* 58E10 80068E10 E81282AF */  sw         $v0, %gp_rel(qline)($gp)
  .L80068E14:
    /* 58E14 80068E14 02000424 */  addiu      $a0, $zero, 0x2
    /* 58E18 80068E18 21280000 */  addu       $a1, $zero, $zero
    /* 58E1C 80068E1C 21300000 */  addu       $a2, $zero, $zero
    /* 58E20 80068E20 01000224 */  addiu      $v0, $zero, 0x1
    /* 58E24 80068E24 A91282A3 */  sb         $v0, %gp_rel(questlog)($gp)
    /* 58E28 80068E28 CC1280AF */  sw         $zero, %gp_rel(D_8011BA4C)($gp)
    /* 58E2C 80068E2C 53EB010C */  jal        PostGamePad__Fiiii
    /* 58E30 80068E30 21380000 */   addu      $a3, $zero, $zero
    /* 58E34 80068E34 E86E020C */  jal        GLUE_SetHomingScrollFlag__Fb
    /* 58E38 80068E38 21200000 */   addu      $a0, $zero, $zero
    /* 58E3C 80068E3C EC6E020C */  jal        GLUE_SetShowPanelFlag__Fb
    /* 58E40 80068E40 21200000 */   addu      $a0, $zero, $zero
    /* 58E44 80068E44 896E020C */  jal        GLUE_SuspendGame__Fv
    /* 58E48 80068E48 00000000 */   nop
    /* 58E4C 80068E4C 21200000 */  addu       $a0, $zero, $zero
    /* 58E50 80068E50 0780053C */  lui        $a1, %hi(DrawQuestLogTSK__FP4TASK)
    /* 58E54 80068E54 688CA524 */  addiu      $a1, $a1, %lo(DrawQuestLogTSK__FP4TASK)
    /* 58E58 80068E58 00080624 */  addiu      $a2, $zero, 0x800
    /* 58E5C 80068E5C 0480000C */  jal        TSK_AddTask
    /* 58E60 80068E60 21380000 */   addu      $a3, $zero, $zero
    /* 58E64 80068E64 1800BF8F */  lw         $ra, 0x18($sp)
    /* 58E68 80068E68 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 58E6C 80068E6C 0800E003 */  jr         $ra
    /* 58E70 80068E70 00000000 */   nop
endlabel StartQuestlog__Fv
