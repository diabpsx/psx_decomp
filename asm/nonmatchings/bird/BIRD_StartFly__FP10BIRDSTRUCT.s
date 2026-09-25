.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BIRD_StartFly__FP10BIRDSTRUCT, 0x8C

glabel BIRD_StartFly__FP10BIRDSTRUCT
    /* 9C190 800AC190 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 9C194 800AC194 1000B0AF */  sw         $s0, 0x10($sp)
    /* 9C198 800AC198 21808000 */  addu       $s0, $a0, $zero
    /* 9C19C 800AC19C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 9C1A0 800AC1A0 1400B1AF */  sw         $s1, 0x14($sp)
    /* 9C1A4 800AC1A4 12000292 */  lbu        $v0, 0x12($s0)
    /* 9C1A8 800AC1A8 0000118E */  lw         $s1, 0x0($s0)
    /* 9C1AC 800AC1AC FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 9C1B0 800AC1B0 0200422C */  sltiu      $v0, $v0, 0x2
    /* 9C1B4 800AC1B4 13004014 */  bnez       $v0, .L800AC204
    /* 9C1B8 800AC1B8 00000000 */   nop
    /* 9C1BC 800AC1BC 3CB0020C */  jal        BIRD_StartScatter__FP10BIRDSTRUCT
    /* 9C1C0 800AC1C0 00000000 */   nop
    /* 9C1C4 800AC1C4 15000292 */  lbu        $v0, 0x15($s0)
    /* 9C1C8 800AC1C8 00000000 */  nop
    /* 9C1CC 800AC1CC 03004010 */  beqz       $v0, .L800AC1DC
    /* 9C1D0 800AC1D0 00000000 */   nop
    /* 9C1D4 800AC1D4 C6F5000C */  jal        PlaySFX__Fi
    /* 9C1D8 800AC1D8 DC000424 */   addiu     $a0, $zero, 0xDC
  .L800AC1DC:
    /* 9C1DC 800AC1DC 09002016 */  bnez       $s1, .L800AC204
    /* 9C1E0 800AC1E0 18001026 */   addiu     $s0, $s0, 0x18
    /* 9C1E4 800AC1E4 21880000 */  addu       $s1, $zero, $zero
    /* 9C1E8 800AC1E8 21200002 */  addu       $a0, $s0, $zero
  .L800AC1EC:
    /* 9C1EC 800AC1EC 3CB0020C */  jal        BIRD_StartScatter__FP10BIRDSTRUCT
    /* 9C1F0 800AC1F0 18001026 */   addiu     $s0, $s0, 0x18
    /* 9C1F4 800AC1F4 01003126 */  addiu      $s1, $s1, 0x1
    /* 9C1F8 800AC1F8 0300222A */  slti       $v0, $s1, 0x3
    /* 9C1FC 800AC1FC FBFF4014 */  bnez       $v0, .L800AC1EC
    /* 9C200 800AC200 21200002 */   addu      $a0, $s0, $zero
  .L800AC204:
    /* 9C204 800AC204 1800BF8F */  lw         $ra, 0x18($sp)
    /* 9C208 800AC208 1400B18F */  lw         $s1, 0x14($sp)
    /* 9C20C 800AC20C 1000B08F */  lw         $s0, 0x10($sp)
    /* 9C210 800AC210 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 9C214 800AC214 0800E003 */  jr         $ra
    /* 9C218 800AC218 00000000 */   nop
endlabel BIRD_StartFly__FP10BIRDSTRUCT
