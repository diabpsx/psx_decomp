.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching to_ascii__FUs, 0x88

glabel to_ascii__FUs
    /* 8BFC 801427F4 1480083C */  lui        $t0, %hi(sjis_table)
    /* 8C00 801427F8 58E10825 */  addiu      $t0, $t0, %lo(sjis_table)
    /* 8C04 801427FC 00000281 */  lb         $v0, 0x0($t0)
    /* 8C08 80142800 00000791 */  lbu        $a3, 0x0($t0)
    /* 8C0C 80142804 17004010 */  beqz       $v0, .L80142864
    /* 8C10 80142808 F0FFBD27 */   addiu     $sp, $sp, -0x10
    /* 8C14 8014280C FFFF8330 */  andi       $v1, $a0, 0xFFFF
    /* 8C18 80142810 01000625 */  addiu      $a2, $t0, 0x1
  .L80142814:
    /* 8C1C 80142814 0100C594 */  lhu        $a1, 0x1($a2)
    /* 8C20 80142818 00000000 */  nop
    /* 8C24 8014281C 2B106500 */  sltu       $v0, $v1, $a1
    /* 8C28 80142820 0B004014 */  bnez       $v0, .L80142850
    /* 8C2C 80142824 00000000 */   nop
    /* 8C30 80142828 0000C290 */  lbu        $v0, 0x0($a2)
    /* 8C34 8014282C 00000000 */  nop
    /* 8C38 80142830 2110A200 */  addu       $v0, $a1, $v0
    /* 8C3C 80142834 2A106200 */  slt        $v0, $v1, $v0
    /* 8C40 80142838 05004010 */  beqz       $v0, .L80142850
    /* 8C44 8014283C 00160700 */   sll       $v0, $a3, 24
    /* 8C48 80142840 03160200 */  sra        $v0, $v0, 24
    /* 8C4C 80142844 23186500 */  subu       $v1, $v1, $a1
    /* 8C50 80142848 1C0A0508 */  j          .L80142870
    /* 8C54 8014284C 21104300 */   addu      $v0, $v0, $v1
  .L80142850:
    /* 8C58 80142850 04000825 */  addiu      $t0, $t0, 0x4
    /* 8C5C 80142854 00000281 */  lb         $v0, 0x0($t0)
    /* 8C60 80142858 00000791 */  lbu        $a3, 0x0($t0)
    /* 8C64 8014285C EDFF4014 */  bnez       $v0, .L80142814
    /* 8C68 80142860 0400C624 */   addiu     $a2, $a2, 0x4
  .L80142864:
    /* 8C6C 80142864 01000224 */  addiu      $v0, $zero, 0x1
    /* 8C70 80142868 480C82AF */  sw         $v0, %gp_rel(to_ascii_invalid_char)($gp)
    /* 8C74 8014286C 3F000224 */  addiu      $v0, $zero, 0x3F
  .L80142870:
    /* 8C78 80142870 1000BD27 */  addiu      $sp, $sp, 0x10
    /* 8C7C 80142874 0800E003 */  jr         $ra
    /* 8C80 80142878 00000000 */   nop
endlabel to_ascii__FUs
