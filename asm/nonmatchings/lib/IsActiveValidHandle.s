.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching IsActiveValidHandle, 0x38

glabel IsActiveValidHandle
    /* 11AD8 80021AD8 C800822C */  sltiu      $v0, $a0, 0xC8
    /* 11ADC 80021ADC 03004014 */  bnez       $v0, .L80021AEC
    /* 11AE0 80021AE0 C0100400 */   sll       $v0, $a0, 3
    /* 11AE4 80021AE4 C2860008 */  j          .L80021B08
    /* 11AE8 80021AE8 21100000 */   addu      $v0, $zero, $zero
  .L80021AEC:
    /* 11AEC 80021AEC 23104400 */  subu       $v0, $v0, $a0
    /* 11AF0 80021AF0 80100200 */  sll        $v0, $v0, 2
    /* 11AF4 80021AF4 1380013C */  lui        $at, %hi(D_801325D8)
    /* 11AF8 80021AF8 21082200 */  addu       $at, $at, $v0
    /* 11AFC 80021AFC D825228C */  lw         $v0, %lo(D_801325D8)($at)
    /* 11B00 80021B00 00000000 */  nop
    /* 11B04 80021B04 2B100200 */  sltu       $v0, $zero, $v0
  .L80021B08:
    /* 11B08 80021B08 0800E003 */  jr         $ra
    /* 11B0C 80021B0C 00000000 */   nop
endlabel IsActiveValidHandle
