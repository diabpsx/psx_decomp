.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DEC_DoDecompRequests__Fv, 0x5C

glabel DEC_DoDecompRequests__Fv
    /* 94458 800A4458 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 9445C 800A445C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 94460 800A4460 21880000 */  addu       $s1, $zero, $zero
    /* 94464 800A4464 1000B0AF */  sw         $s0, 0x10($sp)
    /* 94468 800A4468 1280103C */  lui        $s0, %hi(D_8011D050)
    /* 9446C 800A446C 50D01026 */  addiu      $s0, $s0, %lo(D_8011D050)
    /* 94470 800A4470 1800BFAF */  sw         $ra, 0x18($sp)
  .L800A4474:
    /* 94474 800A4474 0000048E */  lw         $a0, 0x0($s0)
    /* 94478 800A4478 00000000 */  nop
    /* 9447C 800A447C 03008010 */  beqz       $a0, .L800A448C
    /* 94480 800A4480 00000000 */   nop
    /* 94484 800A4484 D14F020C */  jal        DoDecompRequests__7TextDat
    /* 94488 800A4488 00000000 */   nop
  .L800A448C:
    /* 9448C 800A448C 01003126 */  addiu      $s1, $s1, 0x1
    /* 94490 800A4490 0A00222A */  slti       $v0, $s1, 0xA
    /* 94494 800A4494 F7FF4014 */  bnez       $v0, .L800A4474
    /* 94498 800A4498 04001026 */   addiu     $s0, $s0, 0x4
    /* 9449C 800A449C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 944A0 800A44A0 1400B18F */  lw         $s1, 0x14($sp)
    /* 944A4 800A44A4 1000B08F */  lw         $s0, 0x10($sp)
    /* 944A8 800A44A8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 944AC 800A44AC 0800E003 */  jr         $ra
    /* 944B0 800A44B0 00000000 */   nop
endlabel DEC_DoDecompRequests__Fv
