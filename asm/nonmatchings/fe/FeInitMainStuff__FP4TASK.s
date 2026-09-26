.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FeInitMainStuff__FP4TASK, 0xAC

glabel FeInitMainStuff__FP4TASK
    /* 2868 8013C460 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 286C 8013C464 1000B0AF */  sw         $s0, 0x10($sp)
    /* 2870 8013C468 21808000 */  addu       $s0, $a0, $zero
    /* 2874 8013C46C 1400BFAF */  sw         $ra, 0x14($sp)
    /* 2878 8013C470 D692020C */  jal        PutUpCutScreen__Fi
    /* 287C 8013C474 0A000424 */   addiu     $a0, $zero, 0xA
    /* 2880 8013C478 9768020C */  jal        SPU_Init__Fv
    /* 2884 8013C47C 00000000 */   nop
    /* 2888 8013C480 90DF010C */  jal        snd_init__FUl
    /* 288C 8013C484 21200000 */   addu      $a0, $zero, $zero
    /* 2890 8013C488 2E69020C */  jal        SND_LoadBank__Fi
    /* 2894 8013C48C 11000424 */   addiu     $a0, $zero, 0x11
    /* 2898 8013C490 A40B828F */  lw         $v0, %gp_rel(FlameTData)($gp)
    /* 289C 8013C494 00000000 */  nop
    /* 28A0 8013C498 04004014 */  bnez       $v0, .L8013C4AC
    /* 28A4 8013C49C 00000000 */   nop
    /* 28A8 8013C4A0 044F020C */  jal        GM_UseTexData__Fi
    /* 28AC 8013C4A4 CC000424 */   addiu     $a0, $zero, 0xCC
    /* 28B0 8013C4A8 A40B82AF */  sw         $v0, %gp_rel(FlameTData)($gp)
  .L8013C4AC:
    /* 28B4 8013C4AC A00B828F */  lw         $v0, %gp_rel(FeTData)($gp)
    /* 28B8 8013C4B0 00000000 */  nop
    /* 28BC 8013C4B4 04004014 */  bnez       $v0, .L8013C4C8
    /* 28C0 8013C4B8 00000000 */   nop
    /* 28C4 8013C4BC 044F020C */  jal        GM_UseTexData__Fi
    /* 28C8 8013C4C0 CB000424 */   addiu     $a0, $zero, 0xCB
    /* 28CC 8013C4C4 A00B82AF */  sw         $v0, %gp_rel(FeTData)($gp)
  .L8013C4C8:
    /* 28D0 8013C4C8 0B000016 */  bnez       $s0, .L8013C4F8
    /* 28D4 8013C4CC 00000000 */   nop
    /* 28D8 8013C4D0 7693020C */  jal        FinishProgress__Fv
    /* 28DC 8013C4D4 00000000 */   nop
    /* 28E0 8013C4D8 21200000 */  addu       $a0, $zero, $zero
    /* 28E4 8013C4DC 1480053C */  lui        $a1, %hi(DrawBackTSK__FP4TASK)
    /* 28E8 8013C4E0 D8C2A524 */  addiu      $a1, $a1, %lo(DrawBackTSK__FP4TASK)
    /* 28EC 8013C4E4 00080624 */  addiu      $a2, $zero, 0x800
    /* 28F0 8013C4E8 0480000C */  jal        TSK_AddTask
    /* 28F4 8013C4EC 21380000 */   addu      $a3, $zero, $zero
    /* 28F8 8013C4F0 EE80000C */  jal        TSK_Sleep
    /* 28FC 8013C4F4 01000424 */   addiu     $a0, $zero, 0x1
  .L8013C4F8:
    /* 2900 8013C4F8 1400BF8F */  lw         $ra, 0x14($sp)
    /* 2904 8013C4FC 1000B08F */  lw         $s0, 0x10($sp)
    /* 2908 8013C500 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 290C 8013C504 0800E003 */  jr         $ra
    /* 2910 8013C508 00000000 */   nop
endlabel FeInitMainStuff__FP4TASK
