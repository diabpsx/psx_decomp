.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching func_80143604, 0x44

glabel func_80143604
    /* 9A0C 80143604 4249534C */  .word      0x4C534942                    # INVALID    $v0, $s3, 0x4942 # 00000000 <InstrIdType: CPU_NORMAL>
    /* 9A10 80143608 50532D30 */  andi       $t5, $at, 0x5350
    /* 9A14 8014360C 31343136 */  ori        $s1, $s1, 0x3431
    /* 9A18 80143610 2D444941 */  .word      0x4149442D                    # INVALID    $t2, $t1, 0x442D # 00000000 <InstrIdType: CPU_COP0> /* handwritten instruction */
    /* 9A1C 80143614 422D3031 */  andi       $s0, $t1, 0x2D42
    /* 9A20 80143618 00000000 */  nop
    /* 9A24 8014361C 4249534C */  .word      0x4C534942                    # INVALID    $v0, $s3, 0x4942 # 00000000 <InstrIdType: CPU_NORMAL>
    /* 9A28 80143620 50532D30 */  andi       $t5, $at, 0x5350
    /* 9A2C 80143624 31343136 */  ori        $s1, $s1, 0x3431
    /* 9A30 80143628 2D444941 */  .word      0x4149442D                    # INVALID    $t2, $t1, 0x442D # 00000000 <InstrIdType: CPU_COP0> /* handwritten instruction */
    /* 9A34 8014362C 422D3639 */  xori       $s6, $t1, 0x2D42
    /* 9A38 80143630 00000000 */  nop
    /* 9A3C 80143634 4249534C */  .word      0x4C534942                    # INVALID    $v0, $s3, 0x4942 # 00000000 <InstrIdType: CPU_NORMAL>
    /* 9A40 80143638 50532D30 */  andi       $t5, $at, 0x5350
    /* 9A44 8014363C 31343136 */  ori        $s1, $s1, 0x3431
    /* 9A48 80143640 2D444941 */  .word      0x4149442D                    # INVALID    $t2, $t1, 0x442D # 00000000 <InstrIdType: CPU_COP0> /* handwritten instruction */
    /* 9A4C 80143644 422D3838 */  xori       $t8, $at, 0x2D42
endlabel func_80143604
    /* 9A50 80143648 00000000 */  nop
