.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching WitchItemOk__Fi, 0x90

glabel WitchItemOk__Fi
    /* 39774 80049774 40210400 */  sll        $a0, $a0, 5
    /* 39778 80049778 1180013C */  lui        $at, %hi(AllItemsList + 0x4)
    /* 3977C 8004977C 21082400 */  addu       $at, $at, $a0
    /* 39780 80049780 A8132280 */  lb         $v0, %lo(AllItemsList + 0x4)($at)
    /* 39784 80049784 00000000 */  nop
    /* 39788 80049788 0100432C */  sltiu      $v1, $v0, 0x1
    /* 3978C 8004978C 21286000 */  addu       $a1, $v1, $zero
    /* 39790 80049790 0A000324 */  addiu      $v1, $zero, 0xA
    /* 39794 80049794 02004314 */  bne        $v0, $v1, .L800497A0
    /* 39798 80049798 00000000 */   nop
    /* 3979C 8004979C 01000524 */  addiu      $a1, $zero, 0x1
  .L800497A0:
    /* 397A0 800497A0 1180013C */  lui        $at, %hi(AllItemsList + 0x18)
    /* 397A4 800497A4 21082400 */  addu       $at, $at, $a0
    /* 397A8 800497A8 BC132390 */  lbu        $v1, %lo(AllItemsList + 0x18)($at)
    /* 397AC 800497AC 06000224 */  addiu      $v0, $zero, 0x6
    /* 397B0 800497B0 02006214 */  bne        $v1, $v0, .L800497BC
    /* 397B4 800497B4 07000624 */   addiu     $a2, $zero, 0x7
    /* 397B8 800497B8 21280000 */  addu       $a1, $zero, $zero
  .L800497BC:
    /* 397BC 800497BC 02006614 */  bne        $v1, $a2, .L800497C8
    /* 397C0 800497C0 00000000 */   nop
    /* 397C4 800497C4 21280000 */  addu       $a1, $zero, $zero
  .L800497C8:
    /* 397C8 800497C8 1180013C */  lui        $at, %hi(AllItemsList + 0x19)
    /* 397CC 800497CC 21082400 */  addu       $at, $at, $a0
    /* 397D0 800497D0 BD132290 */  lbu        $v0, %lo(AllItemsList + 0x19)($at)
    /* 397D4 800497D4 00000000 */  nop
    /* 397D8 800497D8 02004614 */  bne        $v0, $a2, .L800497E4
    /* 397DC 800497DC 02000224 */   addiu     $v0, $zero, 0x2
    /* 397E0 800497E0 21280000 */  addu       $a1, $zero, $zero
  .L800497E4:
    /* 397E4 800497E4 02006214 */  bne        $v1, $v0, .L800497F0
    /* 397E8 800497E8 03000224 */   addiu     $v0, $zero, 0x3
    /* 397EC 800497EC 21280000 */  addu       $a1, $zero, $zero
  .L800497F0:
    /* 397F0 800497F0 02006214 */  bne        $v1, $v0, .L800497FC
    /* 397F4 800497F4 00000000 */   nop
    /* 397F8 800497F8 21280000 */  addu       $a1, $zero, $zero
  .L800497FC:
    /* 397FC 800497FC 0800E003 */  jr         $ra
    /* 39800 80049800 2110A000 */   addu      $v0, $a1, $zero
endlabel WitchItemOk__Fi
