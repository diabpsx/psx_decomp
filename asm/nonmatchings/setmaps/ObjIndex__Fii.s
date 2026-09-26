.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ObjIndex__Fii, 0xB4

glabel ObjIndex__Fii
    /* 1B6E0 801552D8 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1B6E4 801552DC 21388000 */  addu       $a3, $a0, $zero
    /* 1B6E8 801552E0 2130A000 */  addu       $a2, $a1, $zero
    /* 1B6EC 801552E4 1280023C */  lui        $v0, %hi(numobjects)
    /* 1B6F0 801552E8 CCB9428C */  lw         $v0, %lo(numobjects)($v0)
    /* 1B6F4 801552EC 21280000 */  addu       $a1, $zero, $zero
    /* 1B6F8 801552F0 1D004018 */  blez       $v0, .L80155368
    /* 1B6FC 801552F4 1800BFAF */   sw        $ra, 0x18($sp)
    /* 1B700 801552F8 21404000 */  addu       $t0, $v0, $zero
  .L801552FC:
    /* 1B704 801552FC 0E80013C */  lui        $at, %hi(objectactive)
    /* 1B708 80155300 21082500 */  addu       $at, $at, $a1
    /* 1B70C 80155304 20A22480 */  lb         $a0, %lo(objectactive)($at)
    /* 1B710 80155308 00000000 */  nop
    /* 1B714 8015530C 40100400 */  sll        $v0, $a0, 1
    /* 1B718 80155310 21104400 */  addu       $v0, $v0, $a0
    /* 1B71C 80155314 80100200 */  sll        $v0, $v0, 2
    /* 1B720 80155318 23104400 */  subu       $v0, $v0, $a0
    /* 1B724 8015531C 80180200 */  sll        $v1, $v0, 2
    /* 1B728 80155320 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 1B72C 80155324 21082300 */  addu       $at, $at, $v1
    /* 1B730 80155328 6B8C2280 */  lb         $v0, %lo(object + 0x1F)($at)
    /* 1B734 8015532C 00000000 */  nop
    /* 1B738 80155330 09004714 */  bne        $v0, $a3, .L80155358
    /* 1B73C 80155334 00000000 */   nop
    /* 1B740 80155338 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 1B744 8015533C 21082300 */  addu       $at, $at, $v1
    /* 1B748 80155340 6C8C2280 */  lb         $v0, %lo(object + 0x20)($at)
    /* 1B74C 80155344 00000000 */  nop
    /* 1B750 80155348 04004614 */  bne        $v0, $a2, .L8015535C
    /* 1B754 8015534C 0100A524 */   addiu     $a1, $a1, 0x1
    /* 1B758 80155350 DF540508 */  j          .L8015537C
    /* 1B75C 80155354 21108000 */   addu      $v0, $a0, $zero
  .L80155358:
    /* 1B760 80155358 0100A524 */  addiu      $a1, $a1, 0x1
  .L8015535C:
    /* 1B764 8015535C 2A10A800 */  slt        $v0, $a1, $t0
    /* 1B768 80155360 E6FF4014 */  bnez       $v0, .L801552FC
    /* 1B76C 80155364 00000000 */   nop
  .L80155368:
    /* 1B770 80155368 1280043C */  lui        $a0, %hi(D_80119550)
    /* 1B774 8015536C 50958424 */  addiu      $a0, $a0, %lo(D_80119550)
    /* 1B778 80155370 C2E7000C */  jal        app_fatal
    /* 1B77C 80155374 2128E000 */   addu      $a1, $a3, $zero
    /* 1B780 80155378 FFFF0224 */  addiu      $v0, $zero, -0x1
  .L8015537C:
    /* 1B784 8015537C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1B788 80155380 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1B78C 80155384 0800E003 */  jr         $ra
    /* 1B790 80155388 00000000 */   nop
endlabel ObjIndex__Fii
