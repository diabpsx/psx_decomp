.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_TALKXY__FPC4TCmdi, 0x88

glabel On_TALKXY__FPC4TCmdi
    /* 41634 80051634 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 41638 80051638 1400B1AF */  sw         $s1, 0x14($sp)
    /* 4163C 8005163C 21888000 */  addu       $s1, $a0, $zero
    /* 41640 80051640 1000B0AF */  sw         $s0, 0x10($sp)
    /* 41644 80051644 2180A000 */  addu       $s0, $a1, $zero
    /* 41648 80051648 21200002 */  addu       $a0, $s0, $zero
    /* 4164C 8005164C 01002592 */  lbu        $a1, 0x1($s1)
    /* 41650 80051650 02002692 */  lbu        $a2, 0x2($s1)
    /* 41654 80051654 1800BFAF */  sw         $ra, 0x18($sp)
    /* 41658 80051658 4F9B010C */  jal        MakePlrPath__FiiiUc
    /* 4165C 8005165C 21380000 */   addu      $a3, $zero, $zero
    /* 41660 80051660 40101000 */  sll        $v0, $s0, 1
    /* 41664 80051664 21105000 */  addu       $v0, $v0, $s0
    /* 41668 80051668 80100200 */  sll        $v0, $v0, 2
    /* 4166C 8005166C 21105000 */  addu       $v0, $v0, $s0
    /* 41670 80051670 00110200 */  sll        $v0, $v0, 4
    /* 41674 80051674 23105000 */  subu       $v0, $v0, $s0
    /* 41678 80051678 80100200 */  sll        $v0, $v0, 2
    /* 4167C 8005167C 21105000 */  addu       $v0, $v0, $s0
    /* 41680 80051680 C0100200 */  sll        $v0, $v0, 3
    /* 41684 80051684 04002496 */  lhu        $a0, 0x4($s1)
    /* 41688 80051688 11000324 */  addiu      $v1, $zero, 0x11
    /* 4168C 8005168C 0E80013C */  lui        $at, %hi(plr + 0x1E)
    /* 41690 80051690 21082200 */  addu       $at, $at, $v0
    /* 41694 80051694 56A523A0 */  sb         $v1, %lo(plr + 0x1E)($at)
    /* 41698 80051698 0E80013C */  lui        $at, %hi(plr + 0x1F)
    /* 4169C 8005169C 21082200 */  addu       $at, $at, $v0
    /* 416A0 800516A0 57A524A0 */  sb         $a0, %lo(plr + 0x1F)($at)
    /* 416A4 800516A4 1800BF8F */  lw         $ra, 0x18($sp)
    /* 416A8 800516A8 1400B18F */  lw         $s1, 0x14($sp)
    /* 416AC 800516AC 1000B08F */  lw         $s0, 0x10($sp)
    /* 416B0 800516B0 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 416B4 800516B4 0800E003 */  jr         $ra
    /* 416B8 800516B8 00000000 */   nop
endlabel On_TALKXY__FPC4TCmdi
