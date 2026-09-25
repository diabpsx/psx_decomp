.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_StartWBuy__Fv, 0x354

glabel S_StartWBuy__Fv
    /* 5C714 8006C714 20138283 */  lb         $v0, %gp_rel(WStaffFlag)($gp)
    /* 5C718 8006C718 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 5C71C 8006C71C 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 5C720 8006C720 2800B2AF */  sw         $s2, 0x28($sp)
    /* 5C724 8006C724 2400B1AF */  sw         $s1, 0x24($sp)
    /* 5C728 8006C728 03004010 */  beqz       $v0, .L8006C738
    /* 5C72C 8006C72C 2000B0AF */   sw        $s0, 0x20($sp)
    /* 5C730 8006C730 CFB10108 */  j          .L8006C73C
    /* 5C734 8006C734 02000224 */   addiu     $v0, $zero, 0x2
  .L8006C738:
    /* 5C738 8006C738 01000224 */  addiu      $v0, $zero, 0x1
  .L8006C73C:
    /* 5C73C 8006C73C 262182A3 */  sb         $v0, %gp_rel(D_8011C8A6)($gp)
    /* 5C740 8006C740 3413838F */  lw         $v1, %gp_rel(StorePlrNo)($gp)
    /* 5C744 8006C744 1280043C */  lui        $a0, %hi(_NoWitchItems)
    /* 5C748 8006C748 C8BA8424 */  addiu      $a0, $a0, %lo(_NoWitchItems)
    /* 5C74C 8006C74C 80100300 */  sll        $v0, $v1, 2
    /* 5C750 8006C750 1280013C */  lui        $at, %hi(_WitchIdxOfs)
    /* 5C754 8006C754 21082200 */  addu       $at, $at, $v0
    /* 5C758 8006C758 D0BA20AC */  sw         $zero, %lo(_WitchIdxOfs)($at)
    /* 5C75C 8006C75C 1280013C */  lui        $at, %hi(_NoWitchItems)
    /* 5C760 8006C760 21082200 */  addu       $at, $at, $v0
    /* 5C764 8006C764 C8BA20AC */  sw         $zero, %lo(_NoWitchItems)($at)
    /* 5C768 8006C768 00110300 */  sll        $v0, $v1, 4
    /* 5C76C 8006C76C 21104300 */  addu       $v0, $v0, $v1
    /* 5C770 8006C770 C0100200 */  sll        $v0, $v0, 3
    /* 5C774 8006C774 23104300 */  subu       $v0, $v0, $v1
    /* 5C778 8006C778 00110200 */  sll        $v0, $v0, 4
    /* 5C77C 8006C77C 0E80013C */  lui        $at, %hi(_witchitem + 0x2C)
    /* 5C780 8006C780 21082200 */  addu       $at, $at, $v0
    /* 5C784 8006C784 44FA2384 */  lh         $v1, %lo(_witchitem + 0x2C)($at)
    /* 5C788 8006C788 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 5C78C 8006C78C 37006210 */  beq        $v1, $v0, .L8006C86C
    /* 5C790 8006C790 21880000 */   addu      $s1, $zero, $zero
    /* 5C794 8006C794 21908000 */  addu       $s2, $a0, $zero
    /* 5C798 8006C798 21800000 */  addu       $s0, $zero, $zero
  .L8006C79C:
    /* 5C79C 8006C79C 0BB1010C */  jal        CheckWitchItem__Fi
    /* 5C7A0 8006C7A0 21202002 */   addu      $a0, $s1, $zero
    /* 5C7A4 8006C7A4 22004010 */  beqz       $v0, .L8006C830
    /* 5C7A8 8006C7A8 00000000 */   nop
    /* 5C7AC 8006C7AC 0E80053C */  lui        $a1, %hi(_witchitem)
    /* 5C7B0 8006C7B0 18FAA524 */  addiu      $a1, $a1, %lo(_witchitem)
    /* 5C7B4 8006C7B4 21280502 */  addu       $a1, $s0, $a1
    /* 5C7B8 8006C7B8 1280023C */  lui        $v0, %hi(options_pad)
    /* 5C7BC 8006C7BC 50B2428C */  lw         $v0, %lo(options_pad)($v0)
    /* 5C7C0 8006C7C0 3413838F */  lw         $v1, %gp_rel(StorePlrNo)($gp)
    /* 5C7C4 8006C7C4 40200200 */  sll        $a0, $v0, 1
    /* 5C7C8 8006C7C8 21208200 */  addu       $a0, $a0, $v0
    /* 5C7CC 8006C7CC 80200400 */  sll        $a0, $a0, 2
    /* 5C7D0 8006C7D0 21208200 */  addu       $a0, $a0, $v0
    /* 5C7D4 8006C7D4 00210400 */  sll        $a0, $a0, 4
    /* 5C7D8 8006C7D8 23208200 */  subu       $a0, $a0, $v0
    /* 5C7DC 8006C7DC 80200400 */  sll        $a0, $a0, 2
    /* 5C7E0 8006C7E0 21208200 */  addu       $a0, $a0, $v0
    /* 5C7E4 8006C7E4 C0200400 */  sll        $a0, $a0, 3
    /* 5C7E8 8006C7E8 0E80023C */  lui        $v0, %hi(plr)
    /* 5C7EC 8006C7EC 38A54224 */  addiu      $v0, $v0, %lo(plr)
    /* 5C7F0 8006C7F0 21208200 */  addu       $a0, $a0, $v0
    /* 5C7F4 8006C7F4 00110300 */  sll        $v0, $v1, 4
    /* 5C7F8 8006C7F8 21104300 */  addu       $v0, $v0, $v1
    /* 5C7FC 8006C7FC C0100200 */  sll        $v0, $v0, 3
    /* 5C800 8006C800 23104300 */  subu       $v0, $v0, $v1
    /* 5C804 8006C804 00110200 */  sll        $v0, $v0, 4
    /* 5C808 8006C808 CAFD000C */  jal        SetItemMinStats__FPC12PlayerStructP10ItemStruct
    /* 5C80C 8006C80C 21284500 */   addu      $a1, $v0, $a1
    /* 5C810 8006C810 3413838F */  lw         $v1, %gp_rel(StorePlrNo)($gp)
    /* 5C814 8006C814 00000000 */  nop
    /* 5C818 8006C818 80180300 */  sll        $v1, $v1, 2
    /* 5C81C 8006C81C 21187200 */  addu       $v1, $v1, $s2
    /* 5C820 8006C820 0000628C */  lw         $v0, 0x0($v1)
    /* 5C824 8006C824 00000000 */  nop
    /* 5C828 8006C828 01004224 */  addiu      $v0, $v0, 0x1
    /* 5C82C 8006C82C 000062AC */  sw         $v0, 0x0($v1)
  .L8006C830:
    /* 5C830 8006C830 6C001026 */  addiu      $s0, $s0, 0x6C
    /* 5C834 8006C834 3413838F */  lw         $v1, %gp_rel(StorePlrNo)($gp)
    /* 5C838 8006C838 00000000 */  nop
    /* 5C83C 8006C83C 00110300 */  sll        $v0, $v1, 4
    /* 5C840 8006C840 21104300 */  addu       $v0, $v0, $v1
    /* 5C844 8006C844 C0100200 */  sll        $v0, $v0, 3
    /* 5C848 8006C848 23104300 */  subu       $v0, $v0, $v1
    /* 5C84C 8006C84C 00110200 */  sll        $v0, $v0, 4
    /* 5C850 8006C850 21100202 */  addu       $v0, $s0, $v0
    /* 5C854 8006C854 0E80013C */  lui        $at, %hi(_witchitem + 0x2C)
    /* 5C858 8006C858 21082200 */  addu       $at, $at, $v0
    /* 5C85C 8006C85C 44FA2384 */  lh         $v1, %lo(_witchitem + 0x2C)($at)
    /* 5C860 8006C860 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 5C864 8006C864 CDFF6214 */  bne        $v1, $v0, .L8006C79C
    /* 5C868 8006C868 01003126 */   addiu     $s1, $s1, 0x1
  .L8006C86C:
    /* 5C86C 8006C86C 3413848F */  lw         $a0, %gp_rel(StorePlrNo)($gp)
    /* 5C870 8006C870 00000000 */  nop
    /* 5C874 8006C874 80180400 */  sll        $v1, $a0, 2
    /* 5C878 8006C878 1280013C */  lui        $at, %hi(_NoWitchItems)
    /* 5C87C 8006C87C 21082300 */  addu       $at, $at, $v1
    /* 5C880 8006C880 C8BA228C */  lw         $v0, %lo(_NoWitchItems)($at)
    /* 5C884 8006C884 00000000 */  nop
    /* 5C888 8006C888 05004014 */  bnez       $v0, .L8006C8A0
    /* 5C88C 8006C88C 00000000 */   nop
    /* 5C890 8006C890 5BBE010C */  jal        StartStore__Fc
    /* 5C894 8006C894 18000424 */   addiu     $a0, $zero, 0x18
    /* 5C898 8006C898 93B20108 */  j          .L8006CA4C
    /* 5C89C 8006C89C 00000000 */   nop
  .L8006C8A0:
    /* 5C8A0 8006C8A0 20138283 */  lb         $v0, %gp_rel(WStaffFlag)($gp)
    /* 5C8A4 8006C8A4 00000000 */  nop
    /* 5C8A8 8006C8A8 26004010 */  beqz       $v0, .L8006C944
    /* 5C8AC 8006C8AC 01000224 */   addiu     $v0, $zero, 0x1
    /* 5C8B0 8006C8B0 1280023C */  lui        $v0, %hi(_WitchIdxOfs)
    /* 5C8B4 8006C8B4 D0BA4224 */  addiu      $v0, $v0, %lo(_WitchIdxOfs)
    /* 5C8B8 8006C8B8 21306200 */  addu       $a2, $v1, $v0
    /* 5C8BC 8006C8BC 00110400 */  sll        $v0, $a0, 4
    /* 5C8C0 8006C8C0 21104400 */  addu       $v0, $v0, $a0
    /* 5C8C4 8006C8C4 C0100200 */  sll        $v0, $v0, 3
    /* 5C8C8 8006C8C8 23104400 */  subu       $v0, $v0, $a0
    /* 5C8CC 8006C8CC 0000C38C */  lw         $v1, 0x0($a2)
    /* 5C8D0 8006C8D0 00210200 */  sll        $a0, $v0, 4
    /* 5C8D4 8006C8D4 C0100300 */  sll        $v0, $v1, 3
    /* 5C8D8 8006C8D8 23104300 */  subu       $v0, $v0, $v1
    /* 5C8DC 8006C8DC 80100200 */  sll        $v0, $v0, 2
    /* 5C8E0 8006C8E0 23104300 */  subu       $v0, $v0, $v1
    /* 5C8E4 8006C8E4 80100200 */  sll        $v0, $v0, 2
    /* 5C8E8 8006C8E8 21104400 */  addu       $v0, $v0, $a0
    /* 5C8EC 8006C8EC 0E80013C */  lui        $at, %hi(_witchitem + 0x4D)
    /* 5C8F0 8006C8F0 21082200 */  addu       $at, $at, $v0
    /* 5C8F4 8006C8F4 65FA2290 */  lbu        $v0, %lo(_witchitem + 0x4D)($at)
    /* 5C8F8 8006C8F8 17000524 */  addiu      $a1, $zero, 0x17
    /* 5C8FC 8006C8FC 11004510 */  beq        $v0, $a1, .L8006C944
    /* 5C900 8006C900 01000224 */   addiu     $v0, $zero, 0x1
    /* 5C904 8006C904 01006224 */  addiu      $v0, $v1, 0x1
  .L8006C908:
    /* 5C908 8006C908 21184000 */  addu       $v1, $v0, $zero
    /* 5C90C 8006C90C C0100300 */  sll        $v0, $v1, 3
    /* 5C910 8006C910 23104300 */  subu       $v0, $v0, $v1
    /* 5C914 8006C914 80100200 */  sll        $v0, $v0, 2
    /* 5C918 8006C918 23104300 */  subu       $v0, $v0, $v1
    /* 5C91C 8006C91C 80100200 */  sll        $v0, $v0, 2
    /* 5C920 8006C920 21104400 */  addu       $v0, $v0, $a0
    /* 5C924 8006C924 0000C3AC */  sw         $v1, 0x0($a2)
    /* 5C928 8006C928 0E80013C */  lui        $at, %hi(_witchitem + 0x4D)
    /* 5C92C 8006C92C 21082200 */  addu       $at, $at, $v0
    /* 5C930 8006C930 65FA2290 */  lbu        $v0, %lo(_witchitem + 0x4D)($at)
    /* 5C934 8006C934 00000000 */  nop
    /* 5C938 8006C938 F3FF4514 */  bne        $v0, $a1, .L8006C908
    /* 5C93C 8006C93C 01006224 */   addiu     $v0, $v1, 0x1
    /* 5C940 8006C940 01000224 */  addiu      $v0, $zero, 0x1
  .L8006C944:
    /* 5C944 8006C944 611382A3 */  sb         $v0, %gp_rel(stextsize)($gp)
    /* 5C948 8006C948 621382A3 */  sb         $v0, %gp_rel(stextscrl)($gp)
    /* 5C94C 8006C94C 14000224 */  addiu      $v0, $zero, 0x14
    /* 5C950 8006C950 142180AF */  sw         $zero, %gp_rel(D_8011C894)($gp)
    /* 5C954 8006C954 182182AF */  sw         $v0, %gp_rel(D_8011C898)($gp)
    /* 5C958 8006C958 4AED010C */  jal        GetStr__Fi
    /* 5C95C 8006C95C 28020424 */   addiu     $a0, $zero, 0x228
    /* 5C960 8006C960 0D80103C */  lui        $s0, %hi(tempstr)
    /* 5C964 8006C964 10EA1026 */  addiu      $s0, $s0, %lo(tempstr)
    /* 5C968 8006C968 1280053C */  lui        $a1, %hi(myplr)
    /* 5C96C 8006C96C 08BAA58C */  lw         $a1, %lo(myplr)($a1)
    /* 5C970 8006C970 21200002 */  addu       $a0, $s0, $zero
    /* 5C974 8006C974 40180500 */  sll        $v1, $a1, 1
    /* 5C978 8006C978 21186500 */  addu       $v1, $v1, $a1
    /* 5C97C 8006C97C 80180300 */  sll        $v1, $v1, 2
    /* 5C980 8006C980 21186500 */  addu       $v1, $v1, $a1
    /* 5C984 8006C984 00190300 */  sll        $v1, $v1, 4
    /* 5C988 8006C988 23186500 */  subu       $v1, $v1, $a1
    /* 5C98C 8006C98C 80180300 */  sll        $v1, $v1, 2
    /* 5C990 8006C990 21186500 */  addu       $v1, $v1, $a1
    /* 5C994 8006C994 C0180300 */  sll        $v1, $v1, 3
    /* 5C998 8006C998 0E80013C */  lui        $at, %hi(plr + 0x150)
    /* 5C99C 8006C99C 21082300 */  addu       $at, $at, $v1
    /* 5C9A0 8006C9A0 88A6268C */  lw         $a2, %lo(plr + 0x150)($at)
    /* 5C9A4 8006C9A4 9767000C */  jal        sprintf
    /* 5C9A8 8006C9A8 21284000 */   addu      $a1, $v0, $zero
    /* 5C9AC 8006C9AC 21200000 */  addu       $a0, $zero, $zero
    /* 5C9B0 8006C9B0 01000524 */  addiu      $a1, $zero, 0x1
    /* 5C9B4 8006C9B4 01000624 */  addiu      $a2, $zero, 0x1
    /* 5C9B8 8006C9B8 03000224 */  addiu      $v0, $zero, 0x3
    /* 5C9BC 8006C9BC 21380002 */  addu       $a3, $s0, $zero
    /* 5C9C0 8006C9C0 1000A2AF */  sw         $v0, 0x10($sp)
    /* 5C9C4 8006C9C4 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5C9C8 8006C9C8 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5C9CC 8006C9CC 5CA7010C */  jal        AddSLine__Fi
    /* 5C9D0 8006C9D0 02000424 */   addiu     $a0, $zero, 0x2
    /* 5C9D4 8006C9D4 3413828F */  lw         $v0, %gp_rel(StorePlrNo)($gp)
    /* 5C9D8 8006C9D8 1421838F */  lw         $v1, %gp_rel(D_8011C894)($gp)
    /* 5C9DC 8006C9DC 80100200 */  sll        $v0, $v0, 2
    /* 5C9E0 8006C9E0 1280013C */  lui        $at, %hi(_WitchIdxOfs)
    /* 5C9E4 8006C9E4 21082200 */  addu       $at, $at, $v0
    /* 5C9E8 8006C9E8 D0BA248C */  lw         $a0, %lo(_WitchIdxOfs)($at)
    /* 5C9EC 8006C9EC 34B1010C */  jal        S_ScrollWBuy__Fi
    /* 5C9F0 8006C9F0 21206400 */   addu      $a0, $v1, $a0
    /* 5C9F4 8006C9F4 3413828F */  lw         $v0, %gp_rel(StorePlrNo)($gp)
    /* 5C9F8 8006C9F8 00000000 */  nop
    /* 5C9FC 8006C9FC 80100200 */  sll        $v0, $v0, 2
    /* 5CA00 8006CA00 1280013C */  lui        $at, %hi(_NoWitchItems)
    /* 5CA04 8006CA04 21082200 */  addu       $at, $at, $v0
    /* 5CA08 8006CA08 C8BA248C */  lw         $a0, %lo(_NoWitchItems)($at)
    /* 5CA0C 8006CA0C 20138383 */  lb         $v1, %gp_rel(WStaffFlag)($gp)
    /* 5CA10 8006CA10 FEFF8224 */  addiu      $v0, $a0, -0x2
    /* 5CA14 8006CA14 282184AF */  sw         $a0, %gp_rel(D_8011C8A8)($gp)
    /* 5CA18 8006CA18 182182AF */  sw         $v0, %gp_rel(D_8011C898)($gp)
    /* 5CA1C 8006CA1C 06006014 */  bnez       $v1, .L8006CA38
    /* 5CA20 8006CA20 00000000 */   nop
    /* 5CA24 8006CA24 21138283 */  lb         $v0, %gp_rel(WFlag)($gp)
    /* 5CA28 8006CA28 00000000 */  nop
    /* 5CA2C 8006CA2C 02004010 */  beqz       $v0, .L8006CA38
    /* 5CA30 8006CA30 FDFF8224 */   addiu     $v0, $a0, -0x3
    /* 5CA34 8006CA34 182182AF */  sw         $v0, %gp_rel(D_8011C898)($gp)
  .L8006CA38:
    /* 5CA38 8006CA38 1821828F */  lw         $v0, %gp_rel(D_8011C898)($gp)
    /* 5CA3C 8006CA3C 00000000 */  nop
    /* 5CA40 8006CA40 02004104 */  bgez       $v0, .L8006CA4C
    /* 5CA44 8006CA44 00000000 */   nop
    /* 5CA48 8006CA48 182180AF */  sw         $zero, %gp_rel(D_8011C898)($gp)
  .L8006CA4C:
    /* 5CA4C 8006CA4C 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 5CA50 8006CA50 2800B28F */  lw         $s2, 0x28($sp)
    /* 5CA54 8006CA54 2400B18F */  lw         $s1, 0x24($sp)
    /* 5CA58 8006CA58 2000B08F */  lw         $s0, 0x20($sp)
    /* 5CA5C 8006CA5C 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 5CA60 8006CA60 0800E003 */  jr         $ra
    /* 5CA64 8006CA64 00000000 */   nop
endlabel S_StartWBuy__Fv
