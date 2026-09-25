.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitLevelType__Fi, 0x4C

glabel InitLevelType__Fi
    /* 42BD0 80052BD0 03008014 */  bnez       $a0, .L80052BE0
    /* 42BD4 80052BD4 FFFF8224 */   addiu     $v0, $a0, -0x1
    /* 42BD8 80052BD8 054B0108 */  j          .L80052C14
    /* 42BDC 80052BDC 21100000 */   addu      $v0, $zero, $zero
  .L80052BE0:
    /* 42BE0 80052BE0 0400422C */  sltiu      $v0, $v0, 0x4
    /* 42BE4 80052BE4 0B004014 */  bnez       $v0, .L80052C14
    /* 42BE8 80052BE8 01000224 */   addiu     $v0, $zero, 0x1
    /* 42BEC 80052BEC FBFF8224 */  addiu      $v0, $a0, -0x5
    /* 42BF0 80052BF0 0400422C */  sltiu      $v0, $v0, 0x4
    /* 42BF4 80052BF4 03004010 */  beqz       $v0, .L80052C04
    /* 42BF8 80052BF8 F7FF8324 */   addiu     $v1, $a0, -0x9
    /* 42BFC 80052BFC 054B0108 */  j          .L80052C14
    /* 42C00 80052C00 02000224 */   addiu     $v0, $zero, 0x2
  .L80052C04:
    /* 42C04 80052C04 0400632C */  sltiu      $v1, $v1, 0x4
    /* 42C08 80052C08 02006014 */  bnez       $v1, .L80052C14
    /* 42C0C 80052C0C 03000224 */   addiu     $v0, $zero, 0x3
    /* 42C10 80052C10 04000224 */  addiu      $v0, $zero, 0x4
  .L80052C14:
    /* 42C14 80052C14 0800E003 */  jr         $ra
    /* 42C18 80052C18 00000000 */   nop
endlabel InitLevelType__Fi
