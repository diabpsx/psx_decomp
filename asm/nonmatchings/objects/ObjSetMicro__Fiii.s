.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ObjSetMicro__Fiii, 0x170

glabel ObjSetMicro__Fiii
    /* 45754 80055754 1280023C */  lui        $v0, %hi(dPiece)
    /* 45758 80055758 44BE428C */  lw         $v0, %lo(dPiece)($v0)
    /* 4575C 8005575C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 45760 80055760 1000B0AF */  sw         $s0, 0x10($sp)
    /* 45764 80055764 21808000 */  addu       $s0, $a0, $zero
    /* 45768 80055768 1400B1AF */  sw         $s1, 0x14($sp)
    /* 4576C 8005576C 2188A000 */  addu       $s1, $a1, $zero
    /* 45770 80055770 1800B2AF */  sw         $s2, 0x18($sp)
    /* 45774 80055774 2190C000 */  addu       $s2, $a2, $zero
    /* 45778 80055778 06004010 */  beqz       $v0, .L80055794
    /* 4577C 8005577C 1C00BFAF */   sw        $ra, 0x1C($sp)
    /* 45780 80055780 00341200 */  sll        $a2, $s2, 16
    /* 45784 80055784 B30A020C */  jal        SetDPiece__Fiis
    /* 45788 80055788 03340600 */   sra       $a2, $a2, 16
    /* 4578C 8005578C 2A560108 */  j          .L800558A8
    /* 45790 80055790 00000000 */   nop
  .L80055794:
    /* 45794 80055794 C0181100 */  sll        $v1, $s1, 3
    /* 45798 80055798 C0101000 */  sll        $v0, $s0, 3
    /* 4579C 8005579C 23105000 */  subu       $v0, $v0, $s0
    /* 457A0 800557A0 C0110200 */  sll        $v0, $v0, 7
    /* 457A4 800557A4 21186200 */  addu       $v1, $v1, $v0
    /* 457A8 800557A8 0E80013C */  lui        $at, %hi(dung_map + 0x2)
    /* 457AC 800557AC 21082300 */  addu       $at, $at, $v1
    /* 457B0 800557B0 2A7A2290 */  lbu        $v0, %lo(dung_map + 0x2)($at)
    /* 457B4 800557B4 00000000 */  nop
    /* 457B8 800557B8 F0004230 */  andi       $v0, $v0, 0xF0
    /* 457BC 800557BC 0E80013C */  lui        $at, %hi(dung_map + 0x2)
    /* 457C0 800557C0 21082300 */  addu       $at, $at, $v1
    /* 457C4 800557C4 2A7A22A0 */  sb         $v0, %lo(dung_map + 0x2)($at)
    /* 457C8 800557C8 0E80013C */  lui        $at, %hi(nSolidTable)
    /* 457CC 800557CC 21083200 */  addu       $at, $at, $s2
    /* 457D0 800557D0 08612290 */  lbu        $v0, %lo(nSolidTable)($at)
    /* 457D4 800557D4 00000000 */  nop
    /* 457D8 800557D8 05004010 */  beqz       $v0, .L800557F0
    /* 457DC 800557DC 21200002 */   addu      $a0, $s0, $zero
    /* 457E0 800557E0 F20A020C */  jal        SetSOLID__Fii
    /* 457E4 800557E4 21282002 */   addu      $a1, $s1, $zero
    /* 457E8 800557E8 FE550108 */  j          .L800557F8
    /* 457EC 800557EC 00000000 */   nop
  .L800557F0:
    /* 457F0 800557F0 150B020C */  jal        ClearSOLID__Fii
    /* 457F4 800557F4 21282002 */   addu      $a1, $s1, $zero
  .L800557F8:
    /* 457F8 800557F8 0E80013C */  lui        $at, %hi(nMissileTable)
    /* 457FC 800557FC 21083200 */  addu       $at, $at, $s2
    /* 45800 80055800 0C692290 */  lbu        $v0, %lo(nMissileTable)($at)
    /* 45804 80055804 00000000 */  nop
    /* 45808 80055808 05004010 */  beqz       $v0, .L80055820
    /* 4580C 8005580C 21200002 */   addu      $a0, $s0, $zero
    /* 45810 80055810 4A0B020C */  jal        SetMISSILE__Fii
    /* 45814 80055814 21282002 */   addu      $a1, $s1, $zero
    /* 45818 80055818 0A560108 */  j          .L80055828
    /* 4581C 8005581C 00000000 */   nop
  .L80055820:
    /* 45820 80055820 6D0B020C */  jal        ClearMISSILE__Fii
    /* 45824 80055824 21282002 */   addu      $a1, $s1, $zero
  .L80055828:
    /* 45828 80055828 0E80013C */  lui        $at, %hi(nBlockTable)
    /* 4582C 8005582C 21083200 */  addu       $at, $at, $s2
    /* 45830 80055830 04592290 */  lbu        $v0, %lo(nBlockTable)($at)
    /* 45834 80055834 00000000 */  nop
    /* 45838 80055838 05004010 */  beqz       $v0, .L80055850
    /* 4583C 8005583C 21200002 */   addu      $a0, $s0, $zero
    /* 45840 80055840 9C0B020C */  jal        SetBLOCK__Fii
    /* 45844 80055844 21282002 */   addu      $a1, $s1, $zero
    /* 45848 80055848 16560108 */  j          .L80055858
    /* 4584C 8005584C 00000000 */   nop
  .L80055850:
    /* 45850 80055850 BF0B020C */  jal        ClearBLOCK__Fii
    /* 45854 80055854 21282002 */   addu      $a1, $s1, $zero
  .L80055858:
    /* 45858 80055858 0E80013C */  lui        $at, %hi(nTrapTable)
    /* 4585C 8005585C 21083200 */  addu       $at, $at, $s2
    /* 45860 80055860 10712290 */  lbu        $v0, %lo(nTrapTable)($at)
    /* 45864 80055864 00000000 */  nop
    /* 45868 80055868 05004010 */  beqz       $v0, .L80055880
    /* 4586C 8005586C 21200002 */   addu      $a0, $s0, $zero
    /* 45870 80055870 EE0B020C */  jal        SetTRAP__Fii
    /* 45874 80055874 21282002 */   addu      $a1, $s1, $zero
    /* 45878 80055878 22560108 */  j          .L80055888
    /* 4587C 8005587C 00000000 */   nop
  .L80055880:
    /* 45880 80055880 110C020C */  jal        ClearTRAP__Fii
    /* 45884 80055884 21282002 */   addu      $a1, $s1, $zero
  .L80055888:
    /* 45888 80055888 04004016 */  bnez       $s2, .L8005589C
    /* 4588C 8005588C 21200002 */   addu      $a0, $s0, $zero
    /* 45890 80055890 F20A020C */  jal        SetSOLID__Fii
    /* 45894 80055894 21282002 */   addu      $a1, $s1, $zero
    /* 45898 80055898 21200002 */  addu       $a0, $s0, $zero
  .L8005589C:
    /* 4589C 8005589C 21282002 */  addu       $a1, $s1, $zero
    /* 458A0 800558A0 A7D4010C */  jal        ChangeBlock__Fiii
    /* 458A4 800558A4 21304002 */   addu      $a2, $s2, $zero
  .L800558A8:
    /* 458A8 800558A8 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 458AC 800558AC 1800B28F */  lw         $s2, 0x18($sp)
    /* 458B0 800558B0 1400B18F */  lw         $s1, 0x14($sp)
    /* 458B4 800558B4 1000B08F */  lw         $s0, 0x10($sp)
    /* 458B8 800558B8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 458BC 800558BC 0800E003 */  jr         $ra
    /* 458C0 800558C0 00000000 */   nop
endlabel ObjSetMicro__Fiii
