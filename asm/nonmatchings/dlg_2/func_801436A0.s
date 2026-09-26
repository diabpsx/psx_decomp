.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching func_801436A0, 0x4C

glabel func_801436A0
    /* 9AA8 801436A0 2CB41180 */  lb         $s1, -0x4BD4($zero)
    /* 9AAC 801436A4 30B41180 */  lb         $s1, -0x4BD0($zero)
    /* 9AB0 801436A8 34B41180 */  lb         $s1, -0x4BCC($zero)
    /* 9AB4 801436AC 25732D31 */  andi       $t5, $t1, 0x7325
    /* 9AB8 801436B0 25732025 */  addiu      $zero, $t1, 0x7325
    /* 9ABC 801436B4 73253264 */  daddiu     $s2, $at, 0x2573
    /* 9AC0 801436B8 20257320 */  addi       $s3, $v1, 0x2520 /* handwritten instruction */
    /* 9AC4 801436BC 25730000 */  .word      0x00007325                    # or         $t6, $zero, $zero # 00000300 <InstrIdType: CPU_SPECIAL>
    /* 9AC8 801436C0 25732D32 */  andi       $t5, $s1, 0x7325
    /* 9ACC 801436C4 25732025 */  addiu      $zero, $t1, 0x7325
    /* 9AD0 801436C8 73253264 */  daddiu     $s2, $at, 0x2573
    /* 9AD4 801436CC 2025732D */  sltiu      $s3, $t3, 0x2520
    /* 9AD8 801436D0 25732532 */  andi       $a1, $s1, 0x7325
    /* 9ADC 801436D4 64202573 */  .word      0x73252064                    # INVALID    $t9, $a1, 0x2064 # 00000000 <InstrIdType: CPU_NORMAL>
    /* 9AE0 801436D8 00000000 */  nop
    /* 9AE4 801436DC 25642E20 */  addi       $t6, $at, 0x6425 /* handwritten instruction */
    /* 9AE8 801436E0 25732025 */  addiu      $zero, $t1, 0x7325
    /* 9AEC 801436E4 73202564 */  daddiu     $a1, $at, 0x2073
    /* 9AF0 801436E8 20257300 */  .word      0x00732520                    # add        $a0, $v1, $s3 # 00000500 <InstrIdType: CPU_SPECIAL> /* handwritten instruction */
endlabel func_801436A0
