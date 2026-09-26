.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddL1Objs__Fiiii, 0x10C

glabel AddL1Objs__Fiiii
    /* 1E7A8 801583A0 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 1E7AC 801583A4 2400B5AF */  sw         $s5, 0x24($sp)
    /* 1E7B0 801583A8 21A88000 */  addu       $s5, $a0, $zero
    /* 1E7B4 801583AC 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1E7B8 801583B0 2190A000 */  addu       $s2, $a1, $zero
    /* 1E7BC 801583B4 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1E7C0 801583B8 2198C000 */  addu       $s3, $a2, $zero
    /* 1E7C4 801583BC 2000B4AF */  sw         $s4, 0x20($sp)
    /* 1E7C8 801583C0 21A0E000 */  addu       $s4, $a3, $zero
    /* 1E7CC 801583C4 2A105402 */  slt        $v0, $s2, $s4
    /* 1E7D0 801583C8 2800BFAF */  sw         $ra, 0x28($sp)
    /* 1E7D4 801583CC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1E7D8 801583D0 2C004010 */  beqz       $v0, .L80158484
    /* 1E7DC 801583D4 1000B0AF */   sw        $s0, 0x10($sp)
    /* 1E7E0 801583D8 2188A002 */  addu       $s1, $s5, $zero
  .L801583DC:
    /* 1E7E4 801583DC 2A103302 */  slt        $v0, $s1, $s3
    /* 1E7E8 801583E0 24004010 */  beqz       $v0, .L80158474
    /* 1E7EC 801583E4 21202002 */   addu      $a0, $s1, $zero
  .L801583E8:
    /* 1E7F0 801583E8 910A020C */  jal        GetDPiece__Fii
    /* 1E7F4 801583EC 21284002 */   addu      $a1, $s2, $zero
    /* 1E7F8 801583F0 00140200 */  sll        $v0, $v0, 16
    /* 1E7FC 801583F4 03840200 */  sra        $s0, $v0, 16
    /* 1E800 801583F8 0E010224 */  addiu      $v0, $zero, 0x10E
    /* 1E804 801583FC 06000216 */  bne        $s0, $v0, .L80158418
    /* 1E808 80158400 2C000224 */   addiu     $v0, $zero, 0x2C
    /* 1E80C 80158404 21200000 */  addu       $a0, $zero, $zero
    /* 1E810 80158408 21282002 */  addu       $a1, $s1, $zero
    /* 1E814 8015840C BE4E010C */  jal        AddObject__Fiii
    /* 1E818 80158410 21304002 */   addu      $a2, $s2, $zero
    /* 1E81C 80158414 2C000224 */  addiu      $v0, $zero, 0x2C
  .L80158418:
    /* 1E820 80158418 05000212 */  beq        $s0, $v0, .L80158430
    /* 1E824 8015841C 33000224 */   addiu     $v0, $zero, 0x33
    /* 1E828 80158420 03000212 */  beq        $s0, $v0, .L80158430
    /* 1E82C 80158424 D6000224 */   addiu     $v0, $zero, 0xD6
    /* 1E830 80158428 06000216 */  bne        $s0, $v0, .L80158444
    /* 1E834 8015842C 2E000224 */   addiu     $v0, $zero, 0x2E
  .L80158430:
    /* 1E838 80158430 01000424 */  addiu      $a0, $zero, 0x1
    /* 1E83C 80158434 21282002 */  addu       $a1, $s1, $zero
    /* 1E840 80158438 BE4E010C */  jal        AddObject__Fiii
    /* 1E844 8015843C 21304002 */   addu      $a2, $s2, $zero
    /* 1E848 80158440 2E000224 */  addiu      $v0, $zero, 0x2E
  .L80158444:
    /* 1E84C 80158444 03000212 */  beq        $s0, $v0, .L80158454
    /* 1E850 80158448 38000224 */   addiu     $v0, $zero, 0x38
    /* 1E854 8015844C 05000216 */  bne        $s0, $v0, .L80158464
    /* 1E858 80158450 00000000 */   nop
  .L80158454:
    /* 1E85C 80158454 02000424 */  addiu      $a0, $zero, 0x2
    /* 1E860 80158458 21282002 */  addu       $a1, $s1, $zero
    /* 1E864 8015845C BE4E010C */  jal        AddObject__Fiii
    /* 1E868 80158460 21304002 */   addu      $a2, $s2, $zero
  .L80158464:
    /* 1E86C 80158464 01003126 */  addiu      $s1, $s1, 0x1
    /* 1E870 80158468 2A103302 */  slt        $v0, $s1, $s3
    /* 1E874 8015846C DEFF4014 */  bnez       $v0, .L801583E8
    /* 1E878 80158470 21202002 */   addu      $a0, $s1, $zero
  .L80158474:
    /* 1E87C 80158474 01005226 */  addiu      $s2, $s2, 0x1
    /* 1E880 80158478 2A105402 */  slt        $v0, $s2, $s4
    /* 1E884 8015847C D7FF4014 */  bnez       $v0, .L801583DC
    /* 1E888 80158480 2188A002 */   addu      $s1, $s5, $zero
  .L80158484:
    /* 1E88C 80158484 2800BF8F */  lw         $ra, 0x28($sp)
    /* 1E890 80158488 2400B58F */  lw         $s5, 0x24($sp)
    /* 1E894 8015848C 2000B48F */  lw         $s4, 0x20($sp)
    /* 1E898 80158490 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 1E89C 80158494 1800B28F */  lw         $s2, 0x18($sp)
    /* 1E8A0 80158498 1400B18F */  lw         $s1, 0x14($sp)
    /* 1E8A4 8015849C 1000B08F */  lw         $s0, 0x10($sp)
    /* 1E8A8 801584A0 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 1E8AC 801584A4 0800E003 */  jr         $ra
    /* 1E8B0 801584A8 00000000 */   nop
endlabel AddL1Objs__Fiiii
