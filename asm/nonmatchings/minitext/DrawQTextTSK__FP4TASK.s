.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawQTextTSK__FP4TASK, 0x2E8

glabel DrawQTextTSK__FP4TASK
    /* 3E068 8004E068 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 3E06C 8004E06C 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 3E070 8004E070 2800B2AF */  sw         $s2, 0x28($sp)
    /* 3E074 8004E074 2400B1AF */  sw         $s1, 0x24($sp)
    /* 3E078 8004E078 2000B0AF */  sw         $s0, 0x20($sp)
    /* 3E07C 8004E07C 1C00908C */  lw         $s0, 0x1C($a0)
    /* 3E080 8004E080 1280123C */  lui        $s2, %hi(stextflag)
    /* 3E084 8004E084 E0BA5292 */  lbu        $s2, %lo(stextflag)($s2)
    /* 3E088 8004E088 0000118E */  lw         $s1, 0x0($s0)
    /* 3E08C 8004E08C 896E020C */  jal        GLUE_SuspendGame__Fv
    /* 3E090 8004E090 00000000 */   nop
    /* 3E094 8004E094 E86E020C */  jal        GLUE_SetHomingScrollFlag__Fb
    /* 3E098 8004E098 21200000 */   addu      $a0, $zero, $zero
    /* 3E09C 8004E09C EC6E020C */  jal        GLUE_SetShowPanelFlag__Fb
    /* 3E0A0 8004E0A0 21200000 */   addu      $a0, $zero, $zero
    /* 3E0A4 8004E0A4 0400038E */  lw         $v1, 0x4($s0)
    /* 3E0A8 8004E0A8 00000000 */  nop
    /* 3E0AC 8004E0AC 40100300 */  sll        $v0, $v1, 1
    /* 3E0B0 8004E0B0 21104300 */  addu       $v0, $v0, $v1
    /* 3E0B4 8004E0B4 80100200 */  sll        $v0, $v0, 2
    /* 3E0B8 8004E0B8 1180013C */  lui        $at, %hi(alltext)
    /* 3E0BC 8004E0BC 21082200 */  addu       $at, $at, $v0
    /* 3E0C0 8004E0C0 207C248C */  lw         $a0, %lo(alltext)($at)
    /* 3E0C4 8004E0C4 4AED010C */  jal        GetStr__Fi
    /* 3E0C8 8004E0C8 00000000 */   nop
    /* 3E0CC 8004E0CC 902082AF */  sw         $v0, %gp_rel(D_8011C810)($gp)
  .L8004E0D0:
    /* 3E0D0 8004E0D0 C6B5020C */  jal        IsKanjiLoaded__Fv
    /* 3E0D4 8004E0D4 00000000 */   nop
    /* 3E0D8 8004E0D8 01004238 */  xori       $v0, $v0, 0x1
    /* 3E0DC 8004E0DC 05004010 */  beqz       $v0, .L8004E0F4
    /* 3E0E0 8004E0E0 00000000 */   nop
    /* 3E0E4 8004E0E4 EE80000C */  jal        TSK_Sleep
    /* 3E0E8 8004E0E8 01000424 */   addiu     $a0, $zero, 0x1
    /* 3E0EC 8004E0EC 34380108 */  j          .L8004E0D0
    /* 3E0F0 8004E0F0 00000000 */   nop
  .L8004E0F4:
    /* 3E0F4 8004E0F4 0400038E */  lw         $v1, 0x4($s0)
    /* 3E0F8 8004E0F8 00000000 */  nop
    /* 3E0FC 8004E0FC 40100300 */  sll        $v0, $v1, 1
    /* 3E100 8004E100 21104300 */  addu       $v0, $v0, $v1
    /* 3E104 8004E104 80100200 */  sll        $v0, $v0, 2
    /* 3E108 8004E108 1180013C */  lui        $at, %hi(alltext + 0x8)
    /* 3E10C 8004E10C 21082200 */  addu       $at, $at, $v0
    /* 3E110 8004E110 287C268C */  lw         $a2, %lo(alltext + 0x8)($at)
    /* 3E114 8004E114 1280053C */  lui        $a1, %hi(D_8011B94C)
    /* 3E118 8004E118 4CB9A524 */  addiu      $a1, $a1, %lo(D_8011B94C)
    /* 3E11C 8004E11C 9767000C */  jal        sprintf
    /* 3E120 8004E120 1000A427 */   addiu     $a0, $sp, 0x10
    /* 3E124 8004E124 5C36010C */  jal        CalcTextSpeed__FPCc
    /* 3E128 8004E128 1000A427 */   addiu     $a0, $sp, 0x10
    /* 3E12C 8004E12C E0118293 */  lbu        $v0, %gp_rel(qtextflag)($gp)
    /* 3E130 8004E130 1280013C */  lui        $at, %hi(stextflag)
    /* 3E134 8004E134 E0BA20A0 */  sb         $zero, %lo(stextflag)($at)
    /* 3E138 8004E138 2B100200 */  sltu       $v0, $zero, $v0
    /* 3E13C 8004E13C A82082AF */  sw         $v0, %gp_rel(D_8011C828)($gp)
    /* 3E140 8004E140 3E10020C */  jal        VID_GetTick__Fv
    /* 3E144 8004E144 00000000 */   nop
    /* 3E148 8004E148 A820838F */  lw         $v1, %gp_rel(D_8011C828)($gp)
    /* 3E14C 8004E14C 9C2082AF */  sw         $v0, %gp_rel(D_8011C81C)($gp)
    /* 3E150 8004E150 2E006010 */  beqz       $v1, .L8004E20C
    /* 3E154 8004E154 01000224 */   addiu     $v0, $zero, 0x1
  .L8004E158:
    /* 3E158 8004E158 01001024 */  addiu      $s0, $zero, 0x1
  .L8004E15C:
    /* 3E15C 8004E15C E438010C */  jal        DrawQText__Fv
    /* 3E160 8004E160 00000000 */   nop
    /* 3E164 8004E164 EE80000C */  jal        TSK_Sleep
    /* 3E168 8004E168 01000424 */   addiu     $a0, $zero, 0x1
    /* 3E16C 8004E16C 1280023C */  lui        $v0, %hi(FeFlag)
    /* 3E170 8004E170 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 3E174 8004E174 00000000 */  nop
    /* 3E178 8004E178 0B004010 */  beqz       $v0, .L8004E1A8
    /* 3E17C 8004E17C 00000000 */   nop
    /* 3E180 8004E180 21200000 */  addu       $a0, $zero, $zero
    /* 3E184 8004E184 FD25020C */  jal        PAD_GetPad__FiUc
    /* 3E188 8004E188 01000524 */   addiu     $a1, $zero, 0x1
    /* 3E18C 8004E18C 993A010C */  jal        GetDown__C4CPad_8004ea64
    /* 3E190 8004E190 21204000 */   addu      $a0, $v0, $zero
    /* 3E194 8004E194 00014230 */  andi       $v0, $v0, 0x100
    /* 3E198 8004E198 0E004010 */  beqz       $v0, .L8004E1D4
    /* 3E19C 8004E19C 00000000 */   nop
    /* 3E1A0 8004E1A0 74380108 */  j          .L8004E1D0
    /* 3E1A4 8004E1A4 00000000 */   nop
  .L8004E1A8:
    /* 3E1A8 8004E1A8 21202002 */  addu       $a0, $s1, $zero
    /* 3E1AC 8004E1AC FD25020C */  jal        PAD_GetPad__FiUc
    /* 3E1B0 8004E1B0 21280000 */   addu      $a1, $zero, $zero
    /* 3E1B4 8004E1B4 993A010C */  jal        GetDown__C4CPad_8004ea64
    /* 3E1B8 8004E1B8 21204000 */   addu      $a0, $v0, $zero
    /* 3E1BC 8004E1BC 00014230 */  andi       $v0, $v0, 0x100
    /* 3E1C0 8004E1C0 04004010 */  beqz       $v0, .L8004E1D4
    /* 3E1C4 8004E1C4 00000000 */   nop
    /* 3E1C8 8004E1C8 1280013C */  lui        $at, %hi(ignore_buttons)
    /* 3E1CC 8004E1CC D0BB30AC */  sw         $s0, %lo(ignore_buttons)($at)
  .L8004E1D0:
    /* 3E1D0 8004E1D0 A82080AF */  sw         $zero, %gp_rel(D_8011C828)($gp)
  .L8004E1D4:
    /* 3E1D4 8004E1D4 A820828F */  lw         $v0, %gp_rel(D_8011C828)($gp)
    /* 3E1D8 8004E1D8 00000000 */  nop
    /* 3E1DC 8004E1DC DEFF4014 */  bnez       $v0, .L8004E158
    /* 3E1E0 8004E1E0 00000000 */   nop
    /* 3E1E4 8004E1E4 1280023C */  lui        $v0, %hi(CDWAIT)
    /* 3E1E8 8004E1E8 ECAD428C */  lw         $v0, %lo(CDWAIT)($v0)
    /* 3E1EC 8004E1EC 00000000 */  nop
    /* 3E1F0 8004E1F0 02004010 */  beqz       $v0, .L8004E1FC
    /* 3E1F4 8004E1F4 00000000 */   nop
    /* 3E1F8 8004E1F8 A82090AF */  sw         $s0, %gp_rel(D_8011C828)($gp)
  .L8004E1FC:
    /* 3E1FC 8004E1FC A820828F */  lw         $v0, %gp_rel(D_8011C828)($gp)
    /* 3E200 8004E200 00000000 */  nop
    /* 3E204 8004E204 D5FF4014 */  bnez       $v0, .L8004E15C
    /* 3E208 8004E208 01000224 */   addiu     $v0, $zero, 0x1
  .L8004E20C:
    /* 3E20C 8004E20C 01000324 */  addiu      $v1, $zero, 0x1
    /* 3E210 8004E210 1280013C */  lui        $at, %hi(CDWAIT)
    /* 3E214 8004E214 ECAD22AC */  sw         $v0, %lo(CDWAIT)($at)
    /* 3E218 8004E218 1280013C */  lui        $at, %hi(PauseMode)
    /* 3E21C 8004E21C A4B723A0 */  sb         $v1, %lo(PauseMode)($at)
    /* 3E220 8004E220 A82080AF */  sw         $zero, %gp_rel(D_8011C828)($gp)
    /* 3E224 8004E224 1280013C */  lui        $at, %hi(ignore_buttons)
    /* 3E228 8004E228 D0BB22AC */  sw         $v0, %lo(ignore_buttons)($at)
    /* 3E22C 8004E22C C6F5000C */  jal        PlaySFX__Fi
    /* 3E230 8004E230 33000424 */   addiu     $a0, $zero, 0x33
    /* 3E234 8004E234 D7F3000C */  jal        stream_stop__Fv
    /* 3E238 8004E238 00000000 */   nop
    /* 3E23C 8004E23C 0C80023C */  lui        $v0, %hi(SFXTab + 0x84)
    /* 3E240 8004E240 649C4280 */  lb         $v0, %lo(SFXTab + 0x84)($v0)
    /* 3E244 8004E244 00000000 */  nop
    /* 3E248 8004E248 08004010 */  beqz       $v0, .L8004E26C
    /* 3E24C 8004E24C 00000000 */   nop
  .L8004E250:
    /* 3E250 8004E250 EE80000C */  jal        TSK_Sleep
    /* 3E254 8004E254 01000424 */   addiu     $a0, $zero, 0x1
    /* 3E258 8004E258 0C80023C */  lui        $v0, %hi(SFXTab + 0x84)
    /* 3E25C 8004E25C 649C4280 */  lb         $v0, %lo(SFXTab + 0x84)($v0)
    /* 3E260 8004E260 00000000 */  nop
    /* 3E264 8004E264 FAFF4014 */  bnez       $v0, .L8004E250
    /* 3E268 8004E268 00000000 */   nop
  .L8004E26C:
    /* 3E26C 8004E26C C0118283 */  lb         $v0, %gp_rel(D_8011B940)($gp)
    /* 3E270 8004E270 00000000 */  nop
    /* 3E274 8004E274 08004014 */  bnez       $v0, .L8004E298
    /* 3E278 8004E278 02000224 */   addiu     $v0, $zero, 0x2
    /* 3E27C 8004E27C 21200000 */  addu       $a0, $zero, $zero
    /* 3E280 8004E280 0580053C */  lui        $a1, %hi(FadeMusicTSK__FP4TASK)
    /* 3E284 8004E284 2CDBA524 */  addiu      $a1, $a1, %lo(FadeMusicTSK__FP4TASK)
    /* 3E288 8004E288 00080624 */  addiu      $a2, $zero, 0x800
    /* 3E28C 8004E28C 0480000C */  jal        TSK_AddTask
    /* 3E290 8004E290 21380000 */   addu      $a3, $zero, $zero
    /* 3E294 8004E294 02000224 */  addiu      $v0, $zero, 0x2
  .L8004E298:
    /* 3E298 8004E298 C01182A3 */  sb         $v0, %gp_rel(D_8011B940)($gp)
    /* 3E29C 8004E29C 00161200 */  sll        $v0, $s2, 24
    /* 3E2A0 8004E2A0 031E0200 */  sra        $v1, $v0, 24
    /* 3E2A4 8004E2A4 1280013C */  lui        $at, %hi(stextflag)
    /* 3E2A8 8004E2A8 E0BA32A0 */  sb         $s2, %lo(stextflag)($at)
    /* 3E2AC 8004E2AC 03006014 */  bnez       $v1, .L8004E2BC
    /* 3E2B0 8004E2B0 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 3E2B4 8004E2B4 1280013C */  lui        $at, %hi(options_pad)
    /* 3E2B8 8004E2B8 50B222AC */  sw         $v0, %lo(options_pad)($at)
  .L8004E2BC:
    /* 3E2BC 8004E2BC 1280023C */  lui        $v0, %hi(Qfromoptions)
    /* 3E2C0 8004E2C0 28B24290 */  lbu        $v0, %lo(Qfromoptions)($v0)
    /* 3E2C4 8004E2C4 00000000 */  nop
    /* 3E2C8 8004E2C8 05004010 */  beqz       $v0, .L8004E2E0
    /* 3E2CC 8004E2CC FFFF4224 */   addiu     $v0, $v0, -0x1
    /* 3E2D0 8004E2D0 1280013C */  lui        $at, %hi(options_pad)
    /* 3E2D4 8004E2D4 50B222AC */  sw         $v0, %lo(options_pad)($at)
    /* 3E2D8 8004E2D8 CB380108 */  j          .L8004E32C
    /* 3E2DC 8004E2DC 00000000 */   nop
  .L8004E2E0:
    /* 3E2E0 8004E2E0 10006014 */  bnez       $v1, .L8004E324
    /* 3E2E4 8004E2E4 01000224 */   addiu     $v0, $zero, 0x1
    /* 3E2E8 8004E2E8 1280023C */  lui        $v0, %hi(questlog)
    /* 3E2EC 8004E2EC 29BA4290 */  lbu        $v0, %lo(questlog)($v0)
    /* 3E2F0 8004E2F0 00000000 */  nop
    /* 3E2F4 8004E2F4 0B004014 */  bnez       $v0, .L8004E324
    /* 3E2F8 8004E2F8 01000224 */   addiu     $v0, $zero, 0x1
    /* 3E2FC 8004E2FC 05000424 */  addiu      $a0, $zero, 0x5
    /* 3E300 8004E300 21280000 */  addu       $a1, $zero, $zero
    /* 3E304 8004E304 21300000 */  addu       $a2, $zero, $zero
    /* 3E308 8004E308 53EB010C */  jal        PostGamePad__Fiiii
    /* 3E30C 8004E30C 21380000 */   addu      $a3, $zero, $zero
    /* 3E310 8004E310 E86E020C */  jal        GLUE_SetHomingScrollFlag__Fb
    /* 3E314 8004E314 01000424 */   addiu     $a0, $zero, 0x1
    /* 3E318 8004E318 EC6E020C */  jal        GLUE_SetShowPanelFlag__Fb
    /* 3E31C 8004E31C 01000424 */   addiu     $a0, $zero, 0x1
    /* 3E320 8004E320 01000224 */  addiu      $v0, $zero, 0x1
  .L8004E324:
    /* 3E324 8004E324 1280013C */  lui        $at, %hi(ignore_buttons)
    /* 3E328 8004E328 D0BB22AC */  sw         $v0, %lo(ignore_buttons)($at)
  .L8004E32C:
    /* 3E32C 8004E32C 69ED010C */  jal        LANG_ReloadMainTXT__Fv
    /* 3E330 8004E330 00000000 */   nop
    /* 3E334 8004E334 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 3E338 8004E338 2800B28F */  lw         $s2, 0x28($sp)
    /* 3E33C 8004E33C 2400B18F */  lw         $s1, 0x24($sp)
    /* 3E340 8004E340 2000B08F */  lw         $s0, 0x20($sp)
    /* 3E344 8004E344 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 3E348 8004E348 0800E003 */  jr         $ra
    /* 3E34C 8004E34C 00000000 */   nop
endlabel DrawQTextTSK__FP4TASK
