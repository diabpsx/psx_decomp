.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddDecap__Fi, 0x74

glabel AddDecap__Fi
    /* 1D1A8 80156DA0 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1D1AC 80156DA4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1D1B0 80156DA8 21808000 */  addu       $s0, $a0, $zero
    /* 1D1B4 80156DAC 1800BFAF */  sw         $ra, 0x18($sp)
    /* 1D1B8 80156DB0 B7F6000C */  jal        GetRndSeed__Fv
    /* 1D1BC 80156DB4 1400B1AF */   sw        $s1, 0x14($sp)
    /* 1D1C0 80156DB8 40881000 */  sll        $s1, $s0, 1
    /* 1D1C4 80156DBC 21883002 */  addu       $s1, $s1, $s0
    /* 1D1C8 80156DC0 80881100 */  sll        $s1, $s1, 2
    /* 1D1CC 80156DC4 23883002 */  subu       $s1, $s1, $s0
    /* 1D1D0 80156DC8 80881100 */  sll        $s1, $s1, 2
    /* 1D1D4 80156DCC 0E80013C */  lui        $at, %hi(object + 0x4)
    /* 1D1D8 80156DD0 21083100 */  addu       $at, $at, $s1
    /* 1D1DC 80156DD4 508C22AC */  sw         $v0, %lo(object + 0x4)($at)
    /* 1D1E0 80156DD8 C9F6000C */  jal        ENG_random__Fl
    /* 1D1E4 80156DDC 01000424 */   addiu     $a0, $zero, 0x1
    /* 1D1E8 80156DE0 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 1D1EC 80156DE4 21083100 */  addu       $at, $at, $s1
    /* 1D1F0 80156DE8 6D8C22A0 */  sb         $v0, %lo(object + 0x21)($at)
    /* 1D1F4 80156DEC 01000224 */  addiu      $v0, $zero, 0x1
    /* 1D1F8 80156DF0 0E80013C */  lui        $at, %hi(object + 0x29)
    /* 1D1FC 80156DF4 21083100 */  addu       $at, $at, $s1
    /* 1D200 80156DF8 758C22A0 */  sb         $v0, %lo(object + 0x29)($at)
    /* 1D204 80156DFC 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1D208 80156E00 1400B18F */  lw         $s1, 0x14($sp)
    /* 1D20C 80156E04 1000B08F */  lw         $s0, 0x10($sp)
    /* 1D210 80156E08 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1D214 80156E0C 0800E003 */  jr         $ra
    /* 1D218 80156E10 00000000 */   nop
endlabel AddDecap__Fi
