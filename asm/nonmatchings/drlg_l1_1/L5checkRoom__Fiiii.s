.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching L5checkRoom__Fiiii, 0x94

glabel L5checkRoom__Fiiii
    /* 3840 8013D438 F0FFBD27 */  addiu      $sp, $sp, -0x10
    /* 3844 8013D43C 1F00E018 */  blez       $a3, .L8013D4BC
    /* 3848 8013D440 21480000 */   addu      $t1, $zero, $zero
    /* 384C 8013D444 0E800C3C */  lui        $t4, %hi(dungeon)
    /* 3850 8013D448 C4408C25 */  addiu      $t4, $t4, %lo(dungeon)
  .L8013D44C:
    /* 3854 8013D44C 1700C018 */  blez       $a2, .L8013D4AC
    /* 3858 8013D450 21400000 */   addu      $t0, $zero, $zero
    /* 385C 8013D454 2110A900 */  addu       $v0, $a1, $t1
    /* 3860 8013D458 28004B2C */  sltiu      $t3, $v0, 0x28
    /* 3864 8013D45C 40500200 */  sll        $t2, $v0, 1
    /* 3868 8013D460 21188800 */  addu       $v1, $a0, $t0
  .L8013D464:
    /* 386C 8013D464 2800622C */  sltiu      $v0, $v1, 0x28
    /* 3870 8013D468 0B004010 */  beqz       $v0, .L8013D498
    /* 3874 8013D46C 00000000 */   nop
    /* 3878 8013D470 09006011 */  beqz       $t3, .L8013D498
    /* 387C 8013D474 40100300 */   sll       $v0, $v1, 1
    /* 3880 8013D478 21104300 */  addu       $v0, $v0, $v1
    /* 3884 8013D47C 40110200 */  sll        $v0, $v0, 5
    /* 3888 8013D480 21104C00 */  addu       $v0, $v0, $t4
    /* 388C 8013D484 21104201 */  addu       $v0, $t2, $v0
    /* 3890 8013D488 00004294 */  lhu        $v0, 0x0($v0)
    /* 3894 8013D48C 00000000 */  nop
    /* 3898 8013D490 03004010 */  beqz       $v0, .L8013D4A0
    /* 389C 8013D494 01000825 */   addiu     $t0, $t0, 0x1
  .L8013D498:
    /* 38A0 8013D498 30F50408 */  j          .L8013D4C0
    /* 38A4 8013D49C 21100000 */   addu      $v0, $zero, $zero
  .L8013D4A0:
    /* 38A8 8013D4A0 2A100601 */  slt        $v0, $t0, $a2
    /* 38AC 8013D4A4 EFFF4014 */  bnez       $v0, .L8013D464
    /* 38B0 8013D4A8 21188800 */   addu      $v1, $a0, $t0
  .L8013D4AC:
    /* 38B4 8013D4AC 01002925 */  addiu      $t1, $t1, 0x1
    /* 38B8 8013D4B0 2A102701 */  slt        $v0, $t1, $a3
    /* 38BC 8013D4B4 E5FF4014 */  bnez       $v0, .L8013D44C
    /* 38C0 8013D4B8 00000000 */   nop
  .L8013D4BC:
    /* 38C4 8013D4BC 01000224 */  addiu      $v0, $zero, 0x1
  .L8013D4C0:
    /* 38C8 8013D4C0 1000BD27 */  addiu      $sp, $sp, 0x10
    /* 38CC 8013D4C4 0800E003 */  jr         $ra
    /* 38D0 8013D4C8 00000000 */   nop
endlabel L5checkRoom__Fiiii
