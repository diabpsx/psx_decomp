.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MI_ResurrectBeam__Fi, 0x78

glabel MI_ResurrectBeam__Fi
    /* 107E8 8014A3E0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 107EC 8014A3E4 80100400 */  sll        $v0, $a0, 2
    /* 107F0 8014A3E8 21104400 */  addu       $v0, $v0, $a0
    /* 107F4 8014A3EC 80100200 */  sll        $v0, $v0, 2
    /* 107F8 8014A3F0 23104400 */  subu       $v0, $v0, $a0
    /* 107FC 8014A3F4 80180200 */  sll        $v1, $v0, 2
    /* 10800 8014A3F8 1000BFAF */  sw         $ra, 0x10($sp)
    /* 10804 8014A3FC 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 10808 8014A400 21082300 */  addu       $at, $at, $v1
    /* 1080C 8014A404 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* 10810 8014A408 00000000 */  nop
    /* 10814 8014A40C FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 10818 8014A410 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 1081C 8014A414 21082300 */  addu       $at, $at, $v1
    /* 10820 8014A418 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* 10824 8014A41C 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 10828 8014A420 21082300 */  addu       $at, $at, $v1
    /* 1082C 8014A424 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* 10830 8014A428 00000000 */  nop
    /* 10834 8014A42C 04004014 */  bnez       $v0, .L8014A440
    /* 10838 8014A430 01000224 */   addiu     $v0, $zero, 0x1
    /* 1083C 8014A434 1080013C */  lui        $at, %hi(missile + 0x38)
    /* 10840 8014A438 21082300 */  addu       $at, $at, $v1
    /* 10844 8014A43C 902C22A0 */  sb         $v0, %lo(missile + 0x38)($at)
  .L8014A440:
    /* 10848 8014A440 D1EA040C */  jal        PutMissile__Fi
    /* 1084C 8014A444 00000000 */   nop
    /* 10850 8014A448 1000BF8F */  lw         $ra, 0x10($sp)
    /* 10854 8014A44C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 10858 8014A450 0800E003 */  jr         $ra
    /* 1085C 8014A454 00000000 */   nop
endlabel MI_ResurrectBeam__Fi
