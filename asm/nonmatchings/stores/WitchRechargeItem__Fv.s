.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching WitchRechargeItem__Fv, 0x17C

glabel WitchRechargeItem__Fv
    /* 62958 80072958 1280033C */  lui        $v1, %hi(myplr)
    /* 6295C 8007295C 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 62960 80072960 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 62964 80072964 1000BFAF */  sw         $ra, 0x10($sp)
    /* 62968 80072968 40100300 */  sll        $v0, $v1, 1
    /* 6296C 8007296C 21104300 */  addu       $v0, $v0, $v1
    /* 62970 80072970 80100200 */  sll        $v0, $v0, 2
    /* 62974 80072974 21104300 */  addu       $v0, $v0, $v1
    /* 62978 80072978 00110200 */  sll        $v0, $v0, 4
    /* 6297C 8007297C 23104300 */  subu       $v0, $v0, $v1
    /* 62980 80072980 80100200 */  sll        $v0, $v0, 2
    /* 62984 80072984 21104300 */  addu       $v0, $v0, $v1
    /* 62988 80072988 C0100200 */  sll        $v0, $v0, 3
    /* 6298C 8007298C 0E80013C */  lui        $at, %hi(plr + 0x1928)
    /* 62990 80072990 21082200 */  addu       $at, $at, $v0
    /* 62994 80072994 60BE248C */  lw         $a0, %lo(plr + 0x1928)($at)
    /* 62998 80072998 D2C1010C */  jal        TakePlrsMoney__Fl
    /* 6299C 8007299C 00000000 */   nop
    /* 629A0 800729A0 0821838F */  lw         $v1, %gp_rel(D_8011C888)($gp)
    /* 629A4 800729A4 1C21828F */  lw         $v0, %gp_rel(D_8011C89C)($gp)
    /* 629A8 800729A8 00000000 */  nop
    /* 629AC 800729AC 23186200 */  subu       $v1, $v1, $v0
    /* 629B0 800729B0 02006104 */  bgez       $v1, .L800729BC
    /* 629B4 800729B4 00000000 */   nop
    /* 629B8 800729B8 07006324 */  addiu      $v1, $v1, 0x7
  .L800729BC:
    /* 629BC 800729BC 1021828F */  lw         $v0, %gp_rel(D_8011C890)($gp)
    /* 629C0 800729C0 C3200300 */  sra        $a0, $v1, 3
    /* 629C4 800729C4 21208200 */  addu       $a0, $a0, $v0
    /* 629C8 800729C8 C0100400 */  sll        $v0, $a0, 3
    /* 629CC 800729CC 23104400 */  subu       $v0, $v0, $a0
    /* 629D0 800729D0 80100200 */  sll        $v0, $v0, 2
    /* 629D4 800729D4 23104400 */  subu       $v0, $v0, $a0
    /* 629D8 800729D8 80100200 */  sll        $v0, $v0, 2
    /* 629DC 800729DC 0E80013C */  lui        $at, %hi(storehold + 0x4B)
    /* 629E0 800729E0 21082200 */  addu       $at, $at, $v0
    /* 629E4 800729E4 D31D2390 */  lbu        $v1, %lo(storehold + 0x4B)($at)
    /* 629E8 800729E8 0E80013C */  lui        $at, %hi(storehold + 0x49)
    /* 629EC 800729EC 21082200 */  addu       $at, $at, $v0
    /* 629F0 800729F0 D11D23A0 */  sb         $v1, %lo(storehold + 0x49)($at)
    /* 629F4 800729F4 0E80013C */  lui        $at, %hi(storehidx)
    /* 629F8 800729F8 21082400 */  addu       $at, $at, $a0
    /* 629FC 800729FC C8312280 */  lb         $v0, %lo(storehidx)($at)
    /* 62A00 80072A00 00000000 */  nop
    /* 62A04 80072A04 15004104 */  bgez       $v0, .L80072A5C
    /* 62A08 80072A08 C0180200 */   sll       $v1, $v0, 3
    /* 62A0C 80072A0C 1280023C */  lui        $v0, %hi(myplr)
    /* 62A10 80072A10 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 62A14 80072A14 00000000 */  nop
    /* 62A18 80072A18 40180200 */  sll        $v1, $v0, 1
    /* 62A1C 80072A1C 21186200 */  addu       $v1, $v1, $v0
    /* 62A20 80072A20 80180300 */  sll        $v1, $v1, 2
    /* 62A24 80072A24 21186200 */  addu       $v1, $v1, $v0
    /* 62A28 80072A28 00190300 */  sll        $v1, $v1, 4
    /* 62A2C 80072A2C 23186200 */  subu       $v1, $v1, $v0
    /* 62A30 80072A30 80180300 */  sll        $v1, $v1, 2
    /* 62A34 80072A34 21186200 */  addu       $v1, $v1, $v0
    /* 62A38 80072A38 C0180300 */  sll        $v1, $v1, 3
    /* 62A3C 80072A3C 0E80013C */  lui        $at, %hi(plr + 0x3AB)
    /* 62A40 80072A40 21082300 */  addu       $at, $at, $v1
    /* 62A44 80072A44 E3A82290 */  lbu        $v0, %lo(plr + 0x3AB)($at)
    /* 62A48 80072A48 0E80013C */  lui        $at, %hi(plr + 0x3A9)
    /* 62A4C 80072A4C 21082300 */  addu       $at, $at, $v1
    /* 62A50 80072A50 E1A822A0 */  sb         $v0, %lo(plr + 0x3A9)($at)
    /* 62A54 80072A54 ADCA0108 */  j          .L80072AB4
    /* 62A58 80072A58 00000000 */   nop
  .L80072A5C:
    /* 62A5C 80072A5C 23186200 */  subu       $v1, $v1, $v0
    /* 62A60 80072A60 80180300 */  sll        $v1, $v1, 2
    /* 62A64 80072A64 23186200 */  subu       $v1, $v1, $v0
    /* 62A68 80072A68 1280043C */  lui        $a0, %hi(myplr)
    /* 62A6C 80072A6C 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 62A70 80072A70 80180300 */  sll        $v1, $v1, 2
    /* 62A74 80072A74 40100400 */  sll        $v0, $a0, 1
    /* 62A78 80072A78 21104400 */  addu       $v0, $v0, $a0
    /* 62A7C 80072A7C 80100200 */  sll        $v0, $v0, 2
    /* 62A80 80072A80 21104400 */  addu       $v0, $v0, $a0
    /* 62A84 80072A84 00110200 */  sll        $v0, $v0, 4
    /* 62A88 80072A88 23104400 */  subu       $v0, $v0, $a0
    /* 62A8C 80072A8C 80100200 */  sll        $v0, $v0, 2
    /* 62A90 80072A90 21104400 */  addu       $v0, $v0, $a0
    /* 62A94 80072A94 C0100200 */  sll        $v0, $v0, 3
    /* 62A98 80072A98 21186200 */  addu       $v1, $v1, $v0
    /* 62A9C 80072A9C 0E80013C */  lui        $at, %hi(plr + 0x4EF)
    /* 62AA0 80072AA0 21082300 */  addu       $at, $at, $v1
    /* 62AA4 80072AA4 27AA2290 */  lbu        $v0, %lo(plr + 0x4EF)($at)
    /* 62AA8 80072AA8 0E80013C */  lui        $at, %hi(plr + 0x4ED)
    /* 62AAC 80072AAC 21082300 */  addu       $at, $at, $v1
    /* 62AB0 80072AB0 25AA22A0 */  sb         $v0, %lo(plr + 0x4ED)($at)
  .L80072AB4:
    /* 62AB4 80072AB4 1280043C */  lui        $a0, %hi(myplr)
    /* 62AB8 80072AB8 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 62ABC 80072ABC C6FE000C */  jal        CalcPlrInv__FiUc
    /* 62AC0 80072AC0 01000524 */   addiu     $a1, $zero, 0x1
    /* 62AC4 80072AC4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 62AC8 80072AC8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 62ACC 80072ACC 0800E003 */  jr         $ra
    /* 62AD0 80072AD0 00000000 */   nop
endlabel WitchRechargeItem__Fv
