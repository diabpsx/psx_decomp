.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitL1Triggers__Fv, 0x12C

glabel InitL1Triggers__Fv
    /* 28938 80162530 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 2893C 80162534 1400B1AF */  sw         $s1, 0x14($sp)
    /* 28940 80162538 21880000 */  addu       $s1, $zero, $zero
    /* 28944 8016253C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 28948 80162540 1000B0AF */  sw         $s0, 0x10($sp)
    /* 2894C 80162544 1280013C */  lui        $at, %hi(numtrigs)
    /* 28950 80162548 78BB20AC */  sw         $zero, %lo(numtrigs)($at)
  .L8016254C:
    /* 28954 8016254C 21800000 */  addu       $s0, $zero, $zero
    /* 28958 80162550 21200002 */  addu       $a0, $s0, $zero
  .L80162554:
    /* 2895C 80162554 910A020C */  jal        GetDPiece__Fii
    /* 28960 80162558 21282002 */   addu      $a1, $s1, $zero
    /* 28964 8016255C 00140200 */  sll        $v0, $v0, 16
    /* 28968 80162560 03140200 */  sra        $v0, $v0, 16
    /* 2896C 80162564 81000324 */  addiu      $v1, $zero, 0x81
    /* 28970 80162568 12004314 */  bne        $v0, $v1, .L801625B4
    /* 28974 8016256C 21200002 */   addu      $a0, $s0, $zero
    /* 28978 80162570 1280043C */  lui        $a0, %hi(numtrigs)
    /* 2897C 80162574 78BB848C */  lw         $a0, %lo(numtrigs)($a0)
    /* 28980 80162578 43000224 */  addiu      $v0, $zero, 0x43
    /* 28984 8016257C 00190400 */  sll        $v1, $a0, 4
    /* 28988 80162580 01008424 */  addiu      $a0, $a0, 0x1
    /* 2898C 80162584 0E80013C */  lui        $at, %hi(trigs)
    /* 28990 80162588 21082300 */  addu       $at, $at, $v1
    /* 28994 8016258C CC3330AC */  sw         $s0, %lo(trigs)($at)
    /* 28998 80162590 0E80013C */  lui        $at, %hi(trigs + 0x4)
    /* 2899C 80162594 21082300 */  addu       $at, $at, $v1
    /* 289A0 80162598 D03331AC */  sw         $s1, %lo(trigs + 0x4)($at)
    /* 289A4 8016259C 0E80013C */  lui        $at, %hi(trigs + 0x8)
    /* 289A8 801625A0 21082300 */  addu       $at, $at, $v1
    /* 289AC 801625A4 D43322AC */  sw         $v0, %lo(trigs + 0x8)($at)
    /* 289B0 801625A8 1280013C */  lui        $at, %hi(numtrigs)
    /* 289B4 801625AC 78BB24AC */  sw         $a0, %lo(numtrigs)($at)
    /* 289B8 801625B0 21200002 */  addu       $a0, $s0, $zero
  .L801625B4:
    /* 289BC 801625B4 910A020C */  jal        GetDPiece__Fii
    /* 289C0 801625B8 21282002 */   addu      $a1, $s1, $zero
    /* 289C4 801625BC 00140200 */  sll        $v0, $v0, 16
    /* 289C8 801625C0 03140200 */  sra        $v0, $v0, 16
    /* 289CC 801625C4 73000324 */  addiu      $v1, $zero, 0x73
    /* 289D0 801625C8 11004314 */  bne        $v0, $v1, .L80162610
    /* 289D4 801625CC 42000224 */   addiu     $v0, $zero, 0x42
    /* 289D8 801625D0 1280043C */  lui        $a0, %hi(numtrigs)
    /* 289DC 801625D4 78BB848C */  lw         $a0, %lo(numtrigs)($a0)
    /* 289E0 801625D8 00000000 */  nop
    /* 289E4 801625DC 00190400 */  sll        $v1, $a0, 4
    /* 289E8 801625E0 01008424 */  addiu      $a0, $a0, 0x1
    /* 289EC 801625E4 0E80013C */  lui        $at, %hi(trigs)
    /* 289F0 801625E8 21082300 */  addu       $at, $at, $v1
    /* 289F4 801625EC CC3330AC */  sw         $s0, %lo(trigs)($at)
    /* 289F8 801625F0 0E80013C */  lui        $at, %hi(trigs + 0x4)
    /* 289FC 801625F4 21082300 */  addu       $at, $at, $v1
    /* 28A00 801625F8 D03331AC */  sw         $s1, %lo(trigs + 0x4)($at)
    /* 28A04 801625FC 0E80013C */  lui        $at, %hi(trigs + 0x8)
    /* 28A08 80162600 21082300 */  addu       $at, $at, $v1
    /* 28A0C 80162604 D43322AC */  sw         $v0, %lo(trigs + 0x8)($at)
    /* 28A10 80162608 1280013C */  lui        $at, %hi(numtrigs)
    /* 28A14 8016260C 78BB24AC */  sw         $a0, %lo(numtrigs)($at)
  .L80162610:
    /* 28A18 80162610 01001026 */  addiu      $s0, $s0, 0x1
    /* 28A1C 80162614 6000022A */  slti       $v0, $s0, 0x60
    /* 28A20 80162618 CEFF4014 */  bnez       $v0, .L80162554
    /* 28A24 8016261C 21200002 */   addu      $a0, $s0, $zero
    /* 28A28 80162620 01003126 */  addiu      $s1, $s1, 0x1
    /* 28A2C 80162624 6000222A */  slti       $v0, $s1, 0x60
    /* 28A30 80162628 C8FF4014 */  bnez       $v0, .L8016254C
    /* 28A34 8016262C 00000000 */   nop
    /* 28A38 80162630 1280023C */  lui        $v0, %hi(sel_data)
    /* 28A3C 80162634 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 28A40 80162638 1280013C */  lui        $at, %hi(_trigflag)
    /* 28A44 8016263C 21082200 */  addu       $at, $at, $v0
    /* 28A48 80162640 74BB20A0 */  sb         $zero, %lo(_trigflag)($at)
    /* 28A4C 80162644 1800BF8F */  lw         $ra, 0x18($sp)
    /* 28A50 80162648 1400B18F */  lw         $s1, 0x14($sp)
    /* 28A54 8016264C 1000B08F */  lw         $s0, 0x10($sp)
    /* 28A58 80162650 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 28A5C 80162654 0800E003 */  jr         $ra
    /* 28A60 80162658 00000000 */   nop
endlabel InitL1Triggers__Fv
