.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddBrnCross__Fi, 0x48

glabel AddBrnCross__Fi
    /* 1D2E0 80156ED8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1D2E4 80156EDC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1D2E8 80156EE0 1400BFAF */  sw         $ra, 0x14($sp)
    /* 1D2EC 80156EE4 B7F6000C */  jal        GetRndSeed__Fv
    /* 1D2F0 80156EE8 21808000 */   addu      $s0, $a0, $zero
    /* 1D2F4 80156EEC 40181000 */  sll        $v1, $s0, 1
    /* 1D2F8 80156EF0 21187000 */  addu       $v1, $v1, $s0
    /* 1D2FC 80156EF4 80180300 */  sll        $v1, $v1, 2
    /* 1D300 80156EF8 23187000 */  subu       $v1, $v1, $s0
    /* 1D304 80156EFC 80180300 */  sll        $v1, $v1, 2
    /* 1D308 80156F00 0E80013C */  lui        $at, %hi(object + 0x4)
    /* 1D30C 80156F04 21082300 */  addu       $at, $at, $v1
    /* 1D310 80156F08 508C22AC */  sw         $v0, %lo(object + 0x4)($at)
    /* 1D314 80156F0C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1D318 80156F10 1000B08F */  lw         $s0, 0x10($sp)
    /* 1D31C 80156F14 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1D320 80156F18 0800E003 */  jr         $ra
    /* 1D324 80156F1C 00000000 */   nop
endlabel AddBrnCross__Fi
