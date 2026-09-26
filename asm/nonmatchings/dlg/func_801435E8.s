.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_801435E8, 0x10

glabel func_801435E8
    /* 99F0 801435E8 70737873 */  .word      0x73787370                    # INVALID    $k1, $t8, 0x7370 # 00000000 <InstrIdType: CPU_NORMAL>
    /* 99F4 801435EC 72632F67 */  daddiu     $t7, $t9, 0x6372
    /* 99F8 801435F0 6D616E2E */  sltiu      $t6, $s3, 0x616D
    /* 99FC 801435F4 68000000 */  .word      0x00000068                    # INVALID    $zero, $zero, 0x68 # 00000000 <InstrIdType: CPU_SPECIAL>
endlabel func_801435E8
