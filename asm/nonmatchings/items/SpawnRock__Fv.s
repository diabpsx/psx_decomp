.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SpawnRock__Fv, 0x1AC

glabel SpawnRock__Fv
    /* 35454 80045454 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 35458 80045458 21200000 */  addu       $a0, $zero, $zero
    /* 3545C 8004545C 21180000 */  addu       $v1, $zero, $zero
    /* 35460 80045460 1280063C */  lui        $a2, %hi(numobjects)
    /* 35464 80045464 CCB9C68C */  lw         $a2, %lo(numobjects)($a2)
    /* 35468 80045468 21280000 */  addu       $a1, $zero, $zero
    /* 3546C 8004546C 2000BFAF */  sw         $ra, 0x20($sp)
    /* 35470 80045470 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 35474 80045474 1600C018 */  blez       $a2, .L800454D0
    /* 35478 80045478 1800B0AF */   sw        $s0, 0x18($sp)
  .L8004547C:
    /* 3547C 8004547C 0E80013C */  lui        $at, %hi(objectactive)
    /* 35480 80045480 21082300 */  addu       $at, $at, $v1
    /* 35484 80045484 20A22580 */  lb         $a1, %lo(objectactive)($at)
    /* 35488 80045488 00000000 */  nop
    /* 3548C 8004548C 40100500 */  sll        $v0, $a1, 1
    /* 35490 80045490 21104500 */  addu       $v0, $v0, $a1
    /* 35494 80045494 80100200 */  sll        $v0, $v0, 2
    /* 35498 80045498 23104500 */  subu       $v0, $v0, $a1
    /* 3549C 8004549C 80100200 */  sll        $v0, $v0, 2
    /* 354A0 800454A0 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 354A4 800454A4 21082200 */  addu       $at, $at, $v0
    /* 354A8 800454A8 6A8C2280 */  lb         $v0, %lo(object + 0x1E)($at)
    /* 354AC 800454AC 01006324 */  addiu      $v1, $v1, 0x1
    /* 354B0 800454B0 17004238 */  xori       $v0, $v0, 0x17
    /* 354B4 800454B4 0100422C */  sltiu      $v0, $v0, 0x1
    /* 354B8 800454B8 21204000 */  addu       $a0, $v0, $zero
    /* 354BC 800454BC 2A106600 */  slt        $v0, $v1, $a2
    /* 354C0 800454C0 03004010 */  beqz       $v0, .L800454D0
    /* 354C4 800454C4 FF008230 */   andi      $v0, $a0, 0xFF
    /* 354C8 800454C8 ECFF4010 */  beqz       $v0, .L8004547C
    /* 354CC 800454CC 00000000 */   nop
  .L800454D0:
    /* 354D0 800454D0 FF008230 */  andi       $v0, $a0, 0xFF
    /* 354D4 800454D4 44004010 */  beqz       $v0, .L800455E8
    /* 354D8 800454D8 00000000 */   nop
    /* 354DC 800454DC 0D80033C */  lui        $v1, %hi(itemavail)
    /* 354E0 800454E0 D4536324 */  addiu      $v1, $v1, %lo(itemavail)
    /* 354E4 800454E4 7E006224 */  addiu      $v0, $v1, 0x7E
    /* 354E8 800454E8 0D80063C */  lui        $a2, %hi(item)
    /* 354EC 800454EC 541DC624 */  addiu      $a2, $a2, %lo(item)
    /* 354F0 800454F0 0811848F */  lw         $a0, %gp_rel(numitems)($gp)
    /* 354F4 800454F4 00007180 */  lb         $s1, 0x0($v1)
    /* 354F8 800454F8 23104400 */  subu       $v0, $v0, $a0
    /* 354FC 800454FC C0801100 */  sll        $s0, $s1, 3
    /* 35500 80045500 23801102 */  subu       $s0, $s0, $s1
    /* 35504 80045504 80801000 */  sll        $s0, $s0, 2
    /* 35508 80045508 23801102 */  subu       $s0, $s0, $s1
    /* 3550C 8004550C 80801000 */  sll        $s0, $s0, 2
    /* 35510 80045510 00004290 */  lbu        $v0, 0x0($v0)
    /* 35514 80045514 21300602 */  addu       $a2, $s0, $a2
    /* 35518 80045518 000062A0 */  sb         $v0, 0x0($v1)
    /* 3551C 8004551C 40100500 */  sll        $v0, $a1, 1
    /* 35520 80045520 21104500 */  addu       $v0, $v0, $a1
    /* 35524 80045524 80100200 */  sll        $v0, $v0, 2
    /* 35528 80045528 23104500 */  subu       $v0, $v0, $a1
    /* 3552C 8004552C 80100200 */  sll        $v0, $v0, 2
    /* 35530 80045530 0D80013C */  lui        $at, %hi(itemactive)
    /* 35534 80045534 21082400 */  addu       $at, $at, $a0
    /* 35538 80045538 545331A0 */  sb         $s1, %lo(itemactive)($at)
    /* 3553C 8004553C 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 35540 80045540 21082200 */  addu       $at, $at, $v0
    /* 35544 80045544 6B8C2590 */  lbu        $a1, %lo(object + 0x1F)($at)
    /* 35548 80045548 21202002 */  addu       $a0, $s1, $zero
    /* 3554C 8004554C 5200C5A0 */  sb         $a1, 0x52($a2)
    /* 35550 80045550 002E0500 */  sll        $a1, $a1, 24
    /* 35554 80045554 032E0500 */  sra        $a1, $a1, 24
    /* 35558 80045558 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 3555C 8004555C 21082200 */  addu       $at, $at, $v0
    /* 35560 80045560 6C8C2390 */  lbu        $v1, %lo(object + 0x20)($at)
    /* 35564 80045564 C0100500 */  sll        $v0, $a1, 3
    /* 35568 80045568 23104500 */  subu       $v0, $v0, $a1
    /* 3556C 8004556C C0110200 */  sll        $v0, $v0, 7
    /* 35570 80045570 5300C3A0 */  sb         $v1, 0x53($a2)
    /* 35574 80045574 001E0300 */  sll        $v1, $v1, 24
    /* 35578 80045578 431D0300 */  sra        $v1, $v1, 21
    /* 3557C 8004557C 21186200 */  addu       $v1, $v1, $v0
    /* 35580 80045580 01002226 */  addiu      $v0, $s1, 0x1
    /* 35584 80045584 0E80013C */  lui        $at, %hi(dung_map + 0x4)
    /* 35588 80045588 21082300 */  addu       $at, $at, $v1
    /* 3558C 8004558C 2C7A22A0 */  sb         $v0, %lo(dung_map + 0x4)($at)
    /* 35590 80045590 1280063C */  lui        $a2, %hi(currlevel)
    /* 35594 80045594 0CC1C690 */  lbu        $a2, %lo(currlevel)($a2)
    /* 35598 80045598 A704010C */  jal        GetItemAttrs__Fiii
    /* 3559C 8004559C 09000524 */   addiu     $a1, $zero, 0x9
    /* 355A0 800455A0 4C0D010C */  jal        SetupItem__Fi
    /* 355A4 800455A4 21202002 */   addu      $a0, $s1, $zero
    /* 355A8 800455A8 02000224 */  addiu      $v0, $zero, 0x2
    /* 355AC 800455AC 0D80013C */  lui        $at, %hi(item + 0x50)
    /* 355B0 800455B0 21083000 */  addu       $at, $at, $s0
    /* 355B4 800455B4 A41D22A0 */  sb         $v0, %lo(item + 0x50)($at)
    /* 355B8 800455B8 01000224 */  addiu      $v0, $zero, 0x1
    /* 355BC 800455BC 0D80013C */  lui        $at, %hi(item + 0x67)
    /* 355C0 800455C0 21083000 */  addu       $at, $at, $s0
    /* 355C4 800455C4 BB1D22A0 */  sb         $v0, %lo(item + 0x67)($at)
    /* 355C8 800455C8 0B000224 */  addiu      $v0, $zero, 0xB
    /* 355CC 800455CC 0D80013C */  lui        $at, %hi(item + 0x4F)
    /* 355D0 800455D0 21083000 */  addu       $at, $at, $s0
    /* 355D4 800455D4 A31D22A0 */  sb         $v0, %lo(item + 0x4F)($at)
    /* 355D8 800455D8 0811828F */  lw         $v0, %gp_rel(numitems)($gp)
    /* 355DC 800455DC 00000000 */  nop
    /* 355E0 800455E0 01004224 */  addiu      $v0, $v0, 0x1
    /* 355E4 800455E4 081182AF */  sw         $v0, %gp_rel(numitems)($gp)
  .L800455E8:
    /* 355E8 800455E8 2000BF8F */  lw         $ra, 0x20($sp)
    /* 355EC 800455EC 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 355F0 800455F0 1800B08F */  lw         $s0, 0x18($sp)
    /* 355F4 800455F4 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 355F8 800455F8 0800E003 */  jr         $ra
    /* 355FC 800455FC 00000000 */   nop
endlabel SpawnRock__Fv
