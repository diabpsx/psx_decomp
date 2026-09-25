.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitCows__Fv, 0x298

glabel InitCows__Fv
    /* 2AD40 8003AD40 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 2AD44 8003AD44 1180043C */  lui        $a0, %hi(D_801112B4)
    /* 2AD48 8003AD48 B4128424 */  addiu      $a0, $a0, %lo(D_801112B4)
    /* 2AD4C 8003AD4C 21280000 */  addu       $a1, $zero, $zero
    /* 2AD50 8003AD50 3800BFAF */  sw         $ra, 0x38($sp)
    /* 2AD54 8003AD54 3400B5AF */  sw         $s5, 0x34($sp)
    /* 2AD58 8003AD58 3000B4AF */  sw         $s4, 0x30($sp)
    /* 2AD5C 8003AD5C 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 2AD60 8003AD60 2800B2AF */  sw         $s2, 0x28($sp)
    /* 2AD64 8003AD64 2400B1AF */  sw         $s1, 0x24($sp)
    /* 2AD68 8003AD68 0BF7000C */  jal        LoadFileInMem__FPCcPUl
    /* 2AD6C 8003AD6C 2000B0AF */   sw        $s0, 0x20($sp)
    /* 2AD70 8003AD70 21A00000 */  addu       $s4, $zero, $zero
    /* 2AD74 8003AD74 0D80153C */  lui        $s5, %hi(towner + 0x9C)
    /* 2AD78 8003AD78 1CFFB526 */  addiu      $s5, $s5, %lo(towner + 0x9C)
    /* 2AD7C 8003AD7C A41082AF */  sw         $v0, %gp_rel(pCowCels)($gp)
    /* 2AD80 8003AD80 80000524 */  addiu      $a1, $zero, 0x80
  .L8003AD84:
    /* 2AD84 8003AD84 21300000 */  addu       $a2, $zero, $zero
    /* 2AD88 8003AD88 09000724 */  addiu      $a3, $zero, 0x9
    /* 2AD8C 8003AD8C 80101400 */  sll        $v0, $s4, 2
    /* 2AD90 8003AD90 0D80013C */  lui        $at, %hi(TownCowX)
    /* 2AD94 8003AD94 21082200 */  addu       $at, $at, $v0
    /* 2AD98 8003AD98 5CFB318C */  lw         $s1, %lo(TownCowX)($at)
    /* 2AD9C 8003AD9C 0D80013C */  lui        $at, %hi(TownCowY)
    /* 2ADA0 8003ADA0 21082200 */  addu       $at, $at, $v0
    /* 2ADA4 8003ADA4 68FB338C */  lw         $s3, %lo(TownCowY)($at)
    /* 2ADA8 8003ADA8 0D80013C */  lui        $at, %hi(TownCowDir)
    /* 2ADAC 8003ADAC 21082200 */  addu       $at, $at, $v0
    /* 2ADB0 8003ADB0 74FB328C */  lw         $s2, %lo(TownCowDir)($at)
    /* 2ADB4 8003ADB4 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2ADB8 8003ADB8 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 2ADBC 8003ADBC 1800A2AF */  sw         $v0, 0x18($sp)
    /* 2ADC0 8003ADC0 0A000224 */  addiu      $v0, $zero, 0xA
    /* 2ADC4 8003ADC4 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 2ADC8 8003ADC8 1000B1AF */  sw         $s1, 0x10($sp)
    /* 2ADCC 8003ADCC 13E8000C */  jal        InitTownerInfo__FilUciiici
    /* 2ADD0 8003ADD0 1400B3AF */   sw        $s3, 0x14($sp)
    /* 2ADD4 8003ADD4 9C10838F */  lw         $v1, %gp_rel(numtowners)($gp)
    /* 2ADD8 8003ADD8 A410848F */  lw         $a0, %gp_rel(pCowCels)($gp)
    /* 2ADDC 8003ADDC 40100300 */  sll        $v0, $v1, 1
    /* 2ADE0 8003ADE0 21104300 */  addu       $v0, $v0, $v1
    /* 2ADE4 8003ADE4 00110200 */  sll        $v0, $v0, 4
    /* 2ADE8 8003ADE8 21104300 */  addu       $v0, $v0, $v1
    /* 2ADEC 8003ADEC 80100200 */  sll        $v0, $v0, 2
    /* 2ADF0 8003ADF0 0D80013C */  lui        $at, %hi(towner + 0xC0)
    /* 2ADF4 8003ADF4 21082200 */  addu       $at, $at, $v0
    /* 2ADF8 8003ADF8 40FF24AC */  sw         $a0, %lo(towner + 0xC0)($at)
    /* 2ADFC 8003ADFC F7E7000C */  jal        SetTownerGPtrs__FPUcPPUc
    /* 2AE00 8003AE00 21285500 */   addu      $a1, $v0, $s5
    /* 2AE04 8003AE04 0C000624 */  addiu      $a2, $zero, 0xC
    /* 2AE08 8003AE08 0C000324 */  addiu      $v1, $zero, 0xC
    /* 2AE0C 8003AE0C 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2AE10 8003AE10 80801200 */  sll        $s0, $s2, 2
    /* 2AE14 8003AE14 40100400 */  sll        $v0, $a0, 1
    /* 2AE18 8003AE18 21104400 */  addu       $v0, $v0, $a0
    /* 2AE1C 8003AE1C 00110200 */  sll        $v0, $v0, 4
    /* 2AE20 8003AE20 21104400 */  addu       $v0, $v0, $a0
    /* 2AE24 8003AE24 80100200 */  sll        $v0, $v0, 2
    /* 2AE28 8003AE28 0D80013C */  lui        $at, %hi(towner + 0xBC)
    /* 2AE2C 8003AE2C 21082200 */  addu       $at, $at, $v0
    /* 2AE30 8003AE30 3CFF23AC */  sw         $v1, %lo(towner + 0xBC)($at)
    /* 2AE34 8003AE34 21105500 */  addu       $v0, $v0, $s5
    /* 2AE38 8003AE38 21100202 */  addu       $v0, $s0, $v0
    /* 2AE3C 8003AE3C 0000458C */  lw         $a1, 0x0($v0)
    /* 2AE40 8003AE40 FFE7000C */  jal        NewTownerAnim__FiPUcii
    /* 2AE44 8003AE44 03000724 */   addiu     $a3, $zero, 0x3
    /* 2AE48 8003AE48 C9F6000C */  jal        ENG_random__Fl
    /* 2AE4C 8003AE4C 0B000424 */   addiu     $a0, $zero, 0xB
    /* 2AE50 8003AE50 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2AE54 8003AE54 00000000 */  nop
    /* 2AE58 8003AE58 40180400 */  sll        $v1, $a0, 1
    /* 2AE5C 8003AE5C 21186400 */  addu       $v1, $v1, $a0
    /* 2AE60 8003AE60 00190300 */  sll        $v1, $v1, 4
    /* 2AE64 8003AE64 21186400 */  addu       $v1, $v1, $a0
    /* 2AE68 8003AE68 80180300 */  sll        $v1, $v1, 2
    /* 2AE6C 8003AE6C 01000424 */  addiu      $a0, $zero, 0x1
    /* 2AE70 8003AE70 0D80013C */  lui        $at, %hi(towner + 0x50)
    /* 2AE74 8003AE74 21082300 */  addu       $at, $at, $v1
    /* 2AE78 8003AE78 D0FE24A0 */  sb         $a0, %lo(towner + 0x50)($at)
    /* 2AE7C 8003AE7C 9C10858F */  lw         $a1, %gp_rel(numtowners)($gp)
    /* 2AE80 8003AE80 01004224 */  addiu      $v0, $v0, 0x1
    /* 2AE84 8003AE84 0D80013C */  lui        $at, %hi(towner + 0x30)
    /* 2AE88 8003AE88 21082300 */  addu       $at, $at, $v1
    /* 2AE8C 8003AE8C B0FE22AC */  sw         $v0, %lo(towner + 0x30)($at)
    /* 2AE90 8003AE90 D2000324 */  addiu      $v1, $zero, 0xD2
    /* 2AE94 8003AE94 40100500 */  sll        $v0, $a1, 1
    /* 2AE98 8003AE98 21104500 */  addu       $v0, $v0, $a1
    /* 2AE9C 8003AE9C 00110200 */  sll        $v0, $v0, 4
    /* 2AEA0 8003AEA0 21104500 */  addu       $v0, $v0, $a1
    /* 2AEA4 8003AEA4 80100200 */  sll        $v0, $v0, 2
    /* 2AEA8 8003AEA8 0D80013C */  lui        $at, %hi(towner + 0x20)
    /* 2AEAC 8003AEAC 21082200 */  addu       $at, $at, $v0
    /* 2AEB0 8003AEB0 A0FE32AC */  sw         $s2, %lo(towner + 0x20)($at)
    /* 2AEB4 8003AEB4 0D80013C */  lui        $at, %hi(towner + 0x98)
    /* 2AEB8 8003AEB8 21082200 */  addu       $at, $at, $v0
    /* 2AEBC 8003AEBC 18FF23AC */  sw         $v1, %lo(towner + 0x98)($at)
    /* 2AEC0 8003AEC0 0D80013C */  lui        $at, %hi(cowoffy)
    /* 2AEC4 8003AEC4 21083000 */  addu       $at, $at, $s0
    /* 2AEC8 8003AEC8 A0FB228C */  lw         $v0, %lo(cowoffy)($at)
    /* 2AECC 8003AECC 00000000 */  nop
    /* 2AED0 8003AED0 21106202 */  addu       $v0, $s3, $v0
    /* 2AED4 8003AED4 C0300200 */  sll        $a2, $v0, 3
    /* 2AED8 8003AED8 C0101100 */  sll        $v0, $s1, 3
    /* 2AEDC 8003AEDC 23105100 */  subu       $v0, $v0, $s1
    /* 2AEE0 8003AEE0 C0110200 */  sll        $v0, $v0, 7
    /* 2AEE4 8003AEE4 2120C200 */  addu       $a0, $a2, $v0
    /* 2AEE8 8003AEE8 0D80013C */  lui        $at, %hi(cowoffx)
    /* 2AEEC 8003AEEC 21083000 */  addu       $at, $at, $s0
    /* 2AEF0 8003AEF0 80FB228C */  lw         $v0, %lo(cowoffx)($at)
    /* 2AEF4 8003AEF4 0E80013C */  lui        $at, %hi(dung_map)
    /* 2AEF8 8003AEF8 21082400 */  addu       $at, $at, $a0
    /* 2AEFC 8003AEFC 287A2384 */  lh         $v1, %lo(dung_map)($at)
    /* 2AF00 8003AF00 00000000 */  nop
    /* 2AF04 8003AF04 05006014 */  bnez       $v1, .L8003AF1C
    /* 2AF08 8003AF08 21882202 */   addu      $s1, $s1, $v0
    /* 2AF0C 8003AF0C 27100500 */  nor        $v0, $zero, $a1
    /* 2AF10 8003AF10 0E80013C */  lui        $at, %hi(dung_map)
    /* 2AF14 8003AF14 21082400 */  addu       $at, $at, $a0
    /* 2AF18 8003AF18 287A22A4 */  sh         $v0, %lo(dung_map)($at)
  .L8003AF1C:
    /* 2AF1C 8003AF1C C0101300 */  sll        $v0, $s3, 3
    /* 2AF20 8003AF20 C0181100 */  sll        $v1, $s1, 3
    /* 2AF24 8003AF24 23187100 */  subu       $v1, $v1, $s1
    /* 2AF28 8003AF28 C0190300 */  sll        $v1, $v1, 7
    /* 2AF2C 8003AF2C 21204300 */  addu       $a0, $v0, $v1
    /* 2AF30 8003AF30 0E80013C */  lui        $at, %hi(dung_map)
    /* 2AF34 8003AF34 21082400 */  addu       $at, $at, $a0
    /* 2AF38 8003AF38 287A2284 */  lh         $v0, %lo(dung_map)($at)
    /* 2AF3C 8003AF3C 00000000 */  nop
    /* 2AF40 8003AF40 07004014 */  bnez       $v0, .L8003AF60
    /* 2AF44 8003AF44 00000000 */   nop
    /* 2AF48 8003AF48 9C10828F */  lw         $v0, %gp_rel(numtowners)($gp)
    /* 2AF4C 8003AF4C 00000000 */  nop
    /* 2AF50 8003AF50 27100200 */  nor        $v0, $zero, $v0
    /* 2AF54 8003AF54 0E80013C */  lui        $at, %hi(dung_map)
    /* 2AF58 8003AF58 21082400 */  addu       $at, $at, $a0
    /* 2AF5C 8003AF5C 287A22A4 */  sh         $v0, %lo(dung_map)($at)
  .L8003AF60:
    /* 2AF60 8003AF60 2118C300 */  addu       $v1, $a2, $v1
    /* 2AF64 8003AF64 0E80013C */  lui        $at, %hi(dung_map)
    /* 2AF68 8003AF68 21082300 */  addu       $at, $at, $v1
    /* 2AF6C 8003AF6C 287A2284 */  lh         $v0, %lo(dung_map)($at)
    /* 2AF70 8003AF70 00000000 */  nop
    /* 2AF74 8003AF74 07004014 */  bnez       $v0, .L8003AF94
    /* 2AF78 8003AF78 00000000 */   nop
    /* 2AF7C 8003AF7C 9C10828F */  lw         $v0, %gp_rel(numtowners)($gp)
    /* 2AF80 8003AF80 00000000 */  nop
    /* 2AF84 8003AF84 27100200 */  nor        $v0, $zero, $v0
    /* 2AF88 8003AF88 0E80013C */  lui        $at, %hi(dung_map)
    /* 2AF8C 8003AF8C 21082300 */  addu       $at, $at, $v1
    /* 2AF90 8003AF90 287A22A4 */  sh         $v0, %lo(dung_map)($at)
  .L8003AF94:
    /* 2AF94 8003AF94 9C10828F */  lw         $v0, %gp_rel(numtowners)($gp)
    /* 2AF98 8003AF98 01009426 */  addiu      $s4, $s4, 0x1
    /* 2AF9C 8003AF9C 01004224 */  addiu      $v0, $v0, 0x1
    /* 2AFA0 8003AFA0 9C1082AF */  sw         $v0, %gp_rel(numtowners)($gp)
    /* 2AFA4 8003AFA4 0300822A */  slti       $v0, $s4, 0x3
    /* 2AFA8 8003AFA8 76FF4014 */  bnez       $v0, .L8003AD84
    /* 2AFAC 8003AFAC 80000524 */   addiu     $a1, $zero, 0x80
    /* 2AFB0 8003AFB0 3800BF8F */  lw         $ra, 0x38($sp)
    /* 2AFB4 8003AFB4 3400B58F */  lw         $s5, 0x34($sp)
    /* 2AFB8 8003AFB8 3000B48F */  lw         $s4, 0x30($sp)
    /* 2AFBC 8003AFBC 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 2AFC0 8003AFC0 2800B28F */  lw         $s2, 0x28($sp)
    /* 2AFC4 8003AFC4 2400B18F */  lw         $s1, 0x24($sp)
    /* 2AFC8 8003AFC8 2000B08F */  lw         $s0, 0x20($sp)
    /* 2AFCC 8003AFCC 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 2AFD0 8003AFD0 0800E003 */  jr         $ra
    /* 2AFD4 8003AFD4 00000000 */   nop
endlabel InitCows__Fv
