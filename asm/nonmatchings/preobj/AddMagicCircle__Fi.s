.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddMagicCircle__Fi, 0x74

glabel AddMagicCircle__Fi
    /* 1D26C 80156E64 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1D270 80156E68 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1D274 80156E6C 1400BFAF */  sw         $ra, 0x14($sp)
    /* 1D278 80156E70 B7F6000C */  jal        GetRndSeed__Fv
    /* 1D27C 80156E74 21808000 */   addu      $s0, $a0, $zero
    /* 1D280 80156E78 40181000 */  sll        $v1, $s0, 1
    /* 1D284 80156E7C 21187000 */  addu       $v1, $v1, $s0
    /* 1D288 80156E80 80180300 */  sll        $v1, $v1, 2
    /* 1D28C 80156E84 23187000 */  subu       $v1, $v1, $s0
    /* 1D290 80156E88 80180300 */  sll        $v1, $v1, 2
    /* 1D294 80156E8C 0E80013C */  lui        $at, %hi(object + 0x4)
    /* 1D298 80156E90 21082300 */  addu       $at, $at, $v1
    /* 1D29C 80156E94 508C22AC */  sw         $v0, %lo(object + 0x4)($at)
    /* 1D2A0 80156E98 01000224 */  addiu      $v0, $zero, 0x1
    /* 1D2A4 80156E9C 0E80013C */  lui        $at, %hi(object + 0x29)
    /* 1D2A8 80156EA0 21082300 */  addu       $at, $at, $v1
    /* 1D2AC 80156EA4 758C22A0 */  sb         $v0, %lo(object + 0x29)($at)
    /* 1D2B0 80156EA8 01000224 */  addiu      $v0, $zero, 0x1
    /* 1D2B4 80156EAC 0E80013C */  lui        $at, %hi(object + 0x18)
    /* 1D2B8 80156EB0 21082300 */  addu       $at, $at, $v1
    /* 1D2BC 80156EB4 648C20A4 */  sh         $zero, %lo(object + 0x18)($at)
    /* 1D2C0 80156EB8 0E80013C */  lui        $at, %hi(object + 0x16)
    /* 1D2C4 80156EBC 21082300 */  addu       $at, $at, $v1
    /* 1D2C8 80156EC0 628C22A4 */  sh         $v0, %lo(object + 0x16)($at)
    /* 1D2CC 80156EC4 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1D2D0 80156EC8 1000B08F */  lw         $s0, 0x10($sp)
    /* 1D2D4 80156ECC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1D2D8 80156ED0 0800E003 */  jr         $ra
    /* 1D2DC 80156ED4 00000000 */   nop
endlabel AddMagicCircle__Fi
