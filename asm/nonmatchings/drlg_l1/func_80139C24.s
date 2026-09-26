.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching func_80139C24, 0x34

glabel func_80139C24
    /* 2C 80139C24 70737873 */  .word      0x73787370                    # INVALID    $k1, $t8, 0x7370 # 00000000 <InstrIdType: CPU_NORMAL>
    /* 30 80139C28 72632F67 */  daddiu     $t7, $t9, 0x6372
    /* 34 80139C2C 6D616E2E */  sltiu      $t6, $s3, 0x616D
    /* 38 80139C30 68000000 */  .word      0x00000068                    # INVALID    $zero, $zero, 0x68 # 00000000 <InstrIdType: CPU_SPECIAL>
    /* 3C 80139C34 726E6436 */  ori        $a0, $s3, 0x6E72
    /* 40 80139C38 2E44554E */  .word      0x4E55442E                    # INVALID    $s2, $s5, 0x442E # 00000000 <InstrIdType: CPU_NORMAL>
    /* 44 80139C3C 00000000 */  nop
    /* 48 80139C40 534B6E67 */  daddiu     $t6, $k1, 0x4B53 /* handwritten instruction */
    /* 4C 80139C44 444F2E44 */  .word      0x442E4F44                    # dmfc1      $t6, $f9 # 00000744 <InstrIdType: CPU_COP1>
    /* 50 80139C48 554E0000 */  .word      0x00004E55                    # INVALID    $zero, $zero, 0x4E55 # 00000000 <InstrIdType: CPU_SPECIAL>
    /* 54 80139C4C 42616E6E */  ldr        $t6, 0x6142($s3)
    /* 58 80139C50 6572322E */  sltiu      $s2, $s1, 0x7265
    /* 5C 80139C54 44554E00 */  .word      0x004E5544                    # sllv       $t2, $t6, $v0 # 00000540 <InstrIdType: CPU_SPECIAL>
endlabel func_80139C24
