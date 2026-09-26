.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching L4SaveQuads__Fv, 0xC0

glabel L4SaveQuads__Fv
    /* 1968C 80153284 21480000 */  addu       $t1, $zero, $zero
    /* 19690 80153288 01000A24 */  addiu      $t2, $zero, 0x1
    /* 19694 8015328C 27000D24 */  addiu      $t5, $zero, 0x27
    /* 19698 80153290 2C188B8F */  lw         $t3, %gp_rel(l4holdx)($gp)
    /* 1969C 80153294 30188C8F */  lw         $t4, %gp_rel(l4holdy)($gp)
  .L80153298:
    /* 196A0 80153298 21300000 */  addu       $a2, $zero, $zero
    /* 196A4 8015329C 21188901 */  addu       $v1, $t4, $t1
    /* 196A8 801532A0 80100300 */  sll        $v0, $v1, 2
    /* 196AC 801532A4 21104300 */  addu       $v0, $v0, $v1
    /* 196B0 801532A8 C0400200 */  sll        $t0, $v0, 3
    /* 196B4 801532AC 2318A901 */  subu       $v1, $t5, $t1
    /* 196B8 801532B0 23186C00 */  subu       $v1, $v1, $t4
    /* 196BC 801532B4 80100300 */  sll        $v0, $v1, 2
    /* 196C0 801532B8 21104300 */  addu       $v0, $v0, $v1
    /* 196C4 801532BC C0380200 */  sll        $a3, $v0, 3
  .L801532C0:
    /* 196C8 801532C0 21286601 */  addu       $a1, $t3, $a2
    /* 196CC 801532C4 2320A601 */  subu       $a0, $t5, $a2
    /* 196D0 801532C8 0100C624 */  addiu      $a2, $a2, 0x1
    /* 196D4 801532CC 21180501 */  addu       $v1, $t0, $a1
    /* 196D8 801532D0 1280023C */  lui        $v0, %hi(mydflags)
    /* 196DC 801532D4 D8C0428C */  lw         $v0, %lo(mydflags)($v0)
    /* 196E0 801532D8 23208B00 */  subu       $a0, $a0, $t3
    /* 196E4 801532DC 21104300 */  addu       $v0, $v0, $v1
    /* 196E8 801532E0 00004AA0 */  sb         $t2, 0x0($v0)
    /* 196EC 801532E4 1280023C */  lui        $v0, %hi(mydflags)
    /* 196F0 801532E8 D8C0428C */  lw         $v0, %lo(mydflags)($v0)
    /* 196F4 801532EC 21180401 */  addu       $v1, $t0, $a0
    /* 196F8 801532F0 21104300 */  addu       $v0, $v0, $v1
    /* 196FC 801532F4 00004AA0 */  sb         $t2, 0x0($v0)
    /* 19700 801532F8 1280023C */  lui        $v0, %hi(mydflags)
    /* 19704 801532FC D8C0428C */  lw         $v0, %lo(mydflags)($v0)
    /* 19708 80153300 2128E500 */  addu       $a1, $a3, $a1
    /* 1970C 80153304 21104500 */  addu       $v0, $v0, $a1
    /* 19710 80153308 00004AA0 */  sb         $t2, 0x0($v0)
    /* 19714 8015330C 1280023C */  lui        $v0, %hi(mydflags)
    /* 19718 80153310 D8C0428C */  lw         $v0, %lo(mydflags)($v0)
    /* 1971C 80153314 2120E400 */  addu       $a0, $a3, $a0
    /* 19720 80153318 21104400 */  addu       $v0, $v0, $a0
    /* 19724 8015331C 00004AA0 */  sb         $t2, 0x0($v0)
    /* 19728 80153320 0E00C228 */  slti       $v0, $a2, 0xE
    /* 1972C 80153324 E6FF4014 */  bnez       $v0, .L801532C0
    /* 19730 80153328 00000000 */   nop
    /* 19734 8015332C 01002925 */  addiu      $t1, $t1, 0x1
    /* 19738 80153330 0E002229 */  slti       $v0, $t1, 0xE
    /* 1973C 80153334 D8FF4014 */  bnez       $v0, .L80153298
    /* 19740 80153338 00000000 */   nop
    /* 19744 8015333C 0800E003 */  jr         $ra
    /* 19748 80153340 00000000 */   nop
endlabel L4SaveQuads__Fv
