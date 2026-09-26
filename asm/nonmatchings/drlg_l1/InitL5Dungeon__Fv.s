.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitL5Dungeon__Fv, 0x84

glabel InitL5Dungeon__Fv
    /* 3700 8013D2F8 21280000 */  addu       $a1, $zero, $zero
    /* 3704 8013D2FC 0E80073C */  lui        $a3, %hi(dungeon)
    /* 3708 8013D300 C440E724 */  addiu      $a3, $a3, %lo(dungeon)
    /* 370C 8013D304 21200000 */  addu       $a0, $zero, $zero
  .L8013D308:
    /* 3710 8013D308 40300500 */  sll        $a2, $a1, 1
    /* 3714 8013D30C 2118E000 */  addu       $v1, $a3, $zero
  .L8013D310:
    /* 3718 8013D310 2110C300 */  addu       $v0, $a2, $v1
    /* 371C 8013D314 000040A4 */  sh         $zero, 0x0($v0)
    /* 3720 8013D318 01008424 */  addiu      $a0, $a0, 0x1
    /* 3724 8013D31C 30008228 */  slti       $v0, $a0, 0x30
    /* 3728 8013D320 FBFF4014 */  bnez       $v0, .L8013D310
    /* 372C 8013D324 60006324 */   addiu     $v1, $v1, 0x60
    /* 3730 8013D328 0100A524 */  addiu      $a1, $a1, 0x1
    /* 3734 8013D32C 3000A228 */  slti       $v0, $a1, 0x30
    /* 3738 8013D330 F5FF4014 */  bnez       $v0, .L8013D308
    /* 373C 8013D334 21200000 */   addu      $a0, $zero, $zero
    /* 3740 8013D338 21280000 */  addu       $a1, $zero, $zero
    /* 3744 8013D33C 21300000 */  addu       $a2, $zero, $zero
  .L8013D340:
    /* 3748 8013D340 21200000 */  addu       $a0, $zero, $zero
  .L8013D344:
    /* 374C 8013D344 2110C400 */  addu       $v0, $a2, $a0
    /* 3750 8013D348 1280033C */  lui        $v1, %hi(mydflags)
    /* 3754 8013D34C D8C0638C */  lw         $v1, %lo(mydflags)($v1)
    /* 3758 8013D350 01008424 */  addiu      $a0, $a0, 0x1
    /* 375C 8013D354 21186200 */  addu       $v1, $v1, $v0
    /* 3760 8013D358 28008228 */  slti       $v0, $a0, 0x28
    /* 3764 8013D35C F9FF4014 */  bnez       $v0, .L8013D344
    /* 3768 8013D360 000060A0 */   sb        $zero, 0x0($v1)
    /* 376C 8013D364 0100A524 */  addiu      $a1, $a1, 0x1
    /* 3770 8013D368 2800A228 */  slti       $v0, $a1, 0x28
    /* 3774 8013D36C F4FF4014 */  bnez       $v0, .L8013D340
    /* 3778 8013D370 2800C624 */   addiu     $a2, $a2, 0x28
    /* 377C 8013D374 0800E003 */  jr         $ra
    /* 3780 8013D378 00000000 */   nop
endlabel InitL5Dungeon__Fv
