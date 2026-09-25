.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching func_80010A7C, 0x78

glabel func_80010A7C
    /* A7C 80010A7C FCFFA4AF */  sw         $a0, -0x4($sp)
    /* A80 80010A80 FCFFBD27 */  addiu      $sp, $sp, -0x4
    /* A84 80010A84 01000624 */  addiu      $a2, $zero, 0x1
  .L80010A88:
    /* A88 80010A88 000042AD */  sw         $v0, 0x0($t2)
    /* A8C 80010A8C 04004A21 */  addi       $t2, $t2, 0x4 /* handwritten instruction */
    /* A90 80010A90 2638E200 */  xor        $a3, $a3, $v0
    /* A94 80010A94 01000224 */  addiu      $v0, $zero, 0x1
    /* A98 80010A98 FFFFC620 */  addi       $a2, $a2, -0x1 /* handwritten instruction */
    /* A9C 80010A9C E5FFC014 */  bnez       $a2, .L80010A34
    /* AA0 80010AA0 00000000 */   nop
    /* AA4 80010AA4 0000A48F */  lw         $a0, 0x0($sp)
    /* AA8 80010AA8 00000000 */  nop
    /* AAC 80010AAC 0400BD27 */  addiu      $sp, $sp, 0x4
    /* AB0 80010AB0 0800E003 */  jr         $ra
    /* AB4 80010AB4 00000000 */   nop
  alabel D_80010AB8
    /* AB8 80010AB8 00000000 */  nop
  alabel D_80010ABC
    /* ABC 80010ABC 00000000 */  nop
  alabel D_80010AC0
    /* AC0 80010AC0 00000000 */  nop
  alabel D_80010AC4
    /* AC4 80010AC4 00000000 */  nop
  alabel D_80010AC8
    /* AC8 80010AC8 00000001 */  .word      0x01000000                    # sll        $zero, $zero, 0 # 01000000 <InstrIdType: CPU_SPECIAL>
    /* ACC 80010ACC 00020004 */  bltz       $zero, .L800112D0
    /* AD0 80010AD0 00100800 */   sll       $v0, $t0, 0
    /* AD4 80010AD4 09000A00 */  .word      0x000A0009                    # jalr       $zero, $zero # 000A0000 <InstrIdType: CPU_SPECIAL>
    /* AD8 80010AD8 0C000000 */   syscall   0 /* handwritten instruction */
    /* ADC 80010ADC 00000000 */  nop
    /* AE0 80010AE0 08000200 */  .word      0x00020008                    # jr         $zero # 00020000 <InstrIdType: CPU_SPECIAL>
    /* AE4 80010AE4 03000300 */   sra       $zero, $v1, 0
    /* AE8 80010AE8 03000100 */  sra        $zero, $at, 0
    /* AEC 80010AEC 04000500 */  sllv       $zero, $a1, $zero
    /* AF0 80010AF0 06000000 */  srlv       $zero, $zero, $zero
endlabel func_80010A7C
    /* AF4 80010AF4 00000000 */  nop
    /* AF8 80010AF8 00000000 */  nop
  alabel D_80010AFC
    /* AFC 80010AFC 00000000 */  nop
