.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PM_DoDeath__FP12PlayerStruct, 0x1E8

glabel PM_DoDeath__FP12PlayerStruct
    /* 544B8 800644B8 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 544BC 800644BC 2000B0AF */  sw         $s0, 0x20($sp)
    /* 544C0 800644C0 21808000 */  addu       $s0, $a0, $zero
    /* 544C4 800644C4 2800BFAF */  sw         $ra, 0x28($sp)
    /* 544C8 800644C8 787F010C */  jal        plrind__FP12PlayerStruct
    /* 544CC 800644CC 2400B1AF */   sw        $s1, 0x24($sp)
    /* 544D0 800644D0 21200002 */  addu       $a0, $s0, $zero
    /* 544D4 800644D4 0386010C */  jal        TryDropPlayerItems__FP12PlayerStruct
    /* 544D8 800644D8 21884000 */   addu      $s1, $v0, $zero
    /* 544DC 800644DC A801028E */  lw         $v0, 0x1A8($s0)
    /* 544E0 800644E0 64010386 */  lh         $v1, 0x164($s0)
    /* 544E4 800644E4 40100200 */  sll        $v0, $v0, 1
    /* 544E8 800644E8 2A186200 */  slt        $v1, $v1, $v0
    /* 544EC 800644EC 5E006014 */  bnez       $v1, .L80064668
    /* 544F0 800644F0 00000000 */   nop
    /* 544F4 800644F4 1280013C */  lui        $at, %hi(D_8011C878)
    /* 544F8 800644F8 21083100 */  addu       $at, $at, $s1
    /* 544FC 800644FC 78C82280 */  lb         $v0, %lo(D_8011C878)($at)
    /* 54500 80064500 00000000 */  nop
    /* 54504 80064504 02004228 */  slti       $v0, $v0, 0x2
    /* 54508 80064508 53004014 */  bnez       $v0, .L80064658
    /* 5450C 8006450C 00000000 */   nop
    /* 54510 80064510 677F010C */  jal        ismyplr__FP12PlayerStruct
    /* 54514 80064514 21200002 */   addu      $a0, $s0, $zero
    /* 54518 80064518 4F004010 */  beqz       $v0, .L80064658
    /* 5451C 8006451C 01000324 */   addiu     $v1, $zero, 0x1
    /* 54520 80064520 1280013C */  lui        $at, %hi(D_8011C878)
    /* 54524 80064524 21083100 */  addu       $at, $at, $s1
    /* 54528 80064528 78C82290 */  lbu        $v0, %lo(D_8011C878)($at)
    /* 5452C 8006452C 00000000 */  nop
    /* 54530 80064530 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 54534 80064534 1280013C */  lui        $at, %hi(D_8011C878)
    /* 54538 80064538 21083100 */  addu       $at, $at, $s1
    /* 5453C 8006453C 78C822A0 */  sb         $v0, %lo(D_8011C878)($at)
    /* 54540 80064540 00160200 */  sll        $v0, $v0, 24
    /* 54544 80064544 03160200 */  sra        $v0, $v0, 24
    /* 54548 80064548 43004314 */  bne        $v0, $v1, .L80064658
    /* 5454C 8006454C 00000000 */   nop
    /* 54550 80064550 BD84010C */  jal        RemovePlrFromMap__FP12PlayerStruct
    /* 54554 80064554 21200002 */   addu      $a0, $s0, $zero
    /* 54558 80064558 1D0000A2 */  sb         $zero, 0x1D($s0)
    /* 5455C 8006455C 1280023C */  lui        $v0, %hi(gbActivePlayers)
    /* 54560 80064560 A3B94290 */  lbu        $v0, %lo(gbActivePlayers)($v0)
    /* 54564 80064564 00000000 */  nop
    /* 54568 80064568 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 5456C 8006456C 1280013C */  lui        $at, %hi(gbActivePlayers)
    /* 54570 80064570 A3B922A0 */  sb         $v0, %lo(gbActivePlayers)($at)
    /* 54574 80064574 FF004230 */  andi       $v0, $v0, 0xFF
    /* 54578 80064578 06004014 */  bnez       $v0, .L80064594
    /* 5457C 8006457C 01000224 */   addiu     $v0, $zero, 0x1
    /* 54580 80064580 8C1282A3 */  sb         $v0, %gp_rel(deathflag)($gp)
    /* 54584 80064584 FD22020C */  jal        PA_SetPauseOk__Fb
    /* 54588 80064588 21200000 */   addu      $a0, $zero, $zero
    /* 5458C 8006458C 92910108 */  j          .L80064648
    /* 54590 80064590 00000000 */   nop
  .L80064594:
    /* 54594 80064594 5C000582 */  lb         $a1, 0x5C($s0)
    /* 54598 80064598 1280023C */  lui        $v0, %hi(numvision)
    /* 5459C 8006459C 1CB9428C */  lw         $v0, %lo(numvision)($v0)
    /* 545A0 800645A0 1280013C */  lui        $at, %hi(dovision)
    /* 545A4 800645A4 20B920A0 */  sb         $zero, %lo(dovision)($at)
    /* 545A8 800645A8 1A004018 */  blez       $v0, .L80064614
    /* 545AC 800645AC 21200000 */   addu      $a0, $zero, $zero
    /* 545B0 800645B0 01000624 */  addiu      $a2, $zero, 0x1
    /* 545B4 800645B4 21180000 */  addu       $v1, $zero, $zero
  .L800645B8:
    /* 545B8 800645B8 0D80013C */  lui        $at, %hi(VisionList + 0x4)
    /* 545BC 800645BC 21082300 */  addu       $at, $at, $v1
    /* 545C0 800645C0 D4652280 */  lb         $v0, %lo(VisionList + 0x4)($at)
    /* 545C4 800645C4 00000000 */  nop
    /* 545C8 800645C8 07004514 */  bne        $v0, $a1, .L800645E8
    /* 545CC 800645CC 00000000 */   nop
    /* 545D0 800645D0 21288000 */  addu       $a1, $a0, $zero
    /* 545D4 800645D4 0D80013C */  lui        $at, %hi(VisionList + 0x5)
    /* 545D8 800645D8 21082300 */  addu       $at, $at, $v1
    /* 545DC 800645DC D56526A0 */  sb         $a2, %lo(VisionList + 0x5)($at)
    /* 545E0 800645E0 1280013C */  lui        $at, %hi(dovision)
    /* 545E4 800645E4 20B926A0 */  sb         $a2, %lo(dovision)($at)
  .L800645E8:
    /* 545E8 800645E8 1280023C */  lui        $v0, %hi(numvision)
    /* 545EC 800645EC 1CB9428C */  lw         $v0, %lo(numvision)($v0)
    /* 545F0 800645F0 01008424 */  addiu      $a0, $a0, 0x1
    /* 545F4 800645F4 2A108200 */  slt        $v0, $a0, $v0
    /* 545F8 800645F8 06004010 */  beqz       $v0, .L80064614
    /* 545FC 800645FC 0E006324 */   addiu     $v1, $v1, 0xE
    /* 54600 80064600 1280023C */  lui        $v0, %hi(dovision)
    /* 54604 80064604 20B94290 */  lbu        $v0, %lo(dovision)($v0)
    /* 54608 80064608 00000000 */  nop
    /* 5460C 8006460C EAFF4010 */  beqz       $v0, .L800645B8
    /* 54610 80064610 00000000 */   nop
  .L80064614:
    /* 54614 80064614 C0100500 */  sll        $v0, $a1, 3
    /* 54618 80064618 23104500 */  subu       $v0, $v0, $a1
    /* 5461C 8006461C 40100200 */  sll        $v0, $v0, 1
    /* 54620 80064620 0D80033C */  lui        $v1, %hi(VisionList)
    /* 54624 80064624 D0656324 */  addiu      $v1, $v1, %lo(VisionList)
    /* 54628 80064628 21104300 */  addu       $v0, $v0, $v1
    /* 5462C 8006462C 00004480 */  lb         $a0, 0x0($v0)
    /* 54630 80064630 01004580 */  lb         $a1, 0x1($v0)
    /* 54634 80064634 02004694 */  lhu        $a2, 0x2($v0)
    /* 54638 80064638 4E33010C */  jal        DoUnVision__Fiiii
    /* 5463C 8006463C 21382002 */   addu      $a3, $s1, $zero
    /* 54640 80064640 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 54644 80064644 5C0002A2 */  sb         $v0, 0x5C($s0)
  .L80064648:
    /* 54648 80064648 787F010C */  jal        plrind__FP12PlayerStruct
    /* 5464C 8006464C 21200002 */   addu      $a0, $s0, $zero
    /* 54650 80064650 E4DF010C */  jal        ClrCursor__Fi
    /* 54654 80064654 21204000 */   addu      $a0, $v0, $zero
  .L80064658:
    /* 54658 80064658 5000038E */  lw         $v1, 0x50($s0)
    /* 5465C 8006465C 10270224 */  addiu      $v0, $zero, 0x2710
    /* 54660 80064660 480002AE */  sw         $v0, 0x48($s0)
    /* 54664 80064664 540003AE */  sw         $v1, 0x54($s0)
  .L80064668:
    /* 54668 80064668 64010286 */  lh         $v0, 0x164($s0)
    /* 5466C 8006466C 00000000 */  nop
    /* 54670 80064670 21184000 */  addu       $v1, $v0, $zero
    /* 54674 80064674 64004228 */  slti       $v0, $v0, 0x64
    /* 54678 80064678 02004010 */  beqz       $v0, .L80064684
    /* 5467C 8006467C 01006224 */   addiu     $v0, $v1, 0x1
    /* 54680 80064680 640102A6 */  sh         $v0, 0x164($s0)
  .L80064684:
    /* 54684 80064684 21100000 */  addu       $v0, $zero, $zero
    /* 54688 80064688 2800BF8F */  lw         $ra, 0x28($sp)
    /* 5468C 8006468C 2400B18F */  lw         $s1, 0x24($sp)
    /* 54690 80064690 2000B08F */  lw         $s0, 0x20($sp)
    /* 54694 80064694 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 54698 80064698 0800E003 */  jr         $ra
    /* 5469C 8006469C 00000000 */   nop
endlabel PM_DoDeath__FP12PlayerStruct
