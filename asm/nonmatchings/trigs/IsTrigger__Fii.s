.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching IsTrigger__Fii, 0xF8

glabel IsTrigger__Fii
    /* 66994 80076994 F813828F */  lw         $v0, %gp_rel(numtrigs)($gp)
    /* 66998 80076998 00000000 */  nop
    /* 6699C 8007699C 12004018 */  blez       $v0, .L800769E8
    /* 669A0 800769A0 21180000 */   addu      $v1, $zero, $zero
    /* 669A4 800769A4 00310200 */  sll        $a2, $v0, 4
  .L800769A8:
    /* 669A8 800769A8 0E80013C */  lui        $at, %hi(trigs)
    /* 669AC 800769AC 21082300 */  addu       $at, $at, $v1
    /* 669B0 800769B0 CC33228C */  lw         $v0, %lo(trigs)($at)
    /* 669B4 800769B4 00000000 */  nop
    /* 669B8 800769B8 07008214 */  bne        $a0, $v0, .L800769D8
    /* 669BC 800769BC 00000000 */   nop
    /* 669C0 800769C0 0E80013C */  lui        $at, %hi(trigs + 0x4)
    /* 669C4 800769C4 21082300 */  addu       $at, $at, $v1
    /* 669C8 800769C8 D033228C */  lw         $v0, %lo(trigs + 0x4)($at)
    /* 669CC 800769CC 00000000 */  nop
    /* 669D0 800769D0 2C00A210 */  beq        $a1, $v0, .L80076A84
    /* 669D4 800769D4 01000224 */   addiu     $v0, $zero, 0x1
  .L800769D8:
    /* 669D8 800769D8 10006324 */  addiu      $v1, $v1, 0x10
    /* 669DC 800769DC 2A106600 */  slt        $v0, $v1, $a2
    /* 669E0 800769E0 F1FF4014 */  bnez       $v0, .L800769A8
    /* 669E4 800769E4 00000000 */   nop
  .L800769E8:
    /* 669E8 800769E8 21300000 */  addu       $a2, $zero, $zero
    /* 669EC 800769EC 1280073C */  lui        $a3, %hi(currlevel)
    /* 669F0 800769F0 0CC1E790 */  lbu        $a3, %lo(currlevel)($a3)
    /* 669F4 800769F4 21180000 */  addu       $v1, $zero, $zero
  .L800769F8:
    /* 669F8 800769F8 0E80013C */  lui        $at, %hi(quests)
    /* 669FC 800769FC 21082300 */  addu       $at, $at, $v1
    /* 66A00 80076A00 40DA2290 */  lbu        $v0, %lo(quests)($at)
    /* 66A04 80076A04 00000000 */  nop
    /* 66A08 80076A08 1900E214 */  bne        $a3, $v0, .L80076A70
    /* 66A0C 80076A0C 00000000 */   nop
    /* 66A10 80076A10 0E80013C */  lui        $at, %hi(quests + 0xC)
    /* 66A14 80076A14 21082300 */  addu       $at, $at, $v1
    /* 66A18 80076A18 4CDA2290 */  lbu        $v0, %lo(quests + 0xC)($at)
    /* 66A1C 80076A1C 00000000 */  nop
    /* 66A20 80076A20 13004010 */  beqz       $v0, .L80076A70
    /* 66A24 80076A24 00000000 */   nop
    /* 66A28 80076A28 0E80013C */  lui        $at, %hi(quests + 0x2)
    /* 66A2C 80076A2C 21082300 */  addu       $at, $at, $v1
    /* 66A30 80076A30 42DA2290 */  lbu        $v0, %lo(quests + 0x2)($at)
    /* 66A34 80076A34 00000000 */  nop
    /* 66A38 80076A38 0D004010 */  beqz       $v0, .L80076A70
    /* 66A3C 80076A3C 00000000 */   nop
    /* 66A40 80076A40 0E80013C */  lui        $at, %hi(quests + 0x4)
    /* 66A44 80076A44 21082300 */  addu       $at, $at, $v1
    /* 66A48 80076A48 44DA228C */  lw         $v0, %lo(quests + 0x4)($at)
    /* 66A4C 80076A4C 00000000 */  nop
    /* 66A50 80076A50 07008214 */  bne        $a0, $v0, .L80076A70
    /* 66A54 80076A54 00000000 */   nop
    /* 66A58 80076A58 0E80013C */  lui        $at, %hi(quests + 0x8)
    /* 66A5C 80076A5C 21082300 */  addu       $at, $at, $v1
    /* 66A60 80076A60 48DA228C */  lw         $v0, %lo(quests + 0x8)($at)
    /* 66A64 80076A64 00000000 */  nop
    /* 66A68 80076A68 0600A210 */  beq        $a1, $v0, .L80076A84
    /* 66A6C 80076A6C 01000224 */   addiu     $v0, $zero, 0x1
  .L80076A70:
    /* 66A70 80076A70 0100C624 */  addiu      $a2, $a2, 0x1
    /* 66A74 80076A74 1000C228 */  slti       $v0, $a2, 0x10
    /* 66A78 80076A78 DFFF4014 */  bnez       $v0, .L800769F8
    /* 66A7C 80076A7C 14006324 */   addiu     $v1, $v1, 0x14
    /* 66A80 80076A80 21100000 */  addu       $v0, $zero, $zero
  .L80076A84:
    /* 66A84 80076A84 0800E003 */  jr         $ra
    /* 66A88 80076A88 00000000 */   nop
endlabel IsTrigger__Fii
