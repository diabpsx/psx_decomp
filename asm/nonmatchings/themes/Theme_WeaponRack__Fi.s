.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Theme_WeaponRack__Fi, 0x17C

glabel Theme_WeaponRack__Fi
    /* 247C8 8015E3C0 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 247CC 8015E3C4 3000B4AF */  sw         $s4, 0x30($sp)
    /* 247D0 8015E3C8 21A08000 */  addu       $s4, $a0, $zero
    /* 247D4 8015E3CC 3400BFAF */  sw         $ra, 0x34($sp)
    /* 247D8 8015E3D0 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 247DC 8015E3D4 2800B2AF */  sw         $s2, 0x28($sp)
    /* 247E0 8015E3D8 2400B1AF */  sw         $s1, 0x24($sp)
    /* 247E4 8015E3DC 2000B0AF */  sw         $s0, 0x20($sp)
    /* 247E8 8015E3E0 1280053C */  lui        $a1, %hi(D_8011C188)
    /* 247EC 8015E3E4 88C1A524 */  addiu      $a1, $a1, %lo(D_8011C188)
    /* 247F0 8015E3E8 0300A288 */  lwl        $v0, 0x3($a1)
    /* 247F4 8015E3EC 0000A298 */  lwr        $v0, 0x0($a1)
    /* 247F8 8015E3F0 00000000 */  nop
    /* 247FC 8015E3F4 1300A2AB */  swl        $v0, 0x13($sp)
    /* 24800 8015E3F8 1000A2BB */  swr        $v0, 0x10($sp)
    /* 24804 8015E3FC 161A8293 */  lbu        $v0, %gp_rel(weaponFlag)($gp)
    /* 24808 8015E400 1280063C */  lui        $a2, %hi(D_8011C16C)
    /* 2480C 8015E404 6CC1C624 */  addiu      $a2, $a2, %lo(D_8011C16C)
    /* 24810 8015E408 0300C388 */  lwl        $v1, 0x3($a2)
    /* 24814 8015E40C 0000C398 */  lwr        $v1, 0x0($a2)
    /* 24818 8015E410 00000000 */  nop
    /* 2481C 8015E414 1B00A3AB */  swl        $v1, 0x1B($sp)
    /* 24820 8015E418 1800A3BB */  swr        $v1, 0x18($sp)
    /* 24824 8015E41C 08004010 */  beqz       $v0, .L8015E440
    /* 24828 8015E420 21900000 */   addu      $s2, $zero, $zero
    /* 2482C 8015E424 D570050C */  jal        TFit_Obj3__Fi
    /* 24830 8015E428 21208002 */   addu      $a0, $s4, $zero
    /* 24834 8015E42C 181A858F */  lw         $a1, %gp_rel(themex)($gp)
    /* 24838 8015E430 1C1A868F */  lw         $a2, %gp_rel(themey)($gp)
    /* 2483C 8015E434 BE4E010C */  jal        AddObject__Fiii
    /* 24840 8015E438 5C000424 */   addiu     $a0, $zero, 0x5C
    /* 24844 8015E43C 21900000 */  addu       $s2, $zero, $zero
  .L8015E440:
    /* 24848 8015E440 21880000 */  addu       $s1, $zero, $zero
    /* 2484C 8015E444 C0981200 */  sll        $s3, $s2, 3
  .L8015E448:
    /* 24850 8015E448 C0101400 */  sll        $v0, $s4, 3
    /* 24854 8015E44C 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 24858 8015E450 21083300 */  addu       $at, $at, $s3
    /* 2485C 8015E454 2F7A2380 */  lb         $v1, %lo(dung_map + 0x7)($at)
    /* 24860 8015E458 1080013C */  lui        $at, %hi(theme + 0x4)
    /* 24864 8015E45C 21082200 */  addu       $at, $at, $v0
    /* 24868 8015E460 4C28228C */  lw         $v0, %lo(theme + 0x4)($at)
    /* 2486C 8015E464 00000000 */  nop
    /* 24870 8015E468 1B006214 */  bne        $v1, $v0, .L8015E4D8
    /* 24874 8015E46C 21202002 */   addu      $a0, $s1, $zero
    /* 24878 8015E470 380B020C */  jal        GetSOLID__Fii
    /* 2487C 8015E474 21284002 */   addu      $a1, $s2, $zero
    /* 24880 8015E478 01004238 */  xori       $v0, $v0, 0x1
    /* 24884 8015E47C 16004010 */  beqz       $v0, .L8015E4D8
    /* 24888 8015E480 21800000 */   addu      $s0, $zero, $zero
    /* 2488C 8015E484 21202002 */  addu       $a0, $s1, $zero
    /* 24890 8015E488 21284002 */  addu       $a1, $s2, $zero
    /* 24894 8015E48C 21308002 */  addu       $a2, $s4, $zero
    /* 24898 8015E490 8270050C */  jal        CheckThemeObj3__Fiiii
    /* 2489C 8015E494 FFFF0724 */   addiu     $a3, $zero, -0x1
    /* 248A0 8015E498 FF004230 */  andi       $v0, $v0, 0xFF
    /* 248A4 8015E49C 09004010 */  beqz       $v0, .L8015E4C4
    /* 248A8 8015E4A0 00000000 */   nop
    /* 248AC 8015E4A4 1280023C */  lui        $v0, %hi(leveltype)
    /* 248B0 8015E4A8 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 248B4 8015E4AC 00000000 */  nop
    /* 248B8 8015E4B0 2110A203 */  addu       $v0, $sp, $v0
    /* 248BC 8015E4B4 0F004480 */  lb         $a0, 0xF($v0)
    /* 248C0 8015E4B8 C9F6000C */  jal        ENG_random__Fl
    /* 248C4 8015E4BC 00000000 */   nop
    /* 248C8 8015E4C0 0100502C */  sltiu      $s0, $v0, 0x1
  .L8015E4C4:
    /* 248CC 8015E4C4 04000012 */  beqz       $s0, .L8015E4D8
    /* 248D0 8015E4C8 5D000424 */   addiu     $a0, $zero, 0x5D
    /* 248D4 8015E4CC 21282002 */  addu       $a1, $s1, $zero
    /* 248D8 8015E4D0 BE4E010C */  jal        AddObject__Fiii
    /* 248DC 8015E4D4 21304002 */   addu      $a2, $s2, $zero
  .L8015E4D8:
    /* 248E0 8015E4D8 01003126 */  addiu      $s1, $s1, 0x1
    /* 248E4 8015E4DC 6000222A */  slti       $v0, $s1, 0x60
    /* 248E8 8015E4E0 D9FF4014 */  bnez       $v0, .L8015E448
    /* 248EC 8015E4E4 80037326 */   addiu     $s3, $s3, 0x380
    /* 248F0 8015E4E8 01005226 */  addiu      $s2, $s2, 0x1
    /* 248F4 8015E4EC 6000422A */  slti       $v0, $s2, 0x60
    /* 248F8 8015E4F0 D3FF4014 */  bnez       $v0, .L8015E440
    /* 248FC 8015E4F4 00000000 */   nop
    /* 24900 8015E4F8 1280023C */  lui        $v0, %hi(leveltype)
    /* 24904 8015E4FC 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 24908 8015E500 00000000 */  nop
    /* 2490C 8015E504 2110A203 */  addu       $v0, $sp, $v0
    /* 24910 8015E508 17004580 */  lb         $a1, 0x17($v0)
    /* 24914 8015E50C 6C73050C */  jal        PlaceThemeMonsts__Fii
    /* 24918 8015E510 21208002 */   addu      $a0, $s4, $zero
    /* 2491C 8015E514 161A80A3 */  sb         $zero, %gp_rel(weaponFlag)($gp)
    /* 24920 8015E518 3400BF8F */  lw         $ra, 0x34($sp)
    /* 24924 8015E51C 3000B48F */  lw         $s4, 0x30($sp)
    /* 24928 8015E520 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 2492C 8015E524 2800B28F */  lw         $s2, 0x28($sp)
    /* 24930 8015E528 2400B18F */  lw         $s1, 0x24($sp)
    /* 24934 8015E52C 2000B08F */  lw         $s0, 0x20($sp)
    /* 24938 8015E530 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 2493C 8015E534 0800E003 */  jr         $ra
    /* 24940 8015E538 00000000 */   nop
endlabel Theme_WeaponRack__Fi
