.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching returnseekmsecs, 0xC0

glabel returnseekmsecs
    /* 19A60 80029A60 B035023C */  lui        $v0, (0x35B0123F >> 16)
    /* 19A64 80029A64 3F124234 */  ori        $v0, $v0, (0x35B0123F & 0xFFFF)
    /* 19A68 80029A68 18008200 */  mult       $a0, $v0
    /* 19A6C 80029A6C 10180000 */  mfhi       $v1
    /* 19A70 80029A70 00000000 */  nop
    /* 19A74 80029A74 00000000 */  nop
    /* 19A78 80029A78 1800A200 */  mult       $a1, $v0
    /* 19A7C 80029A7C F0FFBD27 */  addiu      $sp, $sp, -0x10
    /* 19A80 80029A80 C3270400 */  sra        $a0, $a0, 31
    /* 19A84 80029A84 03130300 */  sra        $v0, $v1, 12
    /* 19A88 80029A88 23304400 */  subu       $a2, $v0, $a0
    /* 19A8C 80029A8C 1C1D838F */  lw         $v1, %gp_rel(blackdevstation)($gp)
    /* 19A90 80029A90 C32F0500 */  sra        $a1, $a1, 31
    /* 19A94 80029A94 10380000 */  mfhi       $a3
    /* 19A98 80029A98 03130700 */  sra        $v0, $a3, 12
    /* 19A9C 80029A9C 0F006014 */  bnez       $v1, .L80029ADC
    /* 19AA0 80029AA0 23204500 */   subu      $a0, $v0, $a1
    /* 19AA4 80029AA4 00110600 */  sll        $v0, $a2, 4
    /* 19AA8 80029AA8 21104400 */  addu       $v0, $v0, $a0
    /* 19AAC 80029AAC 40100200 */  sll        $v0, $v0, 1
    /* 19AB0 80029AB0 0B80013C */  lui        $at, %hi(seekmsecstbl)
    /* 19AB4 80029AB4 21082200 */  addu       $at, $at, $v0
    /* 19AB8 80029AB8 C46B2384 */  lh         $v1, %lo(seekmsecstbl)($at)
    /* 19ABC 80029ABC 00110400 */  sll        $v0, $a0, 4
    /* 19AC0 80029AC0 21104600 */  addu       $v0, $v0, $a2
    /* 19AC4 80029AC4 40100200 */  sll        $v0, $v0, 1
    /* 19AC8 80029AC8 0B80013C */  lui        $at, %hi(seekmsecstbl)
    /* 19ACC 80029ACC 21082200 */  addu       $at, $at, $v0
    /* 19AD0 80029AD0 C46B2284 */  lh         $v0, %lo(seekmsecstbl)($at)
    /* 19AD4 80029AD4 C5A60008 */  j          .L80029B14
    /* 19AD8 80029AD8 21106200 */   addu      $v0, $v1, $v0
  .L80029ADC:
    /* 19ADC 80029ADC 00110600 */  sll        $v0, $a2, 4
    /* 19AE0 80029AE0 21104400 */  addu       $v0, $v0, $a0
    /* 19AE4 80029AE4 40100200 */  sll        $v0, $v0, 1
    /* 19AE8 80029AE8 0B80013C */  lui        $at, %hi(blackseekmsecstbl)
    /* 19AEC 80029AEC 21082200 */  addu       $at, $at, $v0
    /* 19AF0 80029AF0 C46D2384 */  lh         $v1, %lo(blackseekmsecstbl)($at)
    /* 19AF4 80029AF4 00110400 */  sll        $v0, $a0, 4
    /* 19AF8 80029AF8 21104600 */  addu       $v0, $v0, $a2
    /* 19AFC 80029AFC 40100200 */  sll        $v0, $v0, 1
    /* 19B00 80029B00 0B80013C */  lui        $at, %hi(blackseekmsecstbl)
    /* 19B04 80029B04 21082200 */  addu       $at, $at, $v0
    /* 19B08 80029B08 C46D2284 */  lh         $v0, %lo(blackseekmsecstbl)($at)
    /* 19B0C 80029B0C 00000000 */  nop
    /* 19B10 80029B10 21106200 */  addu       $v0, $v1, $v0
  .L80029B14:
    /* 19B14 80029B14 1000BD27 */  addiu      $sp, $sp, 0x10
    /* 19B18 80029B18 0800E003 */  jr         $ra
    /* 19B1C 80029B1C 00000000 */   nop
endlabel returnseekmsecs
