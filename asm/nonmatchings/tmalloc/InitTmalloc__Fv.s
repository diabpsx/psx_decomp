.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitTmalloc__Fv, 0x28

glabel InitTmalloc__Fv
    /* 7844C 8008844C 140480AF */  sw         $zero, %gp_rel(NoTAllocs)($gp)
    /* 78450 80088450 D8010224 */  addiu      $v0, $zero, 0x1D8
  .L80088454:
    /* 78454 80088454 0B80013C */  lui        $at, %hi(MemBlock + 0x4)
    /* 78458 80088458 21082200 */  addu       $at, $at, $v0
    /* 7845C 8008845C 587B20AC */  sw         $zero, %lo(MemBlock + 0x4)($at)
    /* 78460 80088460 F8FF4224 */  addiu      $v0, $v0, -0x8
    /* 78464 80088464 FBFF4104 */  bgez       $v0, .L80088454
    /* 78468 80088468 00000000 */   nop
    /* 7846C 8008846C 0800E003 */  jr         $ra
    /* 78470 80088470 00000000 */   nop
endlabel InitTmalloc__Fv
