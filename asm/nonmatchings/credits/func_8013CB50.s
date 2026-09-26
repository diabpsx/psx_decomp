.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8013CB50, 0x20

glabel func_8013CB50
    /* 2F58 8013CB50 70737873 */  .word      0x73787370                    # INVALID    $k1, $t8, 0x7370 # 00000000 <InstrIdType: CPU_NORMAL>
    /* 2F5C 8013CB54 72632F67 */  daddiu     $t7, $t9, 0x6372
    /* 2F60 8013CB58 6D616E2E */  sltiu      $t6, $s3, 0x616D
    /* 2F64 8013CB5C 68000000 */  .word      0x00000068                    # INVALID    $zero, $zero, 0x68 # 00000000 <InstrIdType: CPU_SPECIAL>
    /* 2F68 8013CB60 70737873 */  .word      0x73787370                    # INVALID    $k1, $t8, 0x7370 # 00000000 <InstrIdType: CPU_NORMAL>
    /* 2F6C 8013CB64 72632F63 */  daddi      $t7, $t9, 0x6372
    /* 2F70 8013CB68 706C6179 */  .word      0x79616C70                    # INVALID    $t3, $at, 0x6C70 # 00000000 <InstrIdType: CPU_NORMAL>
    /* 2F74 8013CB6C 65722E68 */  ldl        $t6, 0x7265($at)
endlabel func_8013CB50
    /* 2F78 8013CB70 00000000 */  nop
