.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckSpell__FiicUc, 0xA0

glabel CheckSpell__FiicUc
    /* 67498 80077498 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 6749C 8007749C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 674A0 800774A0 21808000 */  addu       $s0, $a0, $zero
    /* 674A4 800774A4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 674A8 800774A8 2188A000 */  addu       $s1, $a1, $zero
    /* 674AC 800774AC 00360600 */  sll        $a2, $a2, 24
    /* 674B0 800774B0 0300C014 */  bnez       $a2, .L800774C0
    /* 674B4 800774B4 1800BFAF */   sw        $ra, 0x18($sp)
    /* 674B8 800774B8 48DD0108 */  j          .L80077520
    /* 674BC 800774BC 01000224 */   addiu     $v0, $zero, 0x1
  .L800774C0:
    /* 674C0 800774C0 21200002 */  addu       $a0, $s0, $zero
    /* 674C4 800774C4 0FE9040C */  jal        func_8013A43C
    /* 674C8 800774C8 21282002 */   addu      $a1, $s1, $zero
    /* 674CC 800774CC 0300401C */  bgtz       $v0, .L800774DC
    /* 674D0 800774D0 21200002 */   addu      $a0, $s0, $zero
    /* 674D4 800774D4 48DD0108 */  j          .L80077520
    /* 674D8 800774D8 21100000 */   addu      $v0, $zero, $zero
  .L800774DC:
    /* 674DC 800774DC 15DC010C */  jal        GetManaAmount__Fii
    /* 674E0 800774E0 21282002 */   addu      $a1, $s1, $zero
    /* 674E4 800774E4 40181000 */  sll        $v1, $s0, 1
    /* 674E8 800774E8 21187000 */  addu       $v1, $v1, $s0
    /* 674EC 800774EC 80180300 */  sll        $v1, $v1, 2
    /* 674F0 800774F0 21187000 */  addu       $v1, $v1, $s0
    /* 674F4 800774F4 00190300 */  sll        $v1, $v1, 4
    /* 674F8 800774F8 23187000 */  subu       $v1, $v1, $s0
    /* 674FC 800774FC 80180300 */  sll        $v1, $v1, 2
    /* 67500 80077500 21187000 */  addu       $v1, $v1, $s0
    /* 67504 80077504 C0180300 */  sll        $v1, $v1, 3
    /* 67508 80077508 0E80013C */  lui        $at, %hi(plr + 0x130)
    /* 6750C 8007750C 21082300 */  addu       $at, $at, $v1
    /* 67510 80077510 68A6238C */  lw         $v1, %lo(plr + 0x130)($at)
    /* 67514 80077514 00000000 */  nop
    /* 67518 80077518 2A186200 */  slt        $v1, $v1, $v0
    /* 6751C 8007751C 01006238 */  xori       $v0, $v1, 0x1
  .L80077520:
    /* 67520 80077520 1800BF8F */  lw         $ra, 0x18($sp)
    /* 67524 80077524 1400B18F */  lw         $s1, 0x14($sp)
    /* 67528 80077528 1000B08F */  lw         $s0, 0x10($sp)
    /* 6752C 8007752C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 67530 80077530 0800E003 */  jr         $ra
    /* 67534 80077534 00000000 */   nop
endlabel CheckSpell__FiicUc
