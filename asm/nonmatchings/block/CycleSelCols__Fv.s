.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CycleSelCols__Fv, 0x1B8

glabel CycleSelCols__Fv
    /* 7D45C 8008D45C 1280023C */  lui        $v0, %hi(PauseMode)
    /* 7D460 8008D460 A4B74290 */  lbu        $v0, %lo(PauseMode)($v0)
    /* 7D464 8008D464 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 7D468 8008D468 66004014 */  bnez       $v0, .L8008D604
    /* 7D46C 8008D46C 1000BFAF */   sw        $ra, 0x10($sp)
    /* 7D470 8008D470 1280023C */  lui        $v0, %hi(stextflag)
    /* 7D474 8008D474 E0BA4280 */  lb         $v0, %lo(stextflag)($v0)
    /* 7D478 8008D478 00000000 */  nop
    /* 7D47C 8008D47C 61004014 */  bnez       $v0, .L8008D604
    /* 7D480 8008D480 00000000 */   nop
    /* 7D484 8008D484 1280023C */  lui        $v0, %hi(qtextflag)
    /* 7D488 8008D488 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 7D48C 8008D48C 00000000 */  nop
    /* 7D490 8008D490 5C004014 */  bnez       $v0, .L8008D604
    /* 7D494 8008D494 00000000 */   nop
    /* 7D498 8008D498 1280043C */  lui        $a0, %hi(D_8011AC96)
    /* 7D49C 8008D49C 96AC8424 */  addiu      $a0, $a0, %lo(D_8011AC96)
    /* 7D4A0 8008D4A0 1280063C */  lui        $a2, %hi(P1ObjSelCount)
    /* 7D4A4 8008D4A4 8DACC624 */  addiu      $a2, $a2, %lo(P1ObjSelCount)
    /* 7D4A8 8008D4A8 0735020C */  jal        UpdateSel__FPUsUsPUc
    /* 7D4AC 8008D4AC 00040524 */   addiu     $a1, $zero, 0x400
    /* 7D4B0 8008D4B0 1280043C */  lui        $a0, %hi(D_8011AC98)
    /* 7D4B4 8008D4B4 98AC8424 */  addiu      $a0, $a0, %lo(D_8011AC98)
    /* 7D4B8 8008D4B8 0D058293 */  lbu        $v0, %gp_rel(P1ObjSelCount)($gp)
    /* 7D4BC 8008D4BC 1280063C */  lui        $a2, %hi(P2ObjSelCount)
    /* 7D4C0 8008D4C0 8EACC624 */  addiu      $a2, $a2, %lo(P2ObjSelCount)
    /* 7D4C4 8008D4C4 01004224 */  addiu      $v0, $v0, 0x1
    /* 7D4C8 8008D4C8 1F004230 */  andi       $v0, $v0, 0x1F
    /* 7D4CC 8008D4CC 0D0582A3 */  sb         $v0, %gp_rel(P1ObjSelCount)($gp)
    /* 7D4D0 8008D4D0 0735020C */  jal        UpdateSel__FPUsUsPUc
    /* 7D4D4 8008D4D4 01000524 */   addiu     $a1, $zero, 0x1
    /* 7D4D8 8008D4D8 1280043C */  lui        $a0, %hi(D_8011AC9A)
    /* 7D4DC 8008D4DC 9AAC8424 */  addiu      $a0, $a0, %lo(D_8011AC9A)
    /* 7D4E0 8008D4E0 0E058293 */  lbu        $v0, %gp_rel(P2ObjSelCount)($gp)
    /* 7D4E4 8008D4E4 1280063C */  lui        $a2, %hi(P12ObjSelCount)
    /* 7D4E8 8008D4E8 8FACC624 */  addiu      $a2, $a2, %lo(P12ObjSelCount)
    /* 7D4EC 8008D4EC 01004224 */  addiu      $v0, $v0, 0x1
    /* 7D4F0 8008D4F0 1F004230 */  andi       $v0, $v0, 0x1F
    /* 7D4F4 8008D4F4 0E0582A3 */  sb         $v0, %gp_rel(P2ObjSelCount)($gp)
    /* 7D4F8 8008D4F8 0735020C */  jal        UpdateSel__FPUsUsPUc
    /* 7D4FC 8008D4FC 01040524 */   addiu     $a1, $zero, 0x401
    /* 7D500 8008D500 1280043C */  lui        $a0, %hi(D_8011AC9C)
    /* 7D504 8008D504 9CAC8424 */  addiu      $a0, $a0, %lo(D_8011AC9C)
    /* 7D508 8008D508 0F058293 */  lbu        $v0, %gp_rel(P12ObjSelCount)($gp)
    /* 7D50C 8008D50C 1280063C */  lui        $a2, %hi(P1ItemSelCount)
    /* 7D510 8008D510 90ACC624 */  addiu      $a2, $a2, %lo(P1ItemSelCount)
    /* 7D514 8008D514 01004224 */  addiu      $v0, $v0, 0x1
    /* 7D518 8008D518 1F004230 */  andi       $v0, $v0, 0x1F
    /* 7D51C 8008D51C 0F0582A3 */  sb         $v0, %gp_rel(P12ObjSelCount)($gp)
    /* 7D520 8008D520 0735020C */  jal        UpdateSel__FPUsUsPUc
    /* 7D524 8008D524 00040524 */   addiu     $a1, $zero, 0x400
    /* 7D528 8008D528 1280043C */  lui        $a0, %hi(D_8011AC9E)
    /* 7D52C 8008D52C 9EAC8424 */  addiu      $a0, $a0, %lo(D_8011AC9E)
    /* 7D530 8008D530 10058293 */  lbu        $v0, %gp_rel(P1ItemSelCount)($gp)
    /* 7D534 8008D534 1280063C */  lui        $a2, %hi(P2ItemSelCount)
    /* 7D538 8008D538 91ACC624 */  addiu      $a2, $a2, %lo(P2ItemSelCount)
    /* 7D53C 8008D53C 01004224 */  addiu      $v0, $v0, 0x1
    /* 7D540 8008D540 1F004230 */  andi       $v0, $v0, 0x1F
    /* 7D544 8008D544 100582A3 */  sb         $v0, %gp_rel(P1ItemSelCount)($gp)
    /* 7D548 8008D548 0735020C */  jal        UpdateSel__FPUsUsPUc
    /* 7D54C 8008D54C 01000524 */   addiu     $a1, $zero, 0x1
    /* 7D550 8008D550 1280043C */  lui        $a0, %hi(D_8011ACA0)
    /* 7D554 8008D554 A0AC8424 */  addiu      $a0, $a0, %lo(D_8011ACA0)
    /* 7D558 8008D558 11058293 */  lbu        $v0, %gp_rel(P2ItemSelCount)($gp)
    /* 7D55C 8008D55C 1280063C */  lui        $a2, %hi(P12ItemSelCount)
    /* 7D560 8008D560 92ACC624 */  addiu      $a2, $a2, %lo(P12ItemSelCount)
    /* 7D564 8008D564 01004224 */  addiu      $v0, $v0, 0x1
    /* 7D568 8008D568 1F004230 */  andi       $v0, $v0, 0x1F
    /* 7D56C 8008D56C 110582A3 */  sb         $v0, %gp_rel(P2ItemSelCount)($gp)
    /* 7D570 8008D570 0735020C */  jal        UpdateSel__FPUsUsPUc
    /* 7D574 8008D574 01040524 */   addiu     $a1, $zero, 0x401
    /* 7D578 8008D578 1280043C */  lui        $a0, %hi(D_8011ACA2)
    /* 7D57C 8008D57C A2AC8424 */  addiu      $a0, $a0, %lo(D_8011ACA2)
    /* 7D580 8008D580 12058293 */  lbu        $v0, %gp_rel(P12ItemSelCount)($gp)
    /* 7D584 8008D584 1280063C */  lui        $a2, %hi(P1MonstSelCount)
    /* 7D588 8008D588 93ACC624 */  addiu      $a2, $a2, %lo(P1MonstSelCount)
    /* 7D58C 8008D58C 01004224 */  addiu      $v0, $v0, 0x1
    /* 7D590 8008D590 1F004230 */  andi       $v0, $v0, 0x1F
    /* 7D594 8008D594 120582A3 */  sb         $v0, %gp_rel(P12ItemSelCount)($gp)
    /* 7D598 8008D598 0735020C */  jal        UpdateSel__FPUsUsPUc
    /* 7D59C 8008D59C 00040524 */   addiu     $a1, $zero, 0x400
    /* 7D5A0 8008D5A0 1280043C */  lui        $a0, %hi(D_8011ACA4)
    /* 7D5A4 8008D5A4 A4AC8424 */  addiu      $a0, $a0, %lo(D_8011ACA4)
    /* 7D5A8 8008D5A8 13058293 */  lbu        $v0, %gp_rel(P1MonstSelCount)($gp)
    /* 7D5AC 8008D5AC 1280063C */  lui        $a2, %hi(P2MonstSelCount)
    /* 7D5B0 8008D5B0 94ACC624 */  addiu      $a2, $a2, %lo(P2MonstSelCount)
    /* 7D5B4 8008D5B4 01004224 */  addiu      $v0, $v0, 0x1
    /* 7D5B8 8008D5B8 1F004230 */  andi       $v0, $v0, 0x1F
    /* 7D5BC 8008D5BC 130582A3 */  sb         $v0, %gp_rel(P1MonstSelCount)($gp)
    /* 7D5C0 8008D5C0 0735020C */  jal        UpdateSel__FPUsUsPUc
    /* 7D5C4 8008D5C4 01000524 */   addiu     $a1, $zero, 0x1
    /* 7D5C8 8008D5C8 1280043C */  lui        $a0, %hi(D_8011ACA6)
    /* 7D5CC 8008D5CC A6AC8424 */  addiu      $a0, $a0, %lo(D_8011ACA6)
    /* 7D5D0 8008D5D0 14058293 */  lbu        $v0, %gp_rel(P2MonstSelCount)($gp)
    /* 7D5D4 8008D5D4 1280063C */  lui        $a2, %hi(P12MonstSelCount)
    /* 7D5D8 8008D5D8 95ACC624 */  addiu      $a2, $a2, %lo(P12MonstSelCount)
    /* 7D5DC 8008D5DC 01004224 */  addiu      $v0, $v0, 0x1
    /* 7D5E0 8008D5E0 1F004230 */  andi       $v0, $v0, 0x1F
    /* 7D5E4 8008D5E4 140582A3 */  sb         $v0, %gp_rel(P2MonstSelCount)($gp)
    /* 7D5E8 8008D5E8 0735020C */  jal        UpdateSel__FPUsUsPUc
    /* 7D5EC 8008D5EC 01040524 */   addiu     $a1, $zero, 0x401
    /* 7D5F0 8008D5F0 15058293 */  lbu        $v0, %gp_rel(P12MonstSelCount)($gp)
    /* 7D5F4 8008D5F4 00000000 */  nop
    /* 7D5F8 8008D5F8 01004224 */  addiu      $v0, $v0, 0x1
    /* 7D5FC 8008D5FC 1F004230 */  andi       $v0, $v0, 0x1F
    /* 7D600 8008D600 150582A3 */  sb         $v0, %gp_rel(P12MonstSelCount)($gp)
  .L8008D604:
    /* 7D604 8008D604 1000BF8F */  lw         $ra, 0x10($sp)
    /* 7D608 8008D608 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 7D60C 8008D60C 0800E003 */  jr         $ra
    /* 7D610 8008D610 00000000 */   nop
endlabel CycleSelCols__Fv
