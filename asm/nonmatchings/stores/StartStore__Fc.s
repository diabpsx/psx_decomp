.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StartStore__Fc, 0x35C

glabel StartStore__Fc
    /* 5F96C 8006F96C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 5F970 8006F970 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5F974 8006F974 21808000 */  addu       $s0, $a0, $zero
    /* 5F978 8006F978 33000424 */  addiu      $a0, $zero, 0x33
    /* 5F97C 8006F97C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 5F980 8006F980 C6F5000C */  jal        PlaySFX__Fi
    /* 5F984 8006F984 1400B1AF */   sw        $s1, 0x14($sp)
    /* 5F988 8006F988 21200000 */  addu       $a0, $zero, $zero
    /* 5F98C 8006F98C 1280023C */  lui        $v0, %hi(options_pad)
    /* 5F990 8006F990 50B2428C */  lw         $v0, %lo(options_pad)($v0)
    /* 5F994 8006F994 1280013C */  lui        $at, %hi(sbookflag)
    /* 5F998 8006F998 C6B620A0 */  sb         $zero, %lo(sbookflag)($at)
    /* 5F99C 8006F99C 1280013C */  lui        $at, %hi(invflag)
    /* 5F9A0 8006F9A0 2CC320A0 */  sb         $zero, %lo(invflag)($at)
    /* 5F9A4 8006F9A4 1280013C */  lui        $at, %hi(chrflag)
    /* 5F9A8 8006F9A8 C0B620A0 */  sb         $zero, %lo(chrflag)($at)
    /* 5F9AC 8006F9AC 1280013C */  lui        $at, %hi(questlog)
    /* 5F9B0 8006F9B0 29BA20A0 */  sb         $zero, %lo(questlog)($at)
    /* 5F9B4 8006F9B4 1280013C */  lui        $at, %hi(dropGoldFlag)
    /* 5F9B8 8006F9B8 B4B620A0 */  sb         $zero, %lo(dropGoldFlag)($at)
    /* 5F9BC 8006F9BC 341382AF */  sw         $v0, %gp_rel(StorePlrNo)($gp)
    /* 5F9C0 8006F9C0 36A7010C */  jal        ClearSText__Fii
    /* 5F9C4 8006F9C4 18000524 */   addiu     $a1, $zero, 0x18
    /* 5F9C8 8006F9C8 C5D0010C */  jal        ReleaseStoreBtn__Fv
    /* 5F9CC 8006F9CC 21880002 */   addu      $s1, $s0, $zero
    /* 5F9D0 8006F9D0 FFFF1026 */  addiu      $s0, $s0, -0x1
    /* 5F9D4 8006F9D4 00861000 */  sll        $s0, $s0, 24
    /* 5F9D8 8006F9D8 03861000 */  sra        $s0, $s0, 24
    /* 5F9DC 8006F9DC 1800022E */  sltiu      $v0, $s0, 0x18
    /* 5F9E0 8006F9E0 95004010 */  beqz       $v0, .L8006FC38
    /* 5F9E4 8006F9E4 80101000 */   sll       $v0, $s0, 2
    /* 5F9E8 8006F9E8 1180013C */  lui        $at, %hi(jtbl_801179C8)
    /* 5F9EC 8006F9EC 21082200 */  addu       $at, $at, $v0
    /* 5F9F0 8006F9F0 C879228C */  lw         $v0, %lo(jtbl_801179C8)($at)
    /* 5F9F4 8006F9F4 00000000 */  nop
    /* 5F9F8 8006F9F8 08004000 */  jr         $v0
    /* 5F9FC 8006F9FC 00000000 */   nop
  jlabel .L8006FA00
    /* 5FA00 8006FA00 94AA010C */  jal        S_StartSmith__Fv
    /* 5FA04 8006FA04 00000000 */   nop
    /* 5FA08 8006FA08 0EBF0108 */  j          .L8006FC38
    /* 5FA0C 8006FA0C 00000000 */   nop
  jlabel .L8006FA10
    /* 5FA10 8006FA10 3413838F */  lw         $v1, %gp_rel(StorePlrNo)($gp)
    /* 5FA14 8006FA14 641380AF */  sw         $zero, %gp_rel(SmithItemCount)($gp)
    /* 5FA18 8006FA18 00110300 */  sll        $v0, $v1, 4
    /* 5FA1C 8006FA1C 21104300 */  addu       $v0, $v0, $v1
    /* 5FA20 8006FA20 C0100200 */  sll        $v0, $v0, 3
    /* 5FA24 8006FA24 23104300 */  subu       $v0, $v0, $v1
    /* 5FA28 8006FA28 00210200 */  sll        $a0, $v0, 4
    /* 5FA2C 8006FA2C 0E80013C */  lui        $at, %hi(_smithitem + 0x2C)
    /* 5FA30 8006FA30 21082400 */  addu       $at, $at, $a0
    /* 5FA34 8006FA34 54E42384 */  lh         $v1, %lo(_smithitem + 0x2C)($at)
    /* 5FA38 8006FA38 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 5FA3C 8006FA3C 11006210 */  beq        $v1, $v0, .L8006FA84
    /* 5FA40 8006FA40 00000000 */   nop
    /* 5FA44 8006FA44 FFFF0524 */  addiu      $a1, $zero, -0x1
  .L8006FA48:
    /* 5FA48 8006FA48 6413828F */  lw         $v0, %gp_rel(SmithItemCount)($gp)
    /* 5FA4C 8006FA4C 00000000 */  nop
    /* 5FA50 8006FA50 01004224 */  addiu      $v0, $v0, 0x1
    /* 5FA54 8006FA54 C0180200 */  sll        $v1, $v0, 3
    /* 5FA58 8006FA58 23186200 */  subu       $v1, $v1, $v0
    /* 5FA5C 8006FA5C 80180300 */  sll        $v1, $v1, 2
    /* 5FA60 8006FA60 23186200 */  subu       $v1, $v1, $v0
    /* 5FA64 8006FA64 80180300 */  sll        $v1, $v1, 2
    /* 5FA68 8006FA68 21186400 */  addu       $v1, $v1, $a0
    /* 5FA6C 8006FA6C 0E80013C */  lui        $at, %hi(_smithitem + 0x2C)
    /* 5FA70 8006FA70 21082300 */  addu       $at, $at, $v1
    /* 5FA74 8006FA74 54E42384 */  lh         $v1, %lo(_smithitem + 0x2C)($at)
    /* 5FA78 8006FA78 641382AF */  sw         $v0, %gp_rel(SmithItemCount)($gp)
    /* 5FA7C 8006FA7C F2FF6514 */  bne        $v1, $a1, .L8006FA48
    /* 5FA80 8006FA80 00000000 */   nop
  .L8006FA84:
    /* 5FA84 8006FA84 6413828F */  lw         $v0, %gp_rel(SmithItemCount)($gp)
    /* 5FA88 8006FA88 00000000 */  nop
    /* 5FA8C 8006FA8C 05004010 */  beqz       $v0, .L8006FAA4
    /* 5FA90 8006FA90 00000000 */   nop
    /* 5FA94 8006FA94 78AB010C */  jal        S_StartSBuy__Fv
    /* 5FA98 8006FA98 00000000 */   nop
    /* 5FA9C 8006FA9C 0EBF0108 */  j          .L8006FC38
    /* 5FAA0 8006FAA0 00000000 */   nop
  .L8006FAA4:
    /* 5FAA4 8006FAA4 5BBE010C */  jal        StartStore__Fc
    /* 5FAA8 8006FAA8 18000424 */   addiu     $a0, $zero, 0x18
    /* 5FAAC 8006FAAC 0EBF0108 */  j          .L8006FC38
    /* 5FAB0 8006FAB0 00000000 */   nop
  jlabel .L8006FAB4
    /* 5FAB4 8006FAB4 C3AD010C */  jal        S_StartSSell__Fv
    /* 5FAB8 8006FAB8 00000000 */   nop
    /* 5FABC 8006FABC 0EBF0108 */  j          .L8006FC38
    /* 5FAC0 8006FAC0 00000000 */   nop
  jlabel .L8006FAC4
    /* 5FAC4 8006FAC4 75AF010C */  jal        S_StartSRepair__Fv
    /* 5FAC8 8006FAC8 00000000 */   nop
    /* 5FACC 8006FACC 0EBF0108 */  j          .L8006FC38
    /* 5FAD0 8006FAD0 00000000 */   nop
  jlabel .L8006FAD4
    /* 5FAD4 8006FAD4 A9B0010C */  jal        S_StartWitch__Fv
    /* 5FAD8 8006FAD8 00000000 */   nop
    /* 5FADC 8006FADC 0EBF0108 */  j          .L8006FC38
    /* 5FAE0 8006FAE0 00000000 */   nop
  jlabel .L8006FAE4
    /* 5FAE4 8006FAE4 2821828F */  lw         $v0, %gp_rel(D_8011C8A8)($gp)
    /* 5FAE8 8006FAE8 00000000 */  nop
    /* 5FAEC 8006FAEC 52004018 */  blez       $v0, .L8006FC38
    /* 5FAF0 8006FAF0 00000000 */   nop
    /* 5FAF4 8006FAF4 C5B1010C */  jal        S_StartWBuy__Fv
    /* 5FAF8 8006FAF8 00000000 */   nop
    /* 5FAFC 8006FAFC 0EBF0108 */  j          .L8006FC38
    /* 5FB00 8006FB00 00000000 */   nop
  jlabel .L8006FB04
    /* 5FB04 8006FB04 EDB2010C */  jal        S_StartWSell__Fv
    /* 5FB08 8006FB08 00000000 */   nop
    /* 5FB0C 8006FB0C 0EBF0108 */  j          .L8006FC38
    /* 5FB10 8006FB10 00000000 */   nop
  jlabel .L8006FB14
    /* 5FB14 8006FB14 10B5010C */  jal        S_StartWRecharge__Fv
    /* 5FB18 8006FB18 00000000 */   nop
    /* 5FB1C 8006FB1C 0EBF0108 */  j          .L8006FC38
    /* 5FB20 8006FB20 00000000 */   nop
  jlabel .L8006FB24
    /* 5FB24 8006FB24 1CB6010C */  jal        S_StartNoMoney__Fv
    /* 5FB28 8006FB28 00000000 */   nop
    /* 5FB2C 8006FB2C 0EBF0108 */  j          .L8006FC38
    /* 5FB30 8006FB30 00000000 */   nop
  jlabel .L8006FB34
    /* 5FB34 8006FB34 36B6010C */  jal        S_StartNoRoom__Fv
    /* 5FB38 8006FB38 00000000 */   nop
    /* 5FB3C 8006FB3C 0EBF0108 */  j          .L8006FC38
    /* 5FB40 8006FB40 00000000 */   nop
  jlabel .L8006FB44
    /* 5FB44 8006FB44 4EB6010C */  jal        S_StartNoItems__Fv
    /* 5FB48 8006FB48 00000000 */   nop
    /* 5FB4C 8006FB4C 0EBF0108 */  j          .L8006FC38
    /* 5FB50 8006FB50 00000000 */   nop
  jlabel .L8006FB54
    /* 5FB54 8006FB54 7BB6010C */  jal        S_StartConfirm__Fv
    /* 5FB58 8006FB58 00000000 */   nop
    /* 5FB5C 8006FB5C 0EBF0108 */  j          .L8006FC38
    /* 5FB60 8006FB60 00000000 */   nop
  jlabel .L8006FB64
    /* 5FB64 8006FB64 55B7010C */  jal        S_StartBoy__Fv
    /* 5FB68 8006FB68 00000000 */   nop
    /* 5FB6C 8006FB6C 0EBF0108 */  j          .L8006FC38
    /* 5FB70 8006FB70 00000000 */   nop
  jlabel .L8006FB74
    /* 5FB74 8006FB74 BFB7010C */  jal        S_StartBBoy__Fv
    /* 5FB78 8006FB78 00000000 */   nop
    /* 5FB7C 8006FB7C 0EBF0108 */  j          .L8006FC38
    /* 5FB80 8006FB80 00000000 */   nop
  jlabel .L8006FB84
    /* 5FB84 8006FB84 4CB8010C */  jal        S_StartHealer__Fv
    /* 5FB88 8006FB88 00000000 */   nop
    /* 5FB8C 8006FB8C 0EBF0108 */  j          .L8006FC38
    /* 5FB90 8006FB90 00000000 */   nop
  jlabel .L8006FB94
    /* 5FB94 8006FB94 89B9010C */  jal        S_StartStory__Fv
    /* 5FB98 8006FB98 00000000 */   nop
    /* 5FB9C 8006FB9C 0EBF0108 */  j          .L8006FC38
    /* 5FBA0 8006FBA0 00000000 */   nop
  jlabel .L8006FBA4
    /* 5FBA4 8006FBA4 2821828F */  lw         $v0, %gp_rel(D_8011C8A8)($gp)
    /* 5FBA8 8006FBA8 00000000 */  nop
    /* 5FBAC 8006FBAC 22004018 */  blez       $v0, .L8006FC38
    /* 5FBB0 8006FBB0 00000000 */   nop
    /* 5FBB4 8006FBB4 3BB9010C */  jal        S_StartHBuy__Fv
    /* 5FBB8 8006FBB8 00000000 */   nop
    /* 5FBBC 8006FBBC 0EBF0108 */  j          .L8006FC38
    /* 5FBC0 8006FBC0 00000000 */   nop
  jlabel .L8006FBC4
    /* 5FBC4 8006FBC4 09BA010C */  jal        S_StartSIdentify__Fv
    /* 5FBC8 8006FBC8 00000000 */   nop
    /* 5FBCC 8006FBCC 0EBF0108 */  j          .L8006FC38
    /* 5FBD0 8006FBD0 00000000 */   nop
  jlabel .L8006FBD4
    /* 5FBD4 8006FBD4 84AC010C */  jal        S_StartSPBuy__Fv
    /* 5FBD8 8006FBD8 00000000 */   nop
    /* 5FBDC 8006FBDC FF004230 */  andi       $v0, $v0, 0xFF
    /* 5FBE0 8006FBE0 33004010 */  beqz       $v0, .L8006FCB0
    /* 5FBE4 8006FBE4 00000000 */   nop
    /* 5FBE8 8006FBE8 0EBF0108 */  j          .L8006FC38
    /* 5FBEC 8006FBEC 00000000 */   nop
  jlabel .L8006FBF0
    /* 5FBF0 8006FBF0 27BD010C */  jal        S_StartTalk__Fv
    /* 5FBF4 8006FBF4 00000000 */   nop
    /* 5FBF8 8006FBF8 0EBF0108 */  j          .L8006FC38
    /* 5FBFC 8006FBFC 00000000 */   nop
  jlabel .L8006FC00
    /* 5FC00 8006FC00 B1BC010C */  jal        S_StartIdShow__Fv
    /* 5FC04 8006FC04 00000000 */   nop
    /* 5FC08 8006FC08 0EBF0108 */  j          .L8006FC38
    /* 5FC0C 8006FC0C 00000000 */   nop
  jlabel .L8006FC10
    /* 5FC10 8006FC10 B3BD010C */  jal        S_StartTavern__Fv
    /* 5FC14 8006FC14 00000000 */   nop
    /* 5FC18 8006FC18 0EBF0108 */  j          .L8006FC38
    /* 5FC1C 8006FC1C 00000000 */   nop
  jlabel .L8006FC20
    /* 5FC20 8006FC20 26BE010C */  jal        S_StartDrunk__Fv
    /* 5FC24 8006FC24 00000000 */   nop
    /* 5FC28 8006FC28 0EBF0108 */  j          .L8006FC38
    /* 5FC2C 8006FC2C 00000000 */   nop
  jlabel .L8006FC30
    /* 5FC30 8006FC30 F1BD010C */  jal        S_StartBarMaid__Fv
    /* 5FC34 8006FC34 00000000 */   nop
  .L8006FC38:
    /* 5FC38 8006FC38 1380023C */  lui        $v0, %hi(D_8012EECD)
    /* 5FC3C 8006FC3C CDEE4290 */  lbu        $v0, %lo(D_8012EECD)($v0)
    /* 5FC40 8006FC40 00000000 */  nop
    /* 5FC44 8006FC44 12004014 */  bnez       $v0, .L8006FC90
    /* 5FC48 8006FC48 21180000 */   addu      $v1, $zero, $zero
    /* 5FC4C 8006FC4C 1380023C */  lui        $v0, %hi(D_8012EF59)
    /* 5FC50 8006FC50 59EF4290 */  lbu        $v0, %lo(D_8012EF59)($v0)
    /* 5FC54 8006FC54 00000000 */  nop
    /* 5FC58 8006FC58 0D004014 */  bnez       $v0, .L8006FC90
    /* 5FC5C 8006FC5C 01000324 */   addiu     $v1, $zero, 0x1
    /* 5FC60 8006FC60 8C000424 */  addiu      $a0, $zero, 0x8C
    /* 5FC64 8006FC64 01006324 */  addiu      $v1, $v1, 0x1
  .L8006FC68:
    /* 5FC68 8006FC68 18006228 */  slti       $v0, $v1, 0x18
    /* 5FC6C 8006FC6C 08004010 */  beqz       $v0, .L8006FC90
    /* 5FC70 8006FC70 8C008424 */   addiu     $a0, $a0, 0x8C
    /* 5FC74 8006FC74 1380013C */  lui        $at, %hi(D_8012EECD)
    /* 5FC78 8006FC78 21082400 */  addu       $at, $at, $a0
    /* 5FC7C 8006FC7C CDEE2290 */  lbu        $v0, %lo(D_8012EECD)($at)
    /* 5FC80 8006FC80 00000000 */  nop
    /* 5FC84 8006FC84 F8FF4010 */  beqz       $v0, .L8006FC68
    /* 5FC88 8006FC88 01006324 */   addiu     $v1, $v1, 0x1
    /* 5FC8C 8006FC8C FFFF6324 */  addiu      $v1, $v1, -0x1
  .L8006FC90:
    /* 5FC90 8006FC90 18000224 */  addiu      $v0, $zero, 0x18
    /* 5FC94 8006FC94 04006214 */  bne        $v1, $v0, .L8006FCA8
    /* 5FC98 8006FC98 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 5FC9C 8006FC9C 042182AF */  sw         $v0, %gp_rel(D_8011C884)($gp)
    /* 5FCA0 8006FCA0 2BBF0108 */  j          .L8006FCAC
    /* 5FCA4 8006FCA4 00000000 */   nop
  .L8006FCA8:
    /* 5FCA8 8006FCA8 042183AF */  sw         $v1, %gp_rel(D_8011C884)($gp)
  .L8006FCAC:
    /* 5FCAC 8006FCAC 601391A3 */  sb         $s1, %gp_rel(stextflag)($gp)
  .L8006FCB0:
    /* 5FCB0 8006FCB0 1800BF8F */  lw         $ra, 0x18($sp)
    /* 5FCB4 8006FCB4 1400B18F */  lw         $s1, 0x14($sp)
    /* 5FCB8 8006FCB8 1000B08F */  lw         $s0, 0x10($sp)
    /* 5FCBC 8006FCBC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 5FCC0 8006FCC0 0800E003 */  jr         $ra
    /* 5FCC4 8006FCC4 00000000 */   nop
endlabel StartStore__Fc
