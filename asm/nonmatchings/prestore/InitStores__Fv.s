.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitStores__Fv, 0xF4

glabel InitStores__Fv
    /* 290E4 80162CDC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 290E8 80162CE0 21200000 */  addu       $a0, $zero, $zero
    /* 290EC 80162CE4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 290F0 80162CE8 36A7010C */  jal        ClearSText__Fii
    /* 290F4 80162CEC 18000524 */   addiu     $a1, $zero, 0x18
    /* 290F8 80162CF0 21300000 */  addu       $a2, $zero, $zero
    /* 290FC 80162CF4 FFFF0824 */  addiu      $t0, $zero, -0x1
    /* 29100 80162CF8 1280093C */  lui        $t1, %hi(gbMaxPlayers)
    /* 29104 80162CFC A2B92991 */  lbu        $t1, %lo(gbMaxPlayers)($t1)
    /* 29108 80162D00 1280073C */  lui        $a3, %hi(_numpremium)
    /* 2910C 80162D04 B8BAE724 */  addiu      $a3, $a3, %lo(_numpremium)
    /* 29110 80162D08 1280013C */  lui        $at, %hi(stextflag)
    /* 29114 80162D0C E0BA20A0 */  sb         $zero, %lo(stextflag)($at)
    /* 29118 80162D10 1280013C */  lui        $at, %hi(stextsize)
    /* 2911C 80162D14 E1BA20A0 */  sb         $zero, %lo(stextsize)($at)
    /* 29120 80162D18 1280013C */  lui        $at, %hi(stextscrl)
    /* 29124 80162D1C E2BA20A0 */  sb         $zero, %lo(stextscrl)($at)
  .L80162D20:
    /* 29128 80162D20 2A10C900 */  slt        $v0, $a2, $t1
    /* 2912C 80162D24 26004010 */  beqz       $v0, .L80162DC0
    /* 29130 80162D28 05000524 */   addiu     $a1, $zero, 0x5
    /* 29134 80162D2C 80100600 */  sll        $v0, $a2, 2
    /* 29138 80162D30 21184600 */  addu       $v1, $v0, $a2
    /* 2913C 80162D34 00190300 */  sll        $v1, $v1, 4
    /* 29140 80162D38 21186600 */  addu       $v1, $v1, $a2
    /* 29144 80162D3C C0180300 */  sll        $v1, $v1, 3
    /* 29148 80162D40 1C026424 */  addiu      $a0, $v1, 0x21C
    /* 2914C 80162D44 01000324 */  addiu      $v1, $zero, 0x1
    /* 29150 80162D48 1280013C */  lui        $at, %hi(StorePlrNo)
    /* 29154 80162D4C B4BA26AC */  sw         $a2, %lo(StorePlrNo)($at)
    /* 29158 80162D50 0000E0AC */  sw         $zero, 0x0($a3)
    /* 2915C 80162D54 1280013C */  lui        $at, %hi(_premiumlevel)
    /* 29160 80162D58 21082200 */  addu       $at, $at, $v0
    /* 29164 80162D5C C0BA23AC */  sw         $v1, %lo(_premiumlevel)($at)
  .L80162D60:
    /* 29168 80162D60 0E80013C */  lui        $at, %hi(_premiumitem + 0x2C)
    /* 2916C 80162D64 21082400 */  addu       $at, $at, $a0
    /* 29170 80162D68 34F528A4 */  sh         $t0, %lo(_premiumitem + 0x2C)($at)
    /* 29174 80162D6C FFFFA524 */  addiu      $a1, $a1, -0x1
    /* 29178 80162D70 FBFFA104 */  bgez       $a1, .L80162D60
    /* 2917C 80162D74 94FF8424 */   addiu     $a0, $a0, -0x6C
    /* 29180 80162D78 0400E724 */  addiu      $a3, $a3, 0x4
    /* 29184 80162D7C 1280033C */  lui        $v1, %hi(StorePlrNo)
    /* 29188 80162D80 B4BA638C */  lw         $v1, %lo(StorePlrNo)($v1)
    /* 2918C 80162D84 00000000 */  nop
    /* 29190 80162D88 C0100300 */  sll        $v0, $v1, 3
    /* 29194 80162D8C 23104300 */  subu       $v0, $v0, $v1
    /* 29198 80162D90 80100200 */  sll        $v0, $v0, 2
    /* 2919C 80162D94 23104300 */  subu       $v0, $v0, $v1
    /* 291A0 80162D98 80100200 */  sll        $v0, $v0, 2
    /* 291A4 80162D9C 80180300 */  sll        $v1, $v1, 2
    /* 291A8 80162DA0 0E80013C */  lui        $at, %hi(_boyitem + 0x2C)
    /* 291AC 80162DA4 21082200 */  addu       $at, $at, $v0
    /* 291B0 80162DA8 240B28A4 */  sh         $t0, %lo(_boyitem + 0x2C)($at)
    /* 291B4 80162DAC 1280013C */  lui        $at, %hi(_boylevel)
    /* 291B8 80162DB0 21082300 */  addu       $at, $at, $v1
    /* 291BC 80162DB4 D8BA20AC */  sw         $zero, %lo(_boylevel)($at)
    /* 291C0 80162DB8 488B0508 */  j          .L80162D20
    /* 291C4 80162DBC 0100C624 */   addiu     $a2, $a2, 0x1
  .L80162DC0:
    /* 291C8 80162DC0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 291CC 80162DC4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 291D0 80162DC8 0800E003 */  jr         $ra
    /* 291D4 80162DCC 00000000 */   nop
endlabel InitStores__Fv
