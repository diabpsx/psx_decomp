.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching func_8014274C, 0x24

glabel func_8014274C
    /* 8B54 8014274C 426C696E */  ldr        $t1, 0x6C42($s3)
    /* 8B58 80142750 64322E44 */  .word      0x442E3264                    # dmfc1      $t6, $f6 # 00000264 <InstrIdType: CPU_COP1>
    /* 8B5C 80142754 554E0000 */  .word      0x00004E55                    # INVALID    $zero, $zero, 0x4E55 # 00000000 <InstrIdType: CPU_SPECIAL>
    /* 8B60 80142758 426C6F6F */  ldr        $t7, 0x6C42($k1) /* handwritten instruction */
    /* 8B64 8014275C 64312E44 */  .word      0x442E3164                    # dmfc1      $t6, $f6 # 00000164 <InstrIdType: CPU_COP1>
    /* 8B68 80142760 554E0000 */  .word      0x00004E55                    # INVALID    $zero, $zero, 0x4E55 # 00000000 <InstrIdType: CPU_SPECIAL>
    /* 8B6C 80142764 426F6E65 */  daddiu     $t6, $t3, 0x6F42
    /* 8B70 80142768 73747232 */  andi       $s2, $s3, 0x7473
    /* 8B74 8014276C 2E44554E */  .word      0x4E55442E                    # INVALID    $s2, $s5, 0x442E # 00000000 <InstrIdType: CPU_NORMAL>
endlabel func_8014274C
    /* 8B78 80142770 00000000 */  nop
