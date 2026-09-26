.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Theme_BrnCross__Fi, 0x15C

glabel Theme_BrnCross__Fi
    /* 2466C 8015E264 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 24670 8015E268 3000B4AF */  sw         $s4, 0x30($sp)
    /* 24674 8015E26C 21A08000 */  addu       $s4, $a0, $zero
    /* 24678 8015E270 3400BFAF */  sw         $ra, 0x34($sp)
    /* 2467C 8015E274 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 24680 8015E278 2800B2AF */  sw         $s2, 0x28($sp)
    /* 24684 8015E27C 2400B1AF */  sw         $s1, 0x24($sp)
    /* 24688 8015E280 2000B0AF */  sw         $s0, 0x20($sp)
    /* 2468C 8015E284 1280053C */  lui        $a1, %hi(D_8011C180)
    /* 24690 8015E288 80C1A524 */  addiu      $a1, $a1, %lo(D_8011C180)
    /* 24694 8015E28C 0300A288 */  lwl        $v0, 0x3($a1)
    /* 24698 8015E290 0000A298 */  lwr        $v0, 0x0($a1)
    /* 2469C 8015E294 00000000 */  nop
    /* 246A0 8015E298 1300A2AB */  swl        $v0, 0x13($sp)
    /* 246A4 8015E29C 1000A2BB */  swr        $v0, 0x10($sp)
    /* 246A8 8015E2A0 1280053C */  lui        $a1, %hi(D_8011C184)
    /* 246AC 8015E2A4 84C1A524 */  addiu      $a1, $a1, %lo(D_8011C184)
    /* 246B0 8015E2A8 0300A288 */  lwl        $v0, 0x3($a1)
    /* 246B4 8015E2AC 0000A298 */  lwr        $v0, 0x0($a1)
    /* 246B8 8015E2B0 00000000 */  nop
    /* 246BC 8015E2B4 1B00A2AB */  swl        $v0, 0x1B($sp)
    /* 246C0 8015E2B8 1800A2BB */  swr        $v0, 0x18($sp)
    /* 246C4 8015E2BC 21900000 */  addu       $s2, $zero, $zero
  .L8015E2C0:
    /* 246C8 8015E2C0 21880000 */  addu       $s1, $zero, $zero
    /* 246CC 8015E2C4 C0981200 */  sll        $s3, $s2, 3
  .L8015E2C8:
    /* 246D0 8015E2C8 C0101400 */  sll        $v0, $s4, 3
    /* 246D4 8015E2CC 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 246D8 8015E2D0 21083300 */  addu       $at, $at, $s3
    /* 246DC 8015E2D4 2F7A2380 */  lb         $v1, %lo(dung_map + 0x7)($at)
    /* 246E0 8015E2D8 1080013C */  lui        $at, %hi(theme + 0x4)
    /* 246E4 8015E2DC 21082200 */  addu       $at, $at, $v0
    /* 246E8 8015E2E0 4C28228C */  lw         $v0, %lo(theme + 0x4)($at)
    /* 246EC 8015E2E4 00000000 */  nop
    /* 246F0 8015E2E8 1B006214 */  bne        $v1, $v0, .L8015E358
    /* 246F4 8015E2EC 21202002 */   addu      $a0, $s1, $zero
    /* 246F8 8015E2F0 380B020C */  jal        GetSOLID__Fii
    /* 246FC 8015E2F4 21284002 */   addu      $a1, $s2, $zero
    /* 24700 8015E2F8 01004238 */  xori       $v0, $v0, 0x1
    /* 24704 8015E2FC 16004010 */  beqz       $v0, .L8015E358
    /* 24708 8015E300 21800000 */   addu      $s0, $zero, $zero
    /* 2470C 8015E304 21202002 */  addu       $a0, $s1, $zero
    /* 24710 8015E308 21284002 */  addu       $a1, $s2, $zero
    /* 24714 8015E30C 21308002 */  addu       $a2, $s4, $zero
    /* 24718 8015E310 8270050C */  jal        CheckThemeObj3__Fiiii
    /* 2471C 8015E314 FFFF0724 */   addiu     $a3, $zero, -0x1
    /* 24720 8015E318 FF004230 */  andi       $v0, $v0, 0xFF
    /* 24724 8015E31C 09004010 */  beqz       $v0, .L8015E344
    /* 24728 8015E320 00000000 */   nop
    /* 2472C 8015E324 1280023C */  lui        $v0, %hi(leveltype)
    /* 24730 8015E328 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 24734 8015E32C 00000000 */  nop
    /* 24738 8015E330 2110A203 */  addu       $v0, $sp, $v0
    /* 2473C 8015E334 17004480 */  lb         $a0, 0x17($v0)
    /* 24740 8015E338 C9F6000C */  jal        ENG_random__Fl
    /* 24744 8015E33C 00000000 */   nop
    /* 24748 8015E340 0100502C */  sltiu      $s0, $v0, 0x1
  .L8015E344:
    /* 2474C 8015E344 04000012 */  beqz       $s0, .L8015E358
    /* 24750 8015E348 5B000424 */   addiu     $a0, $zero, 0x5B
    /* 24754 8015E34C 21282002 */  addu       $a1, $s1, $zero
    /* 24758 8015E350 BE4E010C */  jal        AddObject__Fiii
    /* 2475C 8015E354 21304002 */   addu      $a2, $s2, $zero
  .L8015E358:
    /* 24760 8015E358 01003126 */  addiu      $s1, $s1, 0x1
    /* 24764 8015E35C 6000222A */  slti       $v0, $s1, 0x60
    /* 24768 8015E360 D9FF4014 */  bnez       $v0, .L8015E2C8
    /* 2476C 8015E364 80037326 */   addiu     $s3, $s3, 0x380
    /* 24770 8015E368 01005226 */  addiu      $s2, $s2, 0x1
    /* 24774 8015E36C 6000422A */  slti       $v0, $s2, 0x60
    /* 24778 8015E370 D3FF4014 */  bnez       $v0, .L8015E2C0
    /* 2477C 8015E374 00000000 */   nop
    /* 24780 8015E378 1280023C */  lui        $v0, %hi(leveltype)
    /* 24784 8015E37C 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 24788 8015E380 00000000 */  nop
    /* 2478C 8015E384 2110A203 */  addu       $v0, $sp, $v0
    /* 24790 8015E388 0F004580 */  lb         $a1, 0xF($v0)
    /* 24794 8015E38C 6C73050C */  jal        PlaceThemeMonsts__Fii
    /* 24798 8015E390 21208002 */   addu      $a0, $s4, $zero
    /* 2479C 8015E394 01000224 */  addiu      $v0, $zero, 0x1
    /* 247A0 8015E398 151A82A3 */  sb         $v0, %gp_rel(bCrossFlag)($gp)
    /* 247A4 8015E39C 3400BF8F */  lw         $ra, 0x34($sp)
    /* 247A8 8015E3A0 3000B48F */  lw         $s4, 0x30($sp)
    /* 247AC 8015E3A4 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 247B0 8015E3A8 2800B28F */  lw         $s2, 0x28($sp)
    /* 247B4 8015E3AC 2400B18F */  lw         $s1, 0x24($sp)
    /* 247B8 8015E3B0 2000B08F */  lw         $s0, 0x20($sp)
    /* 247BC 8015E3B4 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 247C0 8015E3B8 0800E003 */  jr         $ra
    /* 247C4 8015E3BC 00000000 */   nop
endlabel Theme_BrnCross__Fi
