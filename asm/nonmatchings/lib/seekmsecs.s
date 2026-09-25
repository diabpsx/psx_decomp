.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching seekmsecs, 0x80

glabel seekmsecs
    /* 199E0 800299E0 B035023C */  lui        $v0, (0x35B0123F >> 16)
    /* 199E4 800299E4 3F124234 */  ori        $v0, $v0, (0x35B0123F & 0xFFFF)
    /* 199E8 800299E8 18008200 */  mult       $a0, $v0
    /* 199EC 800299EC 10180000 */  mfhi       $v1
    /* 199F0 800299F0 00000000 */  nop
    /* 199F4 800299F4 00000000 */  nop
    /* 199F8 800299F8 1800A200 */  mult       $a1, $v0
    /* 199FC 800299FC C3270400 */  sra        $a0, $a0, 31
    /* 19A00 80029A00 03130300 */  sra        $v0, $v1, 12
    /* 19A04 80029A04 23304400 */  subu       $a2, $v0, $a0
    /* 19A08 80029A08 1C1D838F */  lw         $v1, %gp_rel(blackdevstation)($gp)
    /* 19A0C 80029A0C C32F0500 */  sra        $a1, $a1, 31
    /* 19A10 80029A10 10380000 */  mfhi       $a3
    /* 19A14 80029A14 03130700 */  sra        $v0, $a3, 12
    /* 19A18 80029A18 09006014 */  bnez       $v1, .L80029A40
    /* 19A1C 80029A1C 23204500 */   subu      $a0, $v0, $a1
    /* 19A20 80029A20 00110600 */  sll        $v0, $a2, 4
    /* 19A24 80029A24 21104400 */  addu       $v0, $v0, $a0
    /* 19A28 80029A28 40100200 */  sll        $v0, $v0, 1
    /* 19A2C 80029A2C 0B80013C */  lui        $at, %hi(seekmsecstbl)
    /* 19A30 80029A30 21082200 */  addu       $at, $at, $v0
    /* 19A34 80029A34 C46B2284 */  lh         $v0, %lo(seekmsecstbl)($at)
    /* 19A38 80029A38 96A60008 */  j          .L80029A58
    /* 19A3C 80029A3C 00000000 */   nop
  .L80029A40:
    /* 19A40 80029A40 00110600 */  sll        $v0, $a2, 4
    /* 19A44 80029A44 21104400 */  addu       $v0, $v0, $a0
    /* 19A48 80029A48 40100200 */  sll        $v0, $v0, 1
    /* 19A4C 80029A4C 0B80013C */  lui        $at, %hi(blackseekmsecstbl)
    /* 19A50 80029A50 21082200 */  addu       $at, $at, $v0
    /* 19A54 80029A54 C46D2284 */  lh         $v0, %lo(blackseekmsecstbl)($at)
  .L80029A58:
    /* 19A58 80029A58 0800E003 */  jr         $ra
    /* 19A5C 80029A5C 00000000 */   nop
endlabel seekmsecs
