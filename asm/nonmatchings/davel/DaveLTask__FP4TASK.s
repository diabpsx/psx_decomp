.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DaveLTask__FP4TASK, 0xD0

glabel DaveLTask__FP4TASK
    /* 906E4 800A06E4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 906E8 800A06E8 1000BFAF */  sw         $ra, 0x10($sp)
    /* 906EC 800A06EC 01000424 */  addiu      $a0, $zero, 0x1
    /* 906F0 800A06F0 FD25020C */  jal        PAD_GetPad__FiUc
    /* 906F4 800A06F4 21280000 */   addu      $a1, $zero, $zero
  .L800A06F8:
    /* 906F8 800A06F8 1280023C */  lui        $v0, %hi(CDWAIT)
    /* 906FC 800A06FC ECAD428C */  lw         $v0, %lo(CDWAIT)($v0)
    /* 90700 800A0700 00000000 */  nop
    /* 90704 800A0704 21004014 */  bnez       $v0, .L800A078C
    /* 90708 800A0708 00000000 */   nop
    /* 9070C 800A070C 1280023C */  lui        $v0, %hi(PauseMode)
    /* 90710 800A0710 A4B74290 */  lbu        $v0, %lo(PauseMode)($v0)
    /* 90714 800A0714 1280033C */  lui        $v1, %hi(invflag)
    /* 90718 800A0718 2CC36390 */  lbu        $v1, %lo(invflag)($v1)
    /* 9071C 800A071C 1280043C */  lui        $a0, %hi(chrflag)
    /* 90720 800A0720 C0B68490 */  lbu        $a0, %lo(chrflag)($a0)
    /* 90724 800A0724 25104300 */  or         $v0, $v0, $v1
    /* 90728 800A0728 25208200 */  or         $a0, $a0, $v0
    /* 9072C 800A072C 1280033C */  lui        $v1, %hi(sbookflag)
    /* 90730 800A0730 C6B66390 */  lbu        $v1, %lo(sbookflag)($v1)
    /* 90734 800A0734 1280023C */  lui        $v0, %hi(questlog)
    /* 90738 800A0738 29BA4290 */  lbu        $v0, %lo(questlog)($v0)
    /* 9073C 800A073C 25186400 */  or         $v1, $v1, $a0
    /* 90740 800A0740 25104300 */  or         $v0, $v0, $v1
    /* 90744 800A0744 2B100200 */  sltu       $v0, $zero, $v0
    /* 90748 800A0748 7C0982AF */  sw         $v0, %gp_rel(D_8011B0FC)($gp)
    /* 9074C 800A074C D979020C */  jal        mteleportfx__Fv
    /* 90750 800A0750 00000000 */   nop
    /* 90754 800A0754 9E7A020C */  jal        invistimer__Fv
    /* 90758 800A0758 00000000 */   nop
    /* 9075C 800A075C 6980020C */  jal        healFX__Fv
    /* 90760 800A0760 00000000 */   nop
    /* 90764 800A0764 7009828F */  lw         $v0, %gp_rel(D_8011B0F0)($gp)
    /* 90768 800A0768 00000000 */  nop
    /* 9076C 800A076C 05004014 */  bnez       $v0, .L800A0784
    /* 90770 800A0770 00000000 */   nop
    /* 90774 800A0774 7409828F */  lw         $v0, %gp_rel(D_8011B0F4)($gp)
    /* 90778 800A0778 00000000 */  nop
    /* 9077C 800A077C 03004010 */  beqz       $v0, .L800A078C
    /* 90780 800A0780 00000000 */   nop
  .L800A0784:
    /* 90784 800A0784 AB7C020C */  jal        doparticlejump__Fv
    /* 90788 800A0788 00000000 */   nop
  .L800A078C:
    /* 9078C 800A078C EE80000C */  jal        TSK_Sleep
    /* 90790 800A0790 01000424 */   addiu     $a0, $zero, 0x1
    /* 90794 800A0794 C16E020C */  jal        GLUE_Finished__Fv
    /* 90798 800A0798 00000000 */   nop
    /* 9079C 800A079C D6FF4010 */  beqz       $v0, .L800A06F8
    /* 907A0 800A07A0 00000000 */   nop
    /* 907A4 800A07A4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 907A8 800A07A8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 907AC 800A07AC 0800E003 */  jr         $ra
    /* 907B0 800A07B0 00000000 */   nop
endlabel DaveLTask__FP4TASK
