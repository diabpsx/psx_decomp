.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawMenu__Fi, 0x1020

glabel DrawMenu__Fi
    /* 972F4 800A72F4 18FFBD27 */  addiu      $sp, $sp, -0xE8
    /* 972F8 800A72F8 BC0A828F */  lw         $v0, %gp_rel(cmenu)($gp)
    /* 972FC 800A72FC 03000324 */  addiu      $v1, $zero, 0x3
    /* 97300 800A7300 E400BFAF */  sw         $ra, 0xE4($sp)
    /* 97304 800A7304 E000BEAF */  sw         $fp, 0xE0($sp)
    /* 97308 800A7308 DC00B7AF */  sw         $s7, 0xDC($sp)
    /* 9730C 800A730C D800B6AF */  sw         $s6, 0xD8($sp)
    /* 97310 800A7310 D400B5AF */  sw         $s5, 0xD4($sp)
    /* 97314 800A7314 D000B4AF */  sw         $s4, 0xD0($sp)
    /* 97318 800A7318 CC00B3AF */  sw         $s3, 0xCC($sp)
    /* 9731C 800A731C C800B2AF */  sw         $s2, 0xC8($sp)
    /* 97320 800A7320 C400B1AF */  sw         $s1, 0xC4($sp)
    /* 97324 800A7324 C000B0AF */  sw         $s0, 0xC0($sp)
    /* 97328 800A7328 01004224 */  addiu      $v0, $v0, 0x1
    /* 9732C 800A732C 20004314 */  bne        $v0, $v1, .L800A73B0
    /* 97330 800A7330 4000A4AF */   sw        $a0, 0x40($sp)
    /* 97334 800A7334 1280023C */  lui        $v0, %hi(FeFlag)
    /* 97338 800A7338 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 9733C 800A733C 00000000 */  nop
    /* 97340 800A7340 0D004010 */  beqz       $v0, .L800A7378
    /* 97344 800A7344 01000224 */   addiu     $v0, $zero, 0x1
    /* 97348 800A7348 0D80013C */  lui        $at, %hi(SoundMenu + 0x30)
    /* 9734C 800A734C 68CB22A0 */  sb         $v0, %lo(SoundMenu + 0x30)($at)
    /* 97350 800A7350 02000224 */  addiu      $v0, $zero, 0x2
    /* 97354 800A7354 0D80013C */  lui        $at, %hi(SoundMenu + 0x48)
    /* 97358 800A7358 80CB22A0 */  sb         $v0, %lo(SoundMenu + 0x48)($at)
    /* 9735C 800A735C 03000224 */  addiu      $v0, $zero, 0x3
    /* 97360 800A7360 0D80013C */  lui        $at, %hi(SoundMenu + 0x60)
    /* 97364 800A7364 98CB22A0 */  sb         $v0, %lo(SoundMenu + 0x60)($at)
    /* 97368 800A7368 0D80013C */  lui        $at, %hi(SoundMenu + 0x18)
    /* 9736C 800A736C 50CB20A0 */  sb         $zero, %lo(SoundMenu + 0x18)($at)
    /* 97370 800A7370 EA9C0208 */  j          .L800A73A8
    /* 97374 800A7374 05000224 */   addiu     $v0, $zero, 0x5
  .L800A7378:
    /* 97378 800A7378 0D80013C */  lui        $at, %hi(SoundMenu + 0x18)
    /* 9737C 800A737C 50CB22A0 */  sb         $v0, %lo(SoundMenu + 0x18)($at)
    /* 97380 800A7380 02000224 */  addiu      $v0, $zero, 0x2
    /* 97384 800A7384 0D80013C */  lui        $at, %hi(SoundMenu + 0x30)
    /* 97388 800A7388 68CB22A0 */  sb         $v0, %lo(SoundMenu + 0x30)($at)
    /* 9738C 800A738C 03000224 */  addiu      $v0, $zero, 0x3
    /* 97390 800A7390 0D80013C */  lui        $at, %hi(SoundMenu + 0x48)
    /* 97394 800A7394 80CB22A0 */  sb         $v0, %lo(SoundMenu + 0x48)($at)
    /* 97398 800A7398 04000224 */  addiu      $v0, $zero, 0x4
    /* 9739C 800A739C 0D80013C */  lui        $at, %hi(SoundMenu + 0x60)
    /* 973A0 800A73A0 98CB22A0 */  sb         $v0, %lo(SoundMenu + 0x60)($at)
    /* 973A4 800A73A4 06000224 */  addiu      $v0, $zero, 0x6
  .L800A73A8:
    /* 973A8 800A73A8 0D80013C */  lui        $at, %hi(SoundMenu + 0x90)
    /* 973AC 800A73AC C8CB22A0 */  sb         $v0, %lo(SoundMenu + 0x90)($at)
  .L800A73B0:
    /* 973B0 800A73B0 4000AA8F */  lw         $t2, 0x40($sp)
    /* 973B4 800A73B4 00000000 */  nop
    /* 973B8 800A73B8 12004015 */  bnez       $t2, .L800A7404
    /* 973BC 800A73BC 01004325 */   addiu     $v1, $t2, 0x1
    /* 973C0 800A73C0 1280023C */  lui        $v0, %hi(FeFlag)
    /* 973C4 800A73C4 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 973C8 800A73C8 00000000 */  nop
    /* 973CC 800A73CC 0D004014 */  bnez       $v0, .L800A7404
    /* 973D0 800A73D0 00000000 */   nop
    /* 973D4 800A73D4 1280023C */  lui        $v0, %hi(deathflag)
    /* 973D8 800A73D8 0CBA4290 */  lbu        $v0, %lo(deathflag)($v0)
    /* 973DC 800A73DC 00000000 */  nop
    /* 973E0 800A73E0 05004010 */  beqz       $v0, .L800A73F8
    /* 973E4 800A73E4 08000224 */   addiu     $v0, $zero, 0x8
    /* 973E8 800A73E8 08000B24 */  addiu      $t3, $zero, 0x8
    /* 973EC 800A73EC BC0A82AF */  sw         $v0, %gp_rel(cmenu)($gp)
    /* 973F0 800A73F0 019D0208 */  j          .L800A7404
    /* 973F4 800A73F4 4000ABAF */   sw        $t3, 0x40($sp)
  .L800A73F8:
    /* 973F8 800A73F8 BC0A83AF */  sw         $v1, %gp_rel(cmenu)($gp)
    /* 973FC 800A73FC 01000A24 */  addiu      $t2, $zero, 0x1
    /* 97400 800A7400 4000AAAF */  sw         $t2, 0x40($sp)
  .L800A7404:
    /* 97404 800A7404 4000AB8F */  lw         $t3, 0x40($sp)
    /* 97408 800A7408 02000224 */  addiu      $v0, $zero, 0x2
    /* 9740C 800A740C 01006325 */  addiu      $v1, $t3, 0x1
    /* 97410 800A7410 08006214 */  bne        $v1, $v0, .L800A7434
    /* 97414 800A7414 00000000 */   nop
    /* 97418 800A7418 1280023C */  lui        $v0, %hi(FeFlag)
    /* 9741C 800A741C 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 97420 800A7420 00000000 */  nop
    /* 97424 800A7424 03004010 */  beqz       $v0, .L800A7434
    /* 97428 800A7428 00000000 */   nop
    /* 9742C 800A742C BC0A80AF */  sw         $zero, %gp_rel(cmenu)($gp)
    /* 97430 800A7430 4000A0AF */  sw         $zero, 0x40($sp)
  .L800A7434:
    /* 97434 800A7434 0D80023C */  lui        $v0, %hi(MenuList)
    /* 97438 800A7438 40D24224 */  addiu      $v0, $v0, %lo(MenuList)
    /* 9743C 800A743C 4000AA8F */  lw         $t2, 0x40($sp)
    /* 97440 800A7440 701F848F */  lw         $a0, %gp_rel(D_8011C6F0)($gp)
    /* 97444 800A7444 C0180A00 */  sll        $v1, $t2, 3
    /* 97448 800A7448 21186200 */  addu       $v1, $v1, $v0
    /* 9744C 800A744C 5000A3AF */  sw         $v1, 0x50($sp)
    /* 97450 800A7450 04006B8C */  lw         $t3, 0x4($v1)
    /* 97454 800A7454 96000524 */  addiu      $a1, $zero, 0x96
    /* 97458 800A7458 A5AD020C */  jal        GetFr__7TextDati_800ab694
    /* 9745C 800A745C 5800ABAF */   sw        $t3, 0x58($sp)
    /* 97460 800A7460 0800428C */  lw         $v0, 0x8($v0)
    /* 97464 800A7464 00000000 */  nop
    /* 97468 800A7468 42120200 */  srl        $v0, $v0, 9
    /* 9746C 800A746C FF014230 */  andi       $v0, $v0, 0x1FF
    /* 97470 800A7470 FCFF4224 */  addiu      $v0, $v0, -0x4
    /* 97474 800A7474 A3AD020C */  jal        GetOverlayOtBase__7CBlocks_800ab68c
    /* 97478 800A7478 6000A2AF */   sw        $v0, 0x60($sp)
    /* 9747C 800A747C 5000AA8F */  lw         $t2, 0x50($sp)
    /* 97480 800A7480 00010324 */  addiu      $v1, $zero, 0x100
    /* 97484 800A7484 00004495 */  lhu        $a0, 0x0($t2)
    /* 97488 800A7488 04004224 */  addiu      $v0, $v0, 0x4
    /* 9748C 800A748C 7000A2AF */  sw         $v0, 0x70($sp)
    /* 97490 800A7490 23186400 */  subu       $v1, $v1, $a0
    /* 97494 800A7494 C2270300 */  srl        $a0, $v1, 31
    /* 97498 800A7498 21186400 */  addu       $v1, $v1, $a0
    /* 9749C 800A749C 43180300 */  sra        $v1, $v1, 1
    /* 974A0 800A74A0 20006724 */  addiu      $a3, $v1, 0x20
    /* 974A4 800A74A4 9000A7AF */  sw         $a3, 0x90($sp)
    /* 974A8 800A74A8 02004391 */  lbu        $v1, 0x2($t2)
    /* 974AC 800A74AC B0000224 */  addiu      $v0, $zero, 0xB0
    /* 974B0 800A74B0 23104300 */  subu       $v0, $v0, $v1
    /* 974B4 800A74B4 C21F0200 */  srl        $v1, $v0, 31
    /* 974B8 800A74B8 21104300 */  addu       $v0, $v0, $v1
    /* 974BC 800A74BC 43100200 */  sra        $v0, $v0, 1
    /* 974C0 800A74C0 20004624 */  addiu      $a2, $v0, 0x20
    /* 974C4 800A74C4 741F828F */  lw         $v0, %gp_rel(D_8011C6F4)($gp)
    /* 974C8 800A74C8 00800434 */  ori        $a0, $zero, 0x8000
    /* 974CC 800A74CC 1A008200 */  div        $zero, $a0, $v0
    /* 974D0 800A74D0 12580000 */  mflo       $t3
    /* 974D4 800A74D4 1280033C */  lui        $v1, %hi(FeFlag)
    /* 974D8 800A74D8 74B36390 */  lbu        $v1, %lo(FeFlag)($v1)
    /* 974DC 800A74DC 00000000 */  nop
    /* 974E0 800A74E0 05006014 */  bnez       $v1, .L800A74F8
    /* 974E4 800A74E4 A000ABAF */   sw        $t3, 0xA0($sp)
    /* 974E8 800A74E8 0D000224 */  addiu      $v0, $zero, 0xD
    /* 974EC 800A74EC AC0A82AF */  sw         $v0, %gp_rel(D_8011B22C)($gp)
    /* 974F0 800A74F0 429D0208 */  j          .L800A7508
    /* 974F4 800A74F4 9800A6AF */   sw        $a2, 0x98($sp)
  .L800A74F8:
    /* 974F8 800A74F8 0D000224 */  addiu      $v0, $zero, 0xD
    /* 974FC 800A74FC AC0A82AF */  sw         $v0, %gp_rel(D_8011B22C)($gp)
    /* 97500 800A7500 20000A24 */  addiu      $t2, $zero, 0x20
    /* 97504 800A7504 9800AAAF */  sw         $t2, 0x98($sp)
  .L800A7508:
    /* 97508 800A7508 4000AB8F */  lw         $t3, 0x40($sp)
    /* 9750C 800A750C 05000224 */  addiu      $v0, $zero, 0x5
    /* 97510 800A7510 01006325 */  addiu      $v1, $t3, 0x1
    /* 97514 800A7514 18006214 */  bne        $v1, $v0, .L800A7578
    /* 97518 800A7518 12000424 */   addiu     $a0, $zero, 0x12
    /* 9751C 800A751C 94000524 */  addiu      $a1, $zero, 0x94
    /* 97520 800A7520 1280063C */  lui        $a2, %hi(D_8011C710)
    /* 97524 800A7524 10C7C624 */  addiu      $a2, $a2, %lo(D_8011C710)
    /* 97528 800A7528 0A000724 */  addiu      $a3, $zero, 0xA
    /* 9752C 800A752C 14000224 */  addiu      $v0, $zero, 0x14
    /* 97530 800A7530 1000A2AF */  sw         $v0, 0x10($sp)
    /* 97534 800A7534 29010224 */  addiu      $v0, $zero, 0x129
    /* 97538 800A7538 1400A2AF */  sw         $v0, 0x14($sp)
    /* 9753C 800A753C CD000224 */  addiu      $v0, $zero, 0xCD
    /* 97540 800A7540 589A020C */  jal        DrawDialogBox__FiiP4RECTiiii
    /* 97544 800A7544 1800A2AF */   sw        $v0, 0x18($sp)
    /* 97548 800A7548 0A000A24 */  addiu      $t2, $zero, 0xA
    /* 9754C 800A754C 14000B24 */  addiu      $t3, $zero, 0x14
    /* 97550 800A7550 0A000224 */  addiu      $v0, $zero, 0xA
    /* 97554 800A7554 901F82A7 */  sh         $v0, %gp_rel(D_8011C710)($gp)
    /* 97558 800A7558 14000224 */  addiu      $v0, $zero, 0x14
    /* 9755C 800A755C 921F82A7 */  sh         $v0, %gp_rel(D_8011C712)($gp)
    /* 97560 800A7560 29010224 */  addiu      $v0, $zero, 0x129
    /* 97564 800A7564 941F82A7 */  sh         $v0, %gp_rel(D_8011C714)($gp)
    /* 97568 800A7568 CD000224 */  addiu      $v0, $zero, 0xCD
    /* 9756C 800A756C 9000AAAF */  sw         $t2, 0x90($sp)
    /* 97570 800A7570 839D0208 */  j          .L800A760C
    /* 97574 800A7574 9800ABAF */   sw        $t3, 0x98($sp)
  .L800A7578:
    /* 97578 800A7578 1280023C */  lui        $v0, %hi(FeFlag)
    /* 9757C 800A757C 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 97580 800A7580 00000000 */  nop
    /* 97584 800A7584 16004014 */  bnez       $v0, .L800A75E0
    /* 97588 800A7588 94000524 */   addiu     $a1, $zero, 0x94
    /* 9758C 800A758C 5000AA8F */  lw         $t2, 0x50($sp)
    /* 97590 800A7590 1000A6AF */  sw         $a2, 0x10($sp)
    /* 97594 800A7594 00004295 */  lhu        $v0, 0x0($t2)
    /* 97598 800A7598 00000000 */  nop
    /* 9759C 800A759C 1400A2AF */  sw         $v0, 0x14($sp)
    /* 975A0 800A75A0 02004291 */  lbu        $v0, 0x2($t2)
    /* 975A4 800A75A4 1280063C */  lui        $a2, %hi(D_8011C710)
    /* 975A8 800A75A8 10C7C624 */  addiu      $a2, $a2, %lo(D_8011C710)
    /* 975AC 800A75AC 589A020C */  jal        DrawDialogBox__FiiP4RECTiiii
    /* 975B0 800A75B0 1800A2AF */   sw        $v0, 0x18($sp)
    /* 975B4 800A75B4 9000AB97 */  lhu        $t3, 0x90($sp)
    /* 975B8 800A75B8 9800AA97 */  lhu        $t2, 0x98($sp)
    /* 975BC 800A75BC 901F8BA7 */  sh         $t3, %gp_rel(D_8011C710)($gp)
    /* 975C0 800A75C0 5000AB8F */  lw         $t3, 0x50($sp)
    /* 975C4 800A75C4 921F8AA7 */  sh         $t2, %gp_rel(D_8011C712)($gp)
    /* 975C8 800A75C8 00006295 */  lhu        $v0, 0x0($t3)
    /* 975CC 800A75CC 00000000 */  nop
    /* 975D0 800A75D0 941F82A7 */  sh         $v0, %gp_rel(D_8011C714)($gp)
    /* 975D4 800A75D4 02006291 */  lbu        $v0, 0x2($t3)
    /* 975D8 800A75D8 839D0208 */  j          .L800A760C
    /* 975DC 800A75DC 00000000 */   nop
  .L800A75E0:
    /* 975E0 800A75E0 9000AA97 */  lhu        $t2, 0x90($sp)
    /* 975E4 800A75E4 9800AB97 */  lhu        $t3, 0x98($sp)
    /* 975E8 800A75E8 901F8AA7 */  sh         $t2, %gp_rel(D_8011C710)($gp)
    /* 975EC 800A75EC 5000AA8F */  lw         $t2, 0x50($sp)
    /* 975F0 800A75F0 921F8BA7 */  sh         $t3, %gp_rel(D_8011C712)($gp)
    /* 975F4 800A75F4 00004295 */  lhu        $v0, 0x0($t2)
    /* 975F8 800A75F8 00000000 */  nop
    /* 975FC 800A75FC 941F82A7 */  sh         $v0, %gp_rel(D_8011C714)($gp)
    /* 97600 800A7600 02004291 */  lbu        $v0, 0x2($t2)
    /* 97604 800A7604 00000000 */  nop
    /* 97608 800A7608 64004224 */  addiu      $v0, $v0, 0x64
  .L800A760C:
    /* 9760C 800A760C 961F82A7 */  sh         $v0, %gp_rel(D_8011C716)($gp)
    /* 97610 800A7610 7000AA8F */  lw         $t2, 0x70($sp)
    /* 97614 800A7614 0C000B24 */  addiu      $t3, $zero, 0xC
    /* 97618 800A7618 6800ABAF */  sw         $t3, 0x68($sp)
    /* 9761C 800A761C FF000B3C */  lui        $t3, (0xFFFFFF >> 16)
    /* 97620 800A7620 80500A00 */  sll        $t2, $t2, 2
    /* 97624 800A7624 B000AAAF */  sw         $t2, 0xB0($sp)
    /* 97628 800A7628 5800AA8F */  lw         $t2, 0x58($sp)
    /* 9762C 800A762C FFFF6B35 */  ori        $t3, $t3, (0xFFFFFF & 0xFFFF)
    /* 97630 800A7630 A800A0AF */  sw         $zero, 0xA8($sp)
    /* 97634 800A7634 B800ABAF */  sw         $t3, 0xB8($sp)
    /* 97638 800A7638 08005E25 */  addiu      $fp, $t2, 0x8
  .L800A763C:
    /* 9763C 800A763C 5000AB8F */  lw         $t3, 0x50($sp)
    /* 97640 800A7640 A800AA8F */  lw         $t2, 0xA8($sp)
    /* 97644 800A7644 03006291 */  lbu        $v0, 0x3($t3)
    /* 97648 800A7648 00000000 */  nop
    /* 9764C 800A764C 2A104201 */  slt        $v0, $t2, $v0
    /* 97650 800A7650 10034010 */  beqz       $v0, .L800A8294
    /* 97654 800A7654 00000000 */   nop
    /* 97658 800A7658 12800B3C */  lui        $t3, %hi(WHITER)
    /* 9765C 800A765C D1AB6B91 */  lbu        $t3, %lo(WHITER)($t3)
    /* 97660 800A7660 12800A3C */  lui        $t2, %hi(WHITEG)
    /* 97664 800A7664 D2AB4A91 */  lbu        $t2, %lo(WHITEG)($t2)
    /* 97668 800A7668 7800ABA3 */  sb         $t3, 0x78($sp)
    /* 9766C 800A766C 12800B3C */  lui        $t3, %hi(WHITEB)
    /* 97670 800A7670 D3AB6B91 */  lbu        $t3, %lo(WHITEB)($t3)
    /* 97674 800A7674 8000AAA3 */  sb         $t2, 0x80($sp)
    /* 97678 800A7678 A800AA8F */  lw         $t2, 0xA8($sp)
    /* 9767C 800A767C 00000000 */  nop
    /* 97680 800A7680 05004011 */  beqz       $t2, .L800A7698
    /* 97684 800A7684 8800ABA3 */   sb        $t3, 0x88($sp)
    /* 97688 800A7688 AC0A828F */  lw         $v0, %gp_rel(D_8011B22C)($gp)
    /* 9768C 800A768C 00000000 */  nop
    /* 97690 800A7690 04004224 */  addiu      $v0, $v0, 0x4
    /* 97694 800A7694 6800A2AF */  sw         $v0, 0x68($sp)
  .L800A7698:
    /* 97698 800A7698 0800C28F */  lw         $v0, 0x8($fp)
    /* 9769C 800A769C 00000000 */  nop
    /* 976A0 800A76A0 F3004010 */  beqz       $v0, .L800A7A70
    /* 976A4 800A76A4 00000000 */   nop
    /* 976A8 800A76A8 5800AB8F */  lw         $t3, 0x58($sp)
    /* 976AC 800A76AC AC0A828F */  lw         $v0, %gp_rel(D_8011B22C)($gp)
    /* 976B0 800A76B0 00006391 */  lbu        $v1, 0x0($t3)
    /* 976B4 800A76B4 00000000 */  nop
    /* 976B8 800A76B8 18006200 */  mult       $v1, $v0
    /* 976BC 800A76BC 5000AA8F */  lw         $t2, 0x50($sp)
    /* 976C0 800A76C0 9000AB8F */  lw         $t3, 0x90($sp)
    /* 976C4 800A76C4 00004295 */  lhu        $v0, 0x0($t2)
    /* 976C8 800A76C8 741F838F */  lw         $v1, %gp_rel(D_8011C6F4)($gp)
    /* 976CC 800A76CC 9800AA8F */  lw         $t2, 0x98($sp)
    /* 976D0 800A76D0 21106201 */  addu       $v0, $t3, $v0
    /* 976D4 800A76D4 23104300 */  subu       $v0, $v0, $v1
    /* 976D8 800A76D8 F2FF5424 */  addiu      $s4, $v0, -0xE
    /* 976DC 800A76DC 12580000 */  mflo       $t3
    /* 976E0 800A76E0 21104B01 */  addu       $v0, $t2, $t3
    /* 976E4 800A76E4 6800AA8F */  lw         $t2, 0x68($sp)
    /* 976E8 800A76E8 1280033C */  lui        $v1, %hi(FeFlag)
    /* 976EC 800A76EC 74B36390 */  lbu        $v1, %lo(FeFlag)($v1)
    /* 976F0 800A76F0 00000000 */  nop
    /* 976F4 800A76F4 07006010 */  beqz       $v1, .L800A7714
    /* 976F8 800A76F8 21804A00 */   addu      $s0, $v0, $t2
    /* 976FC 800A76FC BC0A828F */  lw         $v0, %gp_rel(cmenu)($gp)
    /* 97700 800A7700 03000B24 */  addiu      $t3, $zero, 0x3
    /* 97704 800A7704 01004224 */  addiu      $v0, $v0, 0x1
    /* 97708 800A7708 02004B14 */  bne        $v0, $t3, .L800A7714
    /* 9770C 800A770C 00000000 */   nop
    /* 97710 800A7710 20001026 */  addiu      $s0, $s0, 0x20
  .L800A7714:
    /* 97714 800A7714 B00A828F */  lw         $v0, %gp_rel(D_8011B230)($gp)
    /* 97718 800A7718 A800AA8F */  lw         $t2, 0xA8($sp)
    /* 9771C 800A771C 0400D38F */  lw         $s3, 0x4($fp)
    /* 97720 800A7720 0A004211 */  beq        $t2, $v0, .L800A774C
    /* 97724 800A7724 98000524 */   addiu     $a1, $zero, 0x98
    /* 97728 800A7728 21309302 */  addu       $a2, $s4, $s3
    /* 9772C 800A772C FDFFC624 */  addiu      $a2, $a2, -0x3
    /* 97730 800A7730 701F848F */  lw         $a0, %gp_rel(D_8011C6F0)($gp)
    /* 97734 800A7734 7000AB8F */  lw         $t3, 0x70($sp)
    /* 97738 800A7738 F8FF0726 */  addiu      $a3, $s0, -0x8
    /* 9773C 800A773C 1000A0AF */  sw         $zero, 0x10($sp)
    /* 97740 800A7740 1800A0AF */  sw         $zero, 0x18($sp)
    /* 97744 800A7744 DC9D0208 */  j          .L800A7770
    /* 97748 800A7748 1400ABAF */   sw        $t3, 0x14($sp)
  .L800A774C:
    /* 9774C 800A774C 97000524 */  addiu      $a1, $zero, 0x97
    /* 97750 800A7750 21309302 */  addu       $a2, $s4, $s3
    /* 97754 800A7754 FDFFC624 */  addiu      $a2, $a2, -0x3
    /* 97758 800A7758 701F848F */  lw         $a0, %gp_rel(D_8011C6F0)($gp)
    /* 9775C 800A775C 7000AA8F */  lw         $t2, 0x70($sp)
    /* 97760 800A7760 F8FF0726 */  addiu      $a3, $s0, -0x8
    /* 97764 800A7764 1000A0AF */  sw         $zero, 0x10($sp)
    /* 97768 800A7768 1800A0AF */  sw         $zero, 0x18($sp)
    /* 9776C 800A776C 1400AAAF */  sw         $t2, 0x14($sp)
  .L800A7770:
    /* 97770 800A7770 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 97774 800A7774 FEFF9426 */   addiu     $s4, $s4, -0x2
    /* 97778 800A7778 FAFF1026 */  addiu      $s0, $s0, -0x6
    /* 9777C 800A777C A000AB8F */  lw         $t3, 0xA0($sp)
    /* 97780 800A7780 12000424 */  addiu      $a0, $zero, 0x12
    /* 97784 800A7784 18007301 */  mult       $t3, $s3
    /* 97788 800A7788 94000524 */  addiu      $a1, $zero, 0x94
    /* 9778C 800A778C 21300000 */  addu       $a2, $zero, $zero
    /* 97790 800A7790 21388002 */  addu       $a3, $s4, $zero
    /* 97794 800A7794 741F838F */  lw         $v1, %gp_rel(D_8011C6F4)($gp)
    /* 97798 800A7798 6000AA8F */  lw         $t2, 0x60($sp)
    /* 9779C 800A779C 01000226 */  addiu      $v0, $s0, 0x1
    /* 977A0 800A77A0 1000A2AF */  sw         $v0, 0x10($sp)
    /* 977A4 800A77A4 FEFF4225 */  addiu      $v0, $t2, -0x2
    /* 977A8 800A77A8 80000A24 */  addiu      $t2, $zero, 0x80
    /* 977AC 800A77AC 1800A2AF */  sw         $v0, 0x18($sp)
    /* 977B0 800A77B0 1400A3AF */  sw         $v1, 0x14($sp)
    /* 977B4 800A77B4 12580000 */  mflo       $t3
    /* 977B8 800A77B8 03920B00 */  sra        $s2, $t3, 8
    /* 977BC 800A77BC 589A020C */  jal        DrawDialogBox__FiiP4RECTiiii
    /* 977C0 800A77C0 23B85201 */   subu      $s7, $t2, $s2
    /* 977C4 800A77C4 2CAD020C */  jal        PRIM_GetPrim__FPP7POLY_G4_800ab4b0
    /* 977C8 800A77C8 3800A427 */   addiu     $a0, $sp, 0x38
    /* 977CC 800A77CC 3800A28F */  lw         $v0, 0x38($sp)
    /* 977D0 800A77D0 08000B24 */  addiu      $t3, $zero, 0x8
    /* 977D4 800A77D4 03004BA0 */  sb         $t3, 0x3($v0)
    /* 977D8 800A77D8 3800A28F */  lw         $v0, 0x38($sp)
    /* 977DC 800A77DC 38000A24 */  addiu      $t2, $zero, 0x38
    /* 977E0 800A77E0 07004AA0 */  sb         $t2, 0x7($v0)
    /* 977E4 800A77E4 3800A38F */  lw         $v1, 0x38($sp)
    /* 977E8 800A77E8 00000000 */  nop
    /* 977EC 800A77EC 07006290 */  lbu        $v0, 0x7($v1)
    /* 977F0 800A77F0 00000000 */  nop
    /* 977F4 800A77F4 FD004230 */  andi       $v0, $v0, 0xFD
    /* 977F8 800A77F8 070062A0 */  sb         $v0, 0x7($v1)
    /* 977FC 800A77FC 3800A38F */  lw         $v1, 0x38($sp)
    /* 97800 800A7800 00000000 */  nop
    /* 97804 800A7804 07006290 */  lbu        $v0, 0x7($v1)
    /* 97808 800A7808 00000000 */  nop
    /* 9780C 800A780C FE004230 */  andi       $v0, $v0, 0xFE
    /* 97810 800A7810 070062A0 */  sb         $v0, 0x7($v1)
    /* 97814 800A7814 3800A28F */  lw         $v0, 0x38($sp)
    /* 97818 800A7818 40000B24 */  addiu      $t3, $zero, 0x40
    /* 9781C 800A781C 04004BA0 */  sb         $t3, 0x4($v0)
    /* 97820 800A7820 3800A28F */  lw         $v0, 0x38($sp)
    /* 97824 800A7824 FF00F632 */  andi       $s6, $s7, 0xFF
    /* 97828 800A7828 050040A0 */  sb         $zero, 0x5($v0)
    /* 9782C 800A782C 3800A28F */  lw         $v0, 0x38($sp)
    /* 97830 800A7830 42B01600 */  srl        $s6, $s6, 1
    /* 97834 800A7834 060040A0 */  sb         $zero, 0x6($v0)
    /* 97838 800A7838 3800A28F */  lw         $v0, 0x38($sp)
    /* 9783C 800A783C FF005532 */  andi       $s5, $s2, 0xFF
    /* 97840 800A7840 0C0056A0 */  sb         $s6, 0xC($v0)
    /* 97844 800A7844 3800A28F */  lw         $v0, 0x38($sp)
    /* 97848 800A7848 42A81500 */  srl        $s5, $s5, 1
    /* 9784C 800A784C 0D0055A0 */  sb         $s5, 0xD($v0)
    /* 97850 800A7850 3800A28F */  lw         $v0, 0x38($sp)
    /* 97854 800A7854 00000000 */  nop
    /* 97858 800A7858 0E0040A0 */  sb         $zero, 0xE($v0)
    /* 9785C 800A785C 3800A28F */  lw         $v0, 0x38($sp)
    /* 97860 800A7860 80000A24 */  addiu      $t2, $zero, 0x80
    /* 97864 800A7864 14004AA0 */  sb         $t2, 0x14($v0)
    /* 97868 800A7868 3800A28F */  lw         $v0, 0x38($sp)
    /* 9786C 800A786C 00000000 */  nop
    /* 97870 800A7870 150040A0 */  sb         $zero, 0x15($v0)
    /* 97874 800A7874 3800A28F */  lw         $v0, 0x38($sp)
    /* 97878 800A7878 00000000 */  nop
    /* 9787C 800A787C 160040A0 */  sb         $zero, 0x16($v0)
    /* 97880 800A7880 3800A28F */  lw         $v0, 0x38($sp)
    /* 97884 800A7884 00000000 */  nop
    /* 97888 800A7888 1C0057A0 */  sb         $s7, 0x1C($v0)
    /* 9788C 800A788C 3800A28F */  lw         $v0, 0x38($sp)
    /* 97890 800A7890 00000000 */  nop
    /* 97894 800A7894 1D0052A0 */  sb         $s2, 0x1D($v0)
    /* 97898 800A7898 3800A28F */  lw         $v0, 0x38($sp)
    /* 9789C 800A789C FFFF9426 */  addiu      $s4, $s4, -0x1
    /* 978A0 800A78A0 1E0040A0 */  sb         $zero, 0x1E($v0)
    /* 978A4 800A78A4 3800A38F */  lw         $v1, 0x38($sp)
    /* 978A8 800A78A8 1280053C */  lui        $a1, %hi(ThisOt)
    /* 978AC 800A78AC B4AAA58C */  lw         $a1, %lo(ThisOt)($a1)
    /* 978B0 800A78B0 0000648C */  lw         $a0, 0x0($v1)
    /* 978B4 800A78B4 21989302 */  addu       $s3, $s4, $s3
    /* 978B8 800A78B8 080074A4 */  sh         $s4, 0x8($v1)
    /* 978BC 800A78BC 0A0070A4 */  sh         $s0, 0xA($v1)
    /* 978C0 800A78C0 100073A4 */  sh         $s3, 0x10($v1)
    /* 978C4 800A78C4 120070A4 */  sh         $s0, 0x12($v1)
    /* 978C8 800A78C8 180074A4 */  sh         $s4, 0x18($v1)
    /* 978CC 800A78CC 6000AB8F */  lw         $t3, 0x60($sp)
    /* 978D0 800A78D0 200073A4 */  sh         $s3, 0x20($v1)
    /* 978D4 800A78D4 C28F0B00 */  srl        $s1, $t3, 31
    /* 978D8 800A78D8 21887101 */  addu       $s1, $t3, $s1
    /* 978DC 800A78DC 43881100 */  sra        $s1, $s1, 1
    /* 978E0 800A78E0 21801102 */  addu       $s0, $s0, $s1
    /* 978E4 800A78E4 1A0070A4 */  sh         $s0, 0x1A($v1)
    /* 978E8 800A78E8 220070A4 */  sh         $s0, 0x22($v1)
    /* 978EC 800A78EC B000AA8F */  lw         $t2, 0xB0($sp)
    /* 978F0 800A78F0 00FF0B3C */  lui        $t3, (0xFF000000 >> 16)
    /* 978F4 800A78F4 21284501 */  addu       $a1, $t2, $a1
    /* 978F8 800A78F8 0000A28C */  lw         $v0, 0x0($a1)
    /* 978FC 800A78FC B800AA8F */  lw         $t2, 0xB8($sp)
    /* 97900 800A7900 24208B00 */  and        $a0, $a0, $t3
    /* 97904 800A7904 24104A00 */  and        $v0, $v0, $t2
    /* 97908 800A7908 25208200 */  or         $a0, $a0, $v0
    /* 9790C 800A790C 000064AC */  sw         $a0, 0x0($v1)
    /* 97910 800A7910 3800A427 */  addiu      $a0, $sp, 0x38
    /* 97914 800A7914 0000A28C */  lw         $v0, 0x0($a1)
    /* 97918 800A7918 24186A00 */  and        $v1, $v1, $t2
    /* 9791C 800A791C 24104B00 */  and        $v0, $v0, $t3
    /* 97920 800A7920 25104300 */  or         $v0, $v0, $v1
    /* 97924 800A7924 2CAD020C */  jal        PRIM_GetPrim__FPP7POLY_G4_800ab4b0
    /* 97928 800A7928 0000A2AC */   sw        $v0, 0x0($a1)
    /* 9792C 800A792C 3800A28F */  lw         $v0, 0x38($sp)
    /* 97930 800A7930 08000B24 */  addiu      $t3, $zero, 0x8
    /* 97934 800A7934 03004BA0 */  sb         $t3, 0x3($v0)
    /* 97938 800A7938 3800A28F */  lw         $v0, 0x38($sp)
    /* 9793C 800A793C 38000A24 */  addiu      $t2, $zero, 0x38
    /* 97940 800A7940 07004AA0 */  sb         $t2, 0x7($v0)
    /* 97944 800A7944 3800A38F */  lw         $v1, 0x38($sp)
    /* 97948 800A7948 00000000 */  nop
    /* 9794C 800A794C 07006290 */  lbu        $v0, 0x7($v1)
    /* 97950 800A7950 00000000 */  nop
    /* 97954 800A7954 FD004230 */  andi       $v0, $v0, 0xFD
    /* 97958 800A7958 070062A0 */  sb         $v0, 0x7($v1)
    /* 9795C 800A795C 3800A38F */  lw         $v1, 0x38($sp)
    /* 97960 800A7960 00000000 */  nop
    /* 97964 800A7964 07006290 */  lbu        $v0, 0x7($v1)
    /* 97968 800A7968 00000000 */  nop
    /* 9796C 800A796C FE004230 */  andi       $v0, $v0, 0xFE
    /* 97970 800A7970 070062A0 */  sb         $v0, 0x7($v1)
    /* 97974 800A7974 3800A28F */  lw         $v0, 0x38($sp)
    /* 97978 800A7978 80000B24 */  addiu      $t3, $zero, 0x80
    /* 9797C 800A797C 04004BA0 */  sb         $t3, 0x4($v0)
    /* 97980 800A7980 3800A28F */  lw         $v0, 0x38($sp)
    /* 97984 800A7984 00000000 */  nop
    /* 97988 800A7988 050040A0 */  sb         $zero, 0x5($v0)
    /* 9798C 800A798C 3800A28F */  lw         $v0, 0x38($sp)
    /* 97990 800A7990 00000000 */  nop
    /* 97994 800A7994 060040A0 */  sb         $zero, 0x6($v0)
    /* 97998 800A7998 3800A28F */  lw         $v0, 0x38($sp)
    /* 9799C 800A799C 00000000 */  nop
    /* 979A0 800A79A0 0C0057A0 */  sb         $s7, 0xC($v0)
    /* 979A4 800A79A4 3800A28F */  lw         $v0, 0x38($sp)
    /* 979A8 800A79A8 00000000 */  nop
    /* 979AC 800A79AC 0D0052A0 */  sb         $s2, 0xD($v0)
    /* 979B0 800A79B0 3800A28F */  lw         $v0, 0x38($sp)
    /* 979B4 800A79B4 00000000 */  nop
    /* 979B8 800A79B8 0E0040A0 */  sb         $zero, 0xE($v0)
    /* 979BC 800A79BC 3800A28F */  lw         $v0, 0x38($sp)
    /* 979C0 800A79C0 40000A24 */  addiu      $t2, $zero, 0x40
    /* 979C4 800A79C4 14004AA0 */  sb         $t2, 0x14($v0)
    /* 979C8 800A79C8 3800A28F */  lw         $v0, 0x38($sp)
    /* 979CC 800A79CC 00000000 */  nop
    /* 979D0 800A79D0 150040A0 */  sb         $zero, 0x15($v0)
    /* 979D4 800A79D4 3800A28F */  lw         $v0, 0x38($sp)
    /* 979D8 800A79D8 00000000 */  nop
    /* 979DC 800A79DC 160040A0 */  sb         $zero, 0x16($v0)
    /* 979E0 800A79E0 3800A28F */  lw         $v0, 0x38($sp)
    /* 979E4 800A79E4 00000000 */  nop
    /* 979E8 800A79E8 1C0056A0 */  sb         $s6, 0x1C($v0)
    /* 979EC 800A79EC 3800A28F */  lw         $v0, 0x38($sp)
    /* 979F0 800A79F0 00000000 */  nop
    /* 979F4 800A79F4 1D0055A0 */  sb         $s5, 0x1D($v0)
    /* 979F8 800A79F8 3800A28F */  lw         $v0, 0x38($sp)
    /* 979FC 800A79FC 00000000 */  nop
    /* 97A00 800A7A00 1E0040A0 */  sb         $zero, 0x1E($v0)
    /* 97A04 800A7A04 3800A38F */  lw         $v1, 0x38($sp)
    /* 97A08 800A7A08 1280043C */  lui        $a0, %hi(ThisOt)
    /* 97A0C 800A7A0C B4AA848C */  lw         $a0, %lo(ThisOt)($a0)
    /* 97A10 800A7A10 00FF0A3C */  lui        $t2, (0xFF000000 >> 16)
    /* 97A14 800A7A14 0A0070A4 */  sh         $s0, 0xA($v1)
    /* 97A18 800A7A18 120070A4 */  sh         $s0, 0x12($v1)
    /* 97A1C 800A7A1C 21801102 */  addu       $s0, $s0, $s1
    /* 97A20 800A7A20 080074A4 */  sh         $s4, 0x8($v1)
    /* 97A24 800A7A24 100073A4 */  sh         $s3, 0x10($v1)
    /* 97A28 800A7A28 180074A4 */  sh         $s4, 0x18($v1)
    /* 97A2C 800A7A2C 1A0070A4 */  sh         $s0, 0x1A($v1)
    /* 97A30 800A7A30 200073A4 */  sh         $s3, 0x20($v1)
    /* 97A34 800A7A34 220070A4 */  sh         $s0, 0x22($v1)
    /* 97A38 800A7A38 B000AB8F */  lw         $t3, 0xB0($sp)
    /* 97A3C 800A7A3C 0000658C */  lw         $a1, 0x0($v1)
    /* 97A40 800A7A40 21206401 */  addu       $a0, $t3, $a0
    /* 97A44 800A7A44 0000828C */  lw         $v0, 0x0($a0)
    /* 97A48 800A7A48 B800AB8F */  lw         $t3, 0xB8($sp)
    /* 97A4C 800A7A4C 2428AA00 */  and        $a1, $a1, $t2
    /* 97A50 800A7A50 24104B00 */  and        $v0, $v0, $t3
    /* 97A54 800A7A54 2528A200 */  or         $a1, $a1, $v0
    /* 97A58 800A7A58 000065AC */  sw         $a1, 0x0($v1)
    /* 97A5C 800A7A5C 0000828C */  lw         $v0, 0x0($a0)
    /* 97A60 800A7A60 24186B00 */  and        $v1, $v1, $t3
    /* 97A64 800A7A64 24104A00 */  and        $v0, $v0, $t2
    /* 97A68 800A7A68 25104300 */  or         $v0, $v0, $v1
    /* 97A6C 800A7A6C 000082AC */  sw         $v0, 0x0($a0)
  .L800A7A70:
    /* 97A70 800A7A70 A800AA8F */  lw         $t2, 0xA8($sp)
    /* 97A74 800A7A74 00000000 */  nop
    /* 97A78 800A7A78 0A004015 */  bnez       $t2, .L800A7AA4
    /* 97A7C 800A7A7C 00000000 */   nop
    /* 97A80 800A7A80 12800B3C */  lui        $t3, %hi(BLUER)
    /* 97A84 800A7A84 D4AB6B91 */  lbu        $t3, %lo(BLUER)($t3)
    /* 97A88 800A7A88 12800A3C */  lui        $t2, %hi(BLUEG)
    /* 97A8C 800A7A8C D5AB4A91 */  lbu        $t2, %lo(BLUEG)($t2)
    /* 97A90 800A7A90 7800ABA3 */  sb         $t3, 0x78($sp)
    /* 97A94 800A7A94 12800B3C */  lui        $t3, %hi(BLUEB)
    /* 97A98 800A7A98 D6AB6B91 */  lbu        $t3, %lo(BLUEB)($t3)
    /* 97A9C 800A7A9C 8000AAA3 */  sb         $t2, 0x80($sp)
    /* 97AA0 800A7AA0 8800ABA3 */  sb         $t3, 0x88($sp)
  .L800A7AA4:
    /* 97AA4 800A7AA4 B00A828F */  lw         $v0, %gp_rel(D_8011B230)($gp)
    /* 97AA8 800A7AA8 A800AA8F */  lw         $t2, 0xA8($sp)
    /* 97AAC 800A7AAC 00000000 */  nop
    /* 97AB0 800A7AB0 C7004215 */  bne        $t2, $v0, .L800A7DD0
    /* 97AB4 800A7AB4 00000000 */   nop
    /* 97AB8 800A7AB8 FCFFC28F */  lw         $v0, -0x4($fp)
    /* 97ABC 800A7ABC 00000000 */  nop
    /* 97AC0 800A7AC0 EC014010 */  beqz       $v0, .L800A8274
    /* 97AC4 800A7AC4 00000000 */   nop
    /* 97AC8 800A7AC8 12800A3C */  lui        $t2, %hi(GOLDG)
    /* 97ACC 800A7ACC DBAB4A91 */  lbu        $t2, %lo(GOLDG)($t2)
    /* 97AD0 800A7AD0 12800B3C */  lui        $t3, %hi(GOLDR)
    /* 97AD4 800A7AD4 DAAB6B91 */  lbu        $t3, %lo(GOLDR)($t3)
    /* 97AD8 800A7AD8 8000AAA3 */  sb         $t2, 0x80($sp)
    /* 97ADC 800A7ADC 4000AA8F */  lw         $t2, 0x40($sp)
    /* 97AE0 800A7AE0 7800ABA3 */  sb         $t3, 0x78($sp)
    /* 97AE4 800A7AE4 12800B3C */  lui        $t3, %hi(GOLDB)
    /* 97AE8 800A7AE8 DCAB6B91 */  lbu        $t3, %lo(GOLDB)($t3)
    /* 97AEC 800A7AEC F2FF4225 */  addiu      $v0, $t2, -0xE
    /* 97AF0 800A7AF0 0200422C */  sltiu      $v0, $v0, 0x2
    /* 97AF4 800A7AF4 19004010 */  beqz       $v0, .L800A7B5C
    /* 97AF8 800A7AF8 8800ABA3 */   sb        $t3, 0x88($sp)
    /* 97AFC 800A7AFC 1280023C */  lui        $v0, %hi(MemCardActive)
    /* 97B00 800A7B00 60B1428C */  lw         $v0, %lo(MemCardActive)($v0)
    /* 97B04 800A7B04 00000000 */  nop
    /* 97B08 800A7B08 14004010 */  beqz       $v0, .L800A7B5C
    /* 97B0C 800A7B0C 00000000 */   nop
    /* 97B10 800A7B10 1280023C */  lui        $v0, %hi(current_card)
    /* 97B14 800A7B14 60B4428C */  lw         $v0, %lo(current_card)($v0)
    /* 97B18 800A7B18 00000000 */  nop
    /* 97B1C 800A7B1C 80100200 */  sll        $v0, $v0, 2
    /* 97B20 800A7B20 1280013C */  lui        $at, %hi(card_status)
    /* 97B24 800A7B24 21082200 */  addu       $at, $at, $v0
    /* 97B28 800A7B28 DCB3228C */  lw         $v0, %lo(card_status)($at)
    /* 97B2C 800A7B2C 00000000 */  nop
    /* 97B30 800A7B30 22004014 */  bnez       $v0, .L800A7BBC
    /* 97B34 800A7B34 80021324 */   addiu     $s3, $zero, 0x280
    /* 97B38 800A7B38 C00A828F */  lw         $v0, %gp_rel(CharacterBlockLoaded)($gp)
    /* 97B3C 800A7B3C 00000000 */  nop
    /* 97B40 800A7B40 1E004010 */  beqz       $v0, .L800A7BBC
    /* 97B44 800A7B44 00000000 */   nop
    /* 97B48 800A7B48 A800AB8F */  lw         $t3, 0xA8($sp)
    /* 97B4C 800A7B4C DF6C050C */  jal        func_8015B37C
    /* 97B50 800A7B50 FFFF6425 */   addiu     $a0, $t3, -0x1
    /* 97B54 800A7B54 EF9E0208 */  j          .L800A7BBC
    /* 97B58 800A7B58 21984000 */   addu      $s3, $v0, $zero
  .L800A7B5C:
    /* 97B5C 800A7B5C 1280023C */  lui        $v0, %hi(FeFlag)
    /* 97B60 800A7B60 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 97B64 800A7B64 00000000 */  nop
    /* 97B68 800A7B68 0C004010 */  beqz       $v0, .L800A7B9C
    /* 97B6C 800A7B6C 00000000 */   nop
    /* 97B70 800A7B70 A800AA8F */  lw         $t2, 0xA8($sp)
    /* 97B74 800A7B74 00000000 */  nop
    /* 97B78 800A7B78 08004015 */  bnez       $t2, .L800A7B9C
    /* 97B7C 800A7B7C 00000000 */   nop
    /* 97B80 800A7B80 FCFFC48F */  lw         $a0, -0x4($fp)
    /* 97B84 800A7B84 4AED010C */  jal        GetStr__Fi
    /* 97B88 800A7B88 00000000 */   nop
    /* 97B8C 800A7B8C 0C80043C */  lui        $a0, %hi(LargeFont)
    /* 97B90 800A7B90 F4848424 */  addiu      $a0, $a0, %lo(LargeFont)
    /* 97B94 800A7B94 EC9E0208 */  j          .L800A7BB0
    /* 97B98 800A7B98 00000000 */   nop
  .L800A7B9C:
    /* 97B9C 800A7B9C FCFFC48F */  lw         $a0, -0x4($fp)
    /* 97BA0 800A7BA0 4AED010C */  jal        GetStr__Fi
    /* 97BA4 800A7BA4 00000000 */   nop
    /* 97BA8 800A7BA8 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 97BAC 800A7BAC D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
  .L800A7BB0:
    /* 97BB0 800A7BB0 A92A020C */  jal        GetStrWidth__5CFontPc
    /* 97BB4 800A7BB4 21284000 */   addu      $a1, $v0, $zero
    /* 97BB8 800A7BB8 21984000 */  addu       $s3, $v0, $zero
  .L800A7BBC:
    /* 97BBC 800A7BBC 5800AB8F */  lw         $t3, 0x58($sp)
    /* 97BC0 800A7BC0 AC0A828F */  lw         $v0, %gp_rel(D_8011B22C)($gp)
    /* 97BC4 800A7BC4 00006391 */  lbu        $v1, 0x0($t3)
    /* 97BC8 800A7BC8 00000000 */  nop
    /* 97BCC 800A7BCC 18006200 */  mult       $v1, $v0
    /* 97BD0 800A7BD0 BC0A838F */  lw         $v1, %gp_rel(cmenu)($gp)
    /* 97BD4 800A7BD4 9800AA8F */  lw         $t2, 0x98($sp)
    /* 97BD8 800A7BD8 01006324 */  addiu      $v1, $v1, 0x1
    /* 97BDC 800A7BDC 12580000 */  mflo       $t3
    /* 97BE0 800A7BE0 21104B01 */  addu       $v0, $t2, $t3
    /* 97BE4 800A7BE4 6800AA8F */  lw         $t2, 0x68($sp)
    /* 97BE8 800A7BE8 03000B24 */  addiu      $t3, $zero, 0x3
    /* 97BEC 800A7BEC 21104A00 */  addu       $v0, $v0, $t2
    /* 97BF0 800A7BF0 0F006B14 */  bne        $v1, $t3, .L800A7C30
    /* 97BF4 800A7BF4 FEFF5424 */   addiu     $s4, $v0, -0x2
    /* 97BF8 800A7BF8 B00A838F */  lw         $v1, %gp_rel(D_8011B230)($gp)
    /* 97BFC 800A7BFC 07000224 */  addiu      $v0, $zero, 0x7
    /* 97C00 800A7C00 0C006210 */  beq        $v1, $v0, .L800A7C34
    /* 97C04 800A7C04 00010224 */   addiu     $v0, $zero, 0x100
    /* 97C08 800A7C08 0A007326 */  addiu      $s3, $s3, 0xA
    /* 97C0C 800A7C0C 9000AA8F */  lw         $t2, 0x90($sp)
    /* 97C10 800A7C10 1280023C */  lui        $v0, %hi(FeFlag)
    /* 97C14 800A7C14 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 97C18 800A7C18 00000000 */  nop
    /* 97C1C 800A7C1C 16004010 */  beqz       $v0, .L800A7C78
    /* 97C20 800A7C20 02005225 */   addiu     $s2, $t2, 0x2
    /* 97C24 800A7C24 F8FF5225 */  addiu      $s2, $t2, -0x8
    /* 97C28 800A7C28 159F0208 */  j          .L800A7C54
    /* 97C2C 800A7C2C 06007326 */   addiu     $s3, $s3, 0x6
  .L800A7C30:
    /* 97C30 800A7C30 00010224 */  addiu      $v0, $zero, 0x100
  .L800A7C34:
    /* 97C34 800A7C34 23105300 */  subu       $v0, $v0, $s3
    /* 97C38 800A7C38 C21F0200 */  srl        $v1, $v0, 31
    /* 97C3C 800A7C3C 21104300 */  addu       $v0, $v0, $v1
    /* 97C40 800A7C40 43100200 */  sra        $v0, $v0, 1
    /* 97C44 800A7C44 14005224 */  addiu      $s2, $v0, 0x14
    /* 97C48 800A7C48 10007326 */  addiu      $s3, $s3, 0x10
    /* 97C4C 800A7C4C 1280023C */  lui        $v0, %hi(FeFlag)
    /* 97C50 800A7C50 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
  .L800A7C54:
    /* 97C54 800A7C54 00000000 */  nop
    /* 97C58 800A7C58 07004010 */  beqz       $v0, .L800A7C78
    /* 97C5C 800A7C5C 00000000 */   nop
    /* 97C60 800A7C60 BC0A828F */  lw         $v0, %gp_rel(cmenu)($gp)
    /* 97C64 800A7C64 03000B24 */  addiu      $t3, $zero, 0x3
    /* 97C68 800A7C68 01004224 */  addiu      $v0, $v0, 0x1
    /* 97C6C 800A7C6C 02004B14 */  bne        $v0, $t3, .L800A7C78
    /* 97C70 800A7C70 00000000 */   nop
    /* 97C74 800A7C74 20009426 */  addiu      $s4, $s4, 0x20
  .L800A7C78:
    /* 97C78 800A7C78 4000AA8F */  lw         $t2, 0x40($sp)
    /* 97C7C 800A7C7C 05000224 */  addiu      $v0, $zero, 0x5
    /* 97C80 800A7C80 01004325 */  addiu      $v1, $t2, 0x1
    /* 97C84 800A7C84 52006210 */  beq        $v1, $v0, .L800A7DD0
    /* 97C88 800A7C88 00000000 */   nop
    /* 97C8C 800A7C8C 1280023C */  lui        $v0, %hi(AlertTxt)
    /* 97C90 800A7C90 58B4428C */  lw         $v0, %lo(AlertTxt)($v0)
    /* 97C94 800A7C94 00000000 */  nop
    /* 97C98 800A7C98 21004014 */  bnez       $v0, .L800A7D20
    /* 97C9C 800A7C9C 21204002 */   addu      $a0, $s2, $zero
    /* 97CA0 800A7CA0 21288002 */  addu       $a1, $s4, $zero
    /* 97CA4 800A7CA4 A0000624 */  addiu      $a2, $zero, 0xA0
    /* 97CA8 800A7CA8 40000724 */  addiu      $a3, $zero, 0x40
    /* 97CAC 800A7CAC F0001124 */  addiu      $s1, $zero, 0xF0
    /* 97CB0 800A7CB0 20001024 */  addiu      $s0, $zero, 0x20
    /* 97CB4 800A7CB4 40000B24 */  addiu      $t3, $zero, 0x40
    /* 97CB8 800A7CB8 1800ABAF */  sw         $t3, 0x18($sp)
    /* 97CBC 800A7CBC 7000AB8F */  lw         $t3, 0x70($sp)
    /* 97CC0 800A7CC0 01000A24 */  addiu      $t2, $zero, 0x1
    /* 97CC4 800A7CC4 2000AAAF */  sw         $t2, 0x20($sp)
    /* 97CC8 800A7CC8 1000B1AF */  sw         $s1, 0x10($sp)
    /* 97CCC 800A7CCC 1400B0AF */  sw         $s0, 0x14($sp)
    /* 97CD0 800A7CD0 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 97CD4 800A7CD4 2800AAAF */  sw         $t2, 0x28($sp)
    /* 97CD8 800A7CD8 2C00A0AF */  sw         $zero, 0x2C($sp)
    /* 97CDC 800A7CDC 2400ABAF */  sw         $t3, 0x24($sp)
    /* 97CE0 800A7CE0 08000B24 */  addiu      $t3, $zero, 0x8
    /* 97CE4 800A7CE4 919A020C */  jal        DrawSpinner__FiiUcUcUciiibiT8T8Uc
    /* 97CE8 800A7CE8 3000ABAF */   sw        $t3, 0x30($sp)
    /* 97CEC 800A7CEC 21205302 */  addu       $a0, $s2, $s3
    /* 97CF0 800A7CF0 21288002 */  addu       $a1, $s4, $zero
    /* 97CF4 800A7CF4 A0000624 */  addiu      $a2, $zero, 0xA0
    /* 97CF8 800A7CF8 40000724 */  addiu      $a3, $zero, 0x40
    /* 97CFC 800A7CFC 40000A24 */  addiu      $t2, $zero, 0x40
    /* 97D00 800A7D00 1800AAAF */  sw         $t2, 0x18($sp)
    /* 97D04 800A7D04 7000AA8F */  lw         $t2, 0x70($sp)
    /* 97D08 800A7D08 01000B24 */  addiu      $t3, $zero, 0x1
    /* 97D0C 800A7D0C 2000ABAF */  sw         $t3, 0x20($sp)
    /* 97D10 800A7D10 1000B1AF */  sw         $s1, 0x10($sp)
    /* 97D14 800A7D14 1400B0AF */  sw         $s0, 0x14($sp)
    /* 97D18 800A7D18 6E9F0208 */  j          .L800A7DB8
    /* 97D1C 800A7D1C 1C00A0AF */   sw        $zero, 0x1C($sp)
  .L800A7D20:
    /* 97D20 800A7D20 1280023C */  lui        $v0, %hi(FeFlag)
    /* 97D24 800A7D24 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 97D28 800A7D28 00000000 */  nop
    /* 97D2C 800A7D2C 28004010 */  beqz       $v0, .L800A7DD0
    /* 97D30 800A7D30 21288002 */   addu      $a1, $s4, $zero
    /* 97D34 800A7D34 A0000624 */  addiu      $a2, $zero, 0xA0
    /* 97D38 800A7D38 A0000724 */  addiu      $a3, $zero, 0xA0
    /* 97D3C 800A7D3C 40000B24 */  addiu      $t3, $zero, 0x40
    /* 97D40 800A7D40 40000A24 */  addiu      $t2, $zero, 0x40
    /* 97D44 800A7D44 1800AAAF */  sw         $t2, 0x18($sp)
    /* 97D48 800A7D48 7000AA8F */  lw         $t2, 0x70($sp)
    /* 97D4C 800A7D4C 10001024 */  addiu      $s0, $zero, 0x10
    /* 97D50 800A7D50 1000ABAF */  sw         $t3, 0x10($sp)
    /* 97D54 800A7D54 08000B24 */  addiu      $t3, $zero, 0x8
    /* 97D58 800A7D58 1C00ABAF */  sw         $t3, 0x1C($sp)
    /* 97D5C 800A7D5C 01000B24 */  addiu      $t3, $zero, 0x1
    /* 97D60 800A7D60 1400B0AF */  sw         $s0, 0x14($sp)
    /* 97D64 800A7D64 2000A0AF */  sw         $zero, 0x20($sp)
    /* 97D68 800A7D68 2800ABAF */  sw         $t3, 0x28($sp)
    /* 97D6C 800A7D6C 2C00A0AF */  sw         $zero, 0x2C($sp)
    /* 97D70 800A7D70 2400AAAF */  sw         $t2, 0x24($sp)
    /* 97D74 800A7D74 08000A24 */  addiu      $t2, $zero, 0x8
    /* 97D78 800A7D78 919A020C */  jal        DrawSpinner__FiiUcUcUciiibiT8T8Uc
    /* 97D7C 800A7D7C 3000AAAF */   sw        $t2, 0x30($sp)
    /* 97D80 800A7D80 21205302 */  addu       $a0, $s2, $s3
    /* 97D84 800A7D84 21288002 */  addu       $a1, $s4, $zero
    /* 97D88 800A7D88 A0000624 */  addiu      $a2, $zero, 0xA0
    /* 97D8C 800A7D8C A0000724 */  addiu      $a3, $zero, 0xA0
    /* 97D90 800A7D90 40000A24 */  addiu      $t2, $zero, 0x40
    /* 97D94 800A7D94 1800AAAF */  sw         $t2, 0x18($sp)
    /* 97D98 800A7D98 7000AA8F */  lw         $t2, 0x70($sp)
    /* 97D9C 800A7D9C 40000B24 */  addiu      $t3, $zero, 0x40
    /* 97DA0 800A7DA0 1000ABAF */  sw         $t3, 0x10($sp)
    /* 97DA4 800A7DA4 08000B24 */  addiu      $t3, $zero, 0x8
    /* 97DA8 800A7DA8 1C00ABAF */  sw         $t3, 0x1C($sp)
    /* 97DAC 800A7DAC 01000B24 */  addiu      $t3, $zero, 0x1
    /* 97DB0 800A7DB0 1400B0AF */  sw         $s0, 0x14($sp)
    /* 97DB4 800A7DB4 2000A0AF */  sw         $zero, 0x20($sp)
  .L800A7DB8:
    /* 97DB8 800A7DB8 2800ABAF */  sw         $t3, 0x28($sp)
    /* 97DBC 800A7DBC 2C00A0AF */  sw         $zero, 0x2C($sp)
    /* 97DC0 800A7DC0 2400AAAF */  sw         $t2, 0x24($sp)
    /* 97DC4 800A7DC4 08000A24 */  addiu      $t2, $zero, 0x8
    /* 97DC8 800A7DC8 919A020C */  jal        DrawSpinner__FiiUcUcUciiibiT8T8Uc
    /* 97DCC 800A7DCC 3000AAAF */   sw        $t2, 0x30($sp)
  .L800A7DD0:
    /* 97DD0 800A7DD0 FCFFC28F */  lw         $v0, -0x4($fp)
    /* 97DD4 800A7DD4 00000000 */  nop
    /* 97DD8 800A7DD8 26014010 */  beqz       $v0, .L800A8274
    /* 97DDC 800A7DDC 00000000 */   nop
    /* 97DE0 800A7DE0 801F8293 */  lbu        $v0, %gp_rel(D_8011C700)($gp)
    /* 97DE4 800A7DE4 00000000 */  nop
    /* 97DE8 800A7DE8 0E004010 */  beqz       $v0, .L800A7E24
    /* 97DEC 800A7DEC 03000A24 */   addiu     $t2, $zero, 0x3
    /* 97DF0 800A7DF0 A800AB8F */  lw         $t3, 0xA8($sp)
    /* 97DF4 800A7DF4 00000000 */  nop
    /* 97DF8 800A7DF8 0A006A15 */  bne        $t3, $t2, .L800A7E24
    /* 97DFC 800A7DFC 00000000 */   nop
    /* 97E00 800A7E00 12800B3C */  lui        $t3, %hi(REDR)
    /* 97E04 800A7E04 D7AB6B91 */  lbu        $t3, %lo(REDR)($t3)
    /* 97E08 800A7E08 12800A3C */  lui        $t2, %hi(REDG)
    /* 97E0C 800A7E0C D8AB4A91 */  lbu        $t2, %lo(REDG)($t2)
    /* 97E10 800A7E10 7800ABA3 */  sb         $t3, 0x78($sp)
    /* 97E14 800A7E14 12800B3C */  lui        $t3, %hi(REDB)
    /* 97E18 800A7E18 D9AB6B91 */  lbu        $t3, %lo(REDB)($t3)
    /* 97E1C 800A7E1C 8000AAA3 */  sb         $t2, 0x80($sp)
    /* 97E20 800A7E20 8800ABA3 */  sb         $t3, 0x88($sp)
  .L800A7E24:
    /* 97E24 800A7E24 4000AA8F */  lw         $t2, 0x40($sp)
    /* 97E28 800A7E28 04000224 */  addiu      $v0, $zero, 0x4
    /* 97E2C 800A7E2C 01004325 */  addiu      $v1, $t2, 0x1
    /* 97E30 800A7E30 12006214 */  bne        $v1, $v0, .L800A7E7C
    /* 97E34 800A7E34 00000000 */   nop
    /* 97E38 800A7E38 0400C28F */  lw         $v0, 0x4($fp)
    /* 97E3C 800A7E3C 00000000 */  nop
    /* 97E40 800A7E40 0E004010 */  beqz       $v0, .L800A7E7C
    /* 97E44 800A7E44 01000B24 */   addiu     $t3, $zero, 0x1
    /* 97E48 800A7E48 0C00C28F */  lw         $v0, 0xC($fp)
    /* 97E4C 800A7E4C 00000000 */  nop
    /* 97E50 800A7E50 0A004B10 */  beq        $v0, $t3, .L800A7E7C
    /* 97E54 800A7E54 00000000 */   nop
    /* 97E58 800A7E58 12800A3C */  lui        $t2, %hi(REDR)
    /* 97E5C 800A7E5C D7AB4A91 */  lbu        $t2, %lo(REDR)($t2)
    /* 97E60 800A7E60 12800B3C */  lui        $t3, %hi(REDG)
    /* 97E64 800A7E64 D8AB6B91 */  lbu        $t3, %lo(REDG)($t3)
    /* 97E68 800A7E68 7800AAA3 */  sb         $t2, 0x78($sp)
    /* 97E6C 800A7E6C 12800A3C */  lui        $t2, %hi(REDB)
    /* 97E70 800A7E70 D9AB4A91 */  lbu        $t2, %lo(REDB)($t2)
    /* 97E74 800A7E74 8000ABA3 */  sb         $t3, 0x80($sp)
    /* 97E78 800A7E78 8800AAA3 */  sb         $t2, 0x88($sp)
  .L800A7E7C:
    /* 97E7C 800A7E7C 4000AB8F */  lw         $t3, 0x40($sp)
    /* 97E80 800A7E80 0B000224 */  addiu      $v0, $zero, 0xB
    /* 97E84 800A7E84 01006325 */  addiu      $v1, $t3, 0x1
    /* 97E88 800A7E88 12006214 */  bne        $v1, $v0, .L800A7ED4
    /* 97E8C 800A7E8C 00000000 */   nop
    /* 97E90 800A7E90 0400C28F */  lw         $v0, 0x4($fp)
    /* 97E94 800A7E94 00000000 */  nop
    /* 97E98 800A7E98 0E004010 */  beqz       $v0, .L800A7ED4
    /* 97E9C 800A7E9C FEFF0224 */   addiu     $v0, $zero, -0x2
    /* 97EA0 800A7EA0 0C00C38F */  lw         $v1, 0xC($fp)
    /* 97EA4 800A7EA4 00000000 */  nop
    /* 97EA8 800A7EA8 0A006214 */  bne        $v1, $v0, .L800A7ED4
    /* 97EAC 800A7EAC 00000000 */   nop
    /* 97EB0 800A7EB0 12800A3C */  lui        $t2, %hi(REDR)
    /* 97EB4 800A7EB4 D7AB4A91 */  lbu        $t2, %lo(REDR)($t2)
    /* 97EB8 800A7EB8 12800B3C */  lui        $t3, %hi(REDG)
    /* 97EBC 800A7EBC D8AB6B91 */  lbu        $t3, %lo(REDG)($t3)
    /* 97EC0 800A7EC0 7800AAA3 */  sb         $t2, 0x78($sp)
    /* 97EC4 800A7EC4 12800A3C */  lui        $t2, %hi(REDB)
    /* 97EC8 800A7EC8 D9AB4A91 */  lbu        $t2, %lo(REDB)($t2)
    /* 97ECC 800A7ECC 8000ABA3 */  sb         $t3, 0x80($sp)
    /* 97ED0 800A7ED0 8800AAA3 */  sb         $t2, 0x88($sp)
  .L800A7ED4:
    /* 97ED4 800A7ED4 DC0A828F */  lw         $v0, %gp_rel(DiabloDieFlag)($gp)
    /* 97ED8 800A7ED8 00000000 */  nop
    /* 97EDC 800A7EDC 1F004010 */  beqz       $v0, .L800A7F5C
    /* 97EE0 800A7EE0 00000000 */   nop
    /* 97EE4 800A7EE4 4000AB8F */  lw         $t3, 0x40($sp)
    /* 97EE8 800A7EE8 00000000 */  nop
    /* 97EEC 800A7EEC 01006225 */  addiu      $v0, $t3, 0x1
    /* 97EF0 800A7EF0 08000A24 */  addiu      $t2, $zero, 0x8
    /* 97EF4 800A7EF4 09004A14 */  bne        $v0, $t2, .L800A7F1C
    /* 97EF8 800A7EF8 0D000224 */   addiu     $v0, $zero, 0xD
    /* 97EFC 800A7EFC 0C00C38F */  lw         $v1, 0xC($fp)
    /* 97F00 800A7F00 00000000 */  nop
    /* 97F04 800A7F04 05006214 */  bne        $v1, $v0, .L800A7F1C
    /* 97F08 800A7F08 28000A24 */   addiu     $t2, $zero, 0x28
    /* 97F0C 800A7F0C 28000B24 */  addiu      $t3, $zero, 0x28
    /* 97F10 800A7F10 8800ABA3 */  sb         $t3, 0x88($sp)
    /* 97F14 800A7F14 8000AAA3 */  sb         $t2, 0x80($sp)
    /* 97F18 800A7F18 7800ABA3 */  sb         $t3, 0x78($sp)
  .L800A7F1C:
    /* 97F1C 800A7F1C 4000AA8F */  lw         $t2, 0x40($sp)
    /* 97F20 800A7F20 02000224 */  addiu      $v0, $zero, 0x2
    /* 97F24 800A7F24 01004325 */  addiu      $v1, $t2, 0x1
    /* 97F28 800A7F28 0C006214 */  bne        $v1, $v0, .L800A7F5C
    /* 97F2C 800A7F2C 00000000 */   nop
    /* 97F30 800A7F30 A800AB8F */  lw         $t3, 0xA8($sp)
    /* 97F34 800A7F34 00000000 */  nop
    /* 97F38 800A7F38 08006011 */  beqz       $t3, .L800A7F5C
    /* 97F3C 800A7F3C 05006229 */   slti      $v0, $t3, 0x5
    /* 97F40 800A7F40 06004010 */  beqz       $v0, .L800A7F5C
    /* 97F44 800A7F44 00000000 */   nop
    /* 97F48 800A7F48 28000A24 */  addiu      $t2, $zero, 0x28
    /* 97F4C 800A7F4C 28000B24 */  addiu      $t3, $zero, 0x28
    /* 97F50 800A7F50 8800AAA3 */  sb         $t2, 0x88($sp)
    /* 97F54 800A7F54 8000ABA3 */  sb         $t3, 0x80($sp)
    /* 97F58 800A7F58 7800AAA3 */  sb         $t2, 0x78($sp)
  .L800A7F5C:
    /* 97F5C 800A7F5C 1280023C */  lui        $v0, %hi(FeFlag)
    /* 97F60 800A7F60 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 97F64 800A7F64 00000000 */  nop
    /* 97F68 800A7F68 76004010 */  beqz       $v0, .L800A8144
    /* 97F6C 800A7F6C 00000000 */   nop
    /* 97F70 800A7F70 A800AB8F */  lw         $t3, 0xA8($sp)
    /* 97F74 800A7F74 00000000 */  nop
    /* 97F78 800A7F78 3D006015 */  bnez       $t3, .L800A8070
    /* 97F7C 800A7F7C B6031024 */   addiu     $s0, $zero, 0x3B6
    /* 97F80 800A7F80 921F8297 */  lhu        $v0, %gp_rel(D_8011C712)($gp)
    /* 97F84 800A7F84 1280113C */  lui        $s1, %hi(D_8011C712)
    /* 97F88 800A7F88 12C73126 */  addiu      $s1, $s1, %lo(D_8011C712)
    /* 97F8C 800A7F8C E0FF4224 */  addiu      $v0, $v0, -0x20
    /* 97F90 800A7F90 921F82A7 */  sh         $v0, %gp_rel(D_8011C712)($gp)
    /* 97F94 800A7F94 FCFFC28F */  lw         $v0, -0x4($fp)
    /* 97F98 800A7F98 00000000 */  nop
    /* 97F9C 800A7F9C 07005014 */  bne        $v0, $s0, .L800A7FBC
    /* 97FA0 800A7FA0 00000000 */   nop
    /* 97FA4 800A7FA4 901F8297 */  lhu        $v0, %gp_rel(D_8011C710)($gp)
    /* 97FA8 800A7FA8 941F8397 */  lhu        $v1, %gp_rel(D_8011C714)($gp)
    /* 97FAC 800A7FAC C0FF4224 */  addiu      $v0, $v0, -0x40
    /* 97FB0 800A7FB0 80006324 */  addiu      $v1, $v1, 0x80
    /* 97FB4 800A7FB4 901F82A7 */  sh         $v0, %gp_rel(D_8011C710)($gp)
    /* 97FB8 800A7FB8 941F83A7 */  sh         $v1, %gp_rel(D_8011C714)($gp)
  .L800A7FBC:
    /* 97FBC 800A7FBC FCFFC48F */  lw         $a0, -0x4($fp)
    /* 97FC0 800A7FC0 4AED010C */  jal        GetStr__Fi
    /* 97FC4 800A7FC4 00000000 */   nop
    /* 97FC8 800A7FC8 0C80043C */  lui        $a0, %hi(LargeFont)
    /* 97FCC 800A7FCC F4848424 */  addiu      $a0, $a0, %lo(LargeFont)
    /* 97FD0 800A7FD0 21280000 */  addu       $a1, $zero, $zero
    /* 97FD4 800A7FD4 5800AA8F */  lw         $t2, 0x58($sp)
    /* 97FD8 800A7FD8 AC0A838F */  lw         $v1, %gp_rel(D_8011B22C)($gp)
    /* 97FDC 800A7FDC 00004691 */  lbu        $a2, 0x0($t2)
    /* 97FE0 800A7FE0 21384000 */  addu       $a3, $v0, $zero
    /* 97FE4 800A7FE4 1800C300 */  mult       $a2, $v1
    /* 97FE8 800A7FE8 1280083C */  lui        $t0, %hi(BLUEG)
    /* 97FEC 800A7FEC D5AB0891 */  lbu        $t0, %lo(BLUEG)($t0)
    /* 97FF0 800A7FF0 1280093C */  lui        $t1, %hi(BLUEB)
    /* 97FF4 800A7FF4 D6AB2991 */  lbu        $t1, %lo(BLUEB)($t1)
    /* 97FF8 800A7FF8 6800AA8F */  lw         $t2, 0x68($sp)
    /* 97FFC 800A7FFC 0000C38F */  lw         $v1, 0x0($fp)
    /* 98000 800A8000 1280063C */  lui        $a2, %hi(BLUER)
    /* 98004 800A8004 D4ABC690 */  lbu        $a2, %lo(BLUER)($a2)
    /* 98008 800A8008 FEFF2226 */  addiu      $v0, $s1, -0x2
    /* 9800C 800A800C 1400A2AF */  sw         $v0, 0x14($sp)
    /* 98010 800A8010 1C00A8AF */  sw         $t0, 0x1C($sp)
    /* 98014 800A8014 2000A9AF */  sw         $t1, 0x20($sp)
    /* 98018 800A8018 1000A3AF */  sw         $v1, 0x10($sp)
    /* 9801C 800A801C 1800A6AF */  sw         $a2, 0x18($sp)
    /* 98020 800A8020 12580000 */  mflo       $t3
    /* 98024 800A8024 21306A01 */  addu       $a2, $t3, $t2
    /* 98028 800A8028 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 9802C 800A802C 2200C624 */   addiu     $a2, $a2, 0x22
    /* 98030 800A8030 FCFFC28F */  lw         $v0, -0x4($fp)
    /* 98034 800A8034 00000000 */  nop
    /* 98038 800A8038 07005014 */  bne        $v0, $s0, .L800A8058
    /* 9803C 800A803C 00000000 */   nop
    /* 98040 800A8040 901F8297 */  lhu        $v0, %gp_rel(D_8011C710)($gp)
    /* 98044 800A8044 941F8397 */  lhu        $v1, %gp_rel(D_8011C714)($gp)
    /* 98048 800A8048 40004224 */  addiu      $v0, $v0, 0x40
    /* 9804C 800A804C 80FF6324 */  addiu      $v1, $v1, -0x80
    /* 98050 800A8050 901F82A7 */  sh         $v0, %gp_rel(D_8011C710)($gp)
    /* 98054 800A8054 941F83A7 */  sh         $v1, %gp_rel(D_8011C714)($gp)
  .L800A8058:
    /* 98058 800A8058 921F8297 */  lhu        $v0, %gp_rel(D_8011C712)($gp)
    /* 9805C 800A805C 00000000 */  nop
    /* 98060 800A8060 20004224 */  addiu      $v0, $v0, 0x20
    /* 98064 800A8064 921F82A7 */  sh         $v0, %gp_rel(D_8011C712)($gp)
    /* 98068 800A8068 9EA00208 */  j          .L800A8278
    /* 9806C 800A806C 1800DE27 */   addiu     $fp, $fp, 0x18
  .L800A8070:
    /* 98070 800A8070 BC0A828F */  lw         $v0, %gp_rel(cmenu)($gp)
    /* 98074 800A8074 03000B24 */  addiu      $t3, $zero, 0x3
    /* 98078 800A8078 01004224 */  addiu      $v0, $v0, 0x1
    /* 9807C 800A807C 2C004B14 */  bne        $v0, $t3, .L800A8130
    /* 98080 800A8080 00000000 */   nop
    /* 98084 800A8084 FCFFC48F */  lw         $a0, -0x4($fp)
    /* 98088 800A8088 4AED010C */  jal        GetStr__Fi
    /* 9808C 800A808C 00000000 */   nop
    /* 98090 800A8090 21280000 */  addu       $a1, $zero, $zero
    /* 98094 800A8094 5800AA8F */  lw         $t2, 0x58($sp)
    /* 98098 800A8098 AC0A838F */  lw         $v1, %gp_rel(D_8011B22C)($gp)
    /* 9809C 800A809C 7800AB93 */  lbu        $t3, 0x78($sp)
    /* 980A0 800A80A0 00004491 */  lbu        $a0, 0x0($t2)
    /* 980A4 800A80A4 8000AA93 */  lbu        $t2, 0x80($sp)
    /* 980A8 800A80A8 18008300 */  mult       $a0, $v1
    /* 980AC 800A80AC 0000C38F */  lw         $v1, 0x0($fp)
    /* 980B0 800A80B0 21384000 */  addu       $a3, $v0, $zero
    /* 980B4 800A80B4 1800ABAF */  sw         $t3, 0x18($sp)
    /* 980B8 800A80B8 8800AB93 */  lbu        $t3, 0x88($sp)
    /* 980BC 800A80BC 1280023C */  lui        $v0, %hi(D_8011C710)
    /* 980C0 800A80C0 10C74224 */  addiu      $v0, $v0, %lo(D_8011C710)
    /* 980C4 800A80C4 2000ABAF */  sw         $t3, 0x20($sp)
    /* 980C8 800A80C8 6800AB8F */  lw         $t3, 0x68($sp)
    /* 980CC 800A80CC 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 980D0 800A80D0 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 980D4 800A80D4 1400A2AF */  sw         $v0, 0x14($sp)
    /* 980D8 800A80D8 1C00AAAF */  sw         $t2, 0x1C($sp)
    /* 980DC 800A80DC 1000A3AF */  sw         $v1, 0x10($sp)
    /* 980E0 800A80E0 12500000 */  mflo       $t2
    /* 980E4 800A80E4 21304B01 */  addu       $a2, $t2, $t3
    /* 980E8 800A80E8 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 980EC 800A80EC 2000C624 */   addiu     $a2, $a2, 0x20
    /* 980F0 800A80F0 A800AA8F */  lw         $t2, 0xA8($sp)
    /* 980F4 800A80F4 05000224 */  addiu      $v0, $zero, 0x5
    /* 980F8 800A80F8 5E004215 */  bne        $t2, $v0, .L800A8274
    /* 980FC 800A80FC 00000000 */   nop
    /* 98100 800A8100 5800AB8F */  lw         $t3, 0x58($sp)
    /* 98104 800A8104 AC0A828F */  lw         $v0, %gp_rel(D_8011B22C)($gp)
    /* 98108 800A8108 00006391 */  lbu        $v1, 0x0($t3)
    /* 9810C 800A810C 00000000 */  nop
    /* 98110 800A8110 18006200 */  mult       $v1, $v0
    /* 98114 800A8114 6800AB8F */  lw         $t3, 0x68($sp)
    /* 98118 800A8118 12500000 */  mflo       $t2
    /* 9811C 800A811C 21204B01 */  addu       $a0, $t2, $t3
    /* 98120 800A8120 8F9C020C */  jal        PrintMono__Fi
    /* 98124 800A8124 20008424 */   addiu     $a0, $a0, 0x20
    /* 98128 800A8128 9EA00208 */  j          .L800A8278
    /* 9812C 800A812C 1800DE27 */   addiu     $fp, $fp, 0x18
  .L800A8130:
    /* 98130 800A8130 FCFFC48F */  lw         $a0, -0x4($fp)
    /* 98134 800A8134 4AED010C */  jal        GetStr__Fi
    /* 98138 800A8138 00000000 */   nop
    /* 9813C 800A813C 87A00208 */  j          .L800A821C
    /* 98140 800A8140 08000524 */   addiu     $a1, $zero, 0x8
  .L800A8144:
    /* 98144 800A8144 A800AA8F */  lw         $t2, 0xA8($sp)
    /* 98148 800A8148 00000000 */  nop
    /* 9814C 800A814C 2F004011 */  beqz       $t2, .L800A820C
    /* 98150 800A8150 03000B24 */   addiu     $t3, $zero, 0x3
    /* 98154 800A8154 BC0A828F */  lw         $v0, %gp_rel(cmenu)($gp)
    /* 98158 800A8158 00000000 */  nop
    /* 9815C 800A815C 01004224 */  addiu      $v0, $v0, 0x1
    /* 98160 800A8160 2A004B14 */  bne        $v0, $t3, .L800A820C
    /* 98164 800A8164 00000000 */   nop
    /* 98168 800A8168 FCFFC48F */  lw         $a0, -0x4($fp)
    /* 9816C 800A816C 4AED010C */  jal        GetStr__Fi
    /* 98170 800A8170 00000000 */   nop
    /* 98174 800A8174 08000524 */  addiu      $a1, $zero, 0x8
    /* 98178 800A8178 5800AA8F */  lw         $t2, 0x58($sp)
    /* 9817C 800A817C AC0A838F */  lw         $v1, %gp_rel(D_8011B22C)($gp)
    /* 98180 800A8180 7800AB93 */  lbu        $t3, 0x78($sp)
    /* 98184 800A8184 00004491 */  lbu        $a0, 0x0($t2)
    /* 98188 800A8188 8000AA93 */  lbu        $t2, 0x80($sp)
    /* 9818C 800A818C 18008300 */  mult       $a0, $v1
    /* 98190 800A8190 0000C38F */  lw         $v1, 0x0($fp)
    /* 98194 800A8194 21384000 */  addu       $a3, $v0, $zero
    /* 98198 800A8198 1800ABAF */  sw         $t3, 0x18($sp)
    /* 9819C 800A819C 8800AB93 */  lbu        $t3, 0x88($sp)
    /* 981A0 800A81A0 1280023C */  lui        $v0, %hi(D_8011C710)
    /* 981A4 800A81A4 10C74224 */  addiu      $v0, $v0, %lo(D_8011C710)
    /* 981A8 800A81A8 2000ABAF */  sw         $t3, 0x20($sp)
    /* 981AC 800A81AC 6800AB8F */  lw         $t3, 0x68($sp)
    /* 981B0 800A81B0 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 981B4 800A81B4 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 981B8 800A81B8 1400A2AF */  sw         $v0, 0x14($sp)
    /* 981BC 800A81BC 1C00AAAF */  sw         $t2, 0x1C($sp)
    /* 981C0 800A81C0 1000A3AF */  sw         $v1, 0x10($sp)
    /* 981C4 800A81C4 12500000 */  mflo       $t2
    /* 981C8 800A81C8 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 981CC 800A81CC 21304B01 */   addu      $a2, $t2, $t3
    /* 981D0 800A81D0 A800AA8F */  lw         $t2, 0xA8($sp)
    /* 981D4 800A81D4 05000224 */  addiu      $v0, $zero, 0x5
    /* 981D8 800A81D8 26004215 */  bne        $t2, $v0, .L800A8274
    /* 981DC 800A81DC 00000000 */   nop
    /* 981E0 800A81E0 5800AB8F */  lw         $t3, 0x58($sp)
    /* 981E4 800A81E4 AC0A828F */  lw         $v0, %gp_rel(D_8011B22C)($gp)
    /* 981E8 800A81E8 00006391 */  lbu        $v1, 0x0($t3)
    /* 981EC 800A81EC 00000000 */  nop
    /* 981F0 800A81F0 18006200 */  mult       $v1, $v0
    /* 981F4 800A81F4 6800AB8F */  lw         $t3, 0x68($sp)
    /* 981F8 800A81F8 12500000 */  mflo       $t2
    /* 981FC 800A81FC 8F9C020C */  jal        PrintMono__Fi
    /* 98200 800A8200 21204B01 */   addu      $a0, $t2, $t3
    /* 98204 800A8204 9EA00208 */  j          .L800A8278
    /* 98208 800A8208 1800DE27 */   addiu     $fp, $fp, 0x18
  .L800A820C:
    /* 9820C 800A820C FCFFC48F */  lw         $a0, -0x4($fp)
    /* 98210 800A8210 4AED010C */  jal        GetStr__Fi
    /* 98214 800A8214 00000000 */   nop
    /* 98218 800A8218 21280000 */  addu       $a1, $zero, $zero
  .L800A821C:
    /* 9821C 800A821C 5800AA8F */  lw         $t2, 0x58($sp)
    /* 98220 800A8220 AC0A838F */  lw         $v1, %gp_rel(D_8011B22C)($gp)
    /* 98224 800A8224 7800AB93 */  lbu        $t3, 0x78($sp)
    /* 98228 800A8228 00004491 */  lbu        $a0, 0x0($t2)
    /* 9822C 800A822C 8000AA93 */  lbu        $t2, 0x80($sp)
    /* 98230 800A8230 18008300 */  mult       $a0, $v1
    /* 98234 800A8234 0000C38F */  lw         $v1, 0x0($fp)
    /* 98238 800A8238 21384000 */  addu       $a3, $v0, $zero
    /* 9823C 800A823C 1800ABAF */  sw         $t3, 0x18($sp)
    /* 98240 800A8240 8800AB93 */  lbu        $t3, 0x88($sp)
    /* 98244 800A8244 1280023C */  lui        $v0, %hi(D_8011C710)
    /* 98248 800A8248 10C74224 */  addiu      $v0, $v0, %lo(D_8011C710)
    /* 9824C 800A824C 2000ABAF */  sw         $t3, 0x20($sp)
    /* 98250 800A8250 6800AB8F */  lw         $t3, 0x68($sp)
    /* 98254 800A8254 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 98258 800A8258 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 9825C 800A825C 1400A2AF */  sw         $v0, 0x14($sp)
    /* 98260 800A8260 1C00AAAF */  sw         $t2, 0x1C($sp)
    /* 98264 800A8264 1000A3AF */  sw         $v1, 0x10($sp)
    /* 98268 800A8268 12500000 */  mflo       $t2
    /* 9826C 800A826C 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 98270 800A8270 21304B01 */   addu      $a2, $t2, $t3
  .L800A8274:
    /* 98274 800A8274 1800DE27 */  addiu      $fp, $fp, 0x18
  .L800A8278:
    /* 98278 800A8278 5800AA8F */  lw         $t2, 0x58($sp)
    /* 9827C 800A827C A800AB8F */  lw         $t3, 0xA8($sp)
    /* 98280 800A8280 18004A25 */  addiu      $t2, $t2, 0x18
    /* 98284 800A8284 01006B25 */  addiu      $t3, $t3, 0x1
    /* 98288 800A8288 5800AAAF */  sw         $t2, 0x58($sp)
    /* 9828C 800A828C 8F9D0208 */  j          .L800A763C
    /* 98290 800A8290 A800ABAF */   sw        $t3, 0xA8($sp)
  .L800A8294:
    /* 98294 800A8294 4000AA8F */  lw         $t2, 0x40($sp)
    /* 98298 800A8298 02000224 */  addiu      $v0, $zero, 0x2
    /* 9829C 800A829C 03004215 */  bne        $t2, $v0, .L800A82AC
    /* 982A0 800A82A0 04000224 */   addiu     $v0, $zero, 0x4
    /* 982A4 800A82A4 B6A00208 */  j          .L800A82D8
    /* 982A8 800A82A8 31030424 */   addiu     $a0, $zero, 0x331
  .L800A82AC:
    /* 982AC 800A82AC 4000AB8F */  lw         $t3, 0x40($sp)
    /* 982B0 800A82B0 00000000 */  nop
    /* 982B4 800A82B4 03006215 */  bne        $t3, $v0, .L800A82C4
    /* 982B8 800A82B8 08000224 */   addiu     $v0, $zero, 0x8
    /* 982BC 800A82BC B6A00208 */  j          .L800A82D8
    /* 982C0 800A82C0 9E040424 */   addiu     $a0, $zero, 0x49E
  .L800A82C4:
    /* 982C4 800A82C4 4000AA8F */  lw         $t2, 0x40($sp)
    /* 982C8 800A82C8 00000000 */  nop
    /* 982CC 800A82CC 02004215 */  bne        $t2, $v0, .L800A82D8
    /* 982D0 800A82D0 E6040424 */   addiu     $a0, $zero, 0x4E6
    /* 982D4 800A82D4 E5040424 */  addiu      $a0, $zero, 0x4E5
  .L800A82D8:
    /* 982D8 800A82D8 349A020C */  jal        PrintSelectBack__FUs
    /* 982DC 800A82DC 00000000 */   nop
    /* 982E0 800A82E0 E400BF8F */  lw         $ra, 0xE4($sp)
    /* 982E4 800A82E4 E000BE8F */  lw         $fp, 0xE0($sp)
    /* 982E8 800A82E8 DC00B78F */  lw         $s7, 0xDC($sp)
    /* 982EC 800A82EC D800B68F */  lw         $s6, 0xD8($sp)
    /* 982F0 800A82F0 D400B58F */  lw         $s5, 0xD4($sp)
    /* 982F4 800A82F4 D000B48F */  lw         $s4, 0xD0($sp)
    /* 982F8 800A82F8 CC00B38F */  lw         $s3, 0xCC($sp)
    /* 982FC 800A82FC C800B28F */  lw         $s2, 0xC8($sp)
    /* 98300 800A8300 C400B18F */  lw         $s1, 0xC4($sp)
    /* 98304 800A8304 C000B08F */  lw         $s0, 0xC0($sp)
    /* 98308 800A8308 E800BD27 */  addiu      $sp, $sp, 0xE8
    /* 9830C 800A830C 0800E003 */  jr         $ra
    /* 98310 800A8310 00000000 */   nop
endlabel DrawMenu__Fi
