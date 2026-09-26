.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_DoGotHit__Fi, 0x68

glabel M_DoGotHit__Fi
    /* 14EBC 8014EAB4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 14EC0 8014EAB8 40100400 */  sll        $v0, $a0, 1
    /* 14EC4 8014EABC 21104400 */  addu       $v0, $v0, $a0
    /* 14EC8 8014EAC0 80100200 */  sll        $v0, $v0, 2
    /* 14ECC 8014EAC4 21104400 */  addu       $v0, $v0, $a0
    /* 14ED0 8014EAC8 C0280200 */  sll        $a1, $v0, 3
    /* 14ED4 8014EACC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 14ED8 8014EAD0 1080013C */  lui        $at, %hi(monster + 0x41)
    /* 14EDC 8014EAD4 21082500 */  addu       $at, $at, $a1
    /* 14EE0 8014EAD8 D5532380 */  lb         $v1, %lo(monster + 0x41)($at)
    /* 14EE4 8014EADC 1080013C */  lui        $at, %hi(monster + 0x40)
    /* 14EE8 8014EAE0 21082500 */  addu       $at, $at, $a1
    /* 14EEC 8014EAE4 D4532280 */  lb         $v0, %lo(monster + 0x40)($at)
    /* 14EF0 8014EAE8 00000000 */  nop
    /* 14EF4 8014EAEC 07006214 */  bne        $v1, $v0, .L8014EB0C
    /* 14EF8 8014EAF0 21100000 */   addu      $v0, $zero, $zero
    /* 14EFC 8014EAF4 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 14F00 8014EAF8 21082500 */  addu       $at, $at, $a1
    /* 14F04 8014EAFC D0532580 */  lb         $a1, %lo(monster + 0x3C)($at)
    /* 14F08 8014EB00 9CFF010C */  jal        M_StartStand__Fii
    /* 14F0C 8014EB04 00000000 */   nop
    /* 14F10 8014EB08 01000224 */  addiu      $v0, $zero, 0x1
  .L8014EB0C:
    /* 14F14 8014EB0C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 14F18 8014EB10 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 14F1C 8014EB14 0800E003 */  jr         $ra
    /* 14F20 8014EB18 00000000 */   nop
endlabel M_DoGotHit__Fi
