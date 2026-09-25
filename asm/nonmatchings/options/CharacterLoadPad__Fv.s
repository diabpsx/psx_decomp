.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CharacterLoadPad__Fv, 0x554

glabel CharacterLoadPad__Fv
    /* 9839C 800A839C BC0A828F */  lw         $v0, %gp_rel(cmenu)($gp)
    /* 983A0 800A83A0 1280043C */  lui        $a0, %hi(cardondelay)
    /* 983A4 800A83A4 FCB1848C */  lw         $a0, %lo(cardondelay)($a0)
    /* 983A8 800A83A8 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 983AC 800A83AC 3800BFAF */  sw         $ra, 0x38($sp)
    /* 983B0 800A83B0 3400B3AF */  sw         $s3, 0x34($sp)
    /* 983B4 800A83B4 3000B2AF */  sw         $s2, 0x30($sp)
    /* 983B8 800A83B8 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 983BC 800A83BC 2800B0AF */  sw         $s0, 0x28($sp)
    /* 983C0 800A83C0 C0100200 */  sll        $v0, $v0, 3
    /* 983C4 800A83C4 0D80013C */  lui        $at, %hi(MenuList + 0x4)
    /* 983C8 800A83C8 21082200 */  addu       $at, $at, $v0
    /* 983CC 800A83CC 44D2338C */  lw         $s3, %lo(MenuList + 0x4)($at)
    /* 983D0 800A83D0 16008018 */  blez       $a0, .L800A842C
    /* 983D4 800A83D4 FFFF8224 */   addiu     $v0, $a0, -0x1
    /* 983D8 800A83D8 1280033C */  lui        $v1, %hi(countdownloadcharblock)
    /* 983DC 800A83DC 6CB1638C */  lw         $v1, %lo(countdownloadcharblock)($v1)
    /* 983E0 800A83E0 1280013C */  lui        $at, %hi(cardondelay)
    /* 983E4 800A83E4 FCB122AC */  sw         $v0, %lo(cardondelay)($at)
    /* 983E8 800A83E8 0C006010 */  beqz       $v1, .L800A841C
    /* 983EC 800A83EC 00000000 */   nop
    /* 983F0 800A83F0 1280023C */  lui        $v0, %hi(current_card)
    /* 983F4 800A83F4 60B4428C */  lw         $v0, %lo(current_card)($v0)
    /* 983F8 800A83F8 00000000 */  nop
    /* 983FC 800A83FC 80100200 */  sll        $v0, $v0, 2
    /* 98400 800A8400 1280013C */  lui        $at, %hi(card_side_read)
    /* 98404 800A8404 21082200 */  addu       $at, $at, $v0
    /* 98408 800A8408 90B1248C */  lw         $a0, %lo(card_side_read)($at)
    /* 9840C 800A840C 9797020C */  jal        ShowLoadingBox__Fi
    /* 98410 800A8410 00000000 */   nop
    /* 98414 800A8414 34A20208 */  j          .L800A88D0
    /* 98418 800A8418 00000000 */   nop
  .L800A841C:
    /* 9841C 800A841C 9797020C */  jal        ShowLoadingBox__Fi
    /* 98420 800A8420 48030424 */   addiu     $a0, $zero, 0x348
    /* 98424 800A8424 34A20208 */  j          .L800A88D0
    /* 98428 800A8428 00000000 */   nop
  .L800A842C:
    /* 9842C 800A842C 1280023C */  lui        $v0, %hi(countdownloadcharblock)
    /* 98430 800A8430 6CB1428C */  lw         $v0, %lo(countdownloadcharblock)($v0)
    /* 98434 800A8434 00000000 */  nop
    /* 98438 800A8438 08004010 */  beqz       $v0, .L800A845C
    /* 9843C 800A843C 00000000 */   nop
    /* 98440 800A8440 1280053C */  lui        $a1, %hi(current_card)
    /* 98444 800A8444 60B4A58C */  lw         $a1, %lo(current_card)($a1)
    /* 98448 800A8448 00000000 */  nop
    /* 9844C 800A844C 0100A42C */  sltiu      $a0, $a1, 0x1
    /* 98450 800A8450 0100A538 */  xori       $a1, $a1, 0x1
    /* 98454 800A8454 F395020C */  jal        ActivateCharacterMemcard__Fii
    /* 98458 800A8458 0100A52C */   sltiu     $a1, $a1, 0x1
  .L800A845C:
    /* 9845C 800A845C C00A828F */  lw         $v0, %gp_rel(CharacterBlockLoaded)($gp)
    /* 98460 800A8460 00000000 */  nop
    /* 98464 800A8464 08004014 */  bnez       $v0, .L800A8488
    /* 98468 800A8468 00000000 */   nop
    /* 9846C 800A846C 1280053C */  lui        $a1, %hi(current_card)
    /* 98470 800A8470 60B4A58C */  lw         $a1, %lo(current_card)($a1)
    /* 98474 800A8474 00000000 */  nop
    /* 98478 800A8478 0100A42C */  sltiu      $a0, $a1, 0x1
    /* 9847C 800A847C 0100A538 */  xori       $a1, $a1, 0x1
    /* 98480 800A8480 F395020C */  jal        ActivateCharacterMemcard__Fii
    /* 98484 800A8484 0100A52C */   sltiu     $a1, $a1, 0x1
  .L800A8488:
    /* 98488 800A8488 D00A848F */  lw         $a0, %gp_rel(options_pad)($gp)
    /* 9848C 800A848C FD25020C */  jal        PAD_GetPad__FiUc
    /* 98490 800A8490 21280000 */   addu      $a1, $zero, $zero
    /* 98494 800A8494 1280033C */  lui        $v1, %hi(AlertTxt)
    /* 98498 800A8498 58B4638C */  lw         $v1, %lo(AlertTxt)($v1)
    /* 9849C 800A849C 00000000 */  nop
    /* 984A0 800A84A0 31006010 */  beqz       $v1, .L800A8568
    /* 984A4 800A84A4 21884000 */   addu      $s1, $v0, $zero
    /* 984A8 800A84A8 EF68050C */  jal        func_8015A3BC
    /* 984AC 800A84AC 21800000 */   addu      $s0, $zero, $zero
    /* 984B0 800A84B0 55AD020C */  jal        GetDown__C4CPad_800ab554
    /* 984B4 800A84B4 21202002 */   addu      $a0, $s1, $zero
    /* 984B8 800A84B8 40004230 */  andi       $v0, $v0, 0x40
    /* 984BC 800A84BC 06004014 */  bnez       $v0, .L800A84D8
    /* 984C0 800A84C0 00000000 */   nop
    /* 984C4 800A84C4 55AD020C */  jal        GetDown__C4CPad_800ab554
    /* 984C8 800A84C8 21202002 */   addu      $a0, $s1, $zero
    /* 984CC 800A84CC 10004230 */  andi       $v0, $v0, 0x10
    /* 984D0 800A84D0 02004010 */  beqz       $v0, .L800A84DC
    /* 984D4 800A84D4 00000000 */   nop
  .L800A84D8:
    /* 984D8 800A84D8 01001024 */  addiu      $s0, $zero, 0x1
  .L800A84DC:
    /* 984DC 800A84DC FC000012 */  beqz       $s0, .L800A88D0
    /* 984E0 800A84E0 00000000 */   nop
    /* 984E4 800A84E4 BC0A828F */  lw         $v0, %gp_rel(cmenu)($gp)
    /* 984E8 800A84E8 00000000 */  nop
    /* 984EC 800A84EC C0100200 */  sll        $v0, $v0, 3
    /* 984F0 800A84F0 0D80013C */  lui        $at, %hi(MenuList + 0x3)
    /* 984F4 800A84F4 21082200 */  addu       $at, $at, $v0
    /* 984F8 800A84F8 43D22390 */  lbu        $v1, %lo(MenuList + 0x3)($at)
    /* 984FC 800A84FC 00000000 */  nop
    /* 98500 800A8500 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 98504 800A8504 40100300 */  sll        $v0, $v1, 1
    /* 98508 800A8508 21104300 */  addu       $v0, $v0, $v1
    /* 9850C 800A850C C0100200 */  sll        $v0, $v0, 3
    /* 98510 800A8510 21105300 */  addu       $v0, $v0, $s3
    /* 98514 800A8514 B00A83AF */  sw         $v1, %gp_rel(D_8011B230)($gp)
    /* 98518 800A8518 1400438C */  lw         $v1, 0x14($v0)
    /* 9851C 800A851C FEFF0224 */  addiu      $v0, $zero, -0x2
    /* 98520 800A8520 05006210 */  beq        $v1, $v0, .L800A8538
    /* 98524 800A8524 FFFF6224 */   addiu     $v0, $v1, -0x1
    /* 98528 800A8528 BC0A82AF */  sw         $v0, %gp_rel(cmenu)($gp)
    /* 9852C 800A852C 03000224 */  addiu      $v0, $zero, 0x3
    /* 98530 800A8530 B00A82AF */  sw         $v0, %gp_rel(D_8011B230)($gp)
    /* 98534 800A8534 C00A80AF */  sw         $zero, %gp_rel(CharacterBlockLoaded)($gp)
  .L800A8538:
    /* 98538 800A8538 C6F5000C */  jal        PlaySFX__Fi
    /* 9853C 800A853C 33000424 */   addiu     $a0, $zero, 0x33
    /* 98540 800A8540 1280013C */  lui        $at, %hi(AlertTxt)
    /* 98544 800A8544 58B420AC */  sw         $zero, %lo(AlertTxt)($at)
    /* 98548 800A8548 1280013C */  lui        $at, %hi(StatusTxt)
    /* 9854C 800A854C 5CB420AC */  sw         $zero, %lo(StatusTxt)($at)
    /* 98550 800A8550 1280013C */  lui        $at, %hi(loadflag)
    /* 98554 800A8554 7CB120AC */  sw         $zero, %lo(loadflag)($at)
    /* 98558 800A8558 1280013C */  lui        $at, %hi(saveflag)
    /* 9855C 800A855C 78B120AC */  sw         $zero, %lo(saveflag)($at)
    /* 98560 800A8560 34A20208 */  j          .L800A88D0
    /* 98564 800A8564 00000000 */   nop
  .L800A8568:
    /* 98568 800A8568 1280023C */  lui        $v0, %hi(current_card)
    /* 9856C 800A856C 60B4428C */  lw         $v0, %lo(current_card)($v0)
    /* 98570 800A8570 1280103C */  lui        $s0, %hi(card_status)
    /* 98574 800A8574 DCB31026 */  addiu      $s0, $s0, %lo(card_status)
    /* 98578 800A8578 80200200 */  sll        $a0, $v0, 2
    /* 9857C 800A857C 1280013C */  lui        $at, %hi(card_status)
    /* 98580 800A8580 21082400 */  addu       $at, $at, $a0
    /* 98584 800A8584 DCB3238C */  lw         $v1, %lo(card_status)($at)
    /* 98588 800A8588 02000224 */  addiu      $v0, $zero, 0x2
    /* 9858C 800A858C 08006214 */  bne        $v1, $v0, .L800A85B0
    /* 98590 800A8590 00000000 */   nop
    /* 98594 800A8594 1280013C */  lui        $at, %hi(card_side_empty)
    /* 98598 800A8598 21082400 */  addu       $at, $at, $a0
    /* 9859C 800A859C 88B1228C */  lw         $v0, %lo(card_side_empty)($at)
    /* 985A0 800A85A0 1280013C */  lui        $at, %hi(AlertTxt)
    /* 985A4 800A85A4 58B422AC */  sw         $v0, %lo(AlertTxt)($at)
    /* 985A8 800A85A8 34A20208 */  j          .L800A88D0
    /* 985AC 800A85AC 00000000 */   nop
  .L800A85B0:
    /* 985B0 800A85B0 2296020C */  jal        ShowCardActionText__Fv
    /* 985B4 800A85B4 00000000 */   nop
    /* 985B8 800A85B8 1280023C */  lui        $v0, %hi(current_card)
    /* 985BC 800A85BC 60B4428C */  lw         $v0, %lo(current_card)($v0)
    /* 985C0 800A85C0 00000000 */  nop
    /* 985C4 800A85C4 80100200 */  sll        $v0, $v0, 2
    /* 985C8 800A85C8 21105000 */  addu       $v0, $v0, $s0
    /* 985CC 800A85CC 0000428C */  lw         $v0, 0x0($v0)
    /* 985D0 800A85D0 00000000 */  nop
    /* 985D4 800A85D4 10004014 */  bnez       $v0, .L800A8618
    /* 985D8 800A85D8 21800000 */   addu      $s0, $zero, $zero
    /* 985DC 800A85DC 901F8397 */  lhu        $v1, %gp_rel(D_8011C710)($gp)
    /* 985E0 800A85E0 941F8897 */  lhu        $t0, %gp_rel(D_8011C714)($gp)
    /* 985E4 800A85E4 B00A848F */  lw         $a0, %gp_rel(D_8011B230)($gp)
    /* 985E8 800A85E8 AC0A858F */  lw         $a1, %gp_rel(D_8011B22C)($gp)
    /* 985EC 800A85EC 921F8697 */  lhu        $a2, %gp_rel(D_8011C712)($gp)
    /* 985F0 800A85F0 961F8797 */  lhu        $a3, %gp_rel(D_8011C716)($gp)
    /* 985F4 800A85F4 58000224 */  addiu      $v0, $zero, 0x58
    /* 985F8 800A85F8 1000A2AF */  sw         $v0, 0x10($sp)
    /* 985FC 800A85FC FFFF8424 */  addiu      $a0, $a0, -0x1
    /* 98600 800A8600 00340600 */  sll        $a2, $a2, 16
    /* 98604 800A8604 003C0700 */  sll        $a3, $a3, 16
    /* 98608 800A8608 25306600 */  or         $a2, $v1, $a2
    /* 9860C 800A860C 436A050C */  jal        func_8015A90C
    /* 98610 800A8610 25380701 */   or        $a3, $t0, $a3
    /* 98614 800A8614 21800000 */  addu       $s0, $zero, $zero
  .L800A8618:
    /* 98618 800A8618 55AD020C */  jal        GetDown__C4CPad_800ab554
    /* 9861C 800A861C 21202002 */   addu      $a0, $s1, $zero
    /* 98620 800A8620 40004230 */  andi       $v0, $v0, 0x40
    /* 98624 800A8624 06004014 */  bnez       $v0, .L800A8640
    /* 98628 800A8628 00000000 */   nop
    /* 9862C 800A862C 55AD020C */  jal        GetDown__C4CPad_800ab554
    /* 98630 800A8630 21202002 */   addu      $a0, $s1, $zero
    /* 98634 800A8634 10004230 */  andi       $v0, $v0, 0x10
    /* 98638 800A8638 02004010 */  beqz       $v0, .L800A8644
    /* 9863C 800A863C 00000000 */   nop
  .L800A8640:
    /* 98640 800A8640 01001024 */  addiu      $s0, $zero, 0x1
  .L800A8644:
    /* 98644 800A8644 4C000012 */  beqz       $s0, .L800A8778
    /* 98648 800A8648 00000000 */   nop
    /* 9864C 800A864C 1280023C */  lui        $v0, %hi(saveflag)
    /* 98650 800A8650 78B1428C */  lw         $v0, %lo(saveflag)($v0)
    /* 98654 800A8654 00000000 */  nop
    /* 98658 800A8658 4B004014 */  bnez       $v0, .L800A8788
    /* 9865C 800A865C 03004228 */   slti      $v0, $v0, 0x3
    /* 98660 800A8660 1280023C */  lui        $v0, %hi(current_card)
    /* 98664 800A8664 60B4428C */  lw         $v0, %lo(current_card)($v0)
    /* 98668 800A8668 00000000 */  nop
    /* 9866C 800A866C 80100200 */  sll        $v0, $v0, 2
    /* 98670 800A8670 1280013C */  lui        $at, %hi(card_status)
    /* 98674 800A8674 21082200 */  addu       $at, $at, $v0
    /* 98678 800A8678 DCB3228C */  lw         $v0, %lo(card_status)($at)
    /* 9867C 800A867C 02001024 */  addiu      $s0, $zero, 0x2
    /* 98680 800A8680 09005010 */  beq        $v0, $s0, .L800A86A8
    /* 98684 800A8684 00000000 */   nop
    /* 98688 800A8688 C6F5000C */  jal        PlaySFX__Fi
    /* 9868C 800A868C 33000424 */   addiu     $a0, $zero, 0x33
    /* 98690 800A8690 1280053C */  lui        $a1, %hi(DiabloCharacterFile)
    /* 98694 800A8694 18B4A58C */  lw         $a1, %lo(DiabloCharacterFile)($a1)
    /* 98698 800A8698 9F69050C */  jal        func_8015A67C
    /* 9869C 800A869C 01000424 */   addiu     $a0, $zero, 0x1
    /* 986A0 800A86A0 05004014 */  bnez       $v0, .L800A86B8
    /* 986A4 800A86A4 01001224 */   addiu     $s2, $zero, 0x1
  .L800A86A8:
    /* 986A8 800A86A8 C6F5000C */  jal        PlaySFX__Fi
    /* 986AC 800A86AC D3030424 */   addiu     $a0, $zero, 0x3D3
    /* 986B0 800A86B0 34A20208 */  j          .L800A88D0
    /* 986B4 800A86B4 00000000 */   nop
  .L800A86B8:
    /* 986B8 800A86B8 1280053C */  lui        $a1, %hi(current_card)
    /* 986BC 800A86BC 60B4A58C */  lw         $a1, %lo(current_card)($a1)
    /* 986C0 800A86C0 00000000 */  nop
    /* 986C4 800A86C4 80100500 */  sll        $v0, $a1, 2
    /* 986C8 800A86C8 1280013C */  lui        $at, %hi(card_usable)
    /* 986CC 800A86CC 21082200 */  addu       $at, $at, $v0
    /* 986D0 800A86D0 E4B3228C */  lw         $v0, %lo(card_usable)($at)
    /* 986D4 800A86D4 1280013C */  lui        $at, %hi(saveflag)
    /* 986D8 800A86D8 78B132AC */  sw         $s2, %lo(saveflag)($at)
    /* 986DC 800A86DC 0B004014 */  bnez       $v0, .L800A870C
    /* 986E0 800A86E0 10000324 */   addiu     $v1, $zero, 0x10
    /* 986E4 800A86E4 BC0A828F */  lw         $v0, %gp_rel(cmenu)($gp)
    /* 986E8 800A86E8 B00A848F */  lw         $a0, %gp_rel(D_8011B230)($gp)
    /* 986EC 800A86EC BC0A83AF */  sw         $v1, %gp_rel(cmenu)($gp)
    /* 986F0 800A86F0 1280013C */  lui        $at, %hi(formatflag)
    /* 986F4 800A86F4 80B120AC */  sw         $zero, %lo(formatflag)($at)
    /* 986F8 800A86F8 B00A90AF */  sw         $s0, %gp_rel(D_8011B230)($gp)
    /* 986FC 800A86FC 0C0B82AF */  sw         $v0, %gp_rel(ReturnMenu)($gp)
    /* 98700 800A8700 B40A84AF */  sw         $a0, %gp_rel(D_8011B234)($gp)
    /* 98704 800A8704 34A20208 */  j          .L800A88D0
    /* 98708 800A8708 00000000 */   nop
  .L800A870C:
    /* 9870C 800A870C B00A828F */  lw         $v0, %gp_rel(D_8011B230)($gp)
    /* 98710 800A8710 00000000 */  nop
    /* 98714 800A8714 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 98718 800A8718 80180200 */  sll        $v1, $v0, 2
    /* 9871C 800A871C 21186200 */  addu       $v1, $v1, $v0
    /* 98720 800A8720 40190300 */  sll        $v1, $v1, 5
    /* 98724 800A8724 23186200 */  subu       $v1, $v1, $v0
    /* 98728 800A8728 C0180300 */  sll        $v1, $v1, 3
    /* 9872C 800A872C 1580013C */  lui        $at, %hi(D_80157B68)
    /* 98730 800A8730 21082300 */  addu       $at, $at, $v1
    /* 98734 800A8734 687B2280 */  lb         $v0, %lo(D_80157B68)($at)
    /* 98738 800A8738 00000000 */  nop
    /* 9873C 800A873C 0E004010 */  beqz       $v0, .L800A8778
    /* 98740 800A8740 0100A42C */   sltiu     $a0, $a1, 0x1
    /* 98744 800A8744 0100A538 */  xori       $a1, $a1, 0x1
    /* 98748 800A8748 E495020C */  jal        ActivateMemcard__Fii
    /* 9874C 800A874C 0100A52C */   sltiu     $a1, $a1, 0x1
    /* 98750 800A8750 BC0A838F */  lw         $v1, %gp_rel(cmenu)($gp)
    /* 98754 800A8754 B00A848F */  lw         $a0, %gp_rel(D_8011B230)($gp)
    /* 98758 800A8758 13000224 */  addiu      $v0, $zero, 0x13
    /* 9875C 800A875C CC0A92AF */  sw         $s2, %gp_rel(ReturnCards)($gp)
    /* 98760 800A8760 BC0A82AF */  sw         $v0, %gp_rel(cmenu)($gp)
    /* 98764 800A8764 B00A90AF */  sw         $s0, %gp_rel(D_8011B230)($gp)
    /* 98768 800A8768 0C0B83AF */  sw         $v1, %gp_rel(ReturnMenu)($gp)
    /* 9876C 800A876C B80A84AF */  sw         $a0, %gp_rel(D_8011B238)($gp)
    /* 98770 800A8770 34A20208 */  j          .L800A88D0
    /* 98774 800A8774 00000000 */   nop
  .L800A8778:
    /* 98778 800A8778 1280023C */  lui        $v0, %hi(saveflag)
    /* 9877C 800A877C 78B1428C */  lw         $v0, %lo(saveflag)($v0)
    /* 98780 800A8780 00000000 */  nop
    /* 98784 800A8784 03004228 */  slti       $v0, $v0, 0x3
  .L800A8788:
    /* 98788 800A8788 0A004014 */  bnez       $v0, .L800A87B4
    /* 9878C 800A878C 00000000 */   nop
    /* 98790 800A8790 1280023C */  lui        $v0, %hi(current_card)
    /* 98794 800A8794 60B4428C */  lw         $v0, %lo(current_card)($v0)
    /* 98798 800A8798 00000000 */  nop
    /* 9879C 800A879C 80100200 */  sll        $v0, $v0, 2
    /* 987A0 800A87A0 1280013C */  lui        $at, %hi(card_side_save)
    /* 987A4 800A87A4 21082200 */  addu       $at, $at, $v0
    /* 987A8 800A87A8 B0B1248C */  lw         $a0, %lo(card_side_save)($at)
    /* 987AC 800A87AC 9797020C */  jal        ShowLoadingBox__Fi
    /* 987B0 800A87B0 00000000 */   nop
  .L800A87B4:
    /* 987B4 800A87B4 1280033C */  lui        $v1, %hi(saveflag)
    /* 987B8 800A87B8 78B1638C */  lw         $v1, %lo(saveflag)($v1)
    /* 987BC 800A87BC 00000000 */  nop
    /* 987C0 800A87C0 24006010 */  beqz       $v1, .L800A8854
    /* 987C4 800A87C4 01006324 */   addiu     $v1, $v1, 0x1
    /* 987C8 800A87C8 1280013C */  lui        $at, %hi(saveflag)
    /* 987CC 800A87CC 78B123AC */  sw         $v1, %lo(saveflag)($at)
    /* 987D0 800A87D0 0A000224 */  addiu      $v0, $zero, 0xA
    /* 987D4 800A87D4 3E006214 */  bne        $v1, $v0, .L800A88D0
    /* 987D8 800A87D8 00000000 */   nop
    /* 987DC 800A87DC 1280053C */  lui        $a1, %hi(DiabloCharacterFile)
    /* 987E0 800A87E0 18B4A58C */  lw         $a1, %lo(DiabloCharacterFile)($a1)
    /* 987E4 800A87E4 1280013C */  lui        $at, %hi(saveflag)
    /* 987E8 800A87E8 78B120AC */  sw         $zero, %lo(saveflag)($at)
    /* 987EC 800A87EC 9F69050C */  jal        func_8015A67C
    /* 987F0 800A87F0 01000424 */   addiu     $a0, $zero, 0x1
    /* 987F4 800A87F4 36004010 */  beqz       $v0, .L800A88D0
    /* 987F8 800A87F8 00000000 */   nop
    /* 987FC 800A87FC B00A858F */  lw         $a1, %gp_rel(D_8011B230)($gp)
    /* 98800 800A8800 1280043C */  lui        $a0, %hi(current_card)
    /* 98804 800A8804 60B4848C */  lw         $a0, %lo(current_card)($a0)
    /* 98808 800A8808 EC70050C */  jal        func_8015C3B0
    /* 9880C 800A880C FFFFA524 */   addiu     $a1, $a1, -0x1
    /* 98810 800A8810 08004010 */  beqz       $v0, .L800A8834
    /* 98814 800A8814 0F050224 */   addiu     $v0, $zero, 0x50F
    /* 98818 800A8818 1280013C */  lui        $at, %hi(AlertTxt)
    /* 9881C 800A881C 58B422AC */  sw         $v0, %lo(AlertTxt)($at)
    /* 98820 800A8820 21200000 */  addu       $a0, $zero, $zero
    /* 98824 800A8824 E495020C */  jal        ActivateMemcard__Fii
    /* 98828 800A8828 21280000 */   addu      $a1, $zero, $zero
    /* 9882C 800A882C 11A20208 */  j          .L800A8844
    /* 98830 800A8830 21200000 */   addu      $a0, $zero, $zero
  .L800A8834:
    /* 98834 800A8834 06050224 */  addiu      $v0, $zero, 0x506
    /* 98838 800A8838 1280013C */  lui        $at, %hi(AlertTxt)
    /* 9883C 800A883C 58B422AC */  sw         $v0, %lo(AlertTxt)($at)
    /* 98840 800A8840 21200000 */  addu       $a0, $zero, $zero
  .L800A8844:
    /* 98844 800A8844 E495020C */  jal        ActivateMemcard__Fii
    /* 98848 800A8848 21280000 */   addu      $a1, $zero, $zero
    /* 9884C 800A884C 34A20208 */  j          .L800A88D0
    /* 98850 800A8850 00000000 */   nop
  .L800A8854:
    /* 98854 800A8854 C0AC020C */  jal        LAMBO_MovePad__FP4CPad
    /* 98858 800A8858 21202002 */   addu      $a0, $s1, $zero
    /* 9885C 800A885C 55AD020C */  jal        GetDown__C4CPad_800ab554
    /* 98860 800A8860 21202002 */   addu      $a0, $s1, $zero
    /* 98864 800A8864 00014230 */  andi       $v0, $v0, 0x100
    /* 98868 800A8868 19004010 */  beqz       $v0, .L800A88D0
    /* 9886C 800A886C 00000000 */   nop
    /* 98870 800A8870 C6F5000C */  jal        PlaySFX__Fi
    /* 98874 800A8874 33000424 */   addiu     $a0, $zero, 0x33
    /* 98878 800A8878 BC0A828F */  lw         $v0, %gp_rel(cmenu)($gp)
    /* 9887C 800A887C 00000000 */  nop
    /* 98880 800A8880 C0100200 */  sll        $v0, $v0, 3
    /* 98884 800A8884 0D80013C */  lui        $at, %hi(MenuList + 0x3)
    /* 98888 800A8888 21082200 */  addu       $at, $at, $v0
    /* 9888C 800A888C 43D22390 */  lbu        $v1, %lo(MenuList + 0x3)($at)
    /* 98890 800A8890 C00A80AF */  sw         $zero, %gp_rel(CharacterBlockLoaded)($gp)
    /* 98894 800A8894 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 98898 800A8898 40100300 */  sll        $v0, $v1, 1
    /* 9889C 800A889C 21104300 */  addu       $v0, $v0, $v1
    /* 988A0 800A88A0 C0100200 */  sll        $v0, $v0, 3
    /* 988A4 800A88A4 21105300 */  addu       $v0, $v0, $s3
    /* 988A8 800A88A8 B00A83AF */  sw         $v1, %gp_rel(D_8011B230)($gp)
    /* 988AC 800A88AC 1400438C */  lw         $v1, 0x14($v0)
    /* 988B0 800A88B0 FEFF0224 */  addiu      $v0, $zero, -0x2
    /* 988B4 800A88B4 06006210 */  beq        $v1, $v0, .L800A88D0
    /* 988B8 800A88B8 FFFF6324 */   addiu     $v1, $v1, -0x1
    /* 988BC 800A88BC 1280023C */  lui        $v0, %hi(current_card)
    /* 988C0 800A88C0 60B4428C */  lw         $v0, %lo(current_card)($v0)
    /* 988C4 800A88C4 BC0A83AF */  sw         $v1, %gp_rel(cmenu)($gp)
    /* 988C8 800A88C8 01004224 */  addiu      $v0, $v0, 0x1
    /* 988CC 800A88CC B00A82AF */  sw         $v0, %gp_rel(D_8011B230)($gp)
  .L800A88D0:
    /* 988D0 800A88D0 3800BF8F */  lw         $ra, 0x38($sp)
    /* 988D4 800A88D4 3400B38F */  lw         $s3, 0x34($sp)
    /* 988D8 800A88D8 3000B28F */  lw         $s2, 0x30($sp)
    /* 988DC 800A88DC 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 988E0 800A88E0 2800B08F */  lw         $s0, 0x28($sp)
    /* 988E4 800A88E4 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 988E8 800A88E8 0800E003 */  jr         $ra
    /* 988EC 800A88EC 00000000 */   nop
endlabel CharacterLoadPad__Fv
