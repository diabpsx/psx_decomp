.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching L5AddWall__Fv, 0x25C

glabel L5AddWall__Fv
    /* 4860 8013E458 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 4864 8013E45C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 4868 8013E460 21880000 */  addu       $s1, $zero, $zero
    /* 486C 8013E464 2400B5AF */  sw         $s5, 0x24($sp)
    /* 4870 8013E468 0E80153C */  lui        $s5, %hi(dungeon)
    /* 4874 8013E46C C440B526 */  addiu      $s5, $s5, %lo(dungeon)
    /* 4878 8013E470 2000B4AF */  sw         $s4, 0x20($sp)
    /* 487C 8013E474 FFFF1424 */  addiu      $s4, $zero, -0x1
    /* 4880 8013E478 2800BFAF */  sw         $ra, 0x28($sp)
    /* 4884 8013E47C 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 4888 8013E480 1800B2AF */  sw         $s2, 0x18($sp)
    /* 488C 8013E484 1000B0AF */  sw         $s0, 0x10($sp)
    /* 4890 8013E488 21800000 */  addu       $s0, $zero, $zero
  .L8013E48C:
    /* 4894 8013E48C 40981100 */  sll        $s3, $s1, 1
    /* 4898 8013E490 2190A002 */  addu       $s2, $s5, $zero
  .L8013E494:
    /* 489C 8013E494 80101100 */  sll        $v0, $s1, 2
    /* 48A0 8013E498 21105100 */  addu       $v0, $v0, $s1
    /* 48A4 8013E49C C0100200 */  sll        $v0, $v0, 3
    /* 48A8 8013E4A0 1280033C */  lui        $v1, %hi(mydflags)
    /* 48AC 8013E4A4 D8C0638C */  lw         $v1, %lo(mydflags)($v1)
    /* 48B0 8013E4A8 21105000 */  addu       $v0, $v0, $s0
    /* 48B4 8013E4AC 21186200 */  addu       $v1, $v1, $v0
    /* 48B8 8013E4B0 00006290 */  lbu        $v0, 0x0($v1)
    /* 48BC 8013E4B4 00000000 */  nop
    /* 48C0 8013E4B8 6C004014 */  bnez       $v0, .L8013E66C
    /* 48C4 8013E4BC 21107202 */   addu      $v0, $s3, $s2
    /* 48C8 8013E4C0 00004394 */  lhu        $v1, 0x0($v0)
    /* 48CC 8013E4C4 03000224 */  addiu      $v0, $zero, 0x3
    /* 48D0 8013E4C8 21006214 */  bne        $v1, $v0, .L8013E550
    /* 48D4 8013E4CC 21107202 */   addu      $v0, $s3, $s2
    /* 48D8 8013E4D0 C9F6000C */  jal        ENG_random__Fl
    /* 48DC 8013E4D4 64000424 */   addiu     $a0, $zero, 0x64
    /* 48E0 8013E4D8 64004228 */  slti       $v0, $v0, 0x64
    /* 48E4 8013E4DC 09004010 */  beqz       $v0, .L8013E504
    /* 48E8 8013E4E0 21200002 */   addu      $a0, $s0, $zero
    /* 48EC 8013E4E4 5CF7040C */  jal        L5HWallOk__Fii
    /* 48F0 8013E4E8 21282002 */   addu      $a1, $s1, $zero
    /* 48F4 8013E4EC 05005410 */  beq        $v0, $s4, .L8013E504
    /* 48F8 8013E4F0 21200002 */   addu      $a0, $s0, $zero
    /* 48FC 8013E4F4 21282002 */  addu       $a1, $s1, $zero
    /* 4900 8013E4F8 02000624 */  addiu      $a2, $zero, 0x2
    /* 4904 8013E4FC FDF7040C */  jal        L5HorizWall__Fiici
    /* 4908 8013E500 21384000 */   addu      $a3, $v0, $zero
  .L8013E504:
    /* 490C 8013E504 21107202 */  addu       $v0, $s3, $s2
    /* 4910 8013E508 00004394 */  lhu        $v1, 0x0($v0)
    /* 4914 8013E50C 03000224 */  addiu      $v0, $zero, 0x3
    /* 4918 8013E510 0F006214 */  bne        $v1, $v0, .L8013E550
    /* 491C 8013E514 21107202 */   addu      $v0, $s3, $s2
    /* 4920 8013E518 C9F6000C */  jal        ENG_random__Fl
    /* 4924 8013E51C 64000424 */   addiu     $a0, $zero, 0x64
    /* 4928 8013E520 64004228 */  slti       $v0, $v0, 0x64
    /* 492C 8013E524 09004010 */  beqz       $v0, .L8013E54C
    /* 4930 8013E528 21200002 */   addu      $a0, $s0, $zero
    /* 4934 8013E52C ABF7040C */  jal        L5VWallOk__Fii
    /* 4938 8013E530 21282002 */   addu      $a1, $s1, $zero
    /* 493C 8013E534 05005410 */  beq        $v0, $s4, .L8013E54C
    /* 4940 8013E538 21200002 */   addu      $a0, $s0, $zero
    /* 4944 8013E53C 21282002 */  addu       $a1, $s1, $zero
    /* 4948 8013E540 01000624 */  addiu      $a2, $zero, 0x1
    /* 494C 8013E544 8BF8040C */  jal        L5VertWall__Fiici
    /* 4950 8013E548 21384000 */   addu      $a3, $v0, $zero
  .L8013E54C:
    /* 4954 8013E54C 21107202 */  addu       $v0, $s3, $s2
  .L8013E550:
    /* 4958 8013E550 00004394 */  lhu        $v1, 0x0($v0)
    /* 495C 8013E554 06000224 */  addiu      $v0, $zero, 0x6
    /* 4960 8013E558 0F006214 */  bne        $v1, $v0, .L8013E598
    /* 4964 8013E55C 21107202 */   addu      $v0, $s3, $s2
    /* 4968 8013E560 C9F6000C */  jal        ENG_random__Fl
    /* 496C 8013E564 64000424 */   addiu     $a0, $zero, 0x64
    /* 4970 8013E568 64004228 */  slti       $v0, $v0, 0x64
    /* 4974 8013E56C 09004010 */  beqz       $v0, .L8013E594
    /* 4978 8013E570 21200002 */   addu      $a0, $s0, $zero
    /* 497C 8013E574 5CF7040C */  jal        L5HWallOk__Fii
    /* 4980 8013E578 21282002 */   addu      $a1, $s1, $zero
    /* 4984 8013E57C 05005410 */  beq        $v0, $s4, .L8013E594
    /* 4988 8013E580 21200002 */   addu      $a0, $s0, $zero
    /* 498C 8013E584 21282002 */  addu       $a1, $s1, $zero
    /* 4990 8013E588 04000624 */  addiu      $a2, $zero, 0x4
    /* 4994 8013E58C FDF7040C */  jal        L5HorizWall__Fiici
    /* 4998 8013E590 21384000 */   addu      $a3, $v0, $zero
  .L8013E594:
    /* 499C 8013E594 21107202 */  addu       $v0, $s3, $s2
  .L8013E598:
    /* 49A0 8013E598 00004394 */  lhu        $v1, 0x0($v0)
    /* 49A4 8013E59C 07000224 */  addiu      $v0, $zero, 0x7
    /* 49A8 8013E5A0 0F006214 */  bne        $v1, $v0, .L8013E5E0
    /* 49AC 8013E5A4 21107202 */   addu      $v0, $s3, $s2
    /* 49B0 8013E5A8 C9F6000C */  jal        ENG_random__Fl
    /* 49B4 8013E5AC 64000424 */   addiu     $a0, $zero, 0x64
    /* 49B8 8013E5B0 64004228 */  slti       $v0, $v0, 0x64
    /* 49BC 8013E5B4 09004010 */  beqz       $v0, .L8013E5DC
    /* 49C0 8013E5B8 21200002 */   addu      $a0, $s0, $zero
    /* 49C4 8013E5BC ABF7040C */  jal        L5VWallOk__Fii
    /* 49C8 8013E5C0 21282002 */   addu      $a1, $s1, $zero
    /* 49CC 8013E5C4 05005410 */  beq        $v0, $s4, .L8013E5DC
    /* 49D0 8013E5C8 21200002 */   addu      $a0, $s0, $zero
    /* 49D4 8013E5CC 21282002 */  addu       $a1, $s1, $zero
    /* 49D8 8013E5D0 04000624 */  addiu      $a2, $zero, 0x4
    /* 49DC 8013E5D4 8BF8040C */  jal        L5VertWall__Fiici
    /* 49E0 8013E5D8 21384000 */   addu      $a3, $v0, $zero
  .L8013E5DC:
    /* 49E4 8013E5DC 21107202 */  addu       $v0, $s3, $s2
  .L8013E5E0:
    /* 49E8 8013E5E0 00004394 */  lhu        $v1, 0x0($v0)
    /* 49EC 8013E5E4 02000224 */  addiu      $v0, $zero, 0x2
    /* 49F0 8013E5E8 0F006214 */  bne        $v1, $v0, .L8013E628
    /* 49F4 8013E5EC 21107202 */   addu      $v0, $s3, $s2
    /* 49F8 8013E5F0 C9F6000C */  jal        ENG_random__Fl
    /* 49FC 8013E5F4 64000424 */   addiu     $a0, $zero, 0x64
    /* 4A00 8013E5F8 64004228 */  slti       $v0, $v0, 0x64
    /* 4A04 8013E5FC 09004010 */  beqz       $v0, .L8013E624
    /* 4A08 8013E600 21200002 */   addu      $a0, $s0, $zero
    /* 4A0C 8013E604 5CF7040C */  jal        L5HWallOk__Fii
    /* 4A10 8013E608 21282002 */   addu      $a1, $s1, $zero
    /* 4A14 8013E60C 05005410 */  beq        $v0, $s4, .L8013E624
    /* 4A18 8013E610 21200002 */   addu      $a0, $s0, $zero
    /* 4A1C 8013E614 21282002 */  addu       $a1, $s1, $zero
    /* 4A20 8013E618 02000624 */  addiu      $a2, $zero, 0x2
    /* 4A24 8013E61C FDF7040C */  jal        L5HorizWall__Fiici
    /* 4A28 8013E620 21384000 */   addu      $a3, $v0, $zero
  .L8013E624:
    /* 4A2C 8013E624 21107202 */  addu       $v0, $s3, $s2
  .L8013E628:
    /* 4A30 8013E628 00004394 */  lhu        $v1, 0x0($v0)
    /* 4A34 8013E62C 01000224 */  addiu      $v0, $zero, 0x1
    /* 4A38 8013E630 0E006214 */  bne        $v1, $v0, .L8013E66C
    /* 4A3C 8013E634 00000000 */   nop
    /* 4A40 8013E638 C9F6000C */  jal        ENG_random__Fl
    /* 4A44 8013E63C 64000424 */   addiu     $a0, $zero, 0x64
    /* 4A48 8013E640 64004228 */  slti       $v0, $v0, 0x64
    /* 4A4C 8013E644 09004010 */  beqz       $v0, .L8013E66C
    /* 4A50 8013E648 21200002 */   addu      $a0, $s0, $zero
    /* 4A54 8013E64C ABF7040C */  jal        L5VWallOk__Fii
    /* 4A58 8013E650 21282002 */   addu      $a1, $s1, $zero
    /* 4A5C 8013E654 05005410 */  beq        $v0, $s4, .L8013E66C
    /* 4A60 8013E658 21200002 */   addu      $a0, $s0, $zero
    /* 4A64 8013E65C 21282002 */  addu       $a1, $s1, $zero
    /* 4A68 8013E660 01000624 */  addiu      $a2, $zero, 0x1
    /* 4A6C 8013E664 8BF8040C */  jal        L5VertWall__Fiici
    /* 4A70 8013E668 21384000 */   addu      $a3, $v0, $zero
  .L8013E66C:
    /* 4A74 8013E66C 01001026 */  addiu      $s0, $s0, 0x1
    /* 4A78 8013E670 2800022A */  slti       $v0, $s0, 0x28
    /* 4A7C 8013E674 87FF4014 */  bnez       $v0, .L8013E494
    /* 4A80 8013E678 60005226 */   addiu     $s2, $s2, 0x60
    /* 4A84 8013E67C 01003126 */  addiu      $s1, $s1, 0x1
    /* 4A88 8013E680 2800222A */  slti       $v0, $s1, 0x28
    /* 4A8C 8013E684 81FF4014 */  bnez       $v0, .L8013E48C
    /* 4A90 8013E688 21800000 */   addu      $s0, $zero, $zero
    /* 4A94 8013E68C 2800BF8F */  lw         $ra, 0x28($sp)
    /* 4A98 8013E690 2400B58F */  lw         $s5, 0x24($sp)
    /* 4A9C 8013E694 2000B48F */  lw         $s4, 0x20($sp)
    /* 4AA0 8013E698 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 4AA4 8013E69C 1800B28F */  lw         $s2, 0x18($sp)
    /* 4AA8 8013E6A0 1400B18F */  lw         $s1, 0x14($sp)
    /* 4AAC 8013E6A4 1000B08F */  lw         $s0, 0x10($sp)
    /* 4AB0 8013E6A8 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 4AB4 8013E6AC 0800E003 */  jr         $ra
    /* 4AB8 8013E6B0 00000000 */   nop
endlabel L5AddWall__Fv
