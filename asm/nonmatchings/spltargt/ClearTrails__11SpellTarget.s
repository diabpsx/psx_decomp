.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ClearTrails__11SpellTarget, 0x28

glabel ClearTrails__11SpellTarget
    /* 9F28C 800AF28C 21180000 */  addu       $v1, $zero, $zero
    /* 9F290 800AF290 FFFF0524 */  addiu      $a1, $zero, -0x1
  .L800AF294:
    /* 9F294 800AF294 280085A4 */  sh         $a1, 0x28($a0)
    /* 9F298 800AF298 380085A4 */  sh         $a1, 0x38($a0)
    /* 9F29C 800AF29C 01006324 */  addiu      $v1, $v1, 0x1
    /* 9F2A0 800AF2A0 08006228 */  slti       $v0, $v1, 0x8
    /* 9F2A4 800AF2A4 FBFF4014 */  bnez       $v0, .L800AF294
    /* 9F2A8 800AF2A8 02008424 */   addiu     $a0, $a0, 0x2
    /* 9F2AC 800AF2AC 0800E003 */  jr         $ra
    /* 9F2B0 800AF2B0 00000000 */   nop
endlabel ClearTrails__11SpellTarget
