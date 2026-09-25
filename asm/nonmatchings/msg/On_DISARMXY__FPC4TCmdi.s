.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_DISARMXY__FPC4TCmdi, 0xE0

glabel On_DISARMXY__FPC4TCmdi
    /* 40FA0 80050FA0 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 40FA4 80050FA4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 40FA8 80050FA8 21888000 */  addu       $s1, $a0, $zero
    /* 40FAC 80050FAC 04002296 */  lhu        $v0, 0x4($s1)
    /* 40FB0 80050FB0 1800BFAF */  sw         $ra, 0x18($sp)
    /* 40FB4 80050FB4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 40FB8 80050FB8 40180200 */  sll        $v1, $v0, 1
    /* 40FBC 80050FBC 21186200 */  addu       $v1, $v1, $v0
    /* 40FC0 80050FC0 80180300 */  sll        $v1, $v1, 2
    /* 40FC4 80050FC4 23186200 */  subu       $v1, $v1, $v0
    /* 40FC8 80050FC8 80180300 */  sll        $v1, $v1, 2
    /* 40FCC 80050FCC 0E80013C */  lui        $at, %hi(object + 0x27)
    /* 40FD0 80050FD0 21082300 */  addu       $at, $at, $v1
    /* 40FD4 80050FD4 738C2290 */  lbu        $v0, %lo(object + 0x27)($at)
    /* 40FD8 80050FD8 00000000 */  nop
    /* 40FDC 80050FDC 0B004014 */  bnez       $v0, .L8005100C
    /* 40FE0 80050FE0 2180A000 */   addu      $s0, $a1, $zero
    /* 40FE4 80050FE4 0E80013C */  lui        $at, %hi(object + 0x2B)
    /* 40FE8 80050FE8 21082300 */  addu       $at, $at, $v1
    /* 40FEC 80050FEC 778C2290 */  lbu        $v0, %lo(object + 0x2B)($at)
    /* 40FF0 80050FF0 00000000 */  nop
    /* 40FF4 80050FF4 06004014 */  bnez       $v0, .L80051010
    /* 40FF8 80050FF8 21200002 */   addu      $a0, $s0, $zero
    /* 40FFC 80050FFC 01002592 */  lbu        $a1, 0x1($s1)
    /* 41000 80051000 02002692 */  lbu        $a2, 0x2($s1)
    /* 41004 80051004 07440108 */  j          .L8005101C
    /* 41008 80051008 01000724 */   addiu     $a3, $zero, 0x1
  .L8005100C:
    /* 4100C 8005100C 21200002 */  addu       $a0, $s0, $zero
  .L80051010:
    /* 41010 80051010 01002592 */  lbu        $a1, 0x1($s1)
    /* 41014 80051014 02002692 */  lbu        $a2, 0x2($s1)
    /* 41018 80051018 21380000 */  addu       $a3, $zero, $zero
  .L8005101C:
    /* 4101C 8005101C 4F9B010C */  jal        MakePlrPath__FiiiUc
    /* 41020 80051020 00000000 */   nop
    /* 41024 80051024 40101000 */  sll        $v0, $s0, 1
    /* 41028 80051028 21105000 */  addu       $v0, $v0, $s0
    /* 4102C 8005102C 80100200 */  sll        $v0, $v0, 2
    /* 41030 80051030 21105000 */  addu       $v0, $v0, $s0
    /* 41034 80051034 00110200 */  sll        $v0, $v0, 4
    /* 41038 80051038 23105000 */  subu       $v0, $v0, $s0
    /* 4103C 8005103C 80100200 */  sll        $v0, $v0, 2
    /* 41040 80051040 21105000 */  addu       $v0, $v0, $s0
    /* 41044 80051044 C0100200 */  sll        $v0, $v0, 3
    /* 41048 80051048 04002496 */  lhu        $a0, 0x4($s1)
    /* 4104C 8005104C 0E000324 */  addiu      $v1, $zero, 0xE
    /* 41050 80051050 0E80013C */  lui        $at, %hi(plr + 0x1E)
    /* 41054 80051054 21082200 */  addu       $at, $at, $v0
    /* 41058 80051058 56A523A0 */  sb         $v1, %lo(plr + 0x1E)($at)
    /* 4105C 8005105C 0E80013C */  lui        $at, %hi(plr + 0x1F)
    /* 41060 80051060 21082200 */  addu       $at, $at, $v0
    /* 41064 80051064 57A524A0 */  sb         $a0, %lo(plr + 0x1F)($at)
    /* 41068 80051068 1800BF8F */  lw         $ra, 0x18($sp)
    /* 4106C 8005106C 1400B18F */  lw         $s1, 0x14($sp)
    /* 41070 80051070 1000B08F */  lw         $s0, 0x10($sp)
    /* 41074 80051074 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 41078 80051078 0800E003 */  jr         $ra
    /* 4107C 8005107C 00000000 */   nop
endlabel On_DISARMXY__FPC4TCmdi
