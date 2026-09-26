.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching L4checkRoom__Fiiii, 0x9C

glabel L4checkRoom__Fiiii
    /* 190FC 80152CF4 11008018 */  blez       $a0, .L80152D3C
    /* 19100 80152CF8 F0FFBD27 */   addiu     $sp, $sp, -0x10
    /* 19104 80152CFC 2100A018 */  blez       $a1, .L80152D84
    /* 19108 80152D00 21100000 */   addu      $v0, $zero, $zero
    /* 1910C 80152D04 1E00E018 */  blez       $a3, .L80152D80
    /* 19110 80152D08 21480000 */   addu      $t1, $zero, $zero
    /* 19114 80152D0C 15800C3C */  lui        $t4, %hi(dung)
    /* 19118 80152D10 74D88C25 */  addiu      $t4, $t4, %lo(dung)
  .L80152D14:
    /* 1911C 80152D14 1600C018 */  blez       $a2, .L80152D70
    /* 19120 80152D18 21400000 */   addu      $t0, $zero, $zero
    /* 19124 80152D1C 2150A900 */  addu       $t2, $a1, $t1
    /* 19128 80152D20 14004B2D */  sltiu      $t3, $t2, 0x14
    /* 1912C 80152D24 21188800 */  addu       $v1, $a0, $t0
  .L80152D28:
    /* 19130 80152D28 1400622C */  sltiu      $v0, $v1, 0x14
    /* 19134 80152D2C 03004010 */  beqz       $v0, .L80152D3C
    /* 19138 80152D30 00000000 */   nop
    /* 1913C 80152D34 03006015 */  bnez       $t3, .L80152D44
    /* 19140 80152D38 80100300 */   sll       $v0, $v1, 2
  .L80152D3C:
    /* 19144 80152D3C 614B0508 */  j          .L80152D84
    /* 19148 80152D40 21100000 */   addu      $v0, $zero, $zero
  .L80152D44:
    /* 1914C 80152D44 21104300 */  addu       $v0, $v0, $v1
    /* 19150 80152D48 80100200 */  sll        $v0, $v0, 2
    /* 19154 80152D4C 21104C00 */  addu       $v0, $v0, $t4
    /* 19158 80152D50 21104A00 */  addu       $v0, $v0, $t2
    /* 1915C 80152D54 00004290 */  lbu        $v0, 0x0($v0)
    /* 19160 80152D58 00000000 */  nop
    /* 19164 80152D5C F7FF4014 */  bnez       $v0, .L80152D3C
    /* 19168 80152D60 01000825 */   addiu     $t0, $t0, 0x1
    /* 1916C 80152D64 2A100601 */  slt        $v0, $t0, $a2
    /* 19170 80152D68 EFFF4014 */  bnez       $v0, .L80152D28
    /* 19174 80152D6C 21188800 */   addu      $v1, $a0, $t0
  .L80152D70:
    /* 19178 80152D70 01002925 */  addiu      $t1, $t1, 0x1
    /* 1917C 80152D74 2A102701 */  slt        $v0, $t1, $a3
    /* 19180 80152D78 E6FF4014 */  bnez       $v0, .L80152D14
    /* 19184 80152D7C 00000000 */   nop
  .L80152D80:
    /* 19188 80152D80 01000224 */  addiu      $v0, $zero, 0x1
  .L80152D84:
    /* 1918C 80152D84 1000BD27 */  addiu      $sp, $sp, 0x10
    /* 19190 80152D88 0800E003 */  jr         $ra
    /* 19194 80152D8C 00000000 */   nop
endlabel L4checkRoom__Fiiii
