.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FindLevTrig__Fiii, 0x98

glabel FindLevTrig__Fiii
    /* 65060 80075060 C0490600 */  sll        $t1, $a2, 7
    /* 65064 80075064 0E80083C */  lui        $t0, %hi(TrigList)
    /* 65068 80075068 1C340825 */  addiu      $t0, $t0, %lo(TrigList)
    /* 6506C 8007506C 0E80013C */  lui        $at, %hi(TrigList)
    /* 65070 80075070 21082900 */  addu       $at, $at, $t1
    /* 65074 80075074 1C342384 */  lh         $v1, %lo(TrigList)($at)
    /* 65078 80075078 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 6507C 8007507C 1A006210 */  beq        $v1, $v0, .L800750E8
    /* 65080 80075080 F8FFBD27 */   addiu     $sp, $sp, -0x8
    /* 65084 80075084 21580001 */  addu       $t3, $t0, $zero
    /* 65088 80075088 FFFF0A24 */  addiu      $t2, $zero, -0x1
    /* 6508C 8007508C 21380000 */  addu       $a3, $zero, $zero
    /* 65090 80075090 21102B01 */  addu       $v0, $t1, $t3
  .L80075094:
    /* 65094 80075094 2118E200 */  addu       $v1, $a3, $v0
    /* 65098 80075098 00006284 */  lh         $v0, 0x0($v1)
    /* 6509C 8007509C 00000000 */  nop
    /* 650A0 800750A0 07008214 */  bne        $a0, $v0, .L800750C0
    /* 650A4 800750A4 00000000 */   nop
    /* 650A8 800750A8 02006284 */  lh         $v0, 0x2($v1)
    /* 650AC 800750AC 00000000 */  nop
    /* 650B0 800750B0 0400A214 */  bne        $a1, $v0, .L800750C4
    /* 650B4 800750B4 0400E724 */   addiu     $a3, $a3, 0x4
    /* 650B8 800750B8 3BD40108 */  j          .L800750EC
    /* 650BC 800750BC 01000224 */   addiu     $v0, $zero, 0x1
  .L800750C0:
    /* 650C0 800750C0 0400E724 */  addiu      $a3, $a3, 0x4
  .L800750C4:
    /* 650C4 800750C4 0E80083C */  lui        $t0, %hi(TrigList)
    /* 650C8 800750C8 1C340825 */  addiu      $t0, $t0, %lo(TrigList)
    /* 650CC 800750CC C0490600 */  sll        $t1, $a2, 7
    /* 650D0 800750D0 21102801 */  addu       $v0, $t1, $t0
    /* 650D4 800750D4 2110E200 */  addu       $v0, $a3, $v0
    /* 650D8 800750D8 00004284 */  lh         $v0, 0x0($v0)
    /* 650DC 800750DC 00000000 */  nop
    /* 650E0 800750E0 ECFF4A14 */  bne        $v0, $t2, .L80075094
    /* 650E4 800750E4 21102B01 */   addu      $v0, $t1, $t3
  .L800750E8:
    /* 650E8 800750E8 21100000 */  addu       $v0, $zero, $zero
  .L800750EC:
    /* 650EC 800750EC 0800BD27 */  addiu      $sp, $sp, 0x8
    /* 650F0 800750F0 0800E003 */  jr         $ra
    /* 650F4 800750F4 00000000 */   nop
endlabel FindLevTrig__Fiii
