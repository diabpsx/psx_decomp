.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_SBSPELL__FPC4TCmdi, 0x74

glabel On_SBSPELL__FPC4TCmdi
    /* 400B4 800500B4 40100500 */  sll        $v0, $a1, 1
    /* 400B8 800500B8 21104500 */  addu       $v0, $v0, $a1
    /* 400BC 800500BC 80100200 */  sll        $v0, $v0, 2
    /* 400C0 800500C0 21104500 */  addu       $v0, $v0, $a1
    /* 400C4 800500C4 00110200 */  sll        $v0, $v0, 4
    /* 400C8 800500C8 23104500 */  subu       $v0, $v0, $a1
    /* 400CC 800500CC 80100200 */  sll        $v0, $v0, 2
    /* 400D0 800500D0 21104500 */  addu       $v0, $v0, $a1
    /* 400D4 800500D4 C0100200 */  sll        $v0, $v0, 3
    /* 400D8 800500D8 02008494 */  lhu        $a0, 0x2($a0)
    /* 400DC 800500DC 0E80013C */  lui        $at, %hi(plr + 0x70)
    /* 400E0 800500E0 21082200 */  addu       $at, $at, $v0
    /* 400E4 800500E4 A8A52590 */  lbu        $a1, %lo(plr + 0x70)($at)
    /* 400E8 800500E8 01000324 */  addiu      $v1, $zero, 0x1
    /* 400EC 800500EC 0E80013C */  lui        $at, %hi(plr + 0x5F)
    /* 400F0 800500F0 21082200 */  addu       $at, $at, $v0
    /* 400F4 800500F4 97A523A0 */  sb         $v1, %lo(plr + 0x5F)($at)
    /* 400F8 800500F8 0C000324 */  addiu      $v1, $zero, 0xC
    /* 400FC 800500FC 0E80013C */  lui        $at, %hi(plr + 0x1E)
    /* 40100 80050100 21082200 */  addu       $at, $at, $v0
    /* 40104 80050104 56A523A0 */  sb         $v1, %lo(plr + 0x1E)($at)
    /* 40108 80050108 0E80013C */  lui        $at, %hi(plr + 0x5D)
    /* 4010C 8005010C 21082200 */  addu       $at, $at, $v0
    /* 40110 80050110 95A524A0 */  sb         $a0, %lo(plr + 0x5D)($at)
    /* 40114 80050114 0E80013C */  lui        $at, %hi(plr + 0x5E)
    /* 40118 80050118 21082200 */  addu       $at, $at, $v0
    /* 4011C 8005011C 96A525A0 */  sb         $a1, %lo(plr + 0x5E)($at)
    /* 40120 80050120 0800E003 */  jr         $ra
    /* 40124 80050124 00000000 */   nop
endlabel On_SBSPELL__FPC4TCmdi
