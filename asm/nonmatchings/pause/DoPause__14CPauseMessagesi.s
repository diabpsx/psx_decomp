.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DoPause__14CPauseMessagesi, 0x210

glabel DoPause__14CPauseMessagesi
    /* 7866C 8008866C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 78670 80088670 1400B1AF */  sw         $s1, 0x14($sp)
    /* 78674 80088674 21888000 */  addu       $s1, $a0, $zero
    /* 78678 80088678 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7867C 8008867C 2180A000 */  addu       $s0, $a1, $zero
    /* 78680 80088680 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 78684 80088684 77000212 */  beq        $s0, $v0, .L80088864
    /* 78688 80088688 1800BFAF */   sw        $ra, 0x18($sp)
    /* 7868C 8008868C 1280043C */  lui        $a0, %hi(qtextflag)
    /* 78690 80088690 60B98490 */  lbu        $a0, %lo(qtextflag)($a0)
    /* 78694 80088694 1280023C */  lui        $v0, %hi(optionsflag)
    /* 78698 80088698 48B2428C */  lw         $v0, %lo(optionsflag)($v0)
    /* 7869C 8008869C 1280033C */  lui        $v1, %hi(invflag)
    /* 786A0 800886A0 2CC36390 */  lbu        $v1, %lo(invflag)($v1)
    /* 786A4 800886A4 25104400 */  or         $v0, $v0, $a0
    /* 786A8 800886A8 25104300 */  or         $v0, $v0, $v1
    /* 786AC 800886AC 1280033C */  lui        $v1, %hi(chrflag)
    /* 786B0 800886B0 C0B66390 */  lbu        $v1, %lo(chrflag)($v1)
    /* 786B4 800886B4 1280043C */  lui        $a0, %hi(questlog)
    /* 786B8 800886B8 29BA8490 */  lbu        $a0, %lo(questlog)($a0)
    /* 786BC 800886BC 25104300 */  or         $v0, $v0, $v1
    /* 786C0 800886C0 25104400 */  or         $v0, $v0, $a0
    /* 786C4 800886C4 1280033C */  lui        $v1, %hi(sbookflag)
    /* 786C8 800886C8 C6B66390 */  lbu        $v1, %lo(sbookflag)($v1)
    /* 786CC 800886CC 1280043C */  lui        $a0, %hi(stextflag)
    /* 786D0 800886D0 E0BA8480 */  lb         $a0, %lo(stextflag)($a0)
    /* 786D4 800886D4 25104300 */  or         $v0, $v0, $v1
    /* 786D8 800886D8 25104400 */  or         $v0, $v0, $a0
    /* 786DC 800886DC 61004014 */  bnez       $v0, .L80088864
    /* 786E0 800886E0 00000000 */   nop
    /* 786E4 800886E4 871F020C */  jal        BL_AsyncLoadDone__Fv
    /* 786E8 800886E8 00000000 */   nop
    /* 786EC 800886EC 5D004010 */  beqz       $v0, .L80088864
    /* 786F0 800886F0 00800434 */   ori       $a0, $zero, 0x8000
    /* 786F4 800886F4 CC81000C */  jal        TSK_SetExecFilter
    /* 786F8 800886F8 00800534 */   ori       $a1, $zero, 0x8000
    /* 786FC 800886FC 01000224 */  addiu      $v0, $zero, 0x1
    /* 78700 80088700 000030AE */  sw         $s0, 0x0($s1)
    /* 78704 80088704 1280013C */  lui        $at, %hi(PauseMode)
    /* 78708 80088708 A4B722A0 */  sb         $v0, %lo(PauseMode)($at)
    /* 7870C 8008870C E86E020C */  jal        GLUE_SetHomingScrollFlag__Fb
    /* 78710 80088710 21200000 */   addu      $a0, $zero, $zero
    /* 78714 80088714 EC6E020C */  jal        GLUE_SetShowPanelFlag__Fb
    /* 78718 80088718 21200000 */   addu      $a0, $zero, $zero
    /* 7871C 8008871C 8D64020C */  jal        STR_pauseall__Fv
    /* 78720 80088720 00000000 */   nop
    /* 78724 80088724 47DF010C */  jal        snd_stop_snd__FP4TSnd
    /* 78728 80088728 21200000 */   addu      $a0, $zero, $zero
    /* 7872C 8008872C 1280023C */  lui        $v0, %hi(deathflag)
    /* 78730 80088730 0CBA4290 */  lbu        $v0, %lo(deathflag)($v0)
    /* 78734 80088734 00000000 */  nop
    /* 78738 80088738 03004014 */  bnez       $v0, .L80088748
    /* 7873C 8008873C 00000000 */   nop
    /* 78740 80088740 C6F5000C */  jal        PlaySFX__Fi
    /* 78744 80088744 33000424 */   addiu     $a0, $zero, 0x33
  .L80088748:
    /* 78748 80088748 0123020C */  jal        PA_GetPauseOk__Fv
    /* 7874C 8008874C 00000000 */   nop
    /* 78750 80088750 0A004010 */  beqz       $v0, .L8008877C
    /* 78754 80088754 00000000 */   nop
    /* 78758 80088758 1280023C */  lui        $v0, %hi(deathflag)
    /* 7875C 8008875C 0CBA4290 */  lbu        $v0, %lo(deathflag)($v0)
    /* 78760 80088760 00000000 */  nop
    /* 78764 80088764 05004010 */  beqz       $v0, .L8008877C
    /* 78768 80088768 00000000 */   nop
    /* 7876C 8008876C 1280023C */  lui        $v0, %hi(PauseMode)
    /* 78770 80088770 A4B74290 */  lbu        $v0, %lo(PauseMode)($v0)
    /* 78774 80088774 E2210208 */  j          .L80088788
    /* 78778 80088778 2B100200 */   sltu      $v0, $zero, $v0
  .L8008877C:
    /* 7877C 8008877C 1F22020C */  jal        DoPausedMessage__14CPauseMessages
    /* 78780 80088780 21202002 */   addu      $a0, $s1, $zero
    /* 78784 80088784 2B100200 */  sltu       $v0, $zero, $v0
  .L80088788:
    /* 78788 80088788 2C004010 */  beqz       $v0, .L8008883C
    /* 7878C 8008878C 00000000 */   nop
    /* 78790 80088790 0123020C */  jal        PA_GetPauseOk__Fv
    /* 78794 80088794 21800000 */   addu      $s0, $zero, $zero
    /* 78798 80088798 04004010 */  beqz       $v0, .L800887AC
    /* 7879C 8008879C 00000000 */   nop
    /* 787A0 800887A0 6D22020C */  jal        DoQuitMessage__14CPauseMessages
    /* 787A4 800887A4 21202002 */   addu      $a0, $s1, $zero
    /* 787A8 800887A8 2B800200 */  sltu       $s0, $zero, $v0
  .L800887AC:
    /* 787AC 800887AC E6FF0012 */  beqz       $s0, .L80088748
    /* 787B0 800887B0 00000000 */   nop
    /* 787B4 800887B4 B522020C */  jal        AreYouSureMessage__14CPauseMessages
    /* 787B8 800887B8 21202002 */   addu      $a0, $s1, $zero
    /* 787BC 800887BC 01004238 */  xori       $v0, $v0, 0x1
    /* 787C0 800887C0 E1FF4010 */  beqz       $v0, .L80088748
    /* 787C4 800887C4 00000000 */   nop
    /* 787C8 800887C8 FD22020C */  jal        PA_SetPauseOk__Fb
    /* 787CC 800887CC 21200000 */   addu      $a0, $zero, $zero
    /* 787D0 800887D0 D7F3000C */  jal        stream_stop__Fv
    /* 787D4 800887D4 00000000 */   nop
    /* 787D8 800887D8 A4DF010C */  jal        music_fade__Fv
    /* 787DC 800887DC 00000000 */   nop
    /* 787E0 800887E0 BEFC010C */  jal        PaletteFadeOut__Fi
    /* 787E4 800887E4 08000424 */   addiu     $a0, $zero, 0x8
    /* 787E8 800887E8 09004010 */  beqz       $v0, .L80088810
    /* 787EC 800887EC 00000000 */   nop
  .L800887F0:
    /* 787F0 800887F0 ABFB010C */  jal        GetFadeState__Fv
    /* 787F4 800887F4 00000000 */   nop
    /* 787F8 800887F8 05004010 */  beqz       $v0, .L80088810
    /* 787FC 800887FC 00000000 */   nop
    /* 78800 80088800 EE80000C */  jal        TSK_Sleep
    /* 78804 80088804 01000424 */   addiu     $a0, $zero, 0x1
    /* 78808 80088808 FC210208 */  j          .L800887F0
    /* 7880C 8008880C 00000000 */   nop
  .L80088810:
    /* 78810 80088810 1280013C */  lui        $at, %hi(PauseMode)
    /* 78814 80088814 A4B720A0 */  sb         $zero, %lo(PauseMode)($at)
    /* 78818 80088818 E889000C */  jal        GAL_SetTimeStamp
    /* 7881C 8008881C 05000424 */   addiu     $a0, $zero, 0x5
    /* 78820 80088820 2B71020C */  jal        GLUE_StartGameExit__Fv
    /* 78824 80088824 00000000 */   nop
    /* 78828 80088828 01000224 */  addiu      $v0, $zero, 0x1
    /* 7882C 8008882C 1280013C */  lui        $at, %hi(user_start)
    /* 78830 80088830 E4B422AC */  sw         $v0, %lo(user_start)($at)
    /* 78834 80088834 D2210208 */  j          .L80088748
    /* 78838 80088838 00000000 */   nop
  .L8008883C:
    /* 7883C 8008883C AA64020C */  jal        STR_resumeall__Fv
    /* 78840 80088840 00000000 */   nop
    /* 78844 80088844 EC6E020C */  jal        GLUE_SetShowPanelFlag__Fb
    /* 78848 80088848 01000424 */   addiu     $a0, $zero, 0x1
    /* 7884C 8008884C E86E020C */  jal        GLUE_SetHomingScrollFlag__Fb
    /* 78850 80088850 01000424 */   addiu     $a0, $zero, 0x1
    /* 78854 80088854 1280013C */  lui        $at, %hi(PauseMode)
    /* 78858 80088858 A4B720A0 */  sb         $zero, %lo(PauseMode)($at)
    /* 7885C 8008885C D281000C */  jal        TSK_ClearExecFilter
    /* 78860 80088860 00000000 */   nop
  .L80088864:
    /* 78864 80088864 1800BF8F */  lw         $ra, 0x18($sp)
    /* 78868 80088868 1400B18F */  lw         $s1, 0x14($sp)
    /* 7886C 8008886C 1000B08F */  lw         $s0, 0x10($sp)
    /* 78870 80088870 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 78874 80088874 0800E003 */  jr         $ra
    /* 78878 80088878 00000000 */   nop
endlabel DoPause__14CPauseMessagesi
