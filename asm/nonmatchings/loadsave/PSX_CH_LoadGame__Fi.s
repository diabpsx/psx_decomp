.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PSX_CH_LoadGame__Fi, 0xA0

glabel PSX_CH_LoadGame__Fi
    /* 226F0 8015C2E8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 226F4 8015C2EC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 226F8 8015C2F0 21808000 */  addu       $s0, $a0, $zero
    /* 226FC 8015C2F4 80201000 */  sll        $a0, $s0, 2
    /* 22700 8015C2F8 21209000 */  addu       $a0, $a0, $s0
    /* 22704 8015C2FC 40210400 */  sll        $a0, $a0, 5
    /* 22708 8015C300 23209000 */  subu       $a0, $a0, $s0
    /* 2270C 8015C304 C0200400 */  sll        $a0, $a0, 3
    /* 22710 8015C308 1280053C */  lui        $a1, %hi(FePlayerNo)
    /* 22714 8015C30C 78B3A58C */  lw         $a1, %lo(FePlayerNo)($a1)
    /* 22718 8015C310 21300000 */  addu       $a2, $zero, $zero
    /* 2271C 8015C314 1400BFAF */  sw         $ra, 0x14($sp)
    /* 22720 8015C318 0100A224 */  addiu      $v0, $a1, 0x1
    /* 22724 8015C31C 1280013C */  lui        $at, %hi(gbMaxPlayers)
    /* 22728 8015C320 A2B922A0 */  sb         $v0, %lo(gbMaxPlayers)($at)
    /* 2272C 8015C324 1580023C */  lui        $v0, %hi(CharDataStruct)
    /* 22730 8015C328 F0764224 */  addiu      $v0, $v0, %lo(CharDataStruct)
    /* 22734 8015C32C EE6B050C */  jal        UnPackPlayer__FPC14PkPlayerStructiUc
    /* 22738 8015C330 21208200 */   addu      $a0, $a0, $v0
    /* 2273C 8015C334 1280033C */  lui        $v1, %hi(FePlayerNo)
    /* 22740 8015C338 78B3638C */  lw         $v1, %lo(FePlayerNo)($v1)
    /* 22744 8015C33C 1680013C */  lui        $at, %hi(CharDataStruct + 0x1DD0)
    /* 22748 8015C340 21083000 */  addu       $at, $at, $s0
    /* 2274C 8015C344 C0942290 */  lbu        $v0, %lo(CharDataStruct + 0x1DD0)($at)
    /* 22750 8015C348 1280013C */  lui        $at, %hi(QSpell)
    /* 22754 8015C34C 21082300 */  addu       $at, $at, $v1
    /* 22758 8015C350 20B122A0 */  sb         $v0, %lo(QSpell)($at)
    /* 2275C 8015C354 1280033C */  lui        $v1, %hi(FePlayerNo)
    /* 22760 8015C358 78B3638C */  lw         $v1, %lo(FePlayerNo)($v1)
    /* 22764 8015C35C 1680013C */  lui        $at, %hi(CharDataStruct + 0x1DD6)
    /* 22768 8015C360 21083000 */  addu       $at, $at, $s0
    /* 2276C 8015C364 C6942290 */  lbu        $v0, %lo(CharDataStruct + 0x1DD6)($at)
    /* 22770 8015C368 1280013C */  lui        $at, %hi(_spltotype)
    /* 22774 8015C36C 21082300 */  addu       $at, $at, $v1
    /* 22778 8015C370 24B122A0 */  sb         $v0, %lo(_spltotype)($at)
    /* 2277C 8015C374 1400BF8F */  lw         $ra, 0x14($sp)
    /* 22780 8015C378 1000B08F */  lw         $s0, 0x10($sp)
    /* 22784 8015C37C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 22788 8015C380 0800E003 */  jr         $ra
    /* 2278C 8015C384 00000000 */   nop
endlabel PSX_CH_LoadGame__Fi
