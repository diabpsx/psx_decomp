.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MI_SetManashield__Fi, 0x44

glabel MI_SetManashield__Fi
    /* 9704 801432FC 80100400 */  sll        $v0, $a0, 2
    /* 9708 80143300 21104400 */  addu       $v0, $v0, $a0
    /* 970C 80143304 80100200 */  sll        $v0, $v0, 2
    /* 9710 80143308 23104400 */  subu       $v0, $v0, $a0
    /* 9714 8014330C 80100200 */  sll        $v0, $v0, 2
    /* 9718 80143310 1080013C */  lui        $at, %hi(missile + 0x2E)
    /* 971C 80143314 21082200 */  addu       $at, $at, $v0
    /* 9720 80143318 862C2284 */  lh         $v0, %lo(missile + 0x2E)($at)
    /* 9724 8014331C 00000000 */  nop
    /* 9728 80143320 04004014 */  bnez       $v0, .L80143334
    /* 972C 80143324 01000224 */   addiu     $v0, $zero, 0x1
    /* 9730 80143328 0D1B82A3 */  sb         $v0, %gp_rel(ManashieldFlag)($gp)
    /* 9734 8014332C CE0C0508 */  j          .L80143338
    /* 9738 80143330 00000000 */   nop
  .L80143334:
    /* 973C 80143334 0E1B82A3 */  sb         $v0, %gp_rel(ManashieldFlag2)($gp)
  .L80143338:
    /* 9740 80143338 0800E003 */  jr         $ra
    /* 9744 8014333C 00000000 */   nop
endlabel MI_SetManashield__Fi
