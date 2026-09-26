.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PSX_CH_SaveGame__Fii, 0x16C

glabel PSX_CH_SaveGame__Fii
    /* 227B8 8015C3B0 80FFBD27 */  addiu      $sp, $sp, -0x80
    /* 227BC 8015C3B4 7000B4AF */  sw         $s4, 0x70($sp)
    /* 227C0 8015C3B8 21A08000 */  addu       $s4, $a0, $zero
    /* 227C4 8015C3BC 6000B0AF */  sw         $s0, 0x60($sp)
    /* 227C8 8015C3C0 2180A000 */  addu       $s0, $a1, $zero
    /* 227CC 8015C3C4 2000A427 */  addiu      $a0, $sp, 0x20
    /* 227D0 8015C3C8 1280053C */  lui        $a1, %hi(D_8011BE54)
    /* 227D4 8015C3CC 54BEA524 */  addiu      $a1, $a1, %lo(D_8011BE54)
    /* 227D8 8015C3D0 0E80063C */  lui        $a2, %hi(D_800E3C94)
    /* 227DC 8015C3D4 943CC624 */  addiu      $a2, $a2, %lo(D_800E3C94)
    /* 227E0 8015C3D8 0E80073C */  lui        $a3, %hi(D_800E3CA0)
    /* 227E4 8015C3DC A03CE724 */  addiu      $a3, $a3, %lo(D_800E3CA0)
    /* 227E8 8015C3E0 7800BFAF */  sw         $ra, 0x78($sp)
    /* 227EC 8015C3E4 7400B5AF */  sw         $s5, 0x74($sp)
    /* 227F0 8015C3E8 6C00B3AF */  sw         $s3, 0x6C($sp)
    /* 227F4 8015C3EC 6800B2AF */  sw         $s2, 0x68($sp)
    /* 227F8 8015C3F0 9767000C */  jal        sprintf
    /* 227FC 8015C3F4 6400B1AF */   sw        $s1, 0x64($sp)
    /* 22800 8015C3F8 A671050C */  jal        GetIcon__Fv
    /* 22804 8015C3FC 04001124 */   addiu     $s1, $zero, 0x4
    /* 22808 8015C400 80201000 */  sll        $a0, $s0, 2
    /* 2280C 8015C404 21209000 */  addu       $a0, $a0, $s0
    /* 22810 8015C408 40210400 */  sll        $a0, $a0, 5
    /* 22814 8015C40C 23209000 */  subu       $a0, $a0, $s0
    /* 22818 8015C410 C0200400 */  sll        $a0, $a0, 3
    /* 2281C 8015C414 1580023C */  lui        $v0, %hi(CharDataStruct)
    /* 22820 8015C418 F0764224 */  addiu      $v0, $v0, %lo(CharDataStruct)
    /* 22824 8015C41C 1280053C */  lui        $a1, %hi(options_pad)
    /* 22828 8015C420 50B2A58C */  lw         $a1, %lo(options_pad)($a1)
    /* 2282C 8015C424 E66A050C */  jal        PackPlayer__FP14PkPlayerStructi
    /* 22830 8015C428 21208200 */   addu      $a0, $a0, $v0
    /* 22834 8015C42C 1280023C */  lui        $v0, %hi(options_pad)
    /* 22838 8015C430 50B2428C */  lw         $v0, %lo(options_pad)($v0)
    /* 2283C 8015C434 1280013C */  lui        $at, %hi(QSpell)
    /* 22840 8015C438 21082200 */  addu       $at, $at, $v0
    /* 22844 8015C43C 20B12290 */  lbu        $v0, %lo(QSpell)($at)
    /* 22848 8015C440 FFFF1224 */  addiu      $s2, $zero, -0x1
    /* 2284C 8015C444 1680013C */  lui        $at, %hi(CharDataStruct + 0x1DD0)
    /* 22850 8015C448 21083000 */  addu       $at, $at, $s0
    /* 22854 8015C44C C09422A0 */  sb         $v0, %lo(CharDataStruct + 0x1DD0)($at)
    /* 22858 8015C450 1280023C */  lui        $v0, %hi(options_pad)
    /* 2285C 8015C454 50B2428C */  lw         $v0, %lo(options_pad)($v0)
    /* 22860 8015C458 0E80133C */  lui        $s3, %hi(IconBuffer + 0x28)
    /* 22864 8015C45C E83C7326 */  addiu      $s3, $s3, %lo(IconBuffer + 0x28)
    /* 22868 8015C460 1280013C */  lui        $at, %hi(_spltotype)
    /* 2286C 8015C464 21082200 */  addu       $at, $at, $v0
    /* 22870 8015C468 24B12290 */  lbu        $v0, %lo(_spltotype)($at)
    /* 22874 8015C46C E0FF7526 */  addiu      $s5, $s3, -0x20
    /* 22878 8015C470 1680013C */  lui        $at, %hi(CharDataStruct + 0x1DD6)
    /* 2287C 8015C474 21083000 */  addu       $at, $at, $s0
    /* 22880 8015C478 C69422A0 */  sb         $v0, %lo(CharDataStruct + 0x1DD6)($at)
  .L8015C47C:
    /* 22884 8015C47C 1280043C */  lui        $a0, %hi(current_card)
    /* 22888 8015C480 60B4848C */  lw         $a0, %lo(current_card)($a0)
    /* 2288C 8015C484 1280053C */  lui        $a1, %hi(DiabloCharacterFile)
    /* 22890 8015C488 18B4A58C */  lw         $a1, %lo(DiabloCharacterFile)($a1)
    /* 22894 8015C48C 6465050C */  jal        GetFileNumber__FiPc
    /* 22898 8015C490 00000000 */   nop
    /* 2289C 8015C494 06005210 */  beq        $v0, $s2, .L8015C4B0
    /* 228A0 8015C498 21208002 */   addu      $a0, $s4, $zero
    /* 228A4 8015C49C 1280043C */  lui        $a0, %hi(current_card)
    /* 228A8 8015C4A0 60B4848C */  lw         $a0, %lo(current_card)($a0)
    /* 228AC 8015C4A4 480B050C */  jal        delete_card_file__Fii
    /* 228B0 8015C4A8 21284000 */   addu      $a1, $v0, $zero
    /* 228B4 8015C4AC 21208002 */  addu       $a0, $s4, $zero
  .L8015C4B0:
    /* 228B8 8015C4B0 01300524 */  addiu      $a1, $zero, 0x3001
    /* 228BC 8015C4B4 2000A727 */  addiu      $a3, $sp, 0x20
    /* 228C0 8015C4B8 FFFF3126 */  addiu      $s1, $s1, -0x1
    /* 228C4 8015C4BC 1280063C */  lui        $a2, %hi(DiabloCharacterFile)
    /* 228C8 8015C4C0 18B4C68C */  lw         $a2, %lo(DiabloCharacterFile)($a2)
    /* 228CC 8015C4C4 E01D0224 */  addiu      $v0, $zero, 0x1DE0
    /* 228D0 8015C4C8 1800A2AF */  sw         $v0, 0x18($sp)
    /* 228D4 8015C4CC 1580023C */  lui        $v0, %hi(CharDataStruct)
    /* 228D8 8015C4D0 F0764224 */  addiu      $v0, $v0, %lo(CharDataStruct)
    /* 228DC 8015C4D4 1000B3AF */  sw         $s3, 0x10($sp)
    /* 228E0 8015C4D8 1400B5AF */  sw         $s5, 0x14($sp)
    /* 228E4 8015C4DC 2E0C050C */  jal        write_card_file__FiiPcT2PUcPUsiT4
    /* 228E8 8015C4E0 1C00A2AF */   sw        $v0, 0x1C($sp)
    /* 228EC 8015C4E4 03003212 */  beq        $s1, $s2, .L8015C4F4
    /* 228F0 8015C4E8 00000000 */   nop
    /* 228F4 8015C4EC E3FF4014 */  bnez       $v0, .L8015C47C
    /* 228F8 8015C4F0 00000000 */   nop
  .L8015C4F4:
    /* 228FC 8015C4F4 7800BF8F */  lw         $ra, 0x78($sp)
    /* 22900 8015C4F8 7400B58F */  lw         $s5, 0x74($sp)
    /* 22904 8015C4FC 7000B48F */  lw         $s4, 0x70($sp)
    /* 22908 8015C500 6C00B38F */  lw         $s3, 0x6C($sp)
    /* 2290C 8015C504 6800B28F */  lw         $s2, 0x68($sp)
    /* 22910 8015C508 6400B18F */  lw         $s1, 0x64($sp)
    /* 22914 8015C50C 6000B08F */  lw         $s0, 0x60($sp)
    /* 22918 8015C510 8000BD27 */  addiu      $sp, $sp, 0x80
    /* 2291C 8015C514 0800E003 */  jr         $ra
    /* 22920 8015C518 00000000 */   nop
endlabel PSX_CH_SaveGame__Fii
