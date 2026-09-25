.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawDurIcon__6GPanelP7PanelXYP12PlayerStruct, 0x12C

glabel DrawDurIcon__6GPanelP7PanelXYP12PlayerStruct
    /* 88704 80098704 1280023C */  lui        $v0, %hi(chrflag)
    /* 88708 80098708 C0B64290 */  lbu        $v0, %lo(chrflag)($v0)
    /* 8870C 8009870C D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 88710 80098710 2000B2AF */  sw         $s2, 0x20($sp)
    /* 88714 80098714 21908000 */  addu       $s2, $a0, $zero
    /* 88718 80098718 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 8871C 8009871C 2188A000 */  addu       $s1, $a1, $zero
    /* 88720 80098720 2400B3AF */  sw         $s3, 0x24($sp)
    /* 88724 80098724 2198C000 */  addu       $s3, $a2, $zero
    /* 88728 80098728 2800BFAF */  sw         $ra, 0x28($sp)
    /* 8872C 8009872C 06004014 */  bnez       $v0, .L80098748
    /* 88730 80098730 1800B0AF */   sw        $s0, 0x18($sp)
    /* 88734 80098734 1280023C */  lui        $v0, %hi(questlog)
    /* 88738 80098738 29BA4290 */  lbu        $v0, %lo(questlog)($v0)
    /* 8873C 8009873C 00000000 */  nop
    /* 88740 80098740 0B004010 */  beqz       $v0, .L80098770
    /* 88744 80098744 00000000 */   nop
  .L80098748:
    /* 88748 80098748 1280023C */  lui        $v0, %hi(invflag)
    /* 8874C 8009874C 2CC34290 */  lbu        $v0, %lo(invflag)($v0)
    /* 88750 80098750 00000000 */  nop
    /* 88754 80098754 2E004014 */  bnez       $v0, .L80098810
    /* 88758 80098758 00000000 */   nop
    /* 8875C 8009875C 1280023C */  lui        $v0, %hi(sbookflag)
    /* 88760 80098760 C6B64290 */  lbu        $v0, %lo(sbookflag)($v0)
    /* 88764 80098764 00000000 */  nop
    /* 88768 80098768 29004014 */  bnez       $v0, .L80098810
    /* 8876C 8009876C 00000000 */   nop
  .L80098770:
    /* 88770 80098770 1280033C */  lui        $v1, %hi(gbMaxPlayers)
    /* 88774 80098774 A2B96390 */  lbu        $v1, %lo(gbMaxPlayers)($v1)
    /* 88778 80098778 01000224 */  addiu      $v0, $zero, 0x1
    /* 8877C 8009877C 0A006210 */  beq        $v1, $v0, .L800987A8
    /* 88780 80098780 21204002 */   addu      $a0, $s2, $zero
    /* 88784 80098784 54002292 */  lbu        $v0, 0x54($s1)
    /* 88788 80098788 00000000 */  nop
    /* 8878C 8009878C 80100200 */  sll        $v0, $v0, 2
    /* 88790 80098790 1280013C */  lui        $at, %hi(spspelstate)
    /* 88794 80098794 21082200 */  addu       $at, $at, $v0
    /* 88798 80098798 4CB6228C */  lw         $v0, %lo(spspelstate)($at)
    /* 8879C 8009879C 00000000 */  nop
    /* 887A0 800987A0 1B004014 */  bnez       $v0, .L80098810
    /* 887A4 800987A4 00000000 */   nop
  .L800987A8:
    /* 887A8 800987A8 B0016726 */  addiu      $a3, $s3, 0x1B0
    /* 887AC 800987AC 3400258E */  lw         $a1, 0x34($s1)
    /* 887B0 800987B0 3800268E */  lw         $a2, 0x38($s1)
    /* 887B4 800987B4 03000224 */  addiu      $v0, $zero, 0x3
    /* 887B8 800987B8 0E61020C */  jal        DrawDurThingy__6GPaneliiP10ItemStructi
    /* 887BC 800987BC 1000A2AF */   sw        $v0, 0x10($sp)
    /* 887C0 800987C0 21204002 */  addu       $a0, $s2, $zero
    /* 887C4 800987C4 38046726 */  addiu      $a3, $s3, 0x438
    /* 887C8 800987C8 3C00258E */  lw         $a1, 0x3C($s1)
    /* 887CC 800987CC 4000268E */  lw         $a2, 0x40($s1)
    /* 887D0 800987D0 02000224 */  addiu      $v0, $zero, 0x2
    /* 887D4 800987D4 0E61020C */  jal        DrawDurThingy__6GPaneliiP10ItemStructi
    /* 887D8 800987D8 1000A2AF */   sw        $v0, 0x10($sp)
    /* 887DC 800987DC 21204002 */  addu       $a0, $s2, $zero
    /* 887E0 800987E0 60036726 */  addiu      $a3, $s3, 0x360
    /* 887E4 800987E4 4400258E */  lw         $a1, 0x44($s1)
    /* 887E8 800987E8 4800268E */  lw         $a2, 0x48($s1)
    /* 887EC 800987EC FFFF1024 */  addiu      $s0, $zero, -0x1
    /* 887F0 800987F0 0E61020C */  jal        DrawDurThingy__6GPaneliiP10ItemStructi
    /* 887F4 800987F4 1000B0AF */   sw        $s0, 0x10($sp)
    /* 887F8 800987F8 21204002 */  addu       $a0, $s2, $zero
    /* 887FC 800987FC 4C00258E */  lw         $a1, 0x4C($s1)
    /* 88800 80098800 5000268E */  lw         $a2, 0x50($s1)
    /* 88804 80098804 CC036726 */  addiu      $a3, $s3, 0x3CC
    /* 88808 80098808 0E61020C */  jal        DrawDurThingy__6GPaneliiP10ItemStructi
    /* 8880C 8009880C 1000B0AF */   sw        $s0, 0x10($sp)
  .L80098810:
    /* 88810 80098810 2800BF8F */  lw         $ra, 0x28($sp)
    /* 88814 80098814 2400B38F */  lw         $s3, 0x24($sp)
    /* 88818 80098818 2000B28F */  lw         $s2, 0x20($sp)
    /* 8881C 8009881C 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 88820 80098820 1800B08F */  lw         $s0, 0x18($sp)
    /* 88824 80098824 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 88828 80098828 0800E003 */  jr         $ra
    /* 8882C 8009882C 00000000 */   nop
endlabel DrawDurIcon__6GPanelP7PanelXYP12PlayerStruct
