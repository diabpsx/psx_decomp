.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching KANJI_SetCache__F10KANJI_FRMS, 0x28C

glabel KANJI_SetCache__F10KANJI_FRMS
    /* 9D34C 800AD34C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 9D350 800AD350 1000B0AF */  sw         $s0, 0x10($sp)
    /* 9D354 800AD354 21808000 */  addu       $s0, $a0, $zero
    /* 9D358 800AD358 1800BFAF */  sw         $ra, 0x18($sp)
    /* 9D35C 800AD35C 7B46020C */  jal        BL_GetCurrentBlocks__Fv
    /* 9D360 800AD360 1400B1AF */   sw        $s1, 0x14($sp)
    /* 9D364 800AD364 B01F90AF */  sw         $s0, %gp_rel(D_8011C730)($gp)
    /* 9D368 800AD368 06000012 */  beqz       $s0, .L800AD384
    /* 9D36C 800AD36C 21884000 */   addu      $s1, $v0, $zero
    /* 9D370 800AD370 01000224 */  addiu      $v0, $zero, 0x1
    /* 9D374 800AD374 05000216 */  bne        $s0, $v0, .L800AD38C
    /* 9D378 800AD378 50000224 */   addiu     $v0, $zero, 0x50
    /* 9D37C 800AD37C E2B40208 */  j          .L800AD388
    /* 9D380 800AD380 00000000 */   nop
  .L800AD384:
    /* 9D384 800AD384 C8000224 */  addiu      $v0, $zero, 0xC8
  .L800AD388:
    /* 9D388 800AD388 4C0B82AF */  sw         $v0, %gp_rel(D_8011B2CC)($gp)
  .L800AD38C:
    /* 9D38C 800AD38C 3F000016 */  bnez       $s0, .L800AD48C
    /* 9D390 800AD390 00000000 */   nop
    /* 9D394 800AD394 0A002012 */  beqz       $s1, .L800AD3C0
    /* 9D398 800AD398 00000000 */   nop
    /* 9D39C 800AD39C E16E020C */  jal        GLUE_SetShowGameScreenFlag__Fb
    /* 9D3A0 800AD3A0 21200000 */   addu      $a0, $zero, $zero
    /* 9D3A4 800AD3A4 1280023C */  lui        $v0, %hi(leveltype)
    /* 9D3A8 800AD3A8 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 9D3AC 800AD3AC 00000000 */  nop
    /* 9D3B0 800AD3B0 03004014 */  bnez       $v0, .L800AD3C0
    /* 9D3B4 800AD3B4 00000000 */   nop
    /* 9D3B8 800AD3B8 CDB7020C */  jal        DumpMonsters__7CBlocks_800adf34
    /* 9D3BC 800AD3BC 21202002 */   addu      $a0, $s1, $zero
  .L800AD3C0:
    /* 9D3C0 800AD3C0 440B838F */  lw         $v1, %gp_rel(D_8011B2C4)($gp)
    /* 9D3C4 800AD3C4 01000224 */  addiu      $v0, $zero, 0x1
    /* 9D3C8 800AD3C8 1280013C */  lui        $at, %hi(CDWAIT)
    /* 9D3CC 800AD3CC ECAD22AC */  sw         $v0, %lo(CDWAIT)($at)
    /* 9D3D0 800AD3D0 10006014 */  bnez       $v1, .L800AD414
    /* 9D3D4 800AD3D4 00000000 */   nop
    /* 9D3D8 800AD3D8 1280023C */  lui        $v0, %hi(FeFlag)
    /* 9D3DC 800AD3DC 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 9D3E0 800AD3E0 00000000 */  nop
    /* 9D3E4 800AD3E4 02004010 */  beqz       $v0, .L800AD3F0
    /* 9D3E8 800AD3E8 22010424 */   addiu     $a0, $zero, 0x122
    /* 9D3EC 800AD3EC 23010424 */  addiu      $a0, $zero, 0x123
  .L800AD3F0:
    /* 9D3F0 800AD3F0 044F020C */  jal        GM_UseTexData__Fi
    /* 9D3F4 800AD3F4 00000000 */   nop
    /* 9D3F8 800AD3F8 440B82AF */  sw         $v0, %gp_rel(D_8011B2C4)($gp)
    /* 9D3FC 800AD3FC 05004014 */  bnez       $v0, .L800AD414
    /* 9D400 800AD400 21200000 */   addu      $a0, $zero, $zero
    /* 9D404 800AD404 1180053C */  lui        $a1, %hi(D_80110EE8)
    /* 9D408 800AD408 E80EA524 */  addiu      $a1, $a1, %lo(D_80110EE8)
    /* 9D40C 800AD40C A583000C */  jal        DBG_Error
    /* 9D410 800AD410 B8000624 */   addiu     $a2, $zero, 0xB8
  .L800AD414:
    /* 9D414 800AD414 440B848F */  lw         $a0, %gp_rel(D_8011B2C4)($gp)
    /* 9D418 800AD418 D7B7020C */  jal        GetDecompBuffers__7TextDat
    /* 9D41C 800AD41C 00000000 */   nop
    /* 9D420 800AD420 B41F82AF */  sw         $v0, %gp_rel(D_8011C734)($gp)
    /* 9D424 800AD424 05004014 */  bnez       $v0, .L800AD43C
    /* 9D428 800AD428 21200000 */   addu      $a0, $zero, $zero
    /* 9D42C 800AD42C 1180053C */  lui        $a1, %hi(D_80110EE8)
    /* 9D430 800AD430 E80EA524 */  addiu      $a1, $a1, %lo(D_80110EE8)
    /* 9D434 800AD434 A583000C */  jal        DBG_Error
    /* 9D438 800AD438 BB000624 */   addiu     $a2, $zero, 0xBB
  .L800AD43C:
    /* 9D43C 800AD43C 0C80103C */  lui        $s0, %hi(AllDats)
    /* 9D440 800AD440 5494108E */  lw         $s0, %lo(AllDats)($s0)
    /* 9D444 800AD444 00000000 */  nop
    /* 9D448 800AD448 07000016 */  bnez       $s0, .L800AD468
    /* 9D44C 800AD44C 21200002 */   addu      $a0, $s0, $zero
    /* 9D450 800AD450 21200000 */  addu       $a0, $zero, $zero
    /* 9D454 800AD454 1180053C */  lui        $a1, %hi(D_80110EE8)
    /* 9D458 800AD458 E80EA524 */  addiu      $a1, $a1, %lo(D_80110EE8)
    /* 9D45C 800AD45C A583000C */  jal        DBG_Error
    /* 9D460 800AD460 BE000624 */   addiu     $a2, $zero, 0xBE
    /* 9D464 800AD464 21200002 */  addu       $a0, $s0, $zero
  .L800AD468:
    /* 9D468 800AD468 E0B7020C */  jal        GetFr__7TextDati_800adf80
    /* 9D46C 800AD46C 39000524 */   addiu     $a1, $zero, 0x39
    /* 9D470 800AD470 B81F82AF */  sw         $v0, %gp_rel(D_8011C738)($gp)
    /* 9D474 800AD474 52004014 */  bnez       $v0, .L800AD5C0
    /* 9D478 800AD478 21200000 */   addu      $a0, $zero, $zero
    /* 9D47C 800AD47C 1180053C */  lui        $a1, %hi(D_80110EE8)
    /* 9D480 800AD480 E80EA524 */  addiu      $a1, $a1, %lo(D_80110EE8)
    /* 9D484 800AD484 6EB50208 */  j          .L800AD5B8
    /* 9D488 800AD488 C1000624 */   addiu     $a2, $zero, 0xC1
  .L800AD48C:
    /* 9D48C 800AD48C 440B848F */  lw         $a0, %gp_rel(D_8011B2C4)($gp)
    /* 9D490 800AD490 00000000 */  nop
    /* 9D494 800AD494 04008010 */  beqz       $a0, .L800AD4A8
    /* 9D498 800AD498 00000000 */   nop
    /* 9D49C 800AD49C 604F020C */  jal        GM_FinishedUsing__FP7TextDat
    /* 9D4A0 800AD4A0 00000000 */   nop
    /* 9D4A4 800AD4A4 440B80AF */  sw         $zero, %gp_rel(D_8011B2C4)($gp)
  .L800AD4A8:
    /* 9D4A8 800AD4A8 10002012 */  beqz       $s1, .L800AD4EC
    /* 9D4AC 800AD4AC 01000224 */   addiu     $v0, $zero, 0x1
    /* 9D4B0 800AD4B0 1280033C */  lui        $v1, %hi(leveltype)
    /* 9D4B4 800AD4B4 0DC16390 */  lbu        $v1, %lo(leveltype)($v1)
    /* 9D4B8 800AD4B8 1280013C */  lui        $at, %hi(CDWAIT)
    /* 9D4BC 800AD4BC ECAD22AC */  sw         $v0, %lo(CDWAIT)($at)
    /* 9D4C0 800AD4C0 03006010 */  beqz       $v1, .L800AD4D0
    /* 9D4C4 800AD4C4 00000000 */   nop
    /* 9D4C8 800AD4C8 37B50208 */  j          .L800AD4DC
    /* 9D4CC 800AD4CC D0000424 */   addiu     $a0, $zero, 0xD0
  .L800AD4D0:
    /* 9D4D0 800AD4D0 1836020C */  jal        SetTownersGraphics__7CBlocks
    /* 9D4D4 800AD4D4 21202002 */   addu      $a0, $s1, $zero
    /* 9D4D8 800AD4D8 CD000424 */  addiu      $a0, $zero, 0xCD
  .L800AD4DC:
    /* 9D4DC 800AD4DC 514F020C */  jal        GM_ForceTpLoad__Fi
    /* 9D4E0 800AD4E0 00000000 */   nop
    /* 9D4E4 800AD4E4 E16E020C */  jal        GLUE_SetShowGameScreenFlag__Fb
    /* 9D4E8 800AD4E8 01000424 */   addiu     $a0, $zero, 0x1
  .L800AD4EC:
    /* 9D4EC 800AD4EC 1280023C */  lui        $v0, %hi(FeFlag)
    /* 9D4F0 800AD4F0 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 9D4F4 800AD4F4 00000000 */  nop
    /* 9D4F8 800AD4F8 0B004014 */  bnez       $v0, .L800AD528
    /* 9D4FC 800AD4FC 00000000 */   nop
    /* 9D500 800AD500 1280023C */  lui        $v0, %hi(stextflag)
    /* 9D504 800AD504 E0BA4280 */  lb         $v0, %lo(stextflag)($v0)
    /* 9D508 800AD508 00000000 */  nop
    /* 9D50C 800AD50C 0E004014 */  bnez       $v0, .L800AD548
    /* 9D510 800AD510 00000000 */   nop
    /* 9D514 800AD514 1280023C */  lui        $v0, %hi(questlog)
    /* 9D518 800AD518 29BA4290 */  lbu        $v0, %lo(questlog)($v0)
    /* 9D51C 800AD51C 00000000 */  nop
    /* 9D520 800AD520 09004014 */  bnez       $v0, .L800AD548
    /* 9D524 800AD524 00000000 */   nop
  .L800AD528:
    /* 9D528 800AD528 21200000 */  addu       $a0, $zero, $zero
    /* 9D52C 800AD52C 00400524 */  addiu      $a1, $zero, 0x4000
    /* 9D530 800AD530 B681000C */  jal        TSK_Exist
    /* 9D534 800AD534 FFFF0624 */   addiu     $a2, $zero, -0x1
    /* 9D538 800AD538 03004010 */  beqz       $v0, .L800AD548
    /* 9D53C 800AD53C 00000000 */   nop
    /* 9D540 800AD540 9E6E020C */  jal        GLUE_ResumeGame__Fv
    /* 9D544 800AD544 00000000 */   nop
  .L800AD548:
    /* 9D548 800AD548 0C80103C */  lui        $s0, %hi(AllDats)
    /* 9D54C 800AD54C 5494108E */  lw         $s0, %lo(AllDats)($s0)
    /* 9D550 800AD550 00000000 */  nop
    /* 9D554 800AD554 05000016 */  bnez       $s0, .L800AD56C
    /* 9D558 800AD558 21200000 */   addu      $a0, $zero, $zero
    /* 9D55C 800AD55C 1180053C */  lui        $a1, %hi(D_80110EE8)
    /* 9D560 800AD560 E80EA524 */  addiu      $a1, $a1, %lo(D_80110EE8)
    /* 9D564 800AD564 A583000C */  jal        DBG_Error
    /* 9D568 800AD568 E6000624 */   addiu     $a2, $zero, 0xE6
  .L800AD56C:
    /* 9D56C 800AD56C D7B7020C */  jal        GetDecompBuffers__7TextDat
    /* 9D570 800AD570 21200002 */   addu      $a0, $s0, $zero
    /* 9D574 800AD574 B41F82AF */  sw         $v0, %gp_rel(D_8011C734)($gp)
    /* 9D578 800AD578 07004014 */  bnez       $v0, .L800AD598
    /* 9D57C 800AD57C 21200002 */   addu      $a0, $s0, $zero
    /* 9D580 800AD580 21200000 */  addu       $a0, $zero, $zero
    /* 9D584 800AD584 1180053C */  lui        $a1, %hi(D_80110EE8)
    /* 9D588 800AD588 E80EA524 */  addiu      $a1, $a1, %lo(D_80110EE8)
    /* 9D58C 800AD58C A583000C */  jal        DBG_Error
    /* 9D590 800AD590 E9000624 */   addiu     $a2, $zero, 0xE9
    /* 9D594 800AD594 21200002 */  addu       $a0, $s0, $zero
  .L800AD598:
    /* 9D598 800AD598 E0B7020C */  jal        GetFr__7TextDati_800adf80
    /* 9D59C 800AD59C 39000524 */   addiu     $a1, $zero, 0x39
    /* 9D5A0 800AD5A0 B81F82AF */  sw         $v0, %gp_rel(D_8011C738)($gp)
    /* 9D5A4 800AD5A4 06004014 */  bnez       $v0, .L800AD5C0
    /* 9D5A8 800AD5A8 21200000 */   addu      $a0, $zero, $zero
    /* 9D5AC 800AD5AC 1180053C */  lui        $a1, %hi(D_80110EE8)
    /* 9D5B0 800AD5B0 E80EA524 */  addiu      $a1, $a1, %lo(D_80110EE8)
    /* 9D5B4 800AD5B4 EC000624 */  addiu      $a2, $zero, 0xEC
  .L800AD5B8:
    /* 9D5B8 800AD5B8 A583000C */  jal        DBG_Error
    /* 9D5BC 800AD5BC 00000000 */   nop
  .L800AD5C0:
    /* 9D5C0 800AD5C0 1800BF8F */  lw         $ra, 0x18($sp)
    /* 9D5C4 800AD5C4 1400B18F */  lw         $s1, 0x14($sp)
    /* 9D5C8 800AD5C8 1000B08F */  lw         $s0, 0x10($sp)
    /* 9D5CC 800AD5CC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 9D5D0 800AD5D0 0800E003 */  jr         $ra
    /* 9D5D4 800AD5D4 00000000 */   nop
endlabel KANJI_SetCache__F10KANJI_FRMS
