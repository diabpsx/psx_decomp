.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching WitchRechargeOk__Fi, 0x8C

glabel WitchRechargeOk__Fi
    /* 5D22C 8006D22C C0180400 */  sll        $v1, $a0, 3
    /* 5D230 8006D230 23186400 */  subu       $v1, $v1, $a0
    /* 5D234 8006D234 80180300 */  sll        $v1, $v1, 2
    /* 5D238 8006D238 23186400 */  subu       $v1, $v1, $a0
    /* 5D23C 8006D23C 1280043C */  lui        $a0, %hi(myplr)
    /* 5D240 8006D240 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 5D244 8006D244 80180300 */  sll        $v1, $v1, 2
    /* 5D248 8006D248 40100400 */  sll        $v0, $a0, 1
    /* 5D24C 8006D24C 21104400 */  addu       $v0, $v0, $a0
    /* 5D250 8006D250 80100200 */  sll        $v0, $v0, 2
    /* 5D254 8006D254 21104400 */  addu       $v0, $v0, $a0
    /* 5D258 8006D258 00110200 */  sll        $v0, $v0, 4
    /* 5D25C 8006D25C 23104400 */  subu       $v0, $v0, $a0
    /* 5D260 8006D260 80100200 */  sll        $v0, $v0, 2
    /* 5D264 8006D264 21104400 */  addu       $v0, $v0, $a0
    /* 5D268 8006D268 C0100200 */  sll        $v0, $v0, 3
    /* 5D26C 8006D26C 21206200 */  addu       $a0, $v1, $v0
    /* 5D270 8006D270 0E80013C */  lui        $at, %hi(plr + 0x4D0)
    /* 5D274 8006D274 21082400 */  addu       $at, $at, $a0
    /* 5D278 8006D278 08AA2384 */  lh         $v1, %lo(plr + 0x4D0)($at)
    /* 5D27C 8006D27C 0A000224 */  addiu      $v0, $zero, 0xA
    /* 5D280 8006D280 0B006214 */  bne        $v1, $v0, .L8006D2B0
    /* 5D284 8006D284 21280000 */   addu      $a1, $zero, $zero
    /* 5D288 8006D288 0E80013C */  lui        $at, %hi(plr + 0x4ED)
    /* 5D28C 8006D28C 21082400 */  addu       $at, $at, $a0
    /* 5D290 8006D290 25AA2290 */  lbu        $v0, %lo(plr + 0x4ED)($at)
    /* 5D294 8006D294 0E80013C */  lui        $at, %hi(plr + 0x4EF)
    /* 5D298 8006D298 21082400 */  addu       $at, $at, $a0
    /* 5D29C 8006D29C 27AA2390 */  lbu        $v1, %lo(plr + 0x4EF)($at)
    /* 5D2A0 8006D2A0 00000000 */  nop
    /* 5D2A4 8006D2A4 26104300 */  xor        $v0, $v0, $v1
    /* 5D2A8 8006D2A8 2B100200 */  sltu       $v0, $zero, $v0
    /* 5D2AC 8006D2AC 21284000 */  addu       $a1, $v0, $zero
  .L8006D2B0:
    /* 5D2B0 8006D2B0 0800E003 */  jr         $ra
    /* 5D2B4 8006D2B4 2110A000 */   addu      $v0, $a1, $zero
endlabel WitchRechargeOk__Fi
