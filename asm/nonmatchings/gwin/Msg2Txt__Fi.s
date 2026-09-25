.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Msg2Txt__Fi, 0x48

glabel Msg2Txt__Fi
    /* 6B300 8007B300 21180000 */  addu       $v1, $zero, $zero
  .L8007B304:
    /* 6B304 8007B304 1280013C */  lui        $at, %hi(D_80118BD8)
    /* 6B308 8007B308 21082300 */  addu       $at, $at, $v1
    /* 6B30C 8007B30C D88B228C */  lw         $v0, %lo(D_80118BD8)($at)
    /* 6B310 8007B310 00000000 */  nop
    /* 6B314 8007B314 06008214 */  bne        $a0, $v0, .L8007B330
    /* 6B318 8007B318 00000000 */   nop
    /* 6B31C 8007B31C 1280013C */  lui        $at, %hi(D_80118BDC)
    /* 6B320 8007B320 21082300 */  addu       $at, $at, $v1
    /* 6B324 8007B324 DC8B228C */  lw         $v0, %lo(D_80118BDC)($at)
    /* 6B328 8007B328 D0EC0108 */  j          .L8007B340
    /* 6B32C 8007B32C 00000000 */   nop
  .L8007B330:
    /* 6B330 8007B330 08006324 */  addiu      $v1, $v1, 0x8
    /* 6B334 8007B334 5800622C */  sltiu      $v0, $v1, 0x58
    /* 6B338 8007B338 F2FF4014 */  bnez       $v0, .L8007B304
    /* 6B33C 8007B33C 21100000 */   addu      $v0, $zero, $zero
  .L8007B340:
    /* 6B340 8007B340 0800E003 */  jr         $ra
    /* 6B344 8007B344 00000000 */   nop
endlabel Msg2Txt__Fi
