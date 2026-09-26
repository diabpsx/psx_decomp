.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8013D1A0, 0x14

glabel func_8013D1A0
    /* 35A8 8013D1A0 70737873 */  .word      0x73787370                    # INVALID    $k1, $t8, 0x7370 # 00000000 <InstrIdType: CPU_NORMAL>
    /* 35AC 8013D1A4 72632F70 */  .word      0x702F6372                    # INVALID    $at, $t7, 0x6372 # 00000000 <InstrIdType: CPU_NORMAL>
    /* 35B0 8013D1A8 72696D70 */  .word      0x706D6972                    # INVALID    $v1, $t5, 0x6972 # 00000000 <InstrIdType: CPU_NORMAL>
    /* 35B4 8013D1AC 6F6F6C2E */  sltiu      $t4, $s3, 0x6F6F
    /* 35B8 8013D1B0 68000000 */  .word      0x00000068                    # INVALID    $zero, $zero, 0x68 # 00000000 <InstrIdType: CPU_SPECIAL>
endlabel func_8013D1A0
