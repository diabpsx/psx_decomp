.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DoThatDrawInv__Fv, 0x810

glabel DoThatDrawInv__Fv
    /* 1FB1C 80159714 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 1FB20 80159718 FB000424 */  addiu      $a0, $zero, 0xFB
    /* 1FB24 8015971C 3000BFAF */  sw         $ra, 0x30($sp)
    /* 1FB28 80159720 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 1FB2C 80159724 2800B2AF */  sw         $s2, 0x28($sp)
    /* 1FB30 80159728 2400B1AF */  sw         $s1, 0x24($sp)
    /* 1FB34 8015972C C80E020C */  jal        PRIM_FullScreen__Fi
    /* 1FB38 80159730 2000B0AF */   sw        $s0, 0x20($sp)
    /* 1FB3C 80159734 BC1B80AF */  sw         $zero, %gp_rel(InvPageFlag)($gp)
    /* 1FB40 80159738 E16E020C */  jal        GLUE_SetShowGameScreenFlag__Fb
    /* 1FB44 8015973C 21200000 */   addu      $a0, $zero, $zero
    /* 1FB48 80159740 EC6E020C */  jal        GLUE_SetShowPanelFlag__Fb
    /* 1FB4C 80159744 21200000 */   addu      $a0, $zero, $zero
    /* 1FB50 80159748 48001024 */  addiu      $s0, $zero, 0x48
    /* 1FB54 8015974C 1180023C */  lui        $v0, %hi(InvSlotTable + 0x48)
    /* 1FB58 80159750 C8D64224 */  addiu      $v0, $v0, %lo(InvSlotTable + 0x48)
  .L80159754:
    /* 1FB5C 80159754 000040A0 */  sb         $zero, 0x0($v0)
    /* 1FB60 80159758 FFFF1026 */  addiu      $s0, $s0, -0x1
    /* 1FB64 8015975C FDFF0106 */  bgez       $s0, .L80159754
    /* 1FB68 80159760 FFFF4224 */   addiu     $v0, $v0, -0x1
    /* 1FB6C 80159764 6261050C */  jal        DrawInvBack__Fv
    /* 1FB70 80159768 FFFF1024 */   addiu     $s0, $zero, -0x1
    /* 1FB74 8015976C 1800A427 */  addiu      $a0, $sp, 0x18
    /* 1FB78 80159770 741B858F */  lw         $a1, %gp_rel(D_8011C2F4)($gp)
    /* 1FB7C 80159774 7E000224 */  addiu      $v0, $zero, 0x7E
    /* 1FB80 80159778 1800A2A7 */  sh         $v0, 0x18($sp)
    /* 1FB84 8015977C 1E000224 */  addiu      $v0, $zero, 0x1E
    /* 1FB88 80159780 1A00A2A7 */  sh         $v0, 0x1A($sp)
    /* 1FB8C 80159784 B8000224 */  addiu      $v0, $zero, 0xB8
    /* 1FB90 80159788 1C00A2A7 */  sh         $v0, 0x1C($sp)
    /* 1FB94 8015978C 60000224 */  addiu      $v0, $zero, 0x60
    /* 1FB98 80159790 7B0E020C */  jal        PRIM_Clip__FP4RECTi
    /* 1FB9C 80159794 1E00A2A7 */   sh        $v0, 0x1E($sp)
    /* 1FBA0 80159798 9B5E050C */  jal        DrawInvStats__Fv
    /* 1FBA4 8015979C 00000000 */   nop
    /* 1FBA8 801597A0 0063050C */  jal        DrawInvMsg__Fv
    /* 1FBAC 801597A4 00000000 */   nop
    /* 1FBB0 801597A8 7363050C */  jal        DrawInvHelpTxt__Fv
    /* 1FBB4 801597AC 00000000 */   nop
    /* 1FBB8 801597B0 1280033C */  lui        $v1, %hi(myplr)
    /* 1FBBC 801597B4 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 1FBC0 801597B8 00000000 */  nop
    /* 1FBC4 801597BC 40100300 */  sll        $v0, $v1, 1
    /* 1FBC8 801597C0 21104300 */  addu       $v0, $v0, $v1
    /* 1FBCC 801597C4 80100200 */  sll        $v0, $v0, 2
    /* 1FBD0 801597C8 21104300 */  addu       $v0, $v0, $v1
    /* 1FBD4 801597CC 00110200 */  sll        $v0, $v0, 4
    /* 1FBD8 801597D0 23104300 */  subu       $v0, $v0, $v1
    /* 1FBDC 801597D4 80100200 */  sll        $v0, $v0, 2
    /* 1FBE0 801597D8 21104300 */  addu       $v0, $v0, $v1
    /* 1FBE4 801597DC C0180200 */  sll        $v1, $v0, 3
    /* 1FBE8 801597E0 0E80013C */  lui        $at, %hi(plr + 0x1DC)
    /* 1FBEC 801597E4 21082300 */  addu       $at, $at, $v1
    /* 1FBF0 801597E8 14A72284 */  lh         $v0, %lo(plr + 0x1DC)($at)
    /* 1FBF4 801597EC 00000000 */  nop
    /* 1FBF8 801597F0 12005010 */  beq        $v0, $s0, .L8015983C
    /* 1FBFC 801597F4 01000224 */   addiu     $v0, $zero, 0x1
    /* 1FC00 801597F8 1180083C */  lui        $t0, %hi(InvRect)
    /* 1FC04 801597FC 30D0088D */  lw         $t0, %lo(InvRect)($t0)
    /* 1FC08 80159800 1180053C */  lui        $a1, %hi(InvRect + 0x4)
    /* 1FC0C 80159804 34D0A58C */  lw         $a1, %lo(InvRect + 0x4)($a1)
    /* 1FC10 80159808 1180013C */  lui        $at, %hi(InvSlotTable)
    /* 1FC14 8015980C 80D622A0 */  sb         $v0, %lo(InvSlotTable)($at)
    /* 1FC18 80159810 0E80013C */  lui        $at, %hi(plr + 0x1FC)
    /* 1FC1C 80159814 21082300 */  addu       $at, $at, $v1
    /* 1FC20 80159818 34A72690 */  lbu        $a2, %lo(plr + 0x1FC)($at)
    /* 1FC24 8015981C 0E80013C */  lui        $at, %hi(plr + 0x216)
    /* 1FC28 80159820 21082300 */  addu       $at, $at, $v1
    /* 1FC2C 80159824 4EA72780 */  lb         $a3, %lo(plr + 0x216)($at)
    /* 1FC30 80159828 1000A0AF */  sw         $zero, 0x10($sp)
    /* 1FC34 8015982C 21200001 */  addu       $a0, $t0, $zero
    /* 1FC38 80159830 0100E738 */  xori       $a3, $a3, 0x1
    /* 1FC3C 80159834 6E5D050C */  jal        InvDrawItem__FiiiUci
    /* 1FC40 80159838 0100E72C */   sltiu     $a3, $a3, 0x1
  .L8015983C:
    /* 1FC44 8015983C 1280023C */  lui        $v0, %hi(myplr)
    /* 1FC48 80159840 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 1FC4C 80159844 00000000 */  nop
    /* 1FC50 80159848 40180200 */  sll        $v1, $v0, 1
    /* 1FC54 8015984C 21186200 */  addu       $v1, $v1, $v0
    /* 1FC58 80159850 80180300 */  sll        $v1, $v1, 2
    /* 1FC5C 80159854 21186200 */  addu       $v1, $v1, $v0
    /* 1FC60 80159858 00190300 */  sll        $v1, $v1, 4
    /* 1FC64 8015985C 23186200 */  subu       $v1, $v1, $v0
    /* 1FC68 80159860 80180300 */  sll        $v1, $v1, 2
    /* 1FC6C 80159864 21186200 */  addu       $v1, $v1, $v0
    /* 1FC70 80159868 C0180300 */  sll        $v1, $v1, 3
    /* 1FC74 8015986C 0E80013C */  lui        $at, %hi(plr + 0x248)
    /* 1FC78 80159870 21082300 */  addu       $at, $at, $v1
    /* 1FC7C 80159874 80A72284 */  lh         $v0, %lo(plr + 0x248)($at)
    /* 1FC80 80159878 00000000 */  nop
    /* 1FC84 8015987C 12005010 */  beq        $v0, $s0, .L801598C8
    /* 1FC88 80159880 01000224 */   addiu     $v0, $zero, 0x1
    /* 1FC8C 80159884 1180083C */  lui        $t0, %hi(InvRect + 0x20)
    /* 1FC90 80159888 50D0088D */  lw         $t0, %lo(InvRect + 0x20)($t0)
    /* 1FC94 8015988C 1180053C */  lui        $a1, %hi(InvRect + 0x24)
    /* 1FC98 80159890 54D0A58C */  lw         $a1, %lo(InvRect + 0x24)($a1)
    /* 1FC9C 80159894 1180013C */  lui        $at, %hi(InvSlotTable + 0x4)
    /* 1FCA0 80159898 84D622A0 */  sb         $v0, %lo(InvSlotTable + 0x4)($at)
    /* 1FCA4 8015989C 0E80013C */  lui        $at, %hi(plr + 0x268)
    /* 1FCA8 801598A0 21082300 */  addu       $at, $at, $v1
    /* 1FCAC 801598A4 A0A72690 */  lbu        $a2, %lo(plr + 0x268)($at)
    /* 1FCB0 801598A8 0E80013C */  lui        $at, %hi(plr + 0x282)
    /* 1FCB4 801598AC 21082300 */  addu       $at, $at, $v1
    /* 1FCB8 801598B0 BAA72780 */  lb         $a3, %lo(plr + 0x282)($at)
    /* 1FCBC 801598B4 1000A0AF */  sw         $zero, 0x10($sp)
    /* 1FCC0 801598B8 21200001 */  addu       $a0, $t0, $zero
    /* 1FCC4 801598BC 0100E738 */  xori       $a3, $a3, 0x1
    /* 1FCC8 801598C0 6E5D050C */  jal        InvDrawItem__FiiiUci
    /* 1FCCC 801598C4 0100E72C */   sltiu     $a3, $a3, 0x1
  .L801598C8:
    /* 1FCD0 801598C8 1280023C */  lui        $v0, %hi(myplr)
    /* 1FCD4 801598CC 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 1FCD8 801598D0 00000000 */  nop
    /* 1FCDC 801598D4 40180200 */  sll        $v1, $v0, 1
    /* 1FCE0 801598D8 21186200 */  addu       $v1, $v1, $v0
    /* 1FCE4 801598DC 80180300 */  sll        $v1, $v1, 2
    /* 1FCE8 801598E0 21186200 */  addu       $v1, $v1, $v0
    /* 1FCEC 801598E4 00190300 */  sll        $v1, $v1, 4
    /* 1FCF0 801598E8 23186200 */  subu       $v1, $v1, $v0
    /* 1FCF4 801598EC 80180300 */  sll        $v1, $v1, 2
    /* 1FCF8 801598F0 21186200 */  addu       $v1, $v1, $v0
    /* 1FCFC 801598F4 C0180300 */  sll        $v1, $v1, 3
    /* 1FD00 801598F8 0E80013C */  lui        $at, %hi(plr + 0x2B4)
    /* 1FD04 801598FC 21082300 */  addu       $at, $at, $v1
    /* 1FD08 80159900 ECA72284 */  lh         $v0, %lo(plr + 0x2B4)($at)
    /* 1FD0C 80159904 00000000 */  nop
    /* 1FD10 80159908 12005010 */  beq        $v0, $s0, .L80159954
    /* 1FD14 8015990C 01000224 */   addiu     $v0, $zero, 0x1
    /* 1FD18 80159910 1180083C */  lui        $t0, %hi(InvRect + 0x28)
    /* 1FD1C 80159914 58D0088D */  lw         $t0, %lo(InvRect + 0x28)($t0)
    /* 1FD20 80159918 1180053C */  lui        $a1, %hi(InvRect + 0x2C)
    /* 1FD24 8015991C 5CD0A58C */  lw         $a1, %lo(InvRect + 0x2C)($a1)
    /* 1FD28 80159920 1180013C */  lui        $at, %hi(InvSlotTable + 0x5)
    /* 1FD2C 80159924 85D622A0 */  sb         $v0, %lo(InvSlotTable + 0x5)($at)
    /* 1FD30 80159928 0E80013C */  lui        $at, %hi(plr + 0x2D4)
    /* 1FD34 8015992C 21082300 */  addu       $at, $at, $v1
    /* 1FD38 80159930 0CA82690 */  lbu        $a2, %lo(plr + 0x2D4)($at)
    /* 1FD3C 80159934 0E80013C */  lui        $at, %hi(plr + 0x2EE)
    /* 1FD40 80159938 21082300 */  addu       $at, $at, $v1
    /* 1FD44 8015993C 26A82780 */  lb         $a3, %lo(plr + 0x2EE)($at)
    /* 1FD48 80159940 1000A0AF */  sw         $zero, 0x10($sp)
    /* 1FD4C 80159944 21200001 */  addu       $a0, $t0, $zero
    /* 1FD50 80159948 0100E738 */  xori       $a3, $a3, 0x1
    /* 1FD54 8015994C 6E5D050C */  jal        InvDrawItem__FiiiUci
    /* 1FD58 80159950 0100E72C */   sltiu     $a3, $a3, 0x1
  .L80159954:
    /* 1FD5C 80159954 1280023C */  lui        $v0, %hi(myplr)
    /* 1FD60 80159958 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 1FD64 8015995C 00000000 */  nop
    /* 1FD68 80159960 40180200 */  sll        $v1, $v0, 1
    /* 1FD6C 80159964 21186200 */  addu       $v1, $v1, $v0
    /* 1FD70 80159968 80180300 */  sll        $v1, $v1, 2
    /* 1FD74 8015996C 21186200 */  addu       $v1, $v1, $v0
    /* 1FD78 80159970 00190300 */  sll        $v1, $v1, 4
    /* 1FD7C 80159974 23186200 */  subu       $v1, $v1, $v0
    /* 1FD80 80159978 80180300 */  sll        $v1, $v1, 2
    /* 1FD84 8015997C 21186200 */  addu       $v1, $v1, $v0
    /* 1FD88 80159980 C0180300 */  sll        $v1, $v1, 3
    /* 1FD8C 80159984 0E80013C */  lui        $at, %hi(plr + 0x320)
    /* 1FD90 80159988 21082300 */  addu       $at, $at, $v1
    /* 1FD94 8015998C 58A82284 */  lh         $v0, %lo(plr + 0x320)($at)
    /* 1FD98 80159990 00000000 */  nop
    /* 1FD9C 80159994 12005010 */  beq        $v0, $s0, .L801599E0
    /* 1FDA0 80159998 01000224 */   addiu     $v0, $zero, 0x1
    /* 1FDA4 8015999C 1180083C */  lui        $t0, %hi(InvRect + 0x30)
    /* 1FDA8 801599A0 60D0088D */  lw         $t0, %lo(InvRect + 0x30)($t0)
    /* 1FDAC 801599A4 1180053C */  lui        $a1, %hi(InvRect + 0x34)
    /* 1FDB0 801599A8 64D0A58C */  lw         $a1, %lo(InvRect + 0x34)($a1)
    /* 1FDB4 801599AC 1180013C */  lui        $at, %hi(InvSlotTable + 0x6)
    /* 1FDB8 801599B0 86D622A0 */  sb         $v0, %lo(InvSlotTable + 0x6)($at)
    /* 1FDBC 801599B4 0E80013C */  lui        $at, %hi(plr + 0x340)
    /* 1FDC0 801599B8 21082300 */  addu       $at, $at, $v1
    /* 1FDC4 801599BC 78A82690 */  lbu        $a2, %lo(plr + 0x340)($at)
    /* 1FDC8 801599C0 0E80013C */  lui        $at, %hi(plr + 0x35A)
    /* 1FDCC 801599C4 21082300 */  addu       $at, $at, $v1
    /* 1FDD0 801599C8 92A82780 */  lb         $a3, %lo(plr + 0x35A)($at)
    /* 1FDD4 801599CC 1000A0AF */  sw         $zero, 0x10($sp)
    /* 1FDD8 801599D0 21200001 */  addu       $a0, $t0, $zero
    /* 1FDDC 801599D4 0100E738 */  xori       $a3, $a3, 0x1
    /* 1FDE0 801599D8 6E5D050C */  jal        InvDrawItem__FiiiUci
    /* 1FDE4 801599DC 0100E72C */   sltiu     $a3, $a3, 0x1
  .L801599E0:
    /* 1FDE8 801599E0 1280023C */  lui        $v0, %hi(myplr)
    /* 1FDEC 801599E4 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 1FDF0 801599E8 00000000 */  nop
    /* 1FDF4 801599EC 40180200 */  sll        $v1, $v0, 1
    /* 1FDF8 801599F0 21186200 */  addu       $v1, $v1, $v0
    /* 1FDFC 801599F4 80180300 */  sll        $v1, $v1, 2
    /* 1FE00 801599F8 21186200 */  addu       $v1, $v1, $v0
    /* 1FE04 801599FC 00190300 */  sll        $v1, $v1, 4
    /* 1FE08 80159A00 23186200 */  subu       $v1, $v1, $v0
    /* 1FE0C 80159A04 80180300 */  sll        $v1, $v1, 2
    /* 1FE10 80159A08 21186200 */  addu       $v1, $v1, $v0
    /* 1FE14 80159A0C C0180300 */  sll        $v1, $v1, 3
    /* 1FE18 80159A10 0E80013C */  lui        $at, %hi(plr + 0x38C)
    /* 1FE1C 80159A14 21082300 */  addu       $at, $at, $v1
    /* 1FE20 80159A18 C4A82284 */  lh         $v0, %lo(plr + 0x38C)($at)
    /* 1FE24 80159A1C 00000000 */  nop
    /* 1FE28 80159A20 50005010 */  beq        $v0, $s0, .L80159B64
    /* 1FE2C 80159A24 01001124 */   addiu     $s1, $zero, 0x1
    /* 1FE30 80159A28 10001224 */  addiu      $s2, $zero, 0x10
    /* 1FE34 80159A2C 1180013C */  lui        $at, %hi(InvSlotTable + 0x7)
    /* 1FE38 80159A30 87D631A0 */  sb         $s1, %lo(InvSlotTable + 0x7)($at)
    /* 1FE3C 80159A34 0E80013C */  lui        $at, %hi(plr + 0x3AC)
    /* 1FE40 80159A38 21082300 */  addu       $at, $at, $v1
    /* 1FE44 80159A3C E4A82690 */  lbu        $a2, %lo(plr + 0x3AC)($at)
    /* 1FE48 80159A40 1180083C */  lui        $t0, %hi(InvRect + 0x38)
    /* 1FE4C 80159A44 68D0088D */  lw         $t0, %lo(InvRect + 0x38)($t0)
    /* 1FE50 80159A48 1180013C */  lui        $at, %hi(InvItemWidth + 0xC)
    /* 1FE54 80159A4C 21082600 */  addu       $at, $at, $a2
    /* 1FE58 80159A50 24D52290 */  lbu        $v0, %lo(InvItemWidth + 0xC)($at)
    /* 1FE5C 80159A54 1180053C */  lui        $a1, %hi(InvRect + 0x3C)
    /* 1FE60 80159A58 6CD0A58C */  lw         $a1, %lo(InvRect + 0x3C)($a1)
    /* 1FE64 80159A5C 02005214 */  bne        $v0, $s2, .L80159A68
    /* 1FE68 80159A60 00000000 */   nop
    /* 1FE6C 80159A64 08000825 */  addiu      $t0, $t0, 0x8
  .L80159A68:
    /* 1FE70 80159A68 1180013C */  lui        $at, %hi(InvItemHeight + 0xC)
    /* 1FE74 80159A6C 21082600 */  addu       $at, $at, $a2
    /* 1FE78 80159A70 D8D52290 */  lbu        $v0, %lo(InvItemHeight + 0xC)($at)
    /* 1FE7C 80159A74 20001024 */  addiu      $s0, $zero, 0x20
    /* 1FE80 80159A78 02005014 */  bne        $v0, $s0, .L80159A84
    /* 1FE84 80159A7C 00000000 */   nop
    /* 1FE88 80159A80 0800A524 */  addiu      $a1, $a1, 0x8
  .L80159A84:
    /* 1FE8C 80159A84 0E80013C */  lui        $at, %hi(plr + 0x3C6)
    /* 1FE90 80159A88 21082300 */  addu       $at, $at, $v1
    /* 1FE94 80159A8C FEA82780 */  lb         $a3, %lo(plr + 0x3C6)($at)
    /* 1FE98 80159A90 21200001 */  addu       $a0, $t0, $zero
    /* 1FE9C 80159A94 1000A0AF */  sw         $zero, 0x10($sp)
    /* 1FEA0 80159A98 0100E738 */  xori       $a3, $a3, 0x1
    /* 1FEA4 80159A9C 6E5D050C */  jal        InvDrawItem__FiiiUci
    /* 1FEA8 80159AA0 0100E72C */   sltiu     $a3, $a3, 0x1
    /* 1FEAC 80159AA4 1280033C */  lui        $v1, %hi(myplr)
    /* 1FEB0 80159AA8 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 1FEB4 80159AAC 00000000 */  nop
    /* 1FEB8 80159AB0 40100300 */  sll        $v0, $v1, 1
    /* 1FEBC 80159AB4 21104300 */  addu       $v0, $v0, $v1
    /* 1FEC0 80159AB8 80100200 */  sll        $v0, $v0, 2
    /* 1FEC4 80159ABC 21104300 */  addu       $v0, $v0, $v1
    /* 1FEC8 80159AC0 00110200 */  sll        $v0, $v0, 4
    /* 1FECC 80159AC4 23104300 */  subu       $v0, $v0, $v1
    /* 1FED0 80159AC8 80100200 */  sll        $v0, $v0, 2
    /* 1FED4 80159ACC 21104300 */  addu       $v0, $v0, $v1
    /* 1FED8 80159AD0 C0380200 */  sll        $a3, $v0, 3
    /* 1FEDC 80159AD4 0E80013C */  lui        $at, %hi(plr + 0x3B4)
    /* 1FEE0 80159AD8 21082700 */  addu       $at, $at, $a3
    /* 1FEE4 80159ADC ECA82380 */  lb         $v1, %lo(plr + 0x3B4)($at)
    /* 1FEE8 80159AE0 02000224 */  addiu      $v0, $zero, 0x2
    /* 1FEEC 80159AE4 1F006214 */  bne        $v1, $v0, .L80159B64
    /* 1FEF0 80159AE8 00000000 */   nop
    /* 1FEF4 80159AEC 1180013C */  lui        $at, %hi(InvSlotTable + 0xD)
    /* 1FEF8 80159AF0 8DD631A0 */  sb         $s1, %lo(InvSlotTable + 0xD)($at)
    /* 1FEFC 80159AF4 0E80013C */  lui        $at, %hi(plr + 0x3AC)
    /* 1FF00 80159AF8 21082700 */  addu       $at, $at, $a3
    /* 1FF04 80159AFC E4A82690 */  lbu        $a2, %lo(plr + 0x3AC)($at)
    /* 1FF08 80159B00 1180083C */  lui        $t0, %hi(InvRect + 0x68)
    /* 1FF0C 80159B04 98D0088D */  lw         $t0, %lo(InvRect + 0x68)($t0)
    /* 1FF10 80159B08 1180013C */  lui        $at, %hi(InvItemWidth + 0xC)
    /* 1FF14 80159B0C 21082600 */  addu       $at, $at, $a2
    /* 1FF18 80159B10 24D52290 */  lbu        $v0, %lo(InvItemWidth + 0xC)($at)
    /* 1FF1C 80159B14 1180053C */  lui        $a1, %hi(InvRect + 0x6C)
    /* 1FF20 80159B18 9CD0A58C */  lw         $a1, %lo(InvRect + 0x6C)($a1)
    /* 1FF24 80159B1C 02005214 */  bne        $v0, $s2, .L80159B28
    /* 1FF28 80159B20 00000000 */   nop
    /* 1FF2C 80159B24 08000825 */  addiu      $t0, $t0, 0x8
  .L80159B28:
    /* 1FF30 80159B28 1180013C */  lui        $at, %hi(InvItemHeight + 0xC)
    /* 1FF34 80159B2C 21082600 */  addu       $at, $at, $a2
    /* 1FF38 80159B30 D8D52290 */  lbu        $v0, %lo(InvItemHeight + 0xC)($at)
    /* 1FF3C 80159B34 00000000 */  nop
    /* 1FF40 80159B38 02005014 */  bne        $v0, $s0, .L80159B44
    /* 1FF44 80159B3C 21200001 */   addu      $a0, $t0, $zero
    /* 1FF48 80159B40 0800A524 */  addiu      $a1, $a1, 0x8
  .L80159B44:
    /* 1FF4C 80159B44 0E80013C */  lui        $at, %hi(plr + 0x432)
    /* 1FF50 80159B48 21082700 */  addu       $at, $at, $a3
    /* 1FF54 80159B4C 6AA92780 */  lb         $a3, %lo(plr + 0x432)($at)
    /* 1FF58 80159B50 01000224 */  addiu      $v0, $zero, 0x1
    /* 1FF5C 80159B54 1000A2AF */  sw         $v0, 0x10($sp)
    /* 1FF60 80159B58 0100E738 */  xori       $a3, $a3, 0x1
    /* 1FF64 80159B5C 6E5D050C */  jal        InvDrawItem__FiiiUci
    /* 1FF68 80159B60 0100E72C */   sltiu     $a3, $a3, 0x1
  .L80159B64:
    /* 1FF6C 80159B64 1280033C */  lui        $v1, %hi(myplr)
    /* 1FF70 80159B68 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 1FF74 80159B6C 00000000 */  nop
    /* 1FF78 80159B70 40100300 */  sll        $v0, $v1, 1
    /* 1FF7C 80159B74 21104300 */  addu       $v0, $v0, $v1
    /* 1FF80 80159B78 80100200 */  sll        $v0, $v0, 2
    /* 1FF84 80159B7C 21104300 */  addu       $v0, $v0, $v1
    /* 1FF88 80159B80 00110200 */  sll        $v0, $v0, 4
    /* 1FF8C 80159B84 23104300 */  subu       $v0, $v0, $v1
    /* 1FF90 80159B88 80100200 */  sll        $v0, $v0, 2
    /* 1FF94 80159B8C 21104300 */  addu       $v0, $v0, $v1
    /* 1FF98 80159B90 C0380200 */  sll        $a3, $v0, 3
    /* 1FF9C 80159B94 0E80013C */  lui        $at, %hi(plr + 0x3F8)
    /* 1FFA0 80159B98 21082700 */  addu       $at, $at, $a3
    /* 1FFA4 80159B9C 30A92384 */  lh         $v1, %lo(plr + 0x3F8)($at)
    /* 1FFA8 80159BA0 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 1FFAC 80159BA4 20006210 */  beq        $v1, $v0, .L80159C28
    /* 1FFB0 80159BA8 01000224 */   addiu     $v0, $zero, 0x1
    /* 1FFB4 80159BAC 1180013C */  lui        $at, %hi(InvSlotTable + 0xD)
    /* 1FFB8 80159BB0 8DD622A0 */  sb         $v0, %lo(InvSlotTable + 0xD)($at)
    /* 1FFBC 80159BB4 10000224 */  addiu      $v0, $zero, 0x10
    /* 1FFC0 80159BB8 0E80013C */  lui        $at, %hi(plr + 0x418)
    /* 1FFC4 80159BBC 21082700 */  addu       $at, $at, $a3
    /* 1FFC8 80159BC0 50A92690 */  lbu        $a2, %lo(plr + 0x418)($at)
    /* 1FFCC 80159BC4 1180083C */  lui        $t0, %hi(InvRect + 0x68)
    /* 1FFD0 80159BC8 98D0088D */  lw         $t0, %lo(InvRect + 0x68)($t0)
    /* 1FFD4 80159BCC 1180013C */  lui        $at, %hi(InvItemWidth + 0xC)
    /* 1FFD8 80159BD0 21082600 */  addu       $at, $at, $a2
    /* 1FFDC 80159BD4 24D52390 */  lbu        $v1, %lo(InvItemWidth + 0xC)($at)
    /* 1FFE0 80159BD8 1180053C */  lui        $a1, %hi(InvRect + 0x6C)
    /* 1FFE4 80159BDC 9CD0A58C */  lw         $a1, %lo(InvRect + 0x6C)($a1)
    /* 1FFE8 80159BE0 02006214 */  bne        $v1, $v0, .L80159BEC
    /* 1FFEC 80159BE4 00000000 */   nop
    /* 1FFF0 80159BE8 08000825 */  addiu      $t0, $t0, 0x8
  .L80159BEC:
    /* 1FFF4 80159BEC 1180013C */  lui        $at, %hi(InvItemHeight + 0xC)
    /* 1FFF8 80159BF0 21082600 */  addu       $at, $at, $a2
    /* 1FFFC 80159BF4 D8D52390 */  lbu        $v1, %lo(InvItemHeight + 0xC)($at)
    /* 20000 80159BF8 20000224 */  addiu      $v0, $zero, 0x20
    /* 20004 80159BFC 02006214 */  bne        $v1, $v0, .L80159C08
    /* 20008 80159C00 00000000 */   nop
    /* 2000C 80159C04 0800A524 */  addiu      $a1, $a1, 0x8
  .L80159C08:
    /* 20010 80159C08 0E80013C */  lui        $at, %hi(plr + 0x432)
    /* 20014 80159C0C 21082700 */  addu       $at, $at, $a3
    /* 20018 80159C10 6AA92780 */  lb         $a3, %lo(plr + 0x432)($at)
    /* 2001C 80159C14 21200001 */  addu       $a0, $t0, $zero
    /* 20020 80159C18 1000A0AF */  sw         $zero, 0x10($sp)
    /* 20024 80159C1C 0100E738 */  xori       $a3, $a3, 0x1
    /* 20028 80159C20 6E5D050C */  jal        InvDrawItem__FiiiUci
    /* 2002C 80159C24 0100E72C */   sltiu     $a3, $a3, 0x1
  .L80159C28:
    /* 20030 80159C28 1280033C */  lui        $v1, %hi(myplr)
    /* 20034 80159C2C 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 20038 80159C30 00000000 */  nop
    /* 2003C 80159C34 40100300 */  sll        $v0, $v1, 1
    /* 20040 80159C38 21104300 */  addu       $v0, $v0, $v1
    /* 20044 80159C3C 80100200 */  sll        $v0, $v0, 2
    /* 20048 80159C40 21104300 */  addu       $v0, $v0, $v1
    /* 2004C 80159C44 00110200 */  sll        $v0, $v0, 4
    /* 20050 80159C48 23104300 */  subu       $v0, $v0, $v1
    /* 20054 80159C4C 80100200 */  sll        $v0, $v0, 2
    /* 20058 80159C50 21104300 */  addu       $v0, $v0, $v1
    /* 2005C 80159C54 C0200200 */  sll        $a0, $v0, 3
    /* 20060 80159C58 0E80013C */  lui        $at, %hi(plr + 0x464)
    /* 20064 80159C5C 21082400 */  addu       $at, $at, $a0
    /* 20068 80159C60 9CA92384 */  lh         $v1, %lo(plr + 0x464)($at)
    /* 2006C 80159C64 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 20070 80159C68 12006210 */  beq        $v1, $v0, .L80159CB4
    /* 20074 80159C6C 01000224 */   addiu     $v0, $zero, 0x1
    /* 20078 80159C70 1180083C */  lui        $t0, %hi(InvRect + 0x98)
    /* 2007C 80159C74 C8D0088D */  lw         $t0, %lo(InvRect + 0x98)($t0)
    /* 20080 80159C78 1180053C */  lui        $a1, %hi(InvRect + 0x9C)
    /* 20084 80159C7C CCD0A58C */  lw         $a1, %lo(InvRect + 0x9C)($a1)
    /* 20088 80159C80 1180013C */  lui        $at, %hi(InvSlotTable + 0x13)
    /* 2008C 80159C84 93D622A0 */  sb         $v0, %lo(InvSlotTable + 0x13)($at)
    /* 20090 80159C88 0E80013C */  lui        $at, %hi(plr + 0x484)
    /* 20094 80159C8C 21082400 */  addu       $at, $at, $a0
    /* 20098 80159C90 BCA92690 */  lbu        $a2, %lo(plr + 0x484)($at)
    /* 2009C 80159C94 0E80013C */  lui        $at, %hi(plr + 0x49E)
    /* 200A0 80159C98 21082400 */  addu       $at, $at, $a0
    /* 200A4 80159C9C D6A92780 */  lb         $a3, %lo(plr + 0x49E)($at)
    /* 200A8 80159CA0 1000A0AF */  sw         $zero, 0x10($sp)
    /* 200AC 80159CA4 21200001 */  addu       $a0, $t0, $zero
    /* 200B0 80159CA8 0100E738 */  xori       $a3, $a3, 0x1
    /* 200B4 80159CAC 6E5D050C */  jal        InvDrawItem__FiiiUci
    /* 200B8 80159CB0 0100E72C */   sltiu     $a3, $a3, 0x1
  .L80159CB4:
    /* 200BC 80159CB4 21800000 */  addu       $s0, $zero, $zero
    /* 200C0 80159CB8 0E80133C */  lui        $s3, %hi(plr + 0x1588)
    /* 200C4 80159CBC C0BA7326 */  addiu      $s3, $s3, %lo(plr + 0x1588)
    /* 200C8 80159CC0 C8001124 */  addiu      $s1, $zero, 0xC8
    /* 200CC 80159CC4 19001224 */  addiu      $s2, $zero, 0x19
  .L80159CC8:
    /* 200D0 80159CC8 1280033C */  lui        $v1, %hi(myplr)
    /* 200D4 80159CCC 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 200D8 80159CD0 00000000 */  nop
    /* 200DC 80159CD4 40100300 */  sll        $v0, $v1, 1
    /* 200E0 80159CD8 21104300 */  addu       $v0, $v0, $v1
    /* 200E4 80159CDC 80100200 */  sll        $v0, $v0, 2
    /* 200E8 80159CE0 21104300 */  addu       $v0, $v0, $v1
    /* 200EC 80159CE4 00110200 */  sll        $v0, $v0, 4
    /* 200F0 80159CE8 23104300 */  subu       $v0, $v0, $v1
    /* 200F4 80159CEC 80100200 */  sll        $v0, $v0, 2
    /* 200F8 80159CF0 21104300 */  addu       $v0, $v0, $v1
    /* 200FC 80159CF4 C0100200 */  sll        $v0, $v0, 3
    /* 20100 80159CF8 21105300 */  addu       $v0, $v0, $s3
    /* 20104 80159CFC 21105000 */  addu       $v0, $v0, $s0
    /* 20108 80159D00 00004280 */  lb         $v0, 0x0($v0)
    /* 2010C 80159D04 00000000 */  nop
    /* 20110 80159D08 2B100200 */  sltu       $v0, $zero, $v0
    /* 20114 80159D0C 1180013C */  lui        $at, %hi(InvSlotTable)
    /* 20118 80159D10 21083200 */  addu       $at, $at, $s2
    /* 2011C 80159D14 80D622A0 */  sb         $v0, %lo(InvSlotTable)($at)
    /* 20120 80159D18 1280033C */  lui        $v1, %hi(myplr)
    /* 20124 80159D1C 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 20128 80159D20 00000000 */  nop
    /* 2012C 80159D24 40100300 */  sll        $v0, $v1, 1
    /* 20130 80159D28 21104300 */  addu       $v0, $v0, $v1
    /* 20134 80159D2C 80100200 */  sll        $v0, $v0, 2
    /* 20138 80159D30 21104300 */  addu       $v0, $v0, $v1
    /* 2013C 80159D34 00110200 */  sll        $v0, $v0, 4
    /* 20140 80159D38 23104300 */  subu       $v0, $v0, $v1
    /* 20144 80159D3C 80100200 */  sll        $v0, $v0, 2
    /* 20148 80159D40 21104300 */  addu       $v0, $v0, $v1
    /* 2014C 80159D44 C0200200 */  sll        $a0, $v0, 3
    /* 20150 80159D48 21109300 */  addu       $v0, $a0, $s3
    /* 20154 80159D4C 21105000 */  addu       $v0, $v0, $s0
    /* 20158 80159D50 00004380 */  lb         $v1, 0x0($v0)
    /* 2015C 80159D54 00000000 */  nop
    /* 20160 80159D58 24006018 */  blez       $v1, .L80159DEC
    /* 20164 80159D5C 00000000 */   nop
    /* 20168 80159D60 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 2016C 80159D64 21082400 */  addu       $at, $at, $a0
    /* 20170 80159D68 BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 20174 80159D6C 00000000 */  nop
    /* 20178 80159D70 2A104300 */  slt        $v0, $v0, $v1
    /* 2017C 80159D74 1D004014 */  bnez       $v0, .L80159DEC
    /* 20180 80159D78 FFFF6324 */   addiu     $v1, $v1, -0x1
    /* 20184 80159D7C C0100300 */  sll        $v0, $v1, 3
    /* 20188 80159D80 23104300 */  subu       $v0, $v0, $v1
    /* 2018C 80159D84 80100200 */  sll        $v0, $v0, 2
    /* 20190 80159D88 23104300 */  subu       $v0, $v0, $v1
    /* 20194 80159D8C 80100200 */  sll        $v0, $v0, 2
    /* 20198 80159D90 21104400 */  addu       $v0, $v0, $a0
    /* 2019C 80159D94 1180013C */  lui        $at, %hi(InvRect)
    /* 201A0 80159D98 21083100 */  addu       $at, $at, $s1
    /* 201A4 80159D9C 30D0288C */  lw         $t0, %lo(InvRect)($at)
    /* 201A8 80159DA0 1180013C */  lui        $at, %hi(InvRect + 0x4)
    /* 201AC 80159DA4 21083100 */  addu       $at, $at, $s1
    /* 201B0 80159DA8 34D0258C */  lw         $a1, %lo(InvRect + 0x4)($at)
    /* 201B4 80159DAC 0E80013C */  lui        $at, %hi(plr + 0x4F0)
    /* 201B8 80159DB0 21082200 */  addu       $at, $at, $v0
    /* 201BC 80159DB4 28AA2690 */  lbu        $a2, %lo(plr + 0x4F0)($at)
    /* 201C0 80159DB8 0E80013C */  lui        $at, %hi(plr + 0x50A)
    /* 201C4 80159DBC 21082200 */  addu       $at, $at, $v0
    /* 201C8 80159DC0 42AA2780 */  lb         $a3, %lo(plr + 0x50A)($at)
    /* 201CC 80159DC4 21200001 */  addu       $a0, $t0, $zero
    /* 201D0 80159DC8 0100E738 */  xori       $a3, $a3, 0x1
    /* 201D4 80159DCC 0100E72C */  sltiu      $a3, $a3, 0x1
    /* 201D8 80159DD0 1180013C */  lui        $at, %hi(InvItemHeight + 0xC)
    /* 201DC 80159DD4 21082600 */  addu       $at, $at, $a2
    /* 201E0 80159DD8 D8D52290 */  lbu        $v0, %lo(InvItemHeight + 0xC)($at)
    /* 201E4 80159DDC 1000A524 */  addiu      $a1, $a1, 0x10
    /* 201E8 80159DE0 1000A0AF */  sw         $zero, 0x10($sp)
    /* 201EC 80159DE4 6E5D050C */  jal        InvDrawItem__FiiiUci
    /* 201F0 80159DE8 2328A200 */   subu      $a1, $a1, $v0
  .L80159DEC:
    /* 201F4 80159DEC 08003126 */  addiu      $s1, $s1, 0x8
    /* 201F8 80159DF0 01001026 */  addiu      $s0, $s0, 0x1
    /* 201FC 80159DF4 2800022A */  slti       $v0, $s0, 0x28
    /* 20200 80159DF8 B3FF4014 */  bnez       $v0, .L80159CC8
    /* 20204 80159DFC 01005226 */   addiu     $s2, $s2, 0x1
    /* 20208 80159E00 21800000 */  addu       $s0, $zero, $zero
    /* 2020C 80159E04 08021224 */  addiu      $s2, $zero, 0x208
    /* 20210 80159E08 41001324 */  addiu      $s3, $zero, 0x41
    /* 20214 80159E0C 21880000 */  addu       $s1, $zero, $zero
  .L80159E10:
    /* 20218 80159E10 1280033C */  lui        $v1, %hi(myplr)
    /* 2021C 80159E14 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 20220 80159E18 00000000 */  nop
    /* 20224 80159E1C 40100300 */  sll        $v0, $v1, 1
    /* 20228 80159E20 21104300 */  addu       $v0, $v0, $v1
    /* 2022C 80159E24 80100200 */  sll        $v0, $v0, 2
    /* 20230 80159E28 21104300 */  addu       $v0, $v0, $v1
    /* 20234 80159E2C 00110200 */  sll        $v0, $v0, 4
    /* 20238 80159E30 23104300 */  subu       $v0, $v0, $v1
    /* 2023C 80159E34 80100200 */  sll        $v0, $v0, 2
    /* 20240 80159E38 21104300 */  addu       $v0, $v0, $v1
    /* 20244 80159E3C C0100200 */  sll        $v0, $v0, 3
    /* 20248 80159E40 21102202 */  addu       $v0, $s1, $v0
    /* 2024C 80159E44 0E80013C */  lui        $at, %hi(plr + 0x15DC)
    /* 20250 80159E48 21082200 */  addu       $at, $at, $v0
    /* 20254 80159E4C 14BB2384 */  lh         $v1, %lo(plr + 0x15DC)($at)
    /* 20258 80159E50 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 2025C 80159E54 21006210 */  beq        $v1, $v0, .L80159EDC
    /* 20260 80159E58 01000224 */   addiu     $v0, $zero, 0x1
    /* 20264 80159E5C 1180013C */  lui        $at, %hi(InvRect)
    /* 20268 80159E60 21083200 */  addu       $at, $at, $s2
    /* 2026C 80159E64 30D0288C */  lw         $t0, %lo(InvRect)($at)
    /* 20270 80159E68 1180013C */  lui        $at, %hi(InvSlotTable)
    /* 20274 80159E6C 21083300 */  addu       $at, $at, $s3
    /* 20278 80159E70 80D622A0 */  sb         $v0, %lo(InvSlotTable)($at)
    /* 2027C 80159E74 1280033C */  lui        $v1, %hi(myplr)
    /* 20280 80159E78 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 20284 80159E7C 1180013C */  lui        $at, %hi(InvRect + 0x4)
    /* 20288 80159E80 21083200 */  addu       $at, $at, $s2
    /* 2028C 80159E84 34D0258C */  lw         $a1, %lo(InvRect + 0x4)($at)
    /* 20290 80159E88 40100300 */  sll        $v0, $v1, 1
    /* 20294 80159E8C 21104300 */  addu       $v0, $v0, $v1
    /* 20298 80159E90 80100200 */  sll        $v0, $v0, 2
    /* 2029C 80159E94 21104300 */  addu       $v0, $v0, $v1
    /* 202A0 80159E98 00110200 */  sll        $v0, $v0, 4
    /* 202A4 80159E9C 23104300 */  subu       $v0, $v0, $v1
    /* 202A8 80159EA0 80100200 */  sll        $v0, $v0, 2
    /* 202AC 80159EA4 21104300 */  addu       $v0, $v0, $v1
    /* 202B0 80159EA8 C0100200 */  sll        $v0, $v0, 3
    /* 202B4 80159EAC 21102202 */  addu       $v0, $s1, $v0
    /* 202B8 80159EB0 0E80013C */  lui        $at, %hi(plr + 0x15FC)
    /* 202BC 80159EB4 21082200 */  addu       $at, $at, $v0
    /* 202C0 80159EB8 34BB2690 */  lbu        $a2, %lo(plr + 0x15FC)($at)
    /* 202C4 80159EBC 0E80013C */  lui        $at, %hi(plr + 0x1616)
    /* 202C8 80159EC0 21082200 */  addu       $at, $at, $v0
    /* 202CC 80159EC4 4EBB2780 */  lb         $a3, %lo(plr + 0x1616)($at)
    /* 202D0 80159EC8 21200001 */  addu       $a0, $t0, $zero
    /* 202D4 80159ECC 1000A0AF */  sw         $zero, 0x10($sp)
    /* 202D8 80159ED0 0100E738 */  xori       $a3, $a3, 0x1
    /* 202DC 80159ED4 6E5D050C */  jal        InvDrawItem__FiiiUci
    /* 202E0 80159ED8 0100E72C */   sltiu     $a3, $a3, 0x1
  .L80159EDC:
    /* 202E4 80159EDC 08005226 */  addiu      $s2, $s2, 0x8
    /* 202E8 80159EE0 01007326 */  addiu      $s3, $s3, 0x1
    /* 202EC 80159EE4 01001026 */  addiu      $s0, $s0, 0x1
    /* 202F0 80159EE8 0800022A */  slti       $v0, $s0, 0x8
    /* 202F4 80159EEC C8FF4014 */  bnez       $v0, .L80159E10
    /* 202F8 80159EF0 6C003126 */   addiu     $s1, $s1, 0x6C
    /* 202FC 80159EF4 8D61050C */  jal        DrawInvCursor__Fv
    /* 20300 80159EF8 00000000 */   nop
    /* 20304 80159EFC A25D050C */  jal        InvDrawSlots__Fv
    /* 20308 80159F00 00000000 */   nop
    /* 2030C 80159F04 3000BF8F */  lw         $ra, 0x30($sp)
    /* 20310 80159F08 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 20314 80159F0C 2800B28F */  lw         $s2, 0x28($sp)
    /* 20318 80159F10 2400B18F */  lw         $s1, 0x24($sp)
    /* 2031C 80159F14 2000B08F */  lw         $s0, 0x20($sp)
    /* 20320 80159F18 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 20324 80159F1C 0800E003 */  jr         $ra
    /* 20328 80159F20 00000000 */   nop
endlabel DoThatDrawInv__Fv
