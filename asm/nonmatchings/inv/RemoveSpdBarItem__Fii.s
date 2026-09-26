.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RemoveSpdBarItem__Fii, 0xF4

glabel RemoveSpdBarItem__Fii
    /* 23DB4 8015D9AC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 23DB8 8015D9B0 C0180500 */  sll        $v1, $a1, 3
    /* 23DBC 8015D9B4 23186500 */  subu       $v1, $v1, $a1
    /* 23DC0 8015D9B8 80180300 */  sll        $v1, $v1, 2
    /* 23DC4 8015D9BC 23186500 */  subu       $v1, $v1, $a1
    /* 23DC8 8015D9C0 80180300 */  sll        $v1, $v1, 2
    /* 23DCC 8015D9C4 40100400 */  sll        $v0, $a0, 1
    /* 23DD0 8015D9C8 21104400 */  addu       $v0, $v0, $a0
    /* 23DD4 8015D9CC 80100200 */  sll        $v0, $v0, 2
    /* 23DD8 8015D9D0 21104400 */  addu       $v0, $v0, $a0
    /* 23DDC 8015D9D4 00110200 */  sll        $v0, $v0, 4
    /* 23DE0 8015D9D8 23104400 */  subu       $v0, $v0, $a0
    /* 23DE4 8015D9DC 80100200 */  sll        $v0, $v0, 2
    /* 23DE8 8015D9E0 21104400 */  addu       $v0, $v0, $a0
    /* 23DEC 8015D9E4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 23DF0 8015D9E8 C0800200 */  sll        $s0, $v0, 3
    /* 23DF4 8015D9EC 21187000 */  addu       $v1, $v1, $s0
    /* 23DF8 8015D9F0 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 23DFC 8015D9F4 1400BFAF */  sw         $ra, 0x14($sp)
    /* 23E00 8015D9F8 0E80013C */  lui        $at, %hi(plr + 0x15DC)
    /* 23E04 8015D9FC 21082300 */  addu       $at, $at, $v1
    /* 23E08 8015DA00 14BB22A4 */  sh         $v0, %lo(plr + 0x15DC)($at)
    /* 23E0C 8015DA04 4CFC000C */  jal        CalcPlrScrolls__Fi
    /* 23E10 8015DA08 00000000 */   nop
    /* 23E14 8015DA0C 0E80013C */  lui        $at, %hi(plr + 0x68)
    /* 23E18 8015DA10 21083000 */  addu       $at, $at, $s0
    /* 23E1C 8015DA14 A0A52380 */  lb         $v1, %lo(plr + 0x68)($at)
    /* 23E20 8015DA18 02000224 */  addiu      $v0, $zero, 0x2
    /* 23E24 8015DA1C 1B006214 */  bne        $v1, $v0, .L8015DA8C
    /* 23E28 8015DA20 FFFF0624 */   addiu     $a2, $zero, -0x1
    /* 23E2C 8015DA24 0E80013C */  lui        $at, %hi(plr + 0x64)
    /* 23E30 8015DA28 21083000 */  addu       $at, $at, $s0
    /* 23E34 8015DA2C 9CA5258C */  lw         $a1, %lo(plr + 0x64)($at)
    /* 23E38 8015DA30 00000000 */  nop
    /* 23E3C 8015DA34 1500A610 */  beq        $a1, $a2, .L8015DA8C
    /* 23E40 8015DA38 FFFFA524 */   addiu     $a1, $a1, -0x1
    /* 23E44 8015DA3C 01000424 */  addiu      $a0, $zero, 0x1
    /* 23E48 8015DA40 0420A400 */  sllv       $a0, $a0, $a1
    /* 23E4C 8015DA44 21108000 */  addu       $v0, $a0, $zero
    /* 23E50 8015DA48 C31F0400 */  sra        $v1, $a0, 31
    /* 23E54 8015DA4C 0E80013C */  lui        $at, %hi(plr + 0xC8)
    /* 23E58 8015DA50 21083000 */  addu       $at, $at, $s0
    /* 23E5C 8015DA54 00A6248C */  lw         $a0, %lo(plr + 0xC8)($at)
    /* 23E60 8015DA58 0E80013C */  lui        $at, %hi(plr + 0xCC)
    /* 23E64 8015DA5C 21083000 */  addu       $at, $at, $s0
    /* 23E68 8015DA60 04A6258C */  lw         $a1, %lo(plr + 0xCC)($at)
    /* 23E6C 8015DA64 00000000 */  nop
    /* 23E70 8015DA68 2428A300 */  and        $a1, $a1, $v1
    /* 23E74 8015DA6C 24208200 */  and        $a0, $a0, $v0
    /* 23E78 8015DA70 06008014 */  bnez       $a0, .L8015DA8C
    /* 23E7C 8015DA74 00000000 */   nop
    /* 23E80 8015DA78 0400A014 */  bnez       $a1, .L8015DA8C
    /* 23E84 8015DA7C 00000000 */   nop
    /* 23E88 8015DA80 0E80013C */  lui        $at, %hi(plr + 0x64)
    /* 23E8C 8015DA84 21083000 */  addu       $at, $at, $s0
    /* 23E90 8015DA88 9CA526AC */  sw         $a2, %lo(plr + 0x64)($at)
  .L8015DA8C:
    /* 23E94 8015DA8C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 23E98 8015DA90 1000B08F */  lw         $s0, 0x10($sp)
    /* 23E9C 8015DA94 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 23EA0 8015DA98 0800E003 */  jr         $ra
    /* 23EA4 8015DA9C 00000000 */   nop
endlabel RemoveSpdBarItem__Fii
