.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_GOTOAGETITEM__FPC4TCmdi, 0x88

glabel On_GOTOAGETITEM__FPC4TCmdi
    /* 404C4 800504C4 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 404C8 800504C8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 404CC 800504CC 21888000 */  addu       $s1, $a0, $zero
    /* 404D0 800504D0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 404D4 800504D4 2180A000 */  addu       $s0, $a1, $zero
    /* 404D8 800504D8 21200002 */  addu       $a0, $s0, $zero
    /* 404DC 800504DC 01002592 */  lbu        $a1, 0x1($s1)
    /* 404E0 800504E0 02002692 */  lbu        $a2, 0x2($s1)
    /* 404E4 800504E4 1800BFAF */  sw         $ra, 0x18($sp)
    /* 404E8 800504E8 4F9B010C */  jal        MakePlrPath__FiiiUc
    /* 404EC 800504EC 21380000 */   addu      $a3, $zero, $zero
    /* 404F0 800504F0 40101000 */  sll        $v0, $s0, 1
    /* 404F4 800504F4 21105000 */  addu       $v0, $v0, $s0
    /* 404F8 800504F8 80100200 */  sll        $v0, $v0, 2
    /* 404FC 800504FC 21105000 */  addu       $v0, $v0, $s0
    /* 40500 80050500 00110200 */  sll        $v0, $v0, 4
    /* 40504 80050504 23105000 */  subu       $v0, $v0, $s0
    /* 40508 80050508 80100200 */  sll        $v0, $v0, 2
    /* 4050C 8005050C 21105000 */  addu       $v0, $v0, $s0
    /* 40510 80050510 C0100200 */  sll        $v0, $v0, 3
    /* 40514 80050514 04002496 */  lhu        $a0, 0x4($s1)
    /* 40518 80050518 10000324 */  addiu      $v1, $zero, 0x10
    /* 4051C 8005051C 0E80013C */  lui        $at, %hi(plr + 0x1E)
    /* 40520 80050520 21082200 */  addu       $at, $at, $v0
    /* 40524 80050524 56A523A0 */  sb         $v1, %lo(plr + 0x1E)($at)
    /* 40528 80050528 0E80013C */  lui        $at, %hi(plr + 0x1F)
    /* 4052C 8005052C 21082200 */  addu       $at, $at, $v0
    /* 40530 80050530 57A524A0 */  sb         $a0, %lo(plr + 0x1F)($at)
    /* 40534 80050534 1800BF8F */  lw         $ra, 0x18($sp)
    /* 40538 80050538 1400B18F */  lw         $s1, 0x14($sp)
    /* 4053C 8005053C 1000B08F */  lw         $s0, 0x10($sp)
    /* 40540 80050540 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 40544 80050544 0800E003 */  jr         $ra
    /* 40548 80050548 00000000 */   nop
endlabel On_GOTOAGETITEM__FPC4TCmdi
