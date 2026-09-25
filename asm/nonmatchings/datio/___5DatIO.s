.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ___5DatIO, 0x58

glabel ___5DatIO
    /* 76780 80086780 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 76784 80086784 1400B1AF */  sw         $s1, 0x14($sp)
    /* 76788 80086788 21888000 */  addu       $s1, $a0, $zero
    /* 7678C 8008678C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 76790 80086790 2180A000 */  addu       $s0, $a1, $zero
    /* 76794 80086794 1180023C */  lui        $v0, %hi(_vt_5DatIO)
    /* 76798 80086798 CC014224 */  addiu      $v0, $v0, %lo(_vt_5DatIO)
    /* 7679C 8008679C 21280000 */  addu       $a1, $zero, $zero
    /* 767A0 800867A0 1800BFAF */  sw         $ra, 0x18($sp)
    /* 767A4 800867A4 3316020C */  jal        ___6FileIO
    /* 767A8 800867A8 100022AE */   sw        $v0, 0x10($s1)
    /* 767AC 800867AC 01001032 */  andi       $s0, $s0, 0x1
    /* 767B0 800867B0 03000012 */  beqz       $s0, .L800867C0
    /* 767B4 800867B4 00000000 */   nop
    /* 767B8 800867B8 B619020C */  jal        __dl__6SysObjPv
    /* 767BC 800867BC 21202002 */   addu      $a0, $s1, $zero
  .L800867C0:
    /* 767C0 800867C0 1800BF8F */  lw         $ra, 0x18($sp)
    /* 767C4 800867C4 1400B18F */  lw         $s1, 0x14($sp)
    /* 767C8 800867C8 1000B08F */  lw         $s0, 0x10($sp)
    /* 767CC 800867CC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 767D0 800867D0 0800E003 */  jr         $ra
    /* 767D4 800867D4 00000000 */   nop
endlabel ___5DatIO
