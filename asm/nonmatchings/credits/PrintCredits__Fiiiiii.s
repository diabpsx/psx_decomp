.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintCredits__Fiiiiii, 0x830

glabel PrintCredits__Fiiiiii
    /* 3650 8013D248 58FFBD27 */  addiu      $sp, $sp, -0xA8
    /* 3654 8013D24C 01000A24 */  addiu      $t2, $zero, 0x1
    /* 3658 8013D250 A400BFAF */  sw         $ra, 0xA4($sp)
    /* 365C 8013D254 A000BEAF */  sw         $fp, 0xA0($sp)
    /* 3660 8013D258 9C00B7AF */  sw         $s7, 0x9C($sp)
    /* 3664 8013D25C 9800B6AF */  sw         $s6, 0x98($sp)
    /* 3668 8013D260 9400B5AF */  sw         $s5, 0x94($sp)
    /* 366C 8013D264 9000B4AF */  sw         $s4, 0x90($sp)
    /* 3670 8013D268 8C00B3AF */  sw         $s3, 0x8C($sp)
    /* 3674 8013D26C 8800B2AF */  sw         $s2, 0x88($sp)
    /* 3678 8013D270 8400B1AF */  sw         $s1, 0x84($sp)
    /* 367C 8013D274 8000B0AF */  sw         $s0, 0x80($sp)
    /* 3680 8013D278 2800A5AF */  sw         $a1, 0x28($sp)
    /* 3684 8013D27C 3000A6AF */  sw         $a2, 0x30($sp)
    /* 3688 8013D280 3800A7AF */  sw         $a3, 0x38($sp)
    /* 368C 8013D284 4AED010C */  jal        GetStr__Fi
    /* 3690 8013D288 5000AAAF */   sw        $t2, 0x50($sp)
    /* 3694 8013D28C 8CF60408 */  j          .L8013DA30
    /* 3698 8013D290 21984000 */   addu      $s3, $v0, $zero
  .L8013D294:
    /* 369C 8013D294 4000B3AF */  sw         $s3, 0x40($sp)
    /* 36A0 8013D298 13006010 */  beqz       $v1, .L8013D2E8
    /* 36A4 8013D29C 21A80000 */   addu      $s5, $zero, $zero
  .L8013D2A0:
    /* 36A8 8013D2A0 4000AA8F */  lw         $t2, 0x40($sp)
    /* 36AC 8013D2A4 00000000 */  nop
    /* 36B0 8013D2A8 00004281 */  lb         $v0, 0x0($t2)
    /* 36B4 8013D2AC 7C000A24 */  addiu      $t2, $zero, 0x7C
    /* 36B8 8013D2B0 0D004A10 */  beq        $v0, $t2, .L8013D2E8
    /* 36BC 8013D2B4 21284000 */   addu      $a1, $v0, $zero
    /* 36C0 8013D2B8 0C80043C */  lui        $a0, %hi(LargeFont)
    /* 36C4 8013D2BC F4848424 */  addiu      $a0, $a0, %lo(LargeFont)
    /* 36C8 8013D2C0 EB2A020C */  jal        GetCharWidth__5CFontUc
    /* 36CC 8013D2C4 FF00A530 */   andi      $a1, $a1, 0xFF
    /* 36D0 8013D2C8 4000AA8F */  lw         $t2, 0x40($sp)
    /* 36D4 8013D2CC 00000000 */  nop
    /* 36D8 8013D2D0 01004A25 */  addiu      $t2, $t2, 0x1
    /* 36DC 8013D2D4 4000AAAF */  sw         $t2, 0x40($sp)
    /* 36E0 8013D2D8 00004381 */  lb         $v1, 0x0($t2)
    /* 36E4 8013D2DC 00000000 */  nop
    /* 36E8 8013D2E0 EFFF6014 */  bnez       $v1, .L8013D2A0
    /* 36EC 8013D2E4 21A8A202 */   addu      $s5, $s5, $v0
  .L8013D2E8:
    /* 36F0 8013D2E8 40010224 */  addiu      $v0, $zero, 0x140
    /* 36F4 8013D2EC 23105500 */  subu       $v0, $v0, $s5
    /* 36F8 8013D2F0 C21F0200 */  srl        $v1, $v0, 31
    /* 36FC 8013D2F4 21104300 */  addu       $v0, $v0, $v1
    /* 3700 8013D2F8 4000AA8F */  lw         $t2, 0x40($sp)
    /* 3704 8013D2FC 43100200 */  sra        $v0, $v0, 1
    /* 3708 8013D300 C0016A12 */  beq        $s3, $t2, .L8013DA04
    /* 370C 8013D304 4800A2AF */   sw        $v0, 0x48($sp)
    /* 3710 8013D308 FF00143C */  lui        $s4, (0xFFFFFF >> 16)
    /* 3714 8013D30C FFFF9436 */  ori        $s4, $s4, (0xFFFFFF & 0xFFFF)
  .L8013D310:
    /* 3718 8013D310 3000AA8F */  lw         $t2, 0x30($sp)
    /* 371C 8013D314 00000000 */  nop
    /* 3720 8013D318 01005125 */  addiu      $s1, $t2, 0x1
    /* 3724 8013D31C 8000222A */  slti       $v0, $s1, 0x80
    /* 3728 8013D320 02004014 */  bnez       $v0, .L8013D32C
    /* 372C 8013D324 3000B1AF */   sw        $s1, 0x30($sp)
    /* 3730 8013D328 7F001124 */  addiu      $s1, $zero, 0x7F
  .L8013D32C:
    /* 3734 8013D32C 03002106 */  bgez       $s1, .L8013D33C
    /* 3738 8013D330 FFFF2226 */   addiu     $v0, $s1, -0x1
    /* 373C 8013D334 21880000 */  addu       $s1, $zero, $zero
    /* 3740 8013D338 FFFF2226 */  addiu      $v0, $s1, -0x1
  .L8013D33C:
    /* 3744 8013D33C 7E00422C */  sltiu      $v0, $v0, 0x7E
    /* 3748 8013D340 02004010 */  beqz       $v0, .L8013D34C
    /* 374C 8013D344 00000000 */   nop
    /* 3750 8013D348 5000A0AF */  sw         $zero, 0x50($sp)
  .L8013D34C:
    /* 3754 8013D34C 00006382 */  lb         $v1, 0x0($s3)
    /* 3758 8013D350 20000224 */  addiu      $v0, $zero, 0x20
    /* 375C 8013D354 07006214 */  bne        $v1, $v0, .L8013D374
    /* 3760 8013D358 21386000 */   addu      $a3, $v1, $zero
    /* 3764 8013D35C 0C80043C */  lui        $a0, %hi(LargeFont)
    /* 3768 8013D360 F4848424 */  addiu      $a0, $a0, %lo(LargeFont)
    /* 376C 8013D364 EB2A020C */  jal        GetCharWidth__5CFontUc
    /* 3770 8013D368 20000524 */   addiu     $a1, $zero, 0x20
    /* 3774 8013D36C 79F60408 */  j          .L8013D9E4
    /* 3778 8013D370 21A84000 */   addu      $s5, $v0, $zero
  .L8013D374:
    /* 377C 8013D374 0C80043C */  lui        $a0, %hi(LargeFont)
    /* 3780 8013D378 F4848424 */  addiu      $a0, $a0, %lo(LargeFont)
    /* 3784 8013D37C 80000224 */  addiu      $v0, $zero, 0x80
    /* 3788 8013D380 4800A597 */  lhu        $a1, 0x48($sp)
    /* 378C 8013D384 2800A697 */  lhu        $a2, 0x28($sp)
    /* 3790 8013D388 FF00E730 */  andi       $a3, $a3, 0xFF
    /* 3794 8013D38C 1000A2AF */  sw         $v0, 0x10($sp)
    /* 3798 8013D390 1400A2AF */  sw         $v0, 0x14($sp)
    /* 379C 8013D394 BB27020C */  jal        PrintChar__5CFontUsUsUcUcUcUc
    /* 37A0 8013D398 1800A2AF */   sw        $v0, 0x18($sp)
    /* 37A4 8013D39C 1280043C */  lui        $a0, %hi(CharFt4)
    /* 37A8 8013D3A0 E4AB848C */  lw         $a0, %lo(CharFt4)($a0)
    /* 37AC 8013D3A4 00000000 */  nop
    /* 37B0 8013D3A8 07008390 */  lbu        $v1, 0x7($a0)
    /* 37B4 8013D3AC 00000000 */  nop
    /* 37B8 8013D3B0 02006334 */  ori        $v1, $v1, 0x2
    /* 37BC 8013D3B4 070083A0 */  sb         $v1, 0x7($a0)
    /* 37C0 8013D3B8 16008394 */  lhu        $v1, 0x16($a0)
    /* 37C4 8013D3BC 1280053C */  lui        $a1, %hi(CharFt4)
    /* 37C8 8013D3C0 E4ABA58C */  lw         $a1, %lo(CharFt4)($a1)
    /* 37CC 8013D3C4 20006334 */  ori        $v1, $v1, 0x20
    /* 37D0 8013D3C8 160083A4 */  sh         $v1, 0x16($a0)
    /* 37D4 8013D3CC 0700A390 */  lbu        $v1, 0x7($a1)
    /* 37D8 8013D3D0 00000000 */  nop
    /* 37DC 8013D3D4 FE006330 */  andi       $v1, $v1, 0xFE
    /* 37E0 8013D3D8 0700A3A0 */  sb         $v1, 0x7($a1)
    /* 37E4 8013D3DC 1280043C */  lui        $a0, %hi(FeTData)
    /* 37E8 8013D3E0 20B3848C */  lw         $a0, %lo(FeTData)($a0)
    /* 37EC 8013D3E4 1280053C */  lui        $a1, %hi(CharFrm)
    /* 37F0 8013D3E8 E8ABA58C */  lw         $a1, %lo(CharFrm)($a1)
    /* 37F4 8013D3EC 4FF8040C */  jal        GetFr__7TextDati_8013e13c
    /* 37F8 8013D3F0 21A84000 */   addu      $s5, $v0, $zero
    /* 37FC 8013D3F4 0002033C */  lui        $v1, (0x2000000 >> 16)
    /* 3800 8013D3F8 0400428C */  lw         $v0, 0x4($v0)
    /* 3804 8013D3FC 1280053C */  lui        $a1, %hi(CharFt4)
    /* 3808 8013D400 E4ABA58C */  lw         $a1, %lo(CharFt4)($a1)
    /* 380C 8013D404 24104300 */  and        $v0, $v0, $v1
    /* 3810 8013D408 0800A984 */  lh         $t1, 0x8($a1)
    /* 3814 8013D40C 1000BE84 */  lh         $fp, 0x10($a1)
    /* 3818 8013D410 1800B784 */  lh         $s7, 0x18($a1)
    /* 381C 8013D414 2000B684 */  lh         $s6, 0x20($a1)
    /* 3820 8013D418 BA004010 */  beqz       $v0, .L8013D704
    /* 3824 8013D41C 7F000A24 */   addiu     $t2, $zero, 0x7F
    /* 3828 8013D420 23205101 */  subu       $a0, $t2, $s1
    /* 382C 8013D424 80200400 */  sll        $a0, $a0, 2
    /* 3830 8013D428 14800A3C */  lui        $t2, %hi(CreditsTable)
    /* 3834 8013D42C 20CE4A25 */  addiu      $t2, $t2, %lo(CreditsTable)
    /* 3838 8013D430 21208A00 */  addu       $a0, $a0, $t2
    /* 383C 8013D434 83000324 */  addiu      $v1, $zero, 0x83
    /* 3840 8013D438 23187100 */  subu       $v1, $v1, $s1
    /* 3844 8013D43C 80180300 */  sll        $v1, $v1, 2
    /* 3848 8013D440 0000828C */  lw         $v0, 0x0($a0)
    /* 384C 8013D444 21186A00 */  addu       $v1, $v1, $t2
    /* 3850 8013D448 21102201 */  addu       $v0, $t1, $v0
    /* 3854 8013D44C 0800A2A4 */  sh         $v0, 0x8($a1)
    /* 3858 8013D450 0000628C */  lw         $v0, 0x0($v1)
    /* 385C 8013D454 00000000 */  nop
    /* 3860 8013D458 2110C203 */  addu       $v0, $fp, $v0
    /* 3864 8013D45C 1000A2A4 */  sh         $v0, 0x10($a1)
    /* 3868 8013D460 0000828C */  lw         $v0, 0x0($a0)
    /* 386C 8013D464 00000000 */  nop
    /* 3870 8013D468 2110E202 */  addu       $v0, $s7, $v0
    /* 3874 8013D46C 1800A2A4 */  sh         $v0, 0x18($a1)
    /* 3878 8013D470 0A00A294 */  lhu        $v0, 0xA($a1)
    /* 387C 8013D474 0000648C */  lw         $a0, 0x0($v1)
    /* 3880 8013D478 0C00A390 */  lbu        $v1, 0xC($a1)
    /* 3884 8013D47C 02004224 */  addiu      $v0, $v0, 0x2
    /* 3888 8013D480 1A00A2A4 */  sh         $v0, 0x1A($a1)
    /* 388C 8013D484 1200A294 */  lhu        $v0, 0x12($a1)
    /* 3890 8013D488 02006324 */  addiu      $v1, $v1, 0x2
    /* 3894 8013D48C 1C00A3A0 */  sb         $v1, 0x1C($a1)
    /* 3898 8013D490 1280033C */  lui        $v1, %hi(CharFt4)
    /* 389C 8013D494 E4AB638C */  lw         $v1, %lo(CharFt4)($v1)
    /* 38A0 8013D498 2120C402 */  addu       $a0, $s6, $a0
    /* 38A4 8013D49C 2000A4A4 */  sh         $a0, 0x20($a1)
    /* 38A8 8013D4A0 02004224 */  addiu      $v0, $v0, 0x2
    /* 38AC 8013D4A4 2200A2A4 */  sh         $v0, 0x22($a1)
    /* 38B0 8013D4A8 14006290 */  lbu        $v0, 0x14($v1)
    /* 38B4 8013D4AC 02001024 */  addiu      $s0, $zero, 0x2
    /* 38B8 8013D4B0 02004224 */  addiu      $v0, $v0, 0x2
    /* 38BC 8013D4B4 240062A0 */  sb         $v0, 0x24($v1)
    /* 38C0 8013D4B8 3800AA8F */  lw         $t2, 0x38($sp)
    /* 38C4 8013D4BC 1280033C */  lui        $v1, %hi(CharFt4)
    /* 38C8 8013D4C0 E4AB638C */  lw         $v1, %lo(CharFt4)($v1)
    /* 38CC 8013D4C4 24102A02 */  and        $v0, $s1, $t2
    /* 38D0 8013D4C8 040062A0 */  sb         $v0, 0x4($v1)
    /* 38D4 8013D4CC B800AA8F */  lw         $t2, 0xB8($sp)
    /* 38D8 8013D4D0 1280033C */  lui        $v1, %hi(CharFt4)
    /* 38DC 8013D4D4 E4AB638C */  lw         $v1, %lo(CharFt4)($v1)
    /* 38E0 8013D4D8 24102A02 */  and        $v0, $s1, $t2
    /* 38E4 8013D4DC 050062A0 */  sb         $v0, 0x5($v1)
    /* 38E8 8013D4E0 BC00AA8F */  lw         $t2, 0xBC($sp)
    /* 38EC 8013D4E4 1280033C */  lui        $v1, %hi(CharFt4)
    /* 38F0 8013D4E8 E4AB638C */  lw         $v1, %lo(CharFt4)($v1)
    /* 38F4 8013D4EC 24102A02 */  and        $v0, $s1, $t2
    /* 38F8 8013D4F0 060062A0 */  sb         $v0, 0x6($v1)
    /* 38FC 8013D4F4 00006592 */  lbu        $a1, 0x0($s3)
    /* 3900 8013D4F8 0C80043C */  lui        $a0, %hi(LargeFont)
    /* 3904 8013D4FC F4848424 */  addiu      $a0, $a0, %lo(LargeFont)
    /* 3908 8013D500 37F8040C */  jal        GetCharHeight__5CFontUc
    /* 390C 8013D504 7800A9AF */   sw        $t1, 0x78($sp)
    /* 3910 8013D508 21904000 */  addu       $s2, $v0, $zero
    /* 3914 8013D50C FFFF4226 */  addiu      $v0, $s2, -0x1
    /* 3918 8013D510 2A100202 */  slt        $v0, $s0, $v0
    /* 391C 8013D514 7800A98F */  lw         $t1, 0x78($sp)
    /* 3920 8013D518 32014010 */  beqz       $v0, .L8013D9E4
    /* 3924 8013D51C 00000000 */   nop
    /* 3928 8013D520 01003126 */  addiu      $s1, $s1, 0x1
  .L8013D524:
    /* 392C 8013D524 23283002 */  subu       $a1, $s1, $s0
    /* 3930 8013D528 6F00A018 */  blez       $a1, .L8013D6E8
    /* 3934 8013D52C 80FF0224 */   addiu     $v0, $zero, -0x80
    /* 3938 8013D530 24102202 */  and        $v0, $s1, $v0
    /* 393C 8013D534 02004010 */  beqz       $v0, .L8013D540
    /* 3940 8013D538 2000A427 */   addiu     $a0, $sp, 0x20
    /* 3944 8013D53C 7F001124 */  addiu      $s1, $zero, 0x7F
  .L8013D540:
    /* 3948 8013D540 0FF8040C */  jal        PRIM_GetPrim__FPP8POLY_FT4_8013e03c
    /* 394C 8013D544 7800A9AF */   sw        $t1, 0x78($sp)
    /* 3950 8013D548 1280063C */  lui        $a2, %hi(CharFt4)
    /* 3954 8013D54C E4ABC68C */  lw         $a2, %lo(CharFt4)($a2)
    /* 3958 8013D550 2000A78F */  lw         $a3, 0x20($sp)
    /* 395C 8013D554 2000C824 */  addiu      $t0, $a2, 0x20
    /* 3960 8013D558 7800A98F */  lw         $t1, 0x78($sp)
  .L8013D55C:
    /* 3964 8013D55C 0000C28C */  lw         $v0, 0x0($a2)
    /* 3968 8013D560 0400C38C */  lw         $v1, 0x4($a2)
    /* 396C 8013D564 0800C48C */  lw         $a0, 0x8($a2)
    /* 3970 8013D568 0C00C58C */  lw         $a1, 0xC($a2)
    /* 3974 8013D56C 0000E2AC */  sw         $v0, 0x0($a3)
    /* 3978 8013D570 0400E3AC */  sw         $v1, 0x4($a3)
    /* 397C 8013D574 0800E4AC */  sw         $a0, 0x8($a3)
    /* 3980 8013D578 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 3984 8013D57C 1000C624 */  addiu      $a2, $a2, 0x10
    /* 3988 8013D580 F6FFC814 */  bne        $a2, $t0, .L8013D55C
    /* 398C 8013D584 1000E724 */   addiu     $a3, $a3, 0x10
    /* 3990 8013D588 0000C28C */  lw         $v0, 0x0($a2)
    /* 3994 8013D58C 0400C38C */  lw         $v1, 0x4($a2)
    /* 3998 8013D590 0000E2AC */  sw         $v0, 0x0($a3)
    /* 399C 8013D594 0400E3AC */  sw         $v1, 0x4($a3)
    /* 39A0 8013D598 7F000A24 */  addiu      $t2, $zero, 0x7F
    /* 39A4 8013D59C 23305101 */  subu       $a2, $t2, $s1
    /* 39A8 8013D5A0 80300600 */  sll        $a2, $a2, 2
    /* 39AC 8013D5A4 14800A3C */  lui        $t2, %hi(CreditsTable)
    /* 39B0 8013D5A8 20CE4A25 */  addiu      $t2, $t2, %lo(CreditsTable)
    /* 39B4 8013D5AC 2130CA00 */  addu       $a2, $a2, $t2
    /* 39B8 8013D5B0 83000424 */  addiu      $a0, $zero, 0x83
    /* 39BC 8013D5B4 23209100 */  subu       $a0, $a0, $s1
    /* 39C0 8013D5B8 80200400 */  sll        $a0, $a0, 2
    /* 39C4 8013D5BC 21208A00 */  addu       $a0, $a0, $t2
    /* 39C8 8013D5C0 2000A58F */  lw         $a1, 0x20($sp)
    /* 39CC 8013D5C4 0000C28C */  lw         $v0, 0x0($a2)
    /* 39D0 8013D5C8 0A00A394 */  lhu        $v1, 0xA($a1)
    /* 39D4 8013D5CC 21102201 */  addu       $v0, $t1, $v0
    /* 39D8 8013D5D0 0800A2A4 */  sh         $v0, 0x8($a1)
    /* 39DC 8013D5D4 1200A294 */  lhu        $v0, 0x12($a1)
    /* 39E0 8013D5D8 21187000 */  addu       $v1, $v1, $s0
    /* 39E4 8013D5DC 0A00A3A4 */  sh         $v1, 0xA($a1)
    /* 39E8 8013D5E0 0000838C */  lw         $v1, 0x0($a0)
    /* 39EC 8013D5E4 21105000 */  addu       $v0, $v0, $s0
    /* 39F0 8013D5E8 1200A2A4 */  sh         $v0, 0x12($a1)
    /* 39F4 8013D5EC 1A00A294 */  lhu        $v0, 0x1A($a1)
    /* 39F8 8013D5F0 2118C303 */  addu       $v1, $fp, $v1
    /* 39FC 8013D5F4 1000A3A4 */  sh         $v1, 0x10($a1)
    /* 3A00 8013D5F8 0000C38C */  lw         $v1, 0x0($a2)
    /* 3A04 8013D5FC 21105000 */  addu       $v0, $v0, $s0
    /* 3A08 8013D600 1A00A2A4 */  sh         $v0, 0x1A($a1)
    /* 3A0C 8013D604 2200A294 */  lhu        $v0, 0x22($a1)
    /* 3A10 8013D608 2118E302 */  addu       $v1, $s7, $v1
    /* 3A14 8013D60C 1800A3A4 */  sh         $v1, 0x18($a1)
    /* 3A18 8013D610 0000848C */  lw         $a0, 0x0($a0)
    /* 3A1C 8013D614 0C00A390 */  lbu        $v1, 0xC($a1)
    /* 3A20 8013D618 21105000 */  addu       $v0, $v0, $s0
    /* 3A24 8013D61C 2200A2A4 */  sh         $v0, 0x22($a1)
    /* 3A28 8013D620 21187000 */  addu       $v1, $v1, $s0
    /* 3A2C 8013D624 0C00A3A0 */  sb         $v1, 0xC($a1)
    /* 3A30 8013D628 2000A38F */  lw         $v1, 0x20($sp)
    /* 3A34 8013D62C 2120C402 */  addu       $a0, $s6, $a0
    /* 3A38 8013D630 2000A4A4 */  sh         $a0, 0x20($a1)
    /* 3A3C 8013D634 14006290 */  lbu        $v0, 0x14($v1)
    /* 3A40 8013D638 00000000 */  nop
    /* 3A44 8013D63C 21105000 */  addu       $v0, $v0, $s0
    /* 3A48 8013D640 140062A0 */  sb         $v0, 0x14($v1)
    /* 3A4C 8013D644 2000A38F */  lw         $v1, 0x20($sp)
    /* 3A50 8013D648 00000000 */  nop
    /* 3A54 8013D64C 1C006290 */  lbu        $v0, 0x1C($v1)
    /* 3A58 8013D650 00000000 */  nop
    /* 3A5C 8013D654 21105000 */  addu       $v0, $v0, $s0
    /* 3A60 8013D658 1C0062A0 */  sb         $v0, 0x1C($v1)
    /* 3A64 8013D65C 2000A38F */  lw         $v1, 0x20($sp)
    /* 3A68 8013D660 00000000 */  nop
    /* 3A6C 8013D664 24006290 */  lbu        $v0, 0x24($v1)
    /* 3A70 8013D668 23283002 */  subu       $a1, $s1, $s0
    /* 3A74 8013D66C 21105000 */  addu       $v0, $v0, $s0
    /* 3A78 8013D670 0200A104 */  bgez       $a1, .L8013D67C
    /* 3A7C 8013D674 240062A0 */   sb        $v0, 0x24($v1)
    /* 3A80 8013D678 21280000 */  addu       $a1, $zero, $zero
  .L8013D67C:
    /* 3A84 8013D67C 3800AA8F */  lw         $t2, 0x38($sp)
    /* 3A88 8013D680 2000A38F */  lw         $v1, 0x20($sp)
    /* 3A8C 8013D684 2410AA00 */  and        $v0, $a1, $t2
    /* 3A90 8013D688 040062A0 */  sb         $v0, 0x4($v1)
    /* 3A94 8013D68C B800AA8F */  lw         $t2, 0xB8($sp)
    /* 3A98 8013D690 2000A38F */  lw         $v1, 0x20($sp)
    /* 3A9C 8013D694 2410AA00 */  and        $v0, $a1, $t2
    /* 3AA0 8013D698 050062A0 */  sb         $v0, 0x5($v1)
    /* 3AA4 8013D69C BC00AA8F */  lw         $t2, 0xBC($sp)
    /* 3AA8 8013D6A0 2000A38F */  lw         $v1, 0x20($sp)
    /* 3AAC 8013D6A4 2410AA00 */  and        $v0, $a1, $t2
    /* 3AB0 8013D6A8 00FF0A3C */  lui        $t2, (0xFF000000 >> 16)
    /* 3AB4 8013D6AC 060062A0 */  sb         $v0, 0x6($v1)
    /* 3AB8 8013D6B0 2000A48F */  lw         $a0, 0x20($sp)
    /* 3ABC 8013D6B4 1280053C */  lui        $a1, %hi(ThisOt)
    /* 3AC0 8013D6B8 B4AAA58C */  lw         $a1, %lo(ThisOt)($a1)
    /* 3AC4 8013D6BC 0000838C */  lw         $v1, 0x0($a0)
    /* 3AC8 8013D6C0 9001A28C */  lw         $v0, 0x190($a1)
    /* 3ACC 8013D6C4 24186A00 */  and        $v1, $v1, $t2
    /* 3AD0 8013D6C8 24105400 */  and        $v0, $v0, $s4
    /* 3AD4 8013D6CC 25186200 */  or         $v1, $v1, $v0
    /* 3AD8 8013D6D0 000083AC */  sw         $v1, 0x0($a0)
    /* 3ADC 8013D6D4 9001A28C */  lw         $v0, 0x190($a1)
    /* 3AE0 8013D6D8 24209400 */  and        $a0, $a0, $s4
    /* 3AE4 8013D6DC 24104A00 */  and        $v0, $v0, $t2
    /* 3AE8 8013D6E0 25104400 */  or         $v0, $v0, $a0
    /* 3AEC 8013D6E4 9001A2AC */  sw         $v0, 0x190($a1)
  .L8013D6E8:
    /* 3AF0 8013D6E8 02001026 */  addiu      $s0, $s0, 0x2
    /* 3AF4 8013D6EC FFFF4226 */  addiu      $v0, $s2, -0x1
    /* 3AF8 8013D6F0 2A100202 */  slt        $v0, $s0, $v0
    /* 3AFC 8013D6F4 8BFF4014 */  bnez       $v0, .L8013D524
    /* 3B00 8013D6F8 01003126 */   addiu     $s1, $s1, 0x1
    /* 3B04 8013D6FC 79F60408 */  j          .L8013D9E4
    /* 3B08 8013D700 FFFF3126 */   addiu     $s1, $s1, -0x1
  .L8013D704:
    /* 3B0C 8013D704 23205101 */  subu       $a0, $t2, $s1
    /* 3B10 8013D708 80200400 */  sll        $a0, $a0, 2
    /* 3B14 8013D70C 14800A3C */  lui        $t2, %hi(CreditsTable)
    /* 3B18 8013D710 20CE4A25 */  addiu      $t2, $t2, %lo(CreditsTable)
    /* 3B1C 8013D714 21208A00 */  addu       $a0, $a0, $t2
    /* 3B20 8013D718 83000324 */  addiu      $v1, $zero, 0x83
    /* 3B24 8013D71C 23187100 */  subu       $v1, $v1, $s1
    /* 3B28 8013D720 80180300 */  sll        $v1, $v1, 2
    /* 3B2C 8013D724 0000828C */  lw         $v0, 0x0($a0)
    /* 3B30 8013D728 21186A00 */  addu       $v1, $v1, $t2
    /* 3B34 8013D72C 21102201 */  addu       $v0, $t1, $v0
    /* 3B38 8013D730 0800A2A4 */  sh         $v0, 0x8($a1)
    /* 3B3C 8013D734 0000628C */  lw         $v0, 0x0($v1)
    /* 3B40 8013D738 00000000 */  nop
    /* 3B44 8013D73C 2110C203 */  addu       $v0, $fp, $v0
    /* 3B48 8013D740 1000A2A4 */  sh         $v0, 0x10($a1)
    /* 3B4C 8013D744 0000828C */  lw         $v0, 0x0($a0)
    /* 3B50 8013D748 00000000 */  nop
    /* 3B54 8013D74C 2110E202 */  addu       $v0, $s7, $v0
    /* 3B58 8013D750 1800A2A4 */  sh         $v0, 0x18($a1)
    /* 3B5C 8013D754 0A00A294 */  lhu        $v0, 0xA($a1)
    /* 3B60 8013D758 0000648C */  lw         $a0, 0x0($v1)
    /* 3B64 8013D75C 0D00A390 */  lbu        $v1, 0xD($a1)
    /* 3B68 8013D760 02004224 */  addiu      $v0, $v0, 0x2
    /* 3B6C 8013D764 1A00A2A4 */  sh         $v0, 0x1A($a1)
    /* 3B70 8013D768 1200A294 */  lhu        $v0, 0x12($a1)
    /* 3B74 8013D76C 02006324 */  addiu      $v1, $v1, 0x2
    /* 3B78 8013D770 1D00A3A0 */  sb         $v1, 0x1D($a1)
    /* 3B7C 8013D774 1280033C */  lui        $v1, %hi(CharFt4)
    /* 3B80 8013D778 E4AB638C */  lw         $v1, %lo(CharFt4)($v1)
    /* 3B84 8013D77C 2120C402 */  addu       $a0, $s6, $a0
    /* 3B88 8013D780 2000A4A4 */  sh         $a0, 0x20($a1)
    /* 3B8C 8013D784 02004224 */  addiu      $v0, $v0, 0x2
    /* 3B90 8013D788 2200A2A4 */  sh         $v0, 0x22($a1)
    /* 3B94 8013D78C 15006290 */  lbu        $v0, 0x15($v1)
    /* 3B98 8013D790 01001024 */  addiu      $s0, $zero, 0x1
    /* 3B9C 8013D794 02004224 */  addiu      $v0, $v0, 0x2
    /* 3BA0 8013D798 250062A0 */  sb         $v0, 0x25($v1)
    /* 3BA4 8013D79C 3800AA8F */  lw         $t2, 0x38($sp)
    /* 3BA8 8013D7A0 1280033C */  lui        $v1, %hi(CharFt4)
    /* 3BAC 8013D7A4 E4AB638C */  lw         $v1, %lo(CharFt4)($v1)
    /* 3BB0 8013D7A8 24102A02 */  and        $v0, $s1, $t2
    /* 3BB4 8013D7AC 040062A0 */  sb         $v0, 0x4($v1)
    /* 3BB8 8013D7B0 B800AA8F */  lw         $t2, 0xB8($sp)
    /* 3BBC 8013D7B4 1280033C */  lui        $v1, %hi(CharFt4)
    /* 3BC0 8013D7B8 E4AB638C */  lw         $v1, %lo(CharFt4)($v1)
    /* 3BC4 8013D7BC 24102A02 */  and        $v0, $s1, $t2
    /* 3BC8 8013D7C0 050062A0 */  sb         $v0, 0x5($v1)
    /* 3BCC 8013D7C4 BC00AA8F */  lw         $t2, 0xBC($sp)
    /* 3BD0 8013D7C8 1280033C */  lui        $v1, %hi(CharFt4)
    /* 3BD4 8013D7CC E4AB638C */  lw         $v1, %lo(CharFt4)($v1)
    /* 3BD8 8013D7D0 24102A02 */  and        $v0, $s1, $t2
    /* 3BDC 8013D7D4 060062A0 */  sb         $v0, 0x6($v1)
    /* 3BE0 8013D7D8 00006592 */  lbu        $a1, 0x0($s3)
    /* 3BE4 8013D7DC 0C80043C */  lui        $a0, %hi(LargeFont)
    /* 3BE8 8013D7E0 F4848424 */  addiu      $a0, $a0, %lo(LargeFont)
    /* 3BEC 8013D7E4 37F8040C */  jal        GetCharHeight__5CFontUc
    /* 3BF0 8013D7E8 7800A9AF */   sw        $t1, 0x78($sp)
    /* 3BF4 8013D7EC 21904000 */  addu       $s2, $v0, $zero
    /* 3BF8 8013D7F0 FFFF4226 */  addiu      $v0, $s2, -0x1
    /* 3BFC 8013D7F4 2A100202 */  slt        $v0, $s0, $v0
    /* 3C00 8013D7F8 7800A98F */  lw         $t1, 0x78($sp)
    /* 3C04 8013D7FC 79004010 */  beqz       $v0, .L8013D9E4
    /* 3C08 8013D800 00000000 */   nop
    /* 3C0C 8013D804 01003126 */  addiu      $s1, $s1, 0x1
  .L8013D808:
    /* 3C10 8013D808 23283002 */  subu       $a1, $s1, $s0
    /* 3C14 8013D80C 6F00A018 */  blez       $a1, .L8013D9CC
    /* 3C18 8013D810 80FF0224 */   addiu     $v0, $zero, -0x80
    /* 3C1C 8013D814 24102202 */  and        $v0, $s1, $v0
    /* 3C20 8013D818 02004010 */  beqz       $v0, .L8013D824
    /* 3C24 8013D81C 2000A427 */   addiu     $a0, $sp, 0x20
    /* 3C28 8013D820 7F001124 */  addiu      $s1, $zero, 0x7F
  .L8013D824:
    /* 3C2C 8013D824 0FF8040C */  jal        PRIM_GetPrim__FPP8POLY_FT4_8013e03c
    /* 3C30 8013D828 7800A9AF */   sw        $t1, 0x78($sp)
    /* 3C34 8013D82C 1280063C */  lui        $a2, %hi(CharFt4)
    /* 3C38 8013D830 E4ABC68C */  lw         $a2, %lo(CharFt4)($a2)
    /* 3C3C 8013D834 2000A78F */  lw         $a3, 0x20($sp)
    /* 3C40 8013D838 2000C824 */  addiu      $t0, $a2, 0x20
    /* 3C44 8013D83C 7800A98F */  lw         $t1, 0x78($sp)
  .L8013D840:
    /* 3C48 8013D840 0000C28C */  lw         $v0, 0x0($a2)
    /* 3C4C 8013D844 0400C38C */  lw         $v1, 0x4($a2)
    /* 3C50 8013D848 0800C48C */  lw         $a0, 0x8($a2)
    /* 3C54 8013D84C 0C00C58C */  lw         $a1, 0xC($a2)
    /* 3C58 8013D850 0000E2AC */  sw         $v0, 0x0($a3)
    /* 3C5C 8013D854 0400E3AC */  sw         $v1, 0x4($a3)
    /* 3C60 8013D858 0800E4AC */  sw         $a0, 0x8($a3)
    /* 3C64 8013D85C 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 3C68 8013D860 1000C624 */  addiu      $a2, $a2, 0x10
    /* 3C6C 8013D864 F6FFC814 */  bne        $a2, $t0, .L8013D840
    /* 3C70 8013D868 1000E724 */   addiu     $a3, $a3, 0x10
    /* 3C74 8013D86C 0000C28C */  lw         $v0, 0x0($a2)
    /* 3C78 8013D870 0400C38C */  lw         $v1, 0x4($a2)
    /* 3C7C 8013D874 0000E2AC */  sw         $v0, 0x0($a3)
    /* 3C80 8013D878 0400E3AC */  sw         $v1, 0x4($a3)
    /* 3C84 8013D87C 7F000A24 */  addiu      $t2, $zero, 0x7F
    /* 3C88 8013D880 23305101 */  subu       $a2, $t2, $s1
    /* 3C8C 8013D884 80300600 */  sll        $a2, $a2, 2
    /* 3C90 8013D888 14800A3C */  lui        $t2, %hi(CreditsTable)
    /* 3C94 8013D88C 20CE4A25 */  addiu      $t2, $t2, %lo(CreditsTable)
    /* 3C98 8013D890 2130CA00 */  addu       $a2, $a2, $t2
    /* 3C9C 8013D894 83000424 */  addiu      $a0, $zero, 0x83
    /* 3CA0 8013D898 23209100 */  subu       $a0, $a0, $s1
    /* 3CA4 8013D89C 80200400 */  sll        $a0, $a0, 2
    /* 3CA8 8013D8A0 21208A00 */  addu       $a0, $a0, $t2
    /* 3CAC 8013D8A4 2000A58F */  lw         $a1, 0x20($sp)
    /* 3CB0 8013D8A8 0000C28C */  lw         $v0, 0x0($a2)
    /* 3CB4 8013D8AC 0A00A394 */  lhu        $v1, 0xA($a1)
    /* 3CB8 8013D8B0 21102201 */  addu       $v0, $t1, $v0
    /* 3CBC 8013D8B4 0800A2A4 */  sh         $v0, 0x8($a1)
    /* 3CC0 8013D8B8 1200A294 */  lhu        $v0, 0x12($a1)
    /* 3CC4 8013D8BC 21187000 */  addu       $v1, $v1, $s0
    /* 3CC8 8013D8C0 0A00A3A4 */  sh         $v1, 0xA($a1)
    /* 3CCC 8013D8C4 0000838C */  lw         $v1, 0x0($a0)
    /* 3CD0 8013D8C8 21105000 */  addu       $v0, $v0, $s0
    /* 3CD4 8013D8CC 1200A2A4 */  sh         $v0, 0x12($a1)
    /* 3CD8 8013D8D0 1A00A294 */  lhu        $v0, 0x1A($a1)
    /* 3CDC 8013D8D4 2118C303 */  addu       $v1, $fp, $v1
    /* 3CE0 8013D8D8 1000A3A4 */  sh         $v1, 0x10($a1)
    /* 3CE4 8013D8DC 0000C38C */  lw         $v1, 0x0($a2)
    /* 3CE8 8013D8E0 21105000 */  addu       $v0, $v0, $s0
    /* 3CEC 8013D8E4 1A00A2A4 */  sh         $v0, 0x1A($a1)
    /* 3CF0 8013D8E8 2200A294 */  lhu        $v0, 0x22($a1)
    /* 3CF4 8013D8EC 2118E302 */  addu       $v1, $s7, $v1
    /* 3CF8 8013D8F0 1800A3A4 */  sh         $v1, 0x18($a1)
    /* 3CFC 8013D8F4 0000848C */  lw         $a0, 0x0($a0)
    /* 3D00 8013D8F8 0D00A390 */  lbu        $v1, 0xD($a1)
    /* 3D04 8013D8FC 21105000 */  addu       $v0, $v0, $s0
    /* 3D08 8013D900 2200A2A4 */  sh         $v0, 0x22($a1)
    /* 3D0C 8013D904 21187000 */  addu       $v1, $v1, $s0
    /* 3D10 8013D908 0D00A3A0 */  sb         $v1, 0xD($a1)
    /* 3D14 8013D90C 2000A38F */  lw         $v1, 0x20($sp)
    /* 3D18 8013D910 2120C402 */  addu       $a0, $s6, $a0
    /* 3D1C 8013D914 2000A4A4 */  sh         $a0, 0x20($a1)
    /* 3D20 8013D918 15006290 */  lbu        $v0, 0x15($v1)
    /* 3D24 8013D91C 00000000 */  nop
    /* 3D28 8013D920 21105000 */  addu       $v0, $v0, $s0
    /* 3D2C 8013D924 150062A0 */  sb         $v0, 0x15($v1)
    /* 3D30 8013D928 2000A38F */  lw         $v1, 0x20($sp)
    /* 3D34 8013D92C 00000000 */  nop
    /* 3D38 8013D930 1D006290 */  lbu        $v0, 0x1D($v1)
    /* 3D3C 8013D934 00000000 */  nop
    /* 3D40 8013D938 21105000 */  addu       $v0, $v0, $s0
    /* 3D44 8013D93C 1D0062A0 */  sb         $v0, 0x1D($v1)
    /* 3D48 8013D940 2000A48F */  lw         $a0, 0x20($sp)
    /* 3D4C 8013D944 40181000 */  sll        $v1, $s0, 1
    /* 3D50 8013D948 25008290 */  lbu        $v0, 0x25($a0)
    /* 3D54 8013D94C 23282302 */  subu       $a1, $s1, $v1
    /* 3D58 8013D950 21105000 */  addu       $v0, $v0, $s0
    /* 3D5C 8013D954 0200A104 */  bgez       $a1, .L8013D960
    /* 3D60 8013D958 250082A0 */   sb        $v0, 0x25($a0)
    /* 3D64 8013D95C 21280000 */  addu       $a1, $zero, $zero
  .L8013D960:
    /* 3D68 8013D960 3800AA8F */  lw         $t2, 0x38($sp)
    /* 3D6C 8013D964 2000A38F */  lw         $v1, 0x20($sp)
    /* 3D70 8013D968 2410AA00 */  and        $v0, $a1, $t2
    /* 3D74 8013D96C 040062A0 */  sb         $v0, 0x4($v1)
    /* 3D78 8013D970 B800AA8F */  lw         $t2, 0xB8($sp)
    /* 3D7C 8013D974 2000A38F */  lw         $v1, 0x20($sp)
    /* 3D80 8013D978 2410AA00 */  and        $v0, $a1, $t2
    /* 3D84 8013D97C 050062A0 */  sb         $v0, 0x5($v1)
    /* 3D88 8013D980 BC00AA8F */  lw         $t2, 0xBC($sp)
    /* 3D8C 8013D984 2000A38F */  lw         $v1, 0x20($sp)
    /* 3D90 8013D988 2410AA00 */  and        $v0, $a1, $t2
    /* 3D94 8013D98C 00FF0A3C */  lui        $t2, (0xFF000000 >> 16)
    /* 3D98 8013D990 060062A0 */  sb         $v0, 0x6($v1)
    /* 3D9C 8013D994 2000A48F */  lw         $a0, 0x20($sp)
    /* 3DA0 8013D998 1280053C */  lui        $a1, %hi(ThisOt)
    /* 3DA4 8013D99C B4AAA58C */  lw         $a1, %lo(ThisOt)($a1)
    /* 3DA8 8013D9A0 0000838C */  lw         $v1, 0x0($a0)
    /* 3DAC 8013D9A4 9001A28C */  lw         $v0, 0x190($a1)
    /* 3DB0 8013D9A8 24186A00 */  and        $v1, $v1, $t2
    /* 3DB4 8013D9AC 24105400 */  and        $v0, $v0, $s4
    /* 3DB8 8013D9B0 25186200 */  or         $v1, $v1, $v0
    /* 3DBC 8013D9B4 000083AC */  sw         $v1, 0x0($a0)
    /* 3DC0 8013D9B8 9001A28C */  lw         $v0, 0x190($a1)
    /* 3DC4 8013D9BC 24209400 */  and        $a0, $a0, $s4
    /* 3DC8 8013D9C0 24104A00 */  and        $v0, $v0, $t2
    /* 3DCC 8013D9C4 25104400 */  or         $v0, $v0, $a0
    /* 3DD0 8013D9C8 9001A2AC */  sw         $v0, 0x190($a1)
  .L8013D9CC:
    /* 3DD4 8013D9CC 02001026 */  addiu      $s0, $s0, 0x2
    /* 3DD8 8013D9D0 FFFF4226 */  addiu      $v0, $s2, -0x1
    /* 3DDC 8013D9D4 2A100202 */  slt        $v0, $s0, $v0
    /* 3DE0 8013D9D8 8BFF4014 */  bnez       $v0, .L8013D808
    /* 3DE4 8013D9DC 01003126 */   addiu     $s1, $s1, 0x1
    /* 3DE8 8013D9E0 FFFF3126 */  addiu      $s1, $s1, -0x1
  .L8013D9E4:
    /* 3DEC 8013D9E4 4800AA8F */  lw         $t2, 0x48($sp)
    /* 3DF0 8013D9E8 00000000 */  nop
    /* 3DF4 8013D9EC 21505501 */  addu       $t2, $t2, $s5
    /* 3DF8 8013D9F0 4800AAAF */  sw         $t2, 0x48($sp)
    /* 3DFC 8013D9F4 4000AA8F */  lw         $t2, 0x40($sp)
    /* 3E00 8013D9F8 01007326 */  addiu      $s3, $s3, 0x1
    /* 3E04 8013D9FC 44FE6A16 */  bne        $s3, $t2, .L8013D310
    /* 3E08 8013DA00 00000000 */   nop
  .L8013DA04:
    /* 3E0C 8013DA04 4000AA8F */  lw         $t2, 0x40($sp)
    /* 3E10 8013DA08 00000000 */  nop
    /* 3E14 8013DA0C 00004281 */  lb         $v0, 0x0($t2)
    /* 3E18 8013DA10 7C000A24 */  addiu      $t2, $zero, 0x7C
    /* 3E1C 8013DA14 02004A14 */  bne        $v0, $t2, .L8013DA20
    /* 3E20 8013DA18 00000000 */   nop
    /* 3E24 8013DA1C 01007326 */  addiu      $s3, $s3, 0x1
  .L8013DA20:
    /* 3E28 8013DA20 2800AA8F */  lw         $t2, 0x28($sp)
    /* 3E2C 8013DA24 00000000 */  nop
    /* 3E30 8013DA28 14004A25 */  addiu      $t2, $t2, 0x14
    /* 3E34 8013DA2C 2800AAAF */  sw         $t2, 0x28($sp)
  .L8013DA30:
    /* 3E38 8013DA30 00006282 */  lb         $v0, 0x0($s3)
    /* 3E3C 8013DA34 00006392 */  lbu        $v1, 0x0($s3)
    /* 3E40 8013DA38 16FE4014 */  bnez       $v0, .L8013D294
    /* 3E44 8013DA3C 00000000 */   nop
    /* 3E48 8013DA40 5000A28F */  lw         $v0, 0x50($sp)
    /* 3E4C 8013DA44 A400BF8F */  lw         $ra, 0xA4($sp)
    /* 3E50 8013DA48 A000BE8F */  lw         $fp, 0xA0($sp)
    /* 3E54 8013DA4C 9C00B78F */  lw         $s7, 0x9C($sp)
    /* 3E58 8013DA50 9800B68F */  lw         $s6, 0x98($sp)
    /* 3E5C 8013DA54 9400B58F */  lw         $s5, 0x94($sp)
    /* 3E60 8013DA58 9000B48F */  lw         $s4, 0x90($sp)
    /* 3E64 8013DA5C 8C00B38F */  lw         $s3, 0x8C($sp)
    /* 3E68 8013DA60 8800B28F */  lw         $s2, 0x88($sp)
    /* 3E6C 8013DA64 8400B18F */  lw         $s1, 0x84($sp)
    /* 3E70 8013DA68 8000B08F */  lw         $s0, 0x80($sp)
    /* 3E74 8013DA6C A800BD27 */  addiu      $sp, $sp, 0xA8
    /* 3E78 8013DA70 0800E003 */  jr         $ra
    /* 3E7C 8013DA74 00000000 */   nop
endlabel PrintCredits__Fiiiiii
