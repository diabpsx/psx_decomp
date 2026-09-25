.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LANG_SetDb__F10LANG_DB_NO, 0x1D4

glabel LANG_SetDb__F10LANG_DB_NO
    /* 6B354 8007B354 B0FFBD27 */  addiu      $sp, $sp, -0x50
    /* 6B358 8007B358 4800B2AF */  sw         $s2, 0x48($sp)
    /* 6B35C 8007B35C 21908000 */  addu       $s2, $a0, $zero
    /* 6B360 8007B360 4C00BFAF */  sw         $ra, 0x4C($sp)
    /* 6B364 8007B364 4400B1AF */  sw         $s1, 0x44($sp)
    /* 6B368 8007B368 D2EC010C */  jal        LANG_GetLang__Fv
    /* 6B36C 8007B36C 4000B0AF */   sw        $s0, 0x40($sp)
    /* 6B370 8007B370 04000324 */  addiu      $v1, $zero, 0x4
    /* 6B374 8007B374 0A004314 */  bne        $v0, $v1, .L8007B3A0
    /* 6B378 8007B378 00000000 */   nop
  .L8007B37C:
    /* 6B37C 8007B37C C6B5020C */  jal        IsKanjiLoaded__Fv
    /* 6B380 8007B380 00000000 */   nop
    /* 6B384 8007B384 01004238 */  xori       $v0, $v0, 0x1
    /* 6B388 8007B388 05004010 */  beqz       $v0, .L8007B3A0
    /* 6B38C 8007B38C 00000000 */   nop
    /* 6B390 8007B390 EE80000C */  jal        TSK_Sleep
    /* 6B394 8007B394 01000424 */   addiu     $a0, $zero, 0x1
    /* 6B398 8007B398 DFEC0108 */  j          .L8007B37C
    /* 6B39C 8007B39C 00000000 */   nop
  .L8007B3A0:
    /* 6B3A0 8007B3A0 7814828F */  lw         $v0, %gp_rel(LangDbNo)($gp)
    /* 6B3A4 8007B3A4 00000000 */  nop
    /* 6B3A8 8007B3A8 58004212 */  beq        $s2, $v0, .L8007B50C
    /* 6B3AC 8007B3AC 00000000 */   nop
    /* 6B3B0 8007B3B0 1D11020C */  jal        SYSI_GetFs__Fv
    /* 6B3B4 8007B3B4 01001024 */   addiu     $s0, $zero, 0x1
    /* 6B3B8 8007B3B8 C0ED010C */  jal        DumpCurrentText__Fv
    /* 6B3BC 8007B3BC 21884000 */   addu      $s1, $v0, $zero
    /* 6B3C0 8007B3C0 6C14848F */  lw         $a0, %gp_rel(LanguageType)($gp)
    /* 6B3C4 8007B3C4 781492AF */  sw         $s2, %gp_rel(LangDbNo)($gp)
    /* 6B3C8 8007B3C8 D9ED010C */  jal        GetLangFileName__F9LANG_TYPEPc
    /* 6B3CC 8007B3CC 1000A527 */   addiu     $a1, $sp, 0x10
    /* 6B3D0 8007B3D0 1280023C */  lui        $v0, %hi(FileSYS)
    /* 6B3D4 8007B3D4 ECAA428C */  lw         $v0, %lo(FileSYS)($v0)
    /* 6B3D8 8007B3D8 00000000 */  nop
    /* 6B3DC 8007B3DC 17005010 */  beq        $v0, $s0, .L8007B43C
    /* 6B3E0 8007B3E0 21202002 */   addu      $a0, $s1, $zero
    /* 6B3E4 8007B3E4 9291020C */  jal        IsGameLoading__Fv
    /* 6B3E8 8007B3E8 00000000 */   nop
    /* 6B3EC 8007B3EC 01004238 */  xori       $v0, $v0, 0x1
    /* 6B3F0 8007B3F0 11004010 */  beqz       $v0, .L8007B438
    /* 6B3F4 8007B3F4 1000A427 */   addiu     $a0, $sp, 0x10
    /* 6B3F8 8007B3F8 1280013C */  lui        $at, %hi(CDWAIT)
    /* 6B3FC 8007B3FC ECAD30AC */  sw         $s0, %lo(CDWAIT)($at)
    /* 6B400 8007B400 B41F020C */  jal        BL_LoadFileAsync__FPcc
    /* 6B404 8007B404 21280000 */   addu      $a1, $zero, $zero
    /* 6B408 8007B408 FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 6B40C 8007B40C 701482AF */  sw         $v0, %gp_rel(hndText)($gp)
    /* 6B410 8007B410 05004314 */  bne        $v0, $v1, .L8007B428
    /* 6B414 8007B414 21200000 */   addu      $a0, $zero, $zero
    /* 6B418 8007B418 1280053C */  lui        $a1, %hi(D_80118C40)
    /* 6B41C 8007B41C 408CA524 */  addiu      $a1, $a1, %lo(D_80118C40)
    /* 6B420 8007B420 A583000C */  jal        DBG_Error
    /* 6B424 8007B424 8A000624 */   addiu     $a2, $zero, 0x8A
  .L8007B428:
    /* 6B428 8007B428 8A1F020C */  jal        BL_WaitForAsyncFinish__Fv
    /* 6B42C 8007B42C 00000000 */   nop
    /* 6B430 8007B430 1DED0108 */  j          .L8007B474
    /* 6B434 8007B434 00000000 */   nop
  .L8007B438:
    /* 6B438 8007B438 21202002 */  addu       $a0, $s1, $zero
  .L8007B43C:
    /* 6B43C 8007B43C 1000A527 */  addiu      $a1, $sp, 0x10
    /* 6B440 8007B440 01000224 */  addiu      $v0, $zero, 0x1
    /* 6B444 8007B444 1280013C */  lui        $at, %hi(CDWAIT)
    /* 6B448 8007B448 ECAD22AC */  sw         $v0, %lo(CDWAIT)($at)
    /* 6B44C 8007B44C 4816020C */  jal        Read__6FileIOPCcUl
    /* 6B450 8007B450 01000624 */   addiu     $a2, $zero, 0x1
    /* 6B454 8007B454 FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 6B458 8007B458 701482AF */  sw         $v0, %gp_rel(hndText)($gp)
    /* 6B45C 8007B45C 05004314 */  bne        $v0, $v1, .L8007B474
    /* 6B460 8007B460 21200000 */   addu      $a0, $zero, $zero
    /* 6B464 8007B464 1280053C */  lui        $a1, %hi(D_80118C40)
    /* 6B468 8007B468 408CA524 */  addiu      $a1, $a1, %lo(D_80118C40)
    /* 6B46C 8007B46C A583000C */  jal        DBG_Error
    /* 6B470 8007B470 92000624 */   addiu     $a2, $zero, 0x92
  .L8007B474:
    /* 6B474 8007B474 1280013C */  lui        $at, %hi(CDWAIT)
    /* 6B478 8007B478 ECAD20AC */  sw         $zero, %lo(CDWAIT)($at)
    /* 6B47C 8007B47C 7014848F */  lw         $a0, %gp_rel(hndText)($gp)
    /* 6B480 8007B480 1280053C */  lui        $a1, %hi(D_8011BBFC)
    /* 6B484 8007B484 FCBBA524 */  addiu      $a1, $a1, %lo(D_8011BBFC)
    /* 6B488 8007B488 9C88000C */  jal        GAL_SetMemName
    /* 6B48C 8007B48C 00000000 */   nop
    /* 6B490 8007B490 7014848F */  lw         $a0, %gp_rel(hndText)($gp)
    /* 6B494 8007B494 DD85000C */  jal        GAL_Lock
    /* 6B498 8007B498 00000000 */   nop
    /* 6B49C 8007B49C 741482AF */  sw         $v0, %gp_rel(TextPtr)($gp)
    /* 6B4A0 8007B4A0 06004014 */  bnez       $v0, .L8007B4BC
    /* 6B4A4 8007B4A4 00000000 */   nop
    /* 6B4A8 8007B4A8 21200000 */  addu       $a0, $zero, $zero
    /* 6B4AC 8007B4AC 1280053C */  lui        $a1, %hi(D_80118C40)
    /* 6B4B0 8007B4B0 408CA524 */  addiu      $a1, $a1, %lo(D_80118C40)
    /* 6B4B4 8007B4B4 A583000C */  jal        DBG_Error
    /* 6B4B8 8007B4B8 98000624 */   addiu     $a2, $zero, 0x98
  .L8007B4BC:
    /* 6B4BC 8007B4BC 7414848F */  lw         $a0, %gp_rel(TextPtr)($gp)
    /* 6B4C0 8007B4C0 D6ED010C */  jal        CalcNumOfStrings__FPPc
    /* 6B4C4 8007B4C4 00000000 */   nop
    /* 6B4C8 8007B4C8 981482AF */  sw         $v0, %gp_rel(NumOfStrings)($gp)
    /* 6B4CC 8007B4CC DFB5020C */  jal        KANJI_SetDb__F10LANG_DB_NO
    /* 6B4D0 8007B4D0 21204002 */   addu      $a0, $s2, $zero
    /* 6B4D4 8007B4D4 9814858F */  lw         $a1, %gp_rel(NumOfStrings)($gp)
    /* 6B4D8 8007B4D8 00000000 */  nop
    /* 6B4DC 8007B4DC 0B00A018 */  blez       $a1, .L8007B50C
    /* 6B4E0 8007B4E0 21200000 */   addu      $a0, $zero, $zero
    /* 6B4E4 8007B4E4 7414838F */  lw         $v1, %gp_rel(TextPtr)($gp)
    /* 6B4E8 8007B4E8 00000000 */  nop
    /* 6B4EC 8007B4EC 21306000 */  addu       $a2, $v1, $zero
  .L8007B4F0:
    /* 6B4F0 8007B4F0 0000628C */  lw         $v0, 0x0($v1)
    /* 6B4F4 8007B4F4 01008424 */  addiu      $a0, $a0, 0x1
    /* 6B4F8 8007B4F8 21104600 */  addu       $v0, $v0, $a2
    /* 6B4FC 8007B4FC 000062AC */  sw         $v0, 0x0($v1)
    /* 6B500 8007B500 2A108500 */  slt        $v0, $a0, $a1
    /* 6B504 8007B504 FAFF4014 */  bnez       $v0, .L8007B4F0
    /* 6B508 8007B508 04006324 */   addiu     $v1, $v1, 0x4
  .L8007B50C:
    /* 6B50C 8007B50C 4C00BF8F */  lw         $ra, 0x4C($sp)
    /* 6B510 8007B510 4800B28F */  lw         $s2, 0x48($sp)
    /* 6B514 8007B514 4400B18F */  lw         $s1, 0x44($sp)
    /* 6B518 8007B518 4000B08F */  lw         $s0, 0x40($sp)
    /* 6B51C 8007B51C 5000BD27 */  addiu      $sp, $sp, 0x50
    /* 6B520 8007B520 0800E003 */  jr         $ra
    /* 6B524 8007B524 00000000 */   nop
endlabel LANG_SetDb__F10LANG_DB_NO
