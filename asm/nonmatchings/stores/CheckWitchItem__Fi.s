.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckWitchItem__Fi, 0xA4

glabel CheckWitchItem__Fi
    /* 5C42C 8006C42C 20138283 */  lb         $v0, %gp_rel(WStaffFlag)($gp)
    /* 5C430 8006C430 00000000 */  nop
    /* 5C434 8006C434 13004014 */  bnez       $v0, .L8006C484
    /* 5C438 8006C438 C0180400 */   sll       $v1, $a0, 3
    /* 5C43C 8006C43C 23186400 */  subu       $v1, $v1, $a0
    /* 5C440 8006C440 80180300 */  sll        $v1, $v1, 2
    /* 5C444 8006C444 23186400 */  subu       $v1, $v1, $a0
    /* 5C448 8006C448 3413848F */  lw         $a0, %gp_rel(StorePlrNo)($gp)
    /* 5C44C 8006C44C 80180300 */  sll        $v1, $v1, 2
    /* 5C450 8006C450 00110400 */  sll        $v0, $a0, 4
    /* 5C454 8006C454 21104400 */  addu       $v0, $v0, $a0
    /* 5C458 8006C458 C0100200 */  sll        $v0, $v0, 3
    /* 5C45C 8006C45C 23104400 */  subu       $v0, $v0, $a0
    /* 5C460 8006C460 00110200 */  sll        $v0, $v0, 4
    /* 5C464 8006C464 21186200 */  addu       $v1, $v1, $v0
    /* 5C468 8006C468 0E80013C */  lui        $at, %hi(_witchitem + 0x4D)
    /* 5C46C 8006C46C 21082300 */  addu       $at, $at, $v1
    /* 5C470 8006C470 65FA2290 */  lbu        $v0, %lo(_witchitem + 0x4D)($at)
    /* 5C474 8006C474 00000000 */  nop
    /* 5C478 8006C478 17004238 */  xori       $v0, $v0, 0x17
    /* 5C47C 8006C47C 32B10108 */  j          .L8006C4C8
    /* 5C480 8006C480 2B100200 */   sltu      $v0, $zero, $v0
  .L8006C484:
    /* 5C484 8006C484 23186400 */  subu       $v1, $v1, $a0
    /* 5C488 8006C488 80180300 */  sll        $v1, $v1, 2
    /* 5C48C 8006C48C 23186400 */  subu       $v1, $v1, $a0
    /* 5C490 8006C490 3413848F */  lw         $a0, %gp_rel(StorePlrNo)($gp)
    /* 5C494 8006C494 80180300 */  sll        $v1, $v1, 2
    /* 5C498 8006C498 00110400 */  sll        $v0, $a0, 4
    /* 5C49C 8006C49C 21104400 */  addu       $v0, $v0, $a0
    /* 5C4A0 8006C4A0 C0100200 */  sll        $v0, $v0, 3
    /* 5C4A4 8006C4A4 23104400 */  subu       $v0, $v0, $a0
    /* 5C4A8 8006C4A8 00110200 */  sll        $v0, $v0, 4
    /* 5C4AC 8006C4AC 21186200 */  addu       $v1, $v1, $v0
    /* 5C4B0 8006C4B0 0E80013C */  lui        $at, %hi(_witchitem + 0x4D)
    /* 5C4B4 8006C4B4 21082300 */  addu       $at, $at, $v1
    /* 5C4B8 8006C4B8 65FA2290 */  lbu        $v0, %lo(_witchitem + 0x4D)($at)
    /* 5C4BC 8006C4BC 00000000 */  nop
    /* 5C4C0 8006C4C0 17004238 */  xori       $v0, $v0, 0x17
    /* 5C4C4 8006C4C4 0100422C */  sltiu      $v0, $v0, 0x1
  .L8006C4C8:
    /* 5C4C8 8006C4C8 0800E003 */  jr         $ra
    /* 5C4CC 8006C4CC 00000000 */   nop
endlabel CheckWitchItem__Fi
