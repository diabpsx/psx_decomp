.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_GOTOGETITEM__FPC4TCmdi, 0x88

glabel On_GOTOGETITEM__FPC4TCmdi
    /* 40128 80050128 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 4012C 8005012C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 40130 80050130 21888000 */  addu       $s1, $a0, $zero
    /* 40134 80050134 1000B0AF */  sw         $s0, 0x10($sp)
    /* 40138 80050138 2180A000 */  addu       $s0, $a1, $zero
    /* 4013C 8005013C 21200002 */  addu       $a0, $s0, $zero
    /* 40140 80050140 01002592 */  lbu        $a1, 0x1($s1)
    /* 40144 80050144 02002692 */  lbu        $a2, 0x2($s1)
    /* 40148 80050148 1800BFAF */  sw         $ra, 0x18($sp)
    /* 4014C 8005014C 4F9B010C */  jal        MakePlrPath__FiiiUc
    /* 40150 80050150 21380000 */   addu      $a3, $zero, $zero
    /* 40154 80050154 40101000 */  sll        $v0, $s0, 1
    /* 40158 80050158 21105000 */  addu       $v0, $v0, $s0
    /* 4015C 8005015C 80100200 */  sll        $v0, $v0, 2
    /* 40160 80050160 21105000 */  addu       $v0, $v0, $s0
    /* 40164 80050164 00110200 */  sll        $v0, $v0, 4
    /* 40168 80050168 23105000 */  subu       $v0, $v0, $s0
    /* 4016C 8005016C 80100200 */  sll        $v0, $v0, 2
    /* 40170 80050170 21105000 */  addu       $v0, $v0, $s0
    /* 40174 80050174 C0100200 */  sll        $v0, $v0, 3
    /* 40178 80050178 04002496 */  lhu        $a0, 0x4($s1)
    /* 4017C 8005017C 0F000324 */  addiu      $v1, $zero, 0xF
    /* 40180 80050180 0E80013C */  lui        $at, %hi(plr + 0x1E)
    /* 40184 80050184 21082200 */  addu       $at, $at, $v0
    /* 40188 80050188 56A523A0 */  sb         $v1, %lo(plr + 0x1E)($at)
    /* 4018C 8005018C 0E80013C */  lui        $at, %hi(plr + 0x1F)
    /* 40190 80050190 21082200 */  addu       $at, $at, $v0
    /* 40194 80050194 57A524A0 */  sb         $a0, %lo(plr + 0x1F)($at)
    /* 40198 80050198 1800BF8F */  lw         $ra, 0x18($sp)
    /* 4019C 8005019C 1400B18F */  lw         $s1, 0x14($sp)
    /* 401A0 800501A0 1000B08F */  lw         $s0, 0x10($sp)
    /* 401A4 800501A4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 401A8 800501A8 0800E003 */  jr         $ra
    /* 401AC 800501AC 00000000 */   nop
endlabel On_GOTOGETITEM__FPC4TCmdi
