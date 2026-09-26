.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching func_8013B7DC, 0x134

glabel func_8013B7DC
    /* 1BE4 8013B7DC 70737873 */  .word      0x73787370                    # INVALID    $k1, $t8, 0x7370 # 00000000 <InstrIdType: CPU_NORMAL>
    /* 1BE8 8013B7E0 72632F67 */  daddiu     $t7, $t9, 0x6372
    /* 1BEC 8013B7E4 6D616E2E */  sltiu      $t6, $s3, 0x616D
    /* 1BF0 8013B7E8 68000000 */  .word      0x00000068                    # INVALID    $zero, $zero, 0x68 # 00000000 <InstrIdType: CPU_SPECIAL>
    /* 1BF4 8013B7EC 63647374 */  .word      0x74736463                    # INVALID    $v1, $s3, 0x6463 # 00000000 <InstrIdType: CPU_NORMAL>
    /* 1BF8 8013B7F0 7265616D */  ldr        $at, 0x6572($t3)
    /* 1BFC 8013B7F4 206D6964 */  daddiu     $t1, $v1, 0x6D20
    /* 1C00 8013B7F8 2D737472 */  .word      0x7274732D                    # INVALID    $s3, $s4, 0x732D # 00000000 <InstrIdType: CPU_NORMAL>
    /* 1C04 8013B7FC 65616D20 */  addi       $t5, $v1, 0x6165 /* handwritten instruction */
    /* 1C08 8013B800 74696D65 */  daddiu     $t5, $t3, 0x6974
    /* 1C0C 8013B804 6F75740A */  j          func_89D1D5BC
    /* 1C10 8013B808 00000000 */   nop
    /* 1C14 8013B80C 63647374 */  .word      0x74736463                    # INVALID    $v1, $s3, 0x6463 # 00000000 <InstrIdType: CPU_NORMAL>
    /* 1C18 8013B810 7265616D */  ldr        $at, 0x6572($t3)
    /* 1C1C 8013B814 206F7065 */  daddiu     $s0, $t3, 0x6F20
    /* 1C20 8013B818 6E207469 */  ldl        $s4, 0x206E($t3)
    /* 1C24 8013B81C 6D656F75 */  .word      0x756F656D                    # INVALID    $t3, $t7, 0x656D # 00000000 <InstrIdType: CPU_NORMAL>
    /* 1C28 8013B820 740A0000 */  teq        $zero, $zero, 41 /* handwritten instruction */
    /* 1C2C 8013B824 756E6465 */  daddiu     $a0, $t3, 0x6E75
    /* 1C30 8013B828 7272756E */  ldr        $s5, 0x7272($s3)
    /* 1C34 8013B82C 20696E20 */  addi       $t6, $v1, 0x6920 /* handwritten instruction */
    /* 1C38 8013B830 6765745F */  .word      0x5F746567                    # bgtzl      $k1, D_80154DD0 # 00140000 <InstrIdType: CPU_NORMAL> /* handwritten instruction */
    /* 1C3C 8013B834 6368756E */   ldr       $s5, 0x6863($s3)
    /* 1C40 8013B838 6B0A0000 */  .word      0x00000A6B                    # sltu       $at, $zero, $zero # 00000240 <InstrIdType: CPU_SPECIAL>
    /* 1C44 8013B83C 64697363 */  daddi      $s3, $k1, 0x6964 /* handwritten instruction */
    /* 1C48 8013B840 61726465 */  daddiu     $a0, $t3, 0x7261
    /* 1C4C 8013B844 64206D6F */  ldr        $t5, 0x2064($k1) /* handwritten instruction */
    /* 1C50 8013B848 72652074 */  .word      0x74206572                    # INVALID    $at, $zero, 0x6572 # 00000000 <InstrIdType: CPU_NORMAL>
    /* 1C54 8013B84C 68616E20 */  addi       $t6, $v1, 0x6168 /* handwritten instruction */
    /* 1C58 8013B850 676F740A */  j          func_89D1BD9C
    /* 1C5C 8013B854 00000000 */   nop
    /* 1C60 8013B858 6F766572 */  .word      0x7265766F                    # INVALID    $s3, $a1, 0x766F # 00000000 <InstrIdType: CPU_NORMAL>
    /* 1C64 8013B85C 64726175 */  .word      0x75617264                    # INVALID    $t3, $at, 0x7264 # 00000000 <InstrIdType: CPU_NORMAL>
    /* 1C68 8013B860 67687420 */  addi       $s4, $v1, 0x6867 /* handwritten instruction */
    /* 1C6C 8013B864 72616E20 */  addi       $t6, $v1, 0x6172 /* handwritten instruction */
    /* 1C70 8013B868 6F75740A */  j          func_89D1D5BC
    /* 1C74 8013B86C 00000000 */   nop
    /* 1C78 8013B870 756E6465 */  daddiu     $a0, $t3, 0x6E75
    /* 1C7C 8013B874 7272756E */  ldr        $s5, 0x7272($s3)
    /* 1C80 8013B878 20696E20 */  addi       $t6, $v1, 0x6920 /* handwritten instruction */
    /* 1C84 8013B87C 64697363 */  daddi      $s3, $k1, 0x6964 /* handwritten instruction */
    /* 1C88 8013B880 61726420 */  addi       $a0, $v1, 0x7261 /* handwritten instruction */
    /* 1C8C 8013B884 28696E3D */  .word      0x3D6E6928                    # lui        $t6, (0x69280000 >> 16) # 01600000 <InstrIdType: CPU_NORMAL>
    /* 1C90 8013B888 25642062 */  daddi      $zero, $s1, 0x6425
    /* 1C94 8013B88C 6F72726F */  ldr        $s2, 0x726F($k1) /* handwritten instruction */
    /* 1C98 8013B890 7765643D */  .word      0x3D646577                    # lui        $a0, (0x65770000 >> 16) # 01600000 <InstrIdType: CPU_NORMAL>
    /* 1C9C 8013B894 2564290A */  j          func_88A59094
    /* 1CA0 8013B898 00000000 */   nop
    /* 1CA4 8013B89C 5761726E */  ldr        $s2, 0x6157($s3)
    /* 1CA8 8013B8A0 696E673A */  xori       $a3, $s3, 0x6E69
    /* 1CAC 8013B8A4 2074696D */  ldr        $t1, 0x7420($t3)
    /* 1CB0 8013B8A8 656F7574 */  .word      0x74756F65                    # INVALID    $v1, $s5, 0x6F65 # 00000000 <InstrIdType: CPU_NORMAL>
    /* 1CB4 8013B8AC 20696E20 */  addi       $t6, $v1, 0x6920 /* handwritten instruction */
    /* 1CB8 8013B8B0 77616974 */  .word      0x74696177                    # INVALID    $v1, $t1, 0x6177 # 00000000 <InstrIdType: CPU_NORMAL>
    /* 1CBC 8013B8B4 5F636473 */  .word      0x7364635F                    # INVALID    $k1, $a0, 0x635F # 00000000 <InstrIdType: CPU_NORMAL>
    /* 1CC0 8013B8B8 74726561 */  daddi      $a1, $t3, 0x7274
    /* 1CC4 8013B8BC 6D28292E */  sltiu      $t1, $s1, 0x286D
    /* 1CC8 8013B8C0 2E2E0A00 */  .word      0x000A2E2E                    # dsub       $a1, $zero, $t2 # 00000600 <InstrIdType: CPU_SPECIAL>
    /* 1CCC 8013B8C4 70737873 */  .word      0x73787370                    # INVALID    $k1, $t8, 0x7370 # 00000000 <InstrIdType: CPU_NORMAL>
    /* 1CD0 8013B8C8 72632F46 */  .word      0x462F6372                    # c.eq.d     $f12, $f15 # 00000340 <InstrIdType: CPU_COP1_FPUD>
    /* 1CD4 8013B8CC 4D562E43 */  .word      0x432E564D                    # INVALID    $t9, $t6, 0x564D # 00000000 <InstrIdType: CPU_COP0> /* handwritten instruction */
    /* 1CD8 8013B8D0 50500000 */  .word      0x00005050                    # mfhi       $t2 # 00000040 <InstrIdType: CPU_SPECIAL>
    /* 1CDC 8013B8D4 44494142 */  .word      0x42414944                    # INVALID    $s2, $at, 0x4944 # 00000000 <InstrIdType: CPU_COP0> /* handwritten instruction */
    /* 1CE0 8013B8D8 454E442E */  sltiu      $a0, $s2, 0x4E45
    /* 1CE4 8013B8DC 4D4F5600 */  break      86, 317
    /* 1CE8 8013B8E0 44494142 */  .word      0x42414944                    # INVALID    $s2, $at, 0x4944 # 00000000 <InstrIdType: CPU_COP0> /* handwritten instruction */
    /* 1CEC 8013B8E4 454E4431 */  andi       $a0, $t2, 0x4E45
    /* 1CF0 8013B8E8 2E4D4F56 */  bnel       $s2, $t7, D_8014EDA4
    /* 1CF4 8013B8EC 00000000 */   nop
    /* 1CF8 8013B8F0 44494142 */  .word      0x42414944                    # INVALID    $s2, $at, 0x4944 # 00000000 <InstrIdType: CPU_COP0> /* handwritten instruction */
    /* 1CFC 8013B8F4 454E4432 */  andi       $a0, $s2, 0x4E45
    /* 1D00 8013B8F8 2E4D4F56 */  bnel       $s2, $t7, D_8014EDB4
    /* 1D04 8013B8FC 00000000 */   nop
    /* 1D08 8013B900 44494142 */  .word      0x42414944                    # INVALID    $s2, $at, 0x4944 # 00000000 <InstrIdType: CPU_COP0> /* handwritten instruction */
    /* 1D0C 8013B904 454E4433 */  andi       $a0, $k0, 0x4E45 /* handwritten instruction */
    /* 1D10 8013B908 2E4D4F56 */  bnel       $s2, $t7, D_8014EDC4
    /* 1D14 8013B90C 00000000 */   nop
endlabel func_8013B7DC
