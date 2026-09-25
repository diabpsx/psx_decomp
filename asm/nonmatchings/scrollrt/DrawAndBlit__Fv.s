.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawAndBlit__Fv, 0xD4

glabel DrawAndBlit__Fv
    /* 594D0 800694D0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 594D4 800694D4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 594D8 800694D8 1400BFAF */  sw         $ra, 0x14($sp)
    /* 594DC 800694DC C16E020C */  jal        GLUE_Finished__Fv
    /* 594E0 800694E0 21800000 */   addu      $s0, $zero, $zero
    /* 594E4 800694E4 05004014 */  bnez       $v0, .L800694FC
    /* 594E8 800694E8 00000000 */   nop
    /* 594EC 800694EC 9291020C */  jal        IsGameLoading__Fv
    /* 594F0 800694F0 00000000 */   nop
    /* 594F4 800694F4 02004010 */  beqz       $v0, .L80069500
    /* 594F8 800694F8 00000000 */   nop
  .L800694FC:
    /* 594FC 800694FC 01001024 */  addiu      $s0, $zero, 0x1
  .L80069500:
    /* 59500 80069500 23000016 */  bnez       $s0, .L80069590
    /* 59504 80069504 01000224 */   addiu     $v0, $zero, 0x1
    /* 59508 80069508 1280033C */  lui        $v1, %hi(leveltype)
    /* 5950C 8006950C 0DC16390 */  lbu        $v1, %lo(leveltype)($v1)
    /* 59510 80069510 1280013C */  lui        $at, %hi(drawhpflag)
    /* 59514 80069514 BEB622A0 */  sb         $v0, %lo(drawhpflag)($at)
    /* 59518 80069518 1280013C */  lui        $at, %hi(drawmanaflag)
    /* 5951C 8006951C BFB622A0 */  sb         $v0, %lo(drawmanaflag)($at)
    /* 59520 80069520 1280013C */  lui        $at, %hi(drawbtnflag)
    /* 59524 80069524 C1B622A0 */  sb         $v0, %lo(drawbtnflag)($at)
    /* 59528 80069528 1280013C */  lui        $at, %hi(drawsbarflag)
    /* 5952C 8006952C 2DC322A0 */  sb         $v0, %lo(drawsbarflag)($at)
    /* 59530 80069530 09006010 */  beqz       $v1, .L80069558
    /* 59534 80069534 00000000 */   nop
    /* 59538 80069538 1280043C */  lui        $a0, %hi(ViewX)
    /* 5953C 8006953C 14C1848C */  lw         $a0, %lo(ViewX)($a0)
    /* 59540 80069540 1280053C */  lui        $a1, %hi(ViewY)
    /* 59544 80069544 18C1A58C */  lw         $a1, %lo(ViewY)($a1)
    /* 59548 80069548 C7A4010C */  jal        DrawView__Fii
    /* 5954C 8006954C 00000000 */   nop
    /* 59550 80069550 5CA50108 */  j          .L80069570
    /* 59554 80069554 00000000 */   nop
  .L80069558:
    /* 59558 80069558 1280043C */  lui        $a0, %hi(ViewX)
    /* 5955C 8006955C 14C1848C */  lw         $a0, %lo(ViewX)($a0)
    /* 59560 80069560 1280053C */  lui        $a1, %hi(ViewY)
    /* 59564 80069564 18C1A58C */  lw         $a1, %lo(ViewY)($a1)
    /* 59568 80069568 1ED1010C */  jal        T_DrawView__Fii
    /* 5956C 8006956C 00000000 */   nop
  .L80069570:
    /* 59570 80069570 1280013C */  lui        $at, %hi(drawhpflag)
    /* 59574 80069574 BEB620A0 */  sb         $zero, %lo(drawhpflag)($at)
    /* 59578 80069578 1280013C */  lui        $at, %hi(drawmanaflag)
    /* 5957C 8006957C BFB620A0 */  sb         $zero, %lo(drawmanaflag)($at)
    /* 59580 80069580 1280013C */  lui        $at, %hi(drawbtnflag)
    /* 59584 80069584 C1B620A0 */  sb         $zero, %lo(drawbtnflag)($at)
    /* 59588 80069588 1280013C */  lui        $at, %hi(drawsbarflag)
    /* 5958C 8006958C 2DC320A0 */  sb         $zero, %lo(drawsbarflag)($at)
  .L80069590:
    /* 59590 80069590 1400BF8F */  lw         $ra, 0x14($sp)
    /* 59594 80069594 1000B08F */  lw         $s0, 0x10($sp)
    /* 59598 80069598 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 5959C 8006959C 0800E003 */  jr         $ra
    /* 595A0 800695A0 00000000 */   nop
endlabel DrawAndBlit__Fv
