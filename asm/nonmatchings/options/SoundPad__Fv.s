.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SoundPad__Fv, 0xA08

glabel SoundPad__Fv
    /* 99260 800A9260 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 99264 800A9264 1800B0AF */  sw         $s0, 0x18($sp)
    /* 99268 800A9268 21800000 */  addu       $s0, $zero, $zero
    /* 9926C 800A926C D00A848F */  lw         $a0, %gp_rel(options_pad)($gp)
    /* 99270 800A9270 21280000 */  addu       $a1, $zero, $zero
    /* 99274 800A9274 2400BFAF */  sw         $ra, 0x24($sp)
    /* 99278 800A9278 2000B2AF */  sw         $s2, 0x20($sp)
    /* 9927C 800A927C FD25020C */  jal        PAD_GetPad__FiUc
    /* 99280 800A9280 1C00B1AF */   sw        $s1, 0x1C($sp)
    /* 99284 800A9284 1280033C */  lui        $v1, %hi(MemCardActive)
    /* 99288 800A9288 60B1638C */  lw         $v1, %lo(MemCardActive)($v1)
    /* 9928C 800A928C 00000000 */  nop
    /* 99290 800A9290 0A006010 */  beqz       $v1, .L800A92BC
    /* 99294 800A9294 21884000 */   addu      $s1, $v0, $zero
    /* 99298 800A9298 5695020C */  jal        MemcardOFF__Fv
    /* 9929C 800A929C 00000000 */   nop
    /* 992A0 800A92A0 05000224 */  addiu      $v0, $zero, 0x5
    /* 992A4 800A92A4 1280013C */  lui        $at, %hi(cardondelay)
    /* 992A8 800A92A8 FCB122AC */  sw         $v0, %lo(cardondelay)($at)
    /* 992AC 800A92AC 1280013C */  lui        $at, %hi(card_active + 0x4)
    /* 992B0 800A92B0 04B220AC */  sw         $zero, %lo(card_active + 0x4)($at)
    /* 992B4 800A92B4 1280013C */  lui        $at, %hi(card_active)
    /* 992B8 800A92B8 00B220AC */  sw         $zero, %lo(card_active)($at)
  .L800A92BC:
    /* 992BC 800A92BC 1280023C */  lui        $v0, %hi(CDWAIT)
    /* 992C0 800A92C0 ECAD428C */  lw         $v0, %lo(CDWAIT)($v0)
    /* 992C4 800A92C4 00000000 */  nop
    /* 992C8 800A92C8 60024014 */  bnez       $v0, .L800A9C4C
    /* 992CC 800A92CC 00000000 */   nop
    /* 992D0 800A92D0 55AD020C */  jal        GetDown__C4CPad_800ab554
    /* 992D4 800A92D4 21202002 */   addu      $a0, $s1, $zero
    /* 992D8 800A92D8 F00A8493 */  lbu        $a0, %gp_rel(D_8011B270)($gp)
    /* 992DC 800A92DC 00000000 */  nop
    /* 992E0 800A92E0 40180400 */  sll        $v1, $a0, 1
    /* 992E4 800A92E4 0D80013C */  lui        $at, %hi(D_800CD360)
    /* 992E8 800A92E8 21082300 */  addu       $at, $at, $v1
    /* 992EC 800A92EC 60D32394 */  lhu        $v1, %lo(D_800CD360)($at)
    /* 992F0 800A92F0 0D80053C */  lui        $a1, %hi(D_800CD360)
    /* 992F4 800A92F4 60D3A524 */  addiu      $a1, $a1, %lo(D_800CD360)
    /* 992F8 800A92F8 24186200 */  and        $v1, $v1, $v0
    /* 992FC 800A92FC 0C006010 */  beqz       $v1, .L800A9330
    /* 99300 800A9300 01008224 */   addiu     $v0, $a0, 0x1
    /* 99304 800A9304 FF004330 */  andi       $v1, $v0, 0xFF
    /* 99308 800A9308 40180300 */  sll        $v1, $v1, 1
    /* 9930C 800A930C 21186500 */  addu       $v1, $v1, $a1
    /* 99310 800A9310 00006394 */  lhu        $v1, 0x0($v1)
    /* 99314 800A9314 F00A82A3 */  sb         $v0, %gp_rel(D_8011B270)($gp)
    /* 99318 800A9318 0B006014 */  bnez       $v1, .L800A9348
    /* 9931C 800A931C 00000000 */   nop
    /* 99320 800A9320 C6F5000C */  jal        PlaySFX__Fi
    /* 99324 800A9324 AF020424 */   addiu     $a0, $zero, 0x2AF
    /* 99328 800A9328 D2A40208 */  j          .L800A9348
    /* 9932C 800A932C 00000000 */   nop
  .L800A9330:
    /* 99330 800A9330 55AD020C */  jal        GetDown__C4CPad_800ab554
    /* 99334 800A9334 21202002 */   addu      $a0, $s1, $zero
    /* 99338 800A9338 FFFF4230 */  andi       $v0, $v0, 0xFFFF
    /* 9933C 800A933C 02004010 */  beqz       $v0, .L800A9348
    /* 99340 800A9340 00000000 */   nop
    /* 99344 800A9344 F00A80A3 */  sb         $zero, %gp_rel(D_8011B270)($gp)
  .L800A9348:
    /* 99348 800A9348 1280023C */  lui        $v0, %hi(FeFlag)
    /* 9934C 800A934C 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 99350 800A9350 00000000 */  nop
    /* 99354 800A9354 03004010 */  beqz       $v0, .L800A9364
    /* 99358 800A9358 21202002 */   addu      $a0, $s1, $zero
    /* 9935C 800A935C E2A40208 */  j          .L800A9388
    /* 99360 800A9360 0C000524 */   addiu     $a1, $zero, 0xC
  .L800A9364:
    /* 99364 800A9364 BC0A838F */  lw         $v1, %gp_rel(cmenu)($gp)
    /* 99368 800A9368 02000224 */  addiu      $v0, $zero, 0x2
    /* 9936C 800A936C 04006214 */  bne        $v1, $v0, .L800A9380
    /* 99370 800A9370 00000000 */   nop
    /* 99374 800A9374 21202002 */  addu       $a0, $s1, $zero
    /* 99378 800A9378 E2A40208 */  j          .L800A9388
    /* 9937C 800A937C 04000524 */   addiu     $a1, $zero, 0x4
  .L800A9380:
    /* 99380 800A9380 21202002 */  addu       $a0, $s1, $zero
    /* 99384 800A9384 08000524 */  addiu      $a1, $zero, 0x8
  .L800A9388:
    /* 99388 800A9388 6BAD020C */  jal        SetPadTick__4CPadUs_800ab5ac
    /* 9938C 800A938C 00000000 */   nop
    /* 99390 800A9390 21202002 */  addu       $a0, $s1, $zero
    /* 99394 800A9394 69AD020C */  jal        SetPadTickMask__4CPadUs_800ab5a4
    /* 99398 800A9398 0F000524 */   addiu     $a1, $zero, 0xF
    /* 9939C 800A939C 4BAD020C */  jal        GetTick__C4CPad_800ab52c
    /* 993A0 800A93A0 21202002 */   addu      $a0, $s1, $zero
    /* 993A4 800A93A4 01004230 */  andi       $v0, $v0, 0x1
    /* 993A8 800A93A8 02004010 */  beqz       $v0, .L800A93B4
    /* 993AC 800A93AC 00000000 */   nop
    /* 993B0 800A93B0 FFFF1024 */  addiu      $s0, $zero, -0x1
  .L800A93B4:
    /* 993B4 800A93B4 4BAD020C */  jal        GetTick__C4CPad_800ab52c
    /* 993B8 800A93B8 21202002 */   addu      $a0, $s1, $zero
    /* 993BC 800A93BC 02004230 */  andi       $v0, $v0, 0x2
    /* 993C0 800A93C0 02004010 */  beqz       $v0, .L800A93CC
    /* 993C4 800A93C4 00000000 */   nop
    /* 993C8 800A93C8 01001024 */  addiu      $s0, $zero, 0x1
  .L800A93CC:
    /* 993CC 800A93CC BC0A828F */  lw         $v0, %gp_rel(cmenu)($gp)
    /* 993D0 800A93D0 B00A858F */  lw         $a1, %gp_rel(D_8011B230)($gp)
    /* 993D4 800A93D4 C0200200 */  sll        $a0, $v0, 3
    /* 993D8 800A93D8 2118B000 */  addu       $v1, $a1, $s0
    /* 993DC 800A93DC 40100300 */  sll        $v0, $v1, 1
    /* 993E0 800A93E0 21104300 */  addu       $v0, $v0, $v1
    /* 993E4 800A93E4 0D80013C */  lui        $at, %hi(MenuList + 0x4)
    /* 993E8 800A93E8 21082400 */  addu       $at, $at, $a0
    /* 993EC 800A93EC 44D2328C */  lw         $s2, %lo(MenuList + 0x4)($at)
    /* 993F0 800A93F0 C0100200 */  sll        $v0, $v0, 3
    /* 993F4 800A93F4 21105200 */  addu       $v0, $v0, $s2
    /* 993F8 800A93F8 0400428C */  lw         $v0, 0x4($v0)
    /* 993FC 800A93FC B00A83AF */  sw         $v1, %gp_rel(D_8011B230)($gp)
    /* 99400 800A9400 1B004014 */  bnez       $v0, .L800A9470
    /* 99404 800A9404 00000000 */   nop
  .L800A9408:
    /* 99408 800A9408 02000016 */  bnez       $s0, .L800A9414
    /* 9940C 800A940C 00000000 */   nop
    /* 99410 800A9410 01001024 */  addiu      $s0, $zero, 0x1
  .L800A9414:
    /* 99414 800A9414 B00A838F */  lw         $v1, %gp_rel(D_8011B230)($gp)
    /* 99418 800A9418 00000000 */  nop
    /* 9941C 800A941C 02006104 */  bgez       $v1, .L800A9428
    /* 99420 800A9420 00000000 */   nop
    /* 99424 800A9424 01001024 */  addiu      $s0, $zero, 0x1
  .L800A9428:
    /* 99428 800A9428 0D80013C */  lui        $at, %hi(MenuList + 0x3)
    /* 9942C 800A942C 21082400 */  addu       $at, $at, $a0
    /* 99430 800A9430 43D22290 */  lbu        $v0, %lo(MenuList + 0x3)($at)
    /* 99434 800A9434 00000000 */  nop
    /* 99438 800A9438 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 9943C 800A943C 2A106200 */  slt        $v0, $v1, $v0
    /* 99440 800A9440 03004014 */  bnez       $v0, .L800A9450
    /* 99444 800A9444 21107000 */   addu      $v0, $v1, $s0
    /* 99448 800A9448 FFFF1024 */  addiu      $s0, $zero, -0x1
    /* 9944C 800A944C 21107000 */  addu       $v0, $v1, $s0
  .L800A9450:
    /* 99450 800A9450 40180200 */  sll        $v1, $v0, 1
    /* 99454 800A9454 21186200 */  addu       $v1, $v1, $v0
    /* 99458 800A9458 C0180300 */  sll        $v1, $v1, 3
    /* 9945C 800A945C 21187200 */  addu       $v1, $v1, $s2
    /* 99460 800A9460 0400638C */  lw         $v1, 0x4($v1)
    /* 99464 800A9464 B00A82AF */  sw         $v0, %gp_rel(D_8011B230)($gp)
    /* 99468 800A9468 E7FF6010 */  beqz       $v1, .L800A9408
    /* 9946C 800A946C 00000000 */   nop
  .L800A9470:
    /* 99470 800A9470 BC0A838F */  lw         $v1, %gp_rel(cmenu)($gp)
    /* 99474 800A9474 01000424 */  addiu      $a0, $zero, 0x1
    /* 99478 800A9478 19006410 */  beq        $v1, $a0, .L800A94E0
    /* 9947C 800A947C 08000224 */   addiu     $v0, $zero, 0x8
    /* 99480 800A9480 17006210 */  beq        $v1, $v0, .L800A94E0
    /* 99484 800A9484 00000000 */   nop
    /* 99488 800A9488 B00A828F */  lw         $v0, %gp_rel(D_8011B230)($gp)
    /* 9948C 800A948C 00000000 */  nop
    /* 99490 800A9490 0800401C */  bgtz       $v0, .L800A94B4
    /* 99494 800A9494 C0100300 */   sll       $v0, $v1, 3
    /* 99498 800A9498 0D80013C */  lui        $at, %hi(MenuList + 0x3)
    /* 9949C 800A949C 21082200 */  addu       $at, $at, $v0
    /* 994A0 800A94A0 43D22290 */  lbu        $v0, %lo(MenuList + 0x3)($at)
    /* 994A4 800A94A4 00000000 */  nop
    /* 994A8 800A94A8 FEFF4224 */  addiu      $v0, $v0, -0x2
    /* 994AC 800A94AC B00A82AF */  sw         $v0, %gp_rel(D_8011B230)($gp)
    /* 994B0 800A94B0 C0100300 */  sll        $v0, $v1, 3
  .L800A94B4:
    /* 994B4 800A94B4 0D80013C */  lui        $at, %hi(MenuList + 0x3)
    /* 994B8 800A94B8 21082200 */  addu       $at, $at, $v0
    /* 994BC 800A94BC 43D22290 */  lbu        $v0, %lo(MenuList + 0x3)($at)
    /* 994C0 800A94C0 B00A838F */  lw         $v1, %gp_rel(D_8011B230)($gp)
    /* 994C4 800A94C4 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 994C8 800A94C8 2A186200 */  slt        $v1, $v1, $v0
    /* 994CC 800A94CC 1D006014 */  bnez       $v1, .L800A9544
    /* 994D0 800A94D0 00000000 */   nop
    /* 994D4 800A94D4 B00A84AF */  sw         $a0, %gp_rel(D_8011B230)($gp)
    /* 994D8 800A94D8 51A50208 */  j          .L800A9544
    /* 994DC 800A94DC 00000000 */   nop
  .L800A94E0:
    /* 994E0 800A94E0 B00A828F */  lw         $v0, %gp_rel(D_8011B230)($gp)
    /* 994E4 800A94E4 00000000 */  nop
    /* 994E8 800A94E8 0A00401C */  bgtz       $v0, .L800A9514
    /* 994EC 800A94EC 00000000 */   nop
    /* 994F0 800A94F0 BC0A828F */  lw         $v0, %gp_rel(cmenu)($gp)
    /* 994F4 800A94F4 00000000 */  nop
    /* 994F8 800A94F8 C0100200 */  sll        $v0, $v0, 3
    /* 994FC 800A94FC 0D80013C */  lui        $at, %hi(MenuList + 0x3)
    /* 99500 800A9500 21082200 */  addu       $at, $at, $v0
    /* 99504 800A9504 43D22290 */  lbu        $v0, %lo(MenuList + 0x3)($at)
    /* 99508 800A9508 00000000 */  nop
    /* 9950C 800A950C FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 99510 800A9510 B00A82AF */  sw         $v0, %gp_rel(D_8011B230)($gp)
  .L800A9514:
    /* 99514 800A9514 BC0A828F */  lw         $v0, %gp_rel(cmenu)($gp)
    /* 99518 800A9518 00000000 */  nop
    /* 9951C 800A951C C0100200 */  sll        $v0, $v0, 3
    /* 99520 800A9520 0D80013C */  lui        $at, %hi(MenuList + 0x3)
    /* 99524 800A9524 21082200 */  addu       $at, $at, $v0
    /* 99528 800A9528 43D22390 */  lbu        $v1, %lo(MenuList + 0x3)($at)
    /* 9952C 800A952C B00A828F */  lw         $v0, %gp_rel(D_8011B230)($gp)
    /* 99530 800A9530 00000000 */  nop
    /* 99534 800A9534 2A104300 */  slt        $v0, $v0, $v1
    /* 99538 800A9538 02004014 */  bnez       $v0, .L800A9544
    /* 9953C 800A953C 01000224 */   addiu     $v0, $zero, 0x1
    /* 99540 800A9540 B00A82AF */  sw         $v0, %gp_rel(D_8011B230)($gp)
  .L800A9544:
    /* 99544 800A9544 B00A828F */  lw         $v0, %gp_rel(D_8011B230)($gp)
    /* 99548 800A9548 00000000 */  nop
    /* 9954C 800A954C 03004510 */  beq        $v0, $a1, .L800A955C
    /* 99550 800A9550 00000000 */   nop
    /* 99554 800A9554 C6F5000C */  jal        PlaySFX__Fi
    /* 99558 800A9558 32000424 */   addiu     $a0, $zero, 0x32
  .L800A955C:
    /* 9955C 800A955C BC0A828F */  lw         $v0, %gp_rel(cmenu)($gp)
    /* 99560 800A9560 04000324 */  addiu      $v1, $zero, 0x4
    /* 99564 800A9564 01004224 */  addiu      $v0, $v0, 0x1
    /* 99568 800A9568 15004314 */  bne        $v0, $v1, .L800A95C0
    /* 9956C 800A956C 60004226 */   addiu     $v0, $s2, 0x60
  .L800A9570:
    /* 99570 800A9570 240040AC */  sw         $zero, 0x24($v0)
    /* 99574 800A9574 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 99578 800A9578 FDFF6104 */  bgez       $v1, .L800A9570
    /* 9957C 800A957C E8FF4224 */   addiu     $v0, $v0, -0x18
    /* 99580 800A9580 01000324 */  addiu      $v1, $zero, 0x1
    /* 99584 800A9584 8C1F848F */  lw         $a0, %gp_rel(D_8011C70C)($gp)
    /* 99588 800A9588 881F858F */  lw         $a1, %gp_rel(D_8011C708)($gp)
    /* 9958C 800A958C 40100400 */  sll        $v0, $a0, 1
    /* 99590 800A9590 21104400 */  addu       $v0, $v0, $a0
    /* 99594 800A9594 C0100200 */  sll        $v0, $v0, 3
    /* 99598 800A9598 21105200 */  addu       $v0, $v0, $s2
    /* 9959C 800A959C 08008510 */  beq        $a0, $a1, .L800A95C0
    /* 995A0 800A95A0 240043AC */   sw        $v1, 0x24($v0)
    /* 995A4 800A95A4 C6F5000C */  jal        PlaySFX__Fi
    /* 995A8 800A95A8 33000424 */   addiu     $a0, $zero, 0x33
    /* 995AC 800A95AC 5C9C020C */  jal        ChangeLang__Fv
    /* 995B0 800A95B0 00000000 */   nop
    /* 995B4 800A95B4 8C1F828F */  lw         $v0, %gp_rel(D_8011C70C)($gp)
    /* 995B8 800A95B8 00000000 */  nop
    /* 995BC 800A95BC 881F82AF */  sw         $v0, %gp_rel(D_8011C708)($gp)
  .L800A95C0:
    /* 995C0 800A95C0 BC0A838F */  lw         $v1, %gp_rel(cmenu)($gp)
    /* 995C4 800A95C4 06000224 */  addiu      $v0, $zero, 0x6
    /* 995C8 800A95C8 1D006214 */  bne        $v1, $v0, .L800A9640
    /* 995CC 800A95CC 21800000 */   addu      $s0, $zero, $zero
    /* 995D0 800A95D0 55AD020C */  jal        GetDown__C4CPad_800ab554
    /* 995D4 800A95D4 21202002 */   addu      $a0, $s1, $zero
    /* 995D8 800A95D8 40004230 */  andi       $v0, $v0, 0x40
    /* 995DC 800A95DC 06004014 */  bnez       $v0, .L800A95F8
    /* 995E0 800A95E0 00000000 */   nop
    /* 995E4 800A95E4 55AD020C */  jal        GetDown__C4CPad_800ab554
    /* 995E8 800A95E8 21202002 */   addu      $a0, $s1, $zero
    /* 995EC 800A95EC 10004230 */  andi       $v0, $v0, 0x10
    /* 995F0 800A95F0 02004010 */  beqz       $v0, .L800A95FC
    /* 995F4 800A95F4 00000000 */   nop
  .L800A95F8:
    /* 995F8 800A95F8 01001024 */  addiu      $s0, $zero, 0x1
  .L800A95FC:
    /* 995FC 800A95FC 58000012 */  beqz       $s0, .L800A9760
    /* 99600 800A9600 01000224 */   addiu     $v0, $zero, 0x1
    /* 99604 800A9604 B00A838F */  lw         $v1, %gp_rel(D_8011B230)($gp)
    /* 99608 800A9608 00000000 */  nop
    /* 9960C 800A960C 55006214 */  bne        $v1, $v0, .L800A9764
    /* 99610 800A9610 21800000 */   addu      $s0, $zero, $zero
    /* 99614 800A9614 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 99618 800A9618 C80A80AF */  sw         $zero, %gp_rel(optionsflag)($gp)
    /* 9961C 800A961C D00A82AF */  sw         $v0, %gp_rel(options_pad)($gp)
    /* 99620 800A9620 C6F5000C */  jal        PlaySFX__Fi
    /* 99624 800A9624 33000424 */   addiu     $a0, $zero, 0x33
    /* 99628 800A9628 EE80000C */  jal        TSK_Sleep
    /* 9962C 800A962C 01000424 */   addiu     $a0, $zero, 0x1
    /* 99630 800A9630 8108020C */  jal        GO_DoGameOver__Fv
    /* 99634 800A9634 21800000 */   addu      $s0, $zero, $zero
    /* 99638 800A9638 D9A50208 */  j          .L800A9764
    /* 9963C 800A963C 00000000 */   nop
  .L800A9640:
    /* 99640 800A9640 B00A828F */  lw         $v0, %gp_rel(D_8011B230)($gp)
    /* 99644 800A9644 00000000 */  nop
    /* 99648 800A9648 40180200 */  sll        $v1, $v0, 1
    /* 9964C 800A964C 21186200 */  addu       $v1, $v1, $v0
    /* 99650 800A9650 C0180300 */  sll        $v1, $v1, 3
    /* 99654 800A9654 21187200 */  addu       $v1, $v1, $s2
    /* 99658 800A9658 1000628C */  lw         $v0, 0x10($v1)
    /* 9965C 800A965C 00000000 */  nop
    /* 99660 800A9660 40004010 */  beqz       $v0, .L800A9764
    /* 99664 800A9664 00000000 */   nop
    /* 99668 800A9668 0C00708C */  lw         $s0, 0xC($v1)
    /* 9966C 800A966C 4BAD020C */  jal        GetTick__C4CPad_800ab52c
    /* 99670 800A9670 21202002 */   addu      $a0, $s1, $zero
    /* 99674 800A9674 04004230 */  andi       $v0, $v0, 0x4
    /* 99678 800A9678 0D004010 */  beqz       $v0, .L800A96B0
    /* 9967C 800A967C 00000000 */   nop
    /* 99680 800A9680 B00A828F */  lw         $v0, %gp_rel(D_8011B230)($gp)
    /* 99684 800A9684 00000000 */  nop
    /* 99688 800A9688 40180200 */  sll        $v1, $v0, 1
    /* 9968C 800A968C 21186200 */  addu       $v1, $v1, $v0
    /* 99690 800A9690 C0180300 */  sll        $v1, $v1, 3
    /* 99694 800A9694 21187200 */  addu       $v1, $v1, $s2
    /* 99698 800A9698 0C00628C */  lw         $v0, 0xC($v1)
    /* 9969C 800A969C 00000000 */  nop
    /* 996A0 800A96A0 FEFF4224 */  addiu      $v0, $v0, -0x2
    /* 996A4 800A96A4 02004104 */  bgez       $v0, .L800A96B0
    /* 996A8 800A96A8 0C0062AC */   sw        $v0, 0xC($v1)
    /* 996AC 800A96AC 0C0060AC */  sw         $zero, 0xC($v1)
  .L800A96B0:
    /* 996B0 800A96B0 4BAD020C */  jal        GetTick__C4CPad_800ab52c
    /* 996B4 800A96B4 21202002 */   addu      $a0, $s1, $zero
    /* 996B8 800A96B8 08004230 */  andi       $v0, $v0, 0x8
    /* 996BC 800A96BC 0F004010 */  beqz       $v0, .L800A96FC
    /* 996C0 800A96C0 00000000 */   nop
    /* 996C4 800A96C4 B00A828F */  lw         $v0, %gp_rel(D_8011B230)($gp)
    /* 996C8 800A96C8 00000000 */  nop
    /* 996CC 800A96CC 40180200 */  sll        $v1, $v0, 1
    /* 996D0 800A96D0 21186200 */  addu       $v1, $v1, $v0
    /* 996D4 800A96D4 C0180300 */  sll        $v1, $v1, 3
    /* 996D8 800A96D8 21187200 */  addu       $v1, $v1, $s2
    /* 996DC 800A96DC 0C00628C */  lw         $v0, 0xC($v1)
    /* 996E0 800A96E0 741F848F */  lw         $a0, %gp_rel(D_8011C6F4)($gp)
    /* 996E4 800A96E4 02004224 */  addiu      $v0, $v0, 0x2
    /* 996E8 800A96E8 0C0062AC */  sw         $v0, 0xC($v1)
    /* 996EC 800A96EC 2A108200 */  slt        $v0, $a0, $v0
    /* 996F0 800A96F0 02004010 */  beqz       $v0, .L800A96FC
    /* 996F4 800A96F4 00000000 */   nop
    /* 996F8 800A96F8 0C0064AC */  sw         $a0, 0xC($v1)
  .L800A96FC:
    /* 996FC 800A96FC B00A838F */  lw         $v1, %gp_rel(D_8011B230)($gp)
    /* 99700 800A9700 00000000 */  nop
    /* 99704 800A9704 40100300 */  sll        $v0, $v1, 1
    /* 99708 800A9708 21104300 */  addu       $v0, $v0, $v1
    /* 9970C 800A970C C0100200 */  sll        $v0, $v0, 3
    /* 99710 800A9710 21105200 */  addu       $v0, $v0, $s2
    /* 99714 800A9714 0C00428C */  lw         $v0, 0xC($v0)
    /* 99718 800A9718 00000000 */  nop
    /* 9971C 800A971C 07000212 */  beq        $s0, $v0, .L800A973C
    /* 99720 800A9720 04000224 */   addiu     $v0, $zero, 0x4
    /* 99724 800A9724 02006214 */  bne        $v1, $v0, .L800A9730
    /* 99728 800A9728 32000424 */   addiu     $a0, $zero, 0x32
    /* 9972C 800A972C 79000424 */  addiu      $a0, $zero, 0x79
  .L800A9730:
    /* 99730 800A9730 C6F5000C */  jal        PlaySFX__Fi
    /* 99734 800A9734 00000000 */   nop
    /* 99738 800A9738 B00A838F */  lw         $v1, %gp_rel(D_8011B230)($gp)
  .L800A973C:
    /* 9973C 800A973C 00000000 */  nop
    /* 99740 800A9740 40100300 */  sll        $v0, $v1, 1
    /* 99744 800A9744 21104300 */  addu       $v0, $v0, $v1
    /* 99748 800A9748 C0100200 */  sll        $v0, $v0, 3
    /* 9974C 800A974C 21105200 */  addu       $v0, $v0, $s2
    /* 99750 800A9750 1000438C */  lw         $v1, 0x10($v0)
    /* 99754 800A9754 0C00428C */  lw         $v0, 0xC($v0)
    /* 99758 800A9758 00000000 */  nop
    /* 9975C 800A975C 000062AC */  sw         $v0, 0x0($v1)
  .L800A9760:
    /* 99760 800A9760 21800000 */  addu       $s0, $zero, $zero
  .L800A9764:
    /* 99764 800A9764 5FAD020C */  jal        GetUp__C4CPad_800ab57c
    /* 99768 800A9768 21202002 */   addu      $a0, $s1, $zero
    /* 9976C 800A976C 40004230 */  andi       $v0, $v0, 0x40
    /* 99770 800A9770 06004014 */  bnez       $v0, .L800A978C
    /* 99774 800A9774 00000000 */   nop
    /* 99778 800A9778 5FAD020C */  jal        GetUp__C4CPad_800ab57c
    /* 9977C 800A977C 21202002 */   addu      $a0, $s1, $zero
    /* 99780 800A9780 10004230 */  andi       $v0, $v0, 0x10
    /* 99784 800A9784 02004010 */  beqz       $v0, .L800A9790
    /* 99788 800A9788 00000000 */   nop
  .L800A978C:
    /* 9978C 800A978C 01001024 */  addiu      $s0, $zero, 0x1
  .L800A9790:
    /* 99790 800A9790 04000012 */  beqz       $s0, .L800A97A4
    /* 99794 800A9794 01000224 */   addiu     $v0, $zero, 0x1
    /* 99798 800A9798 1280013C */  lui        $at, %hi(ignore_buttons)
    /* 9979C 800A979C D0BB22AC */  sw         $v0, %lo(ignore_buttons)($at)
    /* 997A0 800A97A0 EC0A82AF */  sw         $v0, %gp_rel(D_8011B26C)($gp)
  .L800A97A4:
    /* 997A4 800A97A4 21800000 */  addu       $s0, $zero, $zero
    /* 997A8 800A97A8 55AD020C */  jal        GetDown__C4CPad_800ab554
    /* 997AC 800A97AC 21202002 */   addu      $a0, $s1, $zero
    /* 997B0 800A97B0 40004230 */  andi       $v0, $v0, 0x40
    /* 997B4 800A97B4 06004014 */  bnez       $v0, .L800A97D0
    /* 997B8 800A97B8 00000000 */   nop
    /* 997BC 800A97BC 55AD020C */  jal        GetDown__C4CPad_800ab554
    /* 997C0 800A97C0 21202002 */   addu      $a0, $s1, $zero
    /* 997C4 800A97C4 10004230 */  andi       $v0, $v0, 0x10
    /* 997C8 800A97C8 02004010 */  beqz       $v0, .L800A97D4
    /* 997CC 800A97CC 00000000 */   nop
  .L800A97D0:
    /* 997D0 800A97D0 01001024 */  addiu      $s0, $zero, 0x1
  .L800A97D4:
    /* 997D4 800A97D4 8D000012 */  beqz       $s0, .L800A9A0C
    /* 997D8 800A97D8 00000000 */   nop
    /* 997DC 800A97DC EC0A828F */  lw         $v0, %gp_rel(D_8011B26C)($gp)
    /* 997E0 800A97E0 00000000 */  nop
    /* 997E4 800A97E4 89004010 */  beqz       $v0, .L800A9A0C
    /* 997E8 800A97E8 00000000 */   nop
    /* 997EC 800A97EC C5A0020C */  jal        who_pressed__Fi
    /* 997F0 800A97F0 50000424 */   addiu     $a0, $zero, 0x50
    /* 997F4 800A97F4 B00A848F */  lw         $a0, %gp_rel(D_8011B230)($gp)
    /* 997F8 800A97F8 100B82AF */  sw         $v0, %gp_rel(they_pressed)($gp)
    /* 997FC 800A97FC 40100400 */  sll        $v0, $a0, 1
    /* 99800 800A9800 21104400 */  addu       $v0, $v0, $a0
    /* 99804 800A9804 C0100200 */  sll        $v0, $v0, 3
    /* 99808 800A9808 21105200 */  addu       $v0, $v0, $s2
    /* 9980C 800A980C 1400438C */  lw         $v1, 0x14($v0)
    /* 99810 800A9810 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 99814 800A9814 0E006214 */  bne        $v1, $v0, .L800A9850
    /* 99818 800A9818 FEFF0224 */   addiu     $v0, $zero, -0x2
    /* 9981C 800A981C C6F5000C */  jal        PlaySFX__Fi
    /* 99820 800A9820 33000424 */   addiu     $a0, $zero, 0x33
    /* 99824 800A9824 801F80A3 */  sb         $zero, %gp_rel(D_8011C700)($gp)
    /* 99828 800A9828 73AA020C */  jal        ToggleOptions__Fv
    /* 9982C 800A982C 00000000 */   nop
    /* 99830 800A9830 C80A828F */  lw         $v0, %gp_rel(optionsflag)($gp)
    /* 99834 800A9834 00000000 */  nop
    /* 99838 800A9838 04014014 */  bnez       $v0, .L800A9C4C
    /* 9983C 800A983C 01000224 */   addiu     $v0, $zero, 0x1
    /* 99840 800A9840 1280013C */  lui        $at, %hi(ignore_buttons)
    /* 99844 800A9844 D0BB22AC */  sw         $v0, %lo(ignore_buttons)($at)
    /* 99848 800A9848 13A70208 */  j          .L800A9C4C
    /* 9984C 800A984C 00000000 */   nop
  .L800A9850:
    /* 99850 800A9850 66006210 */  beq        $v1, $v0, .L800A99EC
    /* 99854 800A9854 00000000 */   nop
    /* 99858 800A9858 DC0A828F */  lw         $v0, %gp_rel(DiabloDieFlag)($gp)
    /* 9985C 800A985C 00000000 */  nop
    /* 99860 800A9860 0A004010 */  beqz       $v0, .L800A988C
    /* 99864 800A9864 0D000224 */   addiu     $v0, $zero, 0xD
    /* 99868 800A9868 8E006210 */  beq        $v1, $v0, .L800A9AA4
    /* 9986C 800A986C 02000324 */   addiu     $v1, $zero, 0x2
    /* 99870 800A9870 BC0A828F */  lw         $v0, %gp_rel(cmenu)($gp)
    /* 99874 800A9874 00000000 */  nop
    /* 99878 800A9878 01004224 */  addiu      $v0, $v0, 0x1
    /* 9987C 800A987C 03004314 */  bne        $v0, $v1, .L800A988C
    /* 99880 800A9880 05008228 */   slti      $v0, $a0, 0x5
    /* 99884 800A9884 87004014 */  bnez       $v0, .L800A9AA4
    /* 99888 800A9888 00000000 */   nop
  .L800A988C:
    /* 9988C 800A988C C6F5000C */  jal        PlaySFX__Fi
    /* 99890 800A9890 33000424 */   addiu     $a0, $zero, 0x33
    /* 99894 800A9894 B00A838F */  lw         $v1, %gp_rel(D_8011B230)($gp)
    /* 99898 800A9898 00000000 */  nop
    /* 9989C 800A989C 40100300 */  sll        $v0, $v1, 1
    /* 998A0 800A98A0 21104300 */  addu       $v0, $v0, $v1
    /* 998A4 800A98A4 C0100200 */  sll        $v0, $v0, 3
    /* 998A8 800A98A8 21105200 */  addu       $v0, $v0, $s2
    /* 998AC 800A98AC 1400448C */  lw         $a0, 0x14($v0)
    /* 998B0 800A98B0 B40A83AF */  sw         $v1, %gp_rel(D_8011B234)($gp)
    /* 998B4 800A98B4 FFFF8224 */  addiu      $v0, $a0, -0x1
    /* 998B8 800A98B8 BC0A82AF */  sw         $v0, %gp_rel(cmenu)($gp)
    /* 998BC 800A98BC 01000224 */  addiu      $v0, $zero, 0x1
    /* 998C0 800A98C0 07008214 */  bne        $a0, $v0, .L800A98E0
    /* 998C4 800A98C4 00000000 */   nop
    /* 998C8 800A98C8 1280023C */  lui        $v0, %hi(FeFlag)
    /* 998CC 800A98CC 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 998D0 800A98D0 00000000 */  nop
    /* 998D4 800A98D4 02004014 */  bnez       $v0, .L800A98E0
    /* 998D8 800A98D8 00000000 */   nop
    /* 998DC 800A98DC BC0A84AF */  sw         $a0, %gp_rel(cmenu)($gp)
  .L800A98E0:
    /* 998E0 800A98E0 BC0A828F */  lw         $v0, %gp_rel(cmenu)($gp)
    /* 998E4 800A98E4 18000324 */  addiu      $v1, $zero, 0x18
    /* 998E8 800A98E8 01004224 */  addiu      $v0, $v0, 0x1
    /* 998EC 800A98EC 17004314 */  bne        $v0, $v1, .L800A994C
    /* 998F0 800A98F0 01000224 */   addiu     $v0, $zero, 0x1
    /* 998F4 800A98F4 A80A8293 */  lbu        $v0, %gp_rel(Qfromoptions)($gp)
    /* 998F8 800A98F8 00000000 */  nop
    /* 998FC 800A98FC 0D004010 */  beqz       $v0, .L800A9934
    /* 99900 800A9900 04000224 */   addiu     $v0, $zero, 0x4
    /* 99904 800A9904 B00A838F */  lw         $v1, %gp_rel(D_8011B230)($gp)
    /* 99908 800A9908 00000000 */  nop
    /* 9990C 800A990C 09006214 */  bne        $v1, $v0, .L800A9934
    /* 99910 800A9910 00000000 */   nop
    /* 99914 800A9914 E16E020C */  jal        GLUE_SetShowGameScreenFlag__Fb
    /* 99918 800A9918 01000424 */   addiu     $a0, $zero, 0x1
    /* 9991C 800A991C 01000224 */  addiu      $v0, $zero, 0x1
    /* 99920 800A9920 BC0A80AF */  sw         $zero, %gp_rel(cmenu)($gp)
    /* 99924 800A9924 A80A80A3 */  sb         $zero, %gp_rel(Qfromoptions)($gp)
    /* 99928 800A9928 EC0A82AF */  sw         $v0, %gp_rel(D_8011B26C)($gp)
    /* 9992C 800A992C 54A60208 */  j          .L800A9950
    /* 99930 800A9930 00000000 */   nop
  .L800A9934:
    /* 99934 800A9934 D00A828F */  lw         $v0, %gp_rel(options_pad)($gp)
    /* 99938 800A9938 00000000 */  nop
    /* 9993C 800A993C 01004224 */  addiu      $v0, $v0, 0x1
    /* 99940 800A9940 A80A82A3 */  sb         $v0, %gp_rel(Qfromoptions)($gp)
    /* 99944 800A9944 54A60208 */  j          .L800A9950
    /* 99948 800A9948 00000000 */   nop
  .L800A994C:
    /* 9994C 800A994C B00A82AF */  sw         $v0, %gp_rel(D_8011B230)($gp)
  .L800A9950:
    /* 99950 800A9950 BC0A828F */  lw         $v0, %gp_rel(cmenu)($gp)
    /* 99954 800A9954 0B000324 */  addiu      $v1, $zero, 0xB
    /* 99958 800A9958 01004224 */  addiu      $v0, $v0, 0x1
    /* 9995C 800A995C 09004314 */  bne        $v0, $v1, .L800A9984
    /* 99960 800A9960 00000000 */   nop
    /* 99964 800A9964 EFE6000C */  jal        GetSpeed__Fv
    /* 99968 800A9968 00000000 */   nop
    /* 9996C 800A996C 21184000 */  addu       $v1, $v0, $zero
    /* 99970 800A9970 03006010 */  beqz       $v1, .L800A9980
    /* 99974 800A9974 01000224 */   addiu     $v0, $zero, 0x1
    /* 99978 800A9978 02006214 */  bne        $v1, $v0, .L800A9984
    /* 9997C 800A997C 02000224 */   addiu     $v0, $zero, 0x2
  .L800A9980:
    /* 99980 800A9980 B00A82AF */  sw         $v0, %gp_rel(D_8011B230)($gp)
  .L800A9984:
    /* 99984 800A9984 1280023C */  lui        $v0, %hi(deathflag)
    /* 99988 800A9988 0CBA4290 */  lbu        $v0, %lo(deathflag)($v0)
    /* 9998C 800A998C 00000000 */  nop
    /* 99990 800A9990 0C004010 */  beqz       $v0, .L800A99C4
    /* 99994 800A9994 00000000 */   nop
    /* 99998 800A9998 BC0A828F */  lw         $v0, %gp_rel(cmenu)($gp)
    /* 9999C 800A999C 00000000 */  nop
    /* 999A0 800A99A0 0200422C */  sltiu      $v0, $v0, 0x2
    /* 999A4 800A99A4 07004010 */  beqz       $v0, .L800A99C4
    /* 999A8 800A99A8 08000224 */   addiu     $v0, $zero, 0x8
    /* 999AC 800A99AC B40A838F */  lw         $v1, %gp_rel(D_8011B234)($gp)
    /* 999B0 800A99B0 BC0A82AF */  sw         $v0, %gp_rel(cmenu)($gp)
    /* 999B4 800A99B4 801F80A3 */  sb         $zero, %gp_rel(D_8011C700)($gp)
    /* 999B8 800A99B8 B00A83AF */  sw         $v1, %gp_rel(D_8011B230)($gp)
    /* 999BC 800A99BC 13A70208 */  j          .L800A9C4C
    /* 999C0 800A99C0 00000000 */   nop
  .L800A99C4:
    /* 999C4 800A99C4 BC0A828F */  lw         $v0, %gp_rel(cmenu)($gp)
    /* 999C8 800A99C8 00000000 */  nop
    /* 999CC 800A99CC FBFF4224 */  addiu      $v0, $v0, -0x5
    /* 999D0 800A99D0 0200422C */  sltiu      $v0, $v0, 0x2
    /* 999D4 800A99D4 02004010 */  beqz       $v0, .L800A99E0
    /* 999D8 800A99D8 02000224 */   addiu     $v0, $zero, 0x2
    /* 999DC 800A99DC B00A82AF */  sw         $v0, %gp_rel(D_8011B230)($gp)
  .L800A99E0:
    /* 999E0 800A99E0 801F80A3 */  sb         $zero, %gp_rel(D_8011C700)($gp)
    /* 999E4 800A99E4 13A70208 */  j          .L800A9C4C
    /* 999E8 800A99E8 00000000 */   nop
  .L800A99EC:
    /* 999EC 800A99EC BC0A828F */  lw         $v0, %gp_rel(cmenu)($gp)
    /* 999F0 800A99F0 04000324 */  addiu      $v1, $zero, 0x4
    /* 999F4 800A99F4 01004224 */  addiu      $v0, $v0, 0x1
    /* 999F8 800A99F8 04004314 */  bne        $v0, $v1, .L800A9A0C
    /* 999FC 800A99FC FFFF8224 */   addiu     $v0, $a0, -0x1
    /* 99A00 800A9A00 8C1F82AF */  sw         $v0, %gp_rel(D_8011C70C)($gp)
    /* 99A04 800A9A04 13A70208 */  j          .L800A9C4C
    /* 99A08 800A9A08 00000000 */   nop
  .L800A9A0C:
    /* 99A0C 800A9A0C BC0A828F */  lw         $v0, %gp_rel(cmenu)($gp)
    /* 99A10 800A9A10 03000324 */  addiu      $v1, $zero, 0x3
    /* 99A14 800A9A14 01004224 */  addiu      $v0, $v0, 0x1
    /* 99A18 800A9A18 0C004314 */  bne        $v0, $v1, .L800A9A4C
    /* 99A1C 800A9A1C 05000224 */   addiu     $v0, $zero, 0x5
    /* 99A20 800A9A20 B00A838F */  lw         $v1, %gp_rel(D_8011B230)($gp)
    /* 99A24 800A9A24 00000000 */  nop
    /* 99A28 800A9A28 08006214 */  bne        $v1, $v0, .L800A9A4C
    /* 99A2C 800A9A2C 00000000 */   nop
    /* 99A30 800A9A30 55AD020C */  jal        GetDown__C4CPad_800ab554
    /* 99A34 800A9A34 21202002 */   addu      $a0, $s1, $zero
    /* 99A38 800A9A38 0C004230 */  andi       $v0, $v0, 0xC
    /* 99A3C 800A9A3C 03004010 */  beqz       $v0, .L800A9A4C
    /* 99A40 800A9A40 00000000 */   nop
    /* 99A44 800A9A44 85A4020C */  jal        SwitchMONO__Fv
    /* 99A48 800A9A48 00000000 */   nop
  .L800A9A4C:
    /* 99A4C 800A9A4C 55AD020C */  jal        GetDown__C4CPad_800ab554
    /* 99A50 800A9A50 21202002 */   addu      $a0, $s1, $zero
    /* 99A54 800A9A54 00014230 */  andi       $v0, $v0, 0x100
    /* 99A58 800A9A58 08004010 */  beqz       $v0, .L800A9A7C
    /* 99A5C 800A9A5C 00000000 */   nop
    /* 99A60 800A9A60 E00A828F */  lw         $v0, %gp_rel(PadFrig)($gp)
    /* 99A64 800A9A64 00000000 */  nop
    /* 99A68 800A9A68 04004010 */  beqz       $v0, .L800A9A7C
    /* 99A6C 800A9A6C 00000000 */   nop
    /* 99A70 800A9A70 E00A80AF */  sw         $zero, %gp_rel(PadFrig)($gp)
    /* 99A74 800A9A74 13A70208 */  j          .L800A9C4C
    /* 99A78 800A9A78 00000000 */   nop
  .L800A9A7C:
    /* 99A7C 800A9A7C 55AD020C */  jal        GetDown__C4CPad_800ab554
    /* 99A80 800A9A80 21202002 */   addu      $a0, $s1, $zero
    /* 99A84 800A9A84 00014230 */  andi       $v0, $v0, 0x100
    /* 99A88 800A9A88 70004010 */  beqz       $v0, .L800A9C4C
    /* 99A8C 800A9A8C 09000224 */   addiu     $v0, $zero, 0x9
    /* 99A90 800A9A90 BC0A848F */  lw         $a0, %gp_rel(cmenu)($gp)
    /* 99A94 800A9A94 00000000 */  nop
    /* 99A98 800A9A98 01008324 */  addiu      $v1, $a0, 0x1
    /* 99A9C 800A9A9C 05006214 */  bne        $v1, $v0, .L800A9AB4
    /* 99AA0 800A9AA0 00000000 */   nop
  .L800A9AA4:
    /* 99AA4 800A9AA4 C6F5000C */  jal        PlaySFX__Fi
    /* 99AA8 800A9AA8 D3030424 */   addiu     $a0, $zero, 0x3D3
    /* 99AAC 800A9AAC 13A70208 */  j          .L800A9C4C
    /* 99AB0 800A9AB0 00000000 */   nop
  .L800A9AB4:
    /* 99AB4 800A9AB4 A80A8293 */  lbu        $v0, %gp_rel(Qfromoptions)($gp)
    /* 99AB8 800A9AB8 00000000 */  nop
    /* 99ABC 800A9ABC 08004010 */  beqz       $v0, .L800A9AE0
    /* 99AC0 800A9AC0 C0100400 */   sll       $v0, $a0, 3
    /* 99AC4 800A9AC4 C6F5000C */  jal        PlaySFX__Fi
    /* 99AC8 800A9AC8 33000424 */   addiu     $a0, $zero, 0x33
    /* 99ACC 800A9ACC E16E020C */  jal        GLUE_SetShowGameScreenFlag__Fb
    /* 99AD0 800A9AD0 01000424 */   addiu     $a0, $zero, 0x1
    /* 99AD4 800A9AD4 A80A80A3 */  sb         $zero, %gp_rel(Qfromoptions)($gp)
    /* 99AD8 800A9AD8 13A70208 */  j          .L800A9C4C
    /* 99ADC 800A9ADC 00000000 */   nop
  .L800A9AE0:
    /* 99AE0 800A9AE0 0D80013C */  lui        $at, %hi(MenuList + 0x3)
    /* 99AE4 800A9AE4 21082200 */  addu       $at, $at, $v0
    /* 99AE8 800A9AE8 43D22390 */  lbu        $v1, %lo(MenuList + 0x3)($at)
    /* 99AEC 800A9AEC 00000000 */  nop
    /* 99AF0 800A9AF0 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 99AF4 800A9AF4 40100300 */  sll        $v0, $v1, 1
    /* 99AF8 800A9AF8 21104300 */  addu       $v0, $v0, $v1
    /* 99AFC 800A9AFC C0100200 */  sll        $v0, $v0, 3
    /* 99B00 800A9B00 21105200 */  addu       $v0, $v0, $s2
    /* 99B04 800A9B04 B00A83AF */  sw         $v1, %gp_rel(D_8011B230)($gp)
    /* 99B08 800A9B08 1400438C */  lw         $v1, 0x14($v0)
    /* 99B0C 800A9B0C FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 99B10 800A9B10 03006210 */  beq        $v1, $v0, .L800A9B20
    /* 99B14 800A9B14 06000224 */   addiu     $v0, $zero, 0x6
    /* 99B18 800A9B18 0E006214 */  bne        $v1, $v0, .L800A9B54
    /* 99B1C 800A9B1C FEFF0224 */   addiu     $v0, $zero, -0x2
  .L800A9B20:
    /* 99B20 800A9B20 C6F5000C */  jal        PlaySFX__Fi
    /* 99B24 800A9B24 33000424 */   addiu     $a0, $zero, 0x33
    /* 99B28 800A9B28 801F80A3 */  sb         $zero, %gp_rel(D_8011C700)($gp)
    /* 99B2C 800A9B2C 73AA020C */  jal        ToggleOptions__Fv
    /* 99B30 800A9B30 00000000 */   nop
    /* 99B34 800A9B34 C80A828F */  lw         $v0, %gp_rel(optionsflag)($gp)
    /* 99B38 800A9B38 00000000 */  nop
    /* 99B3C 800A9B3C 43004014 */  bnez       $v0, .L800A9C4C
    /* 99B40 800A9B40 00000000 */   nop
    /* 99B44 800A9B44 1280013C */  lui        $at, %hi(ignore_buttons)
    /* 99B48 800A9B48 D0BB20AC */  sw         $zero, %lo(ignore_buttons)($at)
    /* 99B4C 800A9B4C 13A70208 */  j          .L800A9C4C
    /* 99B50 800A9B50 00000000 */   nop
  .L800A9B54:
    /* 99B54 800A9B54 3D006210 */  beq        $v1, $v0, .L800A9C4C
    /* 99B58 800A9B58 00000000 */   nop
    /* 99B5C 800A9B5C C6F5000C */  jal        PlaySFX__Fi
    /* 99B60 800A9B60 33000424 */   addiu     $a0, $zero, 0x33
    /* 99B64 800A9B64 1280023C */  lui        $v0, %hi(deathflag)
    /* 99B68 800A9B68 0CBA4290 */  lbu        $v0, %lo(deathflag)($v0)
    /* 99B6C 800A9B6C 00000000 */  nop
    /* 99B70 800A9B70 0C004010 */  beqz       $v0, .L800A9BA4
    /* 99B74 800A9B74 07000324 */   addiu     $v1, $zero, 0x7
    /* 99B78 800A9B78 BC0A828F */  lw         $v0, %gp_rel(cmenu)($gp)
    /* 99B7C 800A9B7C 00000000 */  nop
    /* 99B80 800A9B80 01004224 */  addiu      $v0, $v0, 0x1
    /* 99B84 800A9B84 24004314 */  bne        $v0, $v1, .L800A9C18
    /* 99B88 800A9B88 08000224 */   addiu     $v0, $zero, 0x8
    /* 99B8C 800A9B8C B40A838F */  lw         $v1, %gp_rel(D_8011B234)($gp)
    /* 99B90 800A9B90 BC0A82AF */  sw         $v0, %gp_rel(cmenu)($gp)
    /* 99B94 800A9B94 801F80A3 */  sb         $zero, %gp_rel(D_8011C700)($gp)
    /* 99B98 800A9B98 B00A83AF */  sw         $v1, %gp_rel(D_8011B230)($gp)
    /* 99B9C 800A9B9C 06A70208 */  j          .L800A9C18
    /* 99BA0 800A9BA0 00000000 */   nop
  .L800A9BA4:
    /* 99BA4 800A9BA4 BC0A828F */  lw         $v0, %gp_rel(cmenu)($gp)
    /* 99BA8 800A9BA8 08000324 */  addiu      $v1, $zero, 0x8
    /* 99BAC 800A9BAC 01004224 */  addiu      $v0, $v0, 0x1
    /* 99BB0 800A9BB0 0E004314 */  bne        $v0, $v1, .L800A9BEC
    /* 99BB4 800A9BB4 00000000 */   nop
    /* 99BB8 800A9BB8 B00A838F */  lw         $v1, %gp_rel(D_8011B230)($gp)
    /* 99BBC 800A9BBC 801F80A3 */  sb         $zero, %gp_rel(D_8011C700)($gp)
    /* 99BC0 800A9BC0 40100300 */  sll        $v0, $v1, 1
    /* 99BC4 800A9BC4 21104300 */  addu       $v0, $v0, $v1
    /* 99BC8 800A9BC8 C0100200 */  sll        $v0, $v0, 3
    /* 99BCC 800A9BCC 21105200 */  addu       $v0, $v0, $s2
    /* 99BD0 800A9BD0 1400438C */  lw         $v1, 0x14($v0)
    /* 99BD4 800A9BD4 05000224 */  addiu      $v0, $zero, 0x5
    /* 99BD8 800A9BD8 B00A82AF */  sw         $v0, %gp_rel(D_8011B230)($gp)
    /* 99BDC 800A9BDC FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 99BE0 800A9BE0 BC0A83AF */  sw         $v1, %gp_rel(cmenu)($gp)
    /* 99BE4 800A9BE4 06A70208 */  j          .L800A9C18
    /* 99BE8 800A9BE8 00000000 */   nop
  .L800A9BEC:
    /* 99BEC 800A9BEC B00A838F */  lw         $v1, %gp_rel(D_8011B230)($gp)
    /* 99BF0 800A9BF0 801F80A3 */  sb         $zero, %gp_rel(D_8011C700)($gp)
    /* 99BF4 800A9BF4 40100300 */  sll        $v0, $v1, 1
    /* 99BF8 800A9BF8 21104300 */  addu       $v0, $v0, $v1
    /* 99BFC 800A9BFC C0100200 */  sll        $v0, $v0, 3
    /* 99C00 800A9C00 21105200 */  addu       $v0, $v0, $s2
    /* 99C04 800A9C04 1400428C */  lw         $v0, 0x14($v0)
    /* 99C08 800A9C08 B40A838F */  lw         $v1, %gp_rel(D_8011B234)($gp)
    /* 99C0C 800A9C0C FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 99C10 800A9C10 B00A83AF */  sw         $v1, %gp_rel(D_8011B230)($gp)
    /* 99C14 800A9C14 BC0A82AF */  sw         $v0, %gp_rel(cmenu)($gp)
  .L800A9C18:
    /* 99C18 800A9C18 1280023C */  lui        $v0, %hi(MemcardOverlay)
    /* 99C1C 800A9C1C 64B1428C */  lw         $v0, %lo(MemcardOverlay)($v0)
    /* 99C20 800A9C20 00000000 */  nop
    /* 99C24 800A9C24 09004010 */  beqz       $v0, .L800A9C4C
    /* 99C28 800A9C28 00000000 */   nop
    /* 99C2C 800A9C2C 1280023C */  lui        $v0, %hi(FeFlag)
    /* 99C30 800A9C30 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 99C34 800A9C34 1280013C */  lui        $at, %hi(MemcardOverlay)
    /* 99C38 800A9C38 64B120AC */  sw         $zero, %lo(MemcardOverlay)($at)
    /* 99C3C 800A9C3C 03004014 */  bnez       $v0, .L800A9C4C
    /* 99C40 800A9C40 00000000 */   nop
    /* 99C44 800A9C44 1D55020C */  jal        OVR_LoadGame__Fv
    /* 99C48 800A9C48 00000000 */   nop
  .L800A9C4C:
    /* 99C4C 800A9C4C 2400BF8F */  lw         $ra, 0x24($sp)
    /* 99C50 800A9C50 2000B28F */  lw         $s2, 0x20($sp)
    /* 99C54 800A9C54 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 99C58 800A9C58 1800B08F */  lw         $s0, 0x18($sp)
    /* 99C5C 800A9C5C 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 99C60 800A9C60 0800E003 */  jr         $ra
    /* 99C64 800A9C64 00000000 */   nop
endlabel SoundPad__Fv
