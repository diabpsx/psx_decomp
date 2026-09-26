.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching L4FixRim__Fv, 0x3C

glabel L4FixRim__Fv
    /* 1A958 80154550 7C010224 */  addiu      $v0, $zero, 0x17C
  .L80154554:
    /* 1A95C 80154554 1580013C */  lui        $at, %hi(dung)
    /* 1A960 80154558 21082200 */  addu       $at, $at, $v0
    /* 1A964 8015455C 74D820A0 */  sb         $zero, %lo(dung)($at)
    /* 1A968 80154560 ECFF4224 */  addiu      $v0, $v0, -0x14
    /* 1A96C 80154564 FBFF4104 */  bgez       $v0, .L80154554
    /* 1A970 80154568 13000324 */   addiu     $v1, $zero, 0x13
    /* 1A974 8015456C 1580023C */  lui        $v0, %hi(dung + 0x13)
    /* 1A978 80154570 87D84224 */  addiu      $v0, $v0, %lo(dung + 0x13)
  .L80154574:
    /* 1A97C 80154574 000040A0 */  sb         $zero, 0x0($v0)
    /* 1A980 80154578 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 1A984 8015457C FDFF6104 */  bgez       $v1, .L80154574
    /* 1A988 80154580 FFFF4224 */   addiu     $v0, $v0, -0x1
    /* 1A98C 80154584 0800E003 */  jr         $ra
    /* 1A990 80154588 00000000 */   nop
endlabel L4FixRim__Fv
