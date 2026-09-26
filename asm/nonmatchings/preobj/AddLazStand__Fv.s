.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddLazStand__Fv, 0x18C

glabel AddLazStand__Fv
    /* 1F724 8015931C D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 1F728 80159320 2400B5AF */  sw         $s5, 0x24($sp)
    /* 1F72C 80159324 21A80000 */  addu       $s5, $zero, $zero
    /* 1F730 80159328 2800BFAF */  sw         $ra, 0x28($sp)
    /* 1F734 8015932C 2000B4AF */  sw         $s4, 0x20($sp)
    /* 1F738 80159330 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1F73C 80159334 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1F740 80159338 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1F744 8015933C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1F748 80159340 01001224 */  addiu      $s2, $zero, 0x1
  .L80159344:
    /* 1F74C 80159344 C9F6000C */  jal        ENG_random__Fl
    /* 1F750 80159348 40000424 */   addiu     $a0, $zero, 0x40
    /* 1F754 8015934C 40000424 */  addiu      $a0, $zero, 0x40
    /* 1F758 80159350 C9F6000C */  jal        ENG_random__Fl
    /* 1F75C 80159354 10005324 */   addiu     $s3, $v0, 0x10
    /* 1F760 80159358 10005424 */  addiu      $s4, $v0, 0x10
    /* 1F764 8015935C FDFF1124 */  addiu      $s1, $zero, -0x3
  .L80159360:
    /* 1F768 80159360 FEFF1024 */  addiu      $s0, $zero, -0x2
    /* 1F76C 80159364 21207002 */  addu       $a0, $s3, $s0
  .L80159368:
    /* 1F770 80159368 305D050C */  jal        RndLocOk__Fii
    /* 1F774 8015936C 21289102 */   addu      $a1, $s4, $s1
    /* 1F778 80159370 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1F77C 80159374 02004014 */  bnez       $v0, .L80159380
    /* 1F780 80159378 00000000 */   nop
    /* 1F784 8015937C 21900000 */  addu       $s2, $zero, $zero
  .L80159380:
    /* 1F788 80159380 01001026 */  addiu      $s0, $s0, 0x1
    /* 1F78C 80159384 0400022A */  slti       $v0, $s0, 0x4
    /* 1F790 80159388 F7FF4014 */  bnez       $v0, .L80159368
    /* 1F794 8015938C 21207002 */   addu      $a0, $s3, $s0
    /* 1F798 80159390 01003126 */  addiu      $s1, $s1, 0x1
    /* 1F79C 80159394 0400222A */  slti       $v0, $s1, 0x4
    /* 1F7A0 80159398 F1FF4014 */  bnez       $v0, .L80159360
    /* 1F7A4 8015939C FF004232 */   andi      $v0, $s2, 0xFF
    /* 1F7A8 801593A0 0A004014 */  bnez       $v0, .L801593CC
    /* 1F7AC 801593A4 0100B526 */   addiu     $s5, $s5, 0x1
    /* 1F7B0 801593A8 1127A22A */  slti       $v0, $s5, 0x2711
    /* 1F7B4 801593AC E5FF4014 */  bnez       $v0, .L80159344
    /* 1F7B8 801593B0 01001224 */   addiu     $s2, $zero, 0x1
    /* 1F7BC 801593B4 01000424 */  addiu      $a0, $zero, 0x1
    /* 1F7C0 801593B8 01000524 */  addiu      $a1, $zero, 0x1
    /* 1F7C4 801593BC 8B5D050C */  jal        InitRndLocObj__Fiii
    /* 1F7C8 801593C0 5F000624 */   addiu     $a2, $zero, 0x5F
    /* 1F7CC 801593C4 20650508 */  j          .L80159480
    /* 1F7D0 801593C8 00000000 */   nop
  .L801593CC:
    /* 1F7D4 801593CC 5F000424 */  addiu      $a0, $zero, 0x5F
    /* 1F7D8 801593D0 21286002 */  addu       $a1, $s3, $zero
    /* 1F7DC 801593D4 BE4E010C */  jal        AddObject__Fiii
    /* 1F7E0 801593D8 21308002 */   addu      $a2, $s4, $zero
    /* 1F7E4 801593DC 1E000424 */  addiu      $a0, $zero, 0x1E
    /* 1F7E8 801593E0 21286002 */  addu       $a1, $s3, $zero
    /* 1F7EC 801593E4 02009026 */  addiu      $s0, $s4, 0x2
    /* 1F7F0 801593E8 BE4E010C */  jal        AddObject__Fiii
    /* 1F7F4 801593EC 21300002 */   addu      $a2, $s0, $zero
    /* 1F7F8 801593F0 57000424 */  addiu      $a0, $zero, 0x57
    /* 1F7FC 801593F4 01007226 */  addiu      $s2, $s3, 0x1
    /* 1F800 801593F8 21284002 */  addu       $a1, $s2, $zero
    /* 1F804 801593FC BE4E010C */  jal        AddObject__Fiii
    /* 1F808 80159400 21300002 */   addu      $a2, $s0, $zero
    /* 1F80C 80159404 1F000424 */  addiu      $a0, $zero, 0x1F
    /* 1F810 80159408 02007126 */  addiu      $s1, $s3, 0x2
    /* 1F814 8015940C 21282002 */  addu       $a1, $s1, $zero
    /* 1F818 80159410 BE4E010C */  jal        AddObject__Fiii
    /* 1F81C 80159414 21300002 */   addu      $a2, $s0, $zero
    /* 1F820 80159418 21000424 */  addiu      $a0, $zero, 0x21
    /* 1F824 8015941C 21286002 */  addu       $a1, $s3, $zero
    /* 1F828 80159420 FEFF9026 */  addiu      $s0, $s4, -0x2
    /* 1F82C 80159424 BE4E010C */  jal        AddObject__Fiii
    /* 1F830 80159428 21300002 */   addu      $a2, $s0, $zero
    /* 1F834 8015942C 57000424 */  addiu      $a0, $zero, 0x57
    /* 1F838 80159430 21284002 */  addu       $a1, $s2, $zero
    /* 1F83C 80159434 BE4E010C */  jal        AddObject__Fiii
    /* 1F840 80159438 21300002 */   addu      $a2, $s0, $zero
    /* 1F844 8015943C 22000424 */  addiu      $a0, $zero, 0x22
    /* 1F848 80159440 21282002 */  addu       $a1, $s1, $zero
    /* 1F84C 80159444 BE4E010C */  jal        AddObject__Fiii
    /* 1F850 80159448 21300002 */   addu      $a2, $s0, $zero
    /* 1F854 8015944C 57000424 */  addiu      $a0, $zero, 0x57
    /* 1F858 80159450 FFFF7026 */  addiu      $s0, $s3, -0x1
    /* 1F85C 80159454 21280002 */  addu       $a1, $s0, $zero
    /* 1F860 80159458 BE4E010C */  jal        AddObject__Fiii
    /* 1F864 8015945C FFFF8626 */   addiu     $a2, $s4, -0x1
    /* 1F868 80159460 23000424 */  addiu      $a0, $zero, 0x23
    /* 1F86C 80159464 21280002 */  addu       $a1, $s0, $zero
    /* 1F870 80159468 BE4E010C */  jal        AddObject__Fiii
    /* 1F874 8015946C 21308002 */   addu      $a2, $s4, $zero
    /* 1F878 80159470 57000424 */  addiu      $a0, $zero, 0x57
    /* 1F87C 80159474 21280002 */  addu       $a1, $s0, $zero
    /* 1F880 80159478 BE4E010C */  jal        AddObject__Fiii
    /* 1F884 8015947C 01008626 */   addiu     $a2, $s4, 0x1
  .L80159480:
    /* 1F888 80159480 2800BF8F */  lw         $ra, 0x28($sp)
    /* 1F88C 80159484 2400B58F */  lw         $s5, 0x24($sp)
    /* 1F890 80159488 2000B48F */  lw         $s4, 0x20($sp)
    /* 1F894 8015948C 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 1F898 80159490 1800B28F */  lw         $s2, 0x18($sp)
    /* 1F89C 80159494 1400B18F */  lw         $s1, 0x14($sp)
    /* 1F8A0 80159498 1000B08F */  lw         $s0, 0x10($sp)
    /* 1F8A4 8015949C 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 1F8A8 801594A0 0800E003 */  jr         $ra
    /* 1F8AC 801594A4 00000000 */   nop
endlabel AddLazStand__Fv
