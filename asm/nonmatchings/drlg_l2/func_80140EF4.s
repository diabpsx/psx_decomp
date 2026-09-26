.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_80140EF4, 0x10

glabel func_80140EF4
    /* 72FC 80140EF4 70737873 */  .word      0x73787370                    # INVALID    $k1, $t8, 0x7370 # 00000000 <InstrIdType: CPU_NORMAL>
    /* 7300 80140EF8 72632F67 */  daddiu     $t7, $t9, 0x6372
    /* 7304 80140EFC 6D616E2E */  sltiu      $t6, $s3, 0x616D
    /* 7308 80140F00 68000000 */  .word      0x00000068                    # INVALID    $zero, $zero, 0x68 # 00000000 <InstrIdType: CPU_SPECIAL>
endlabel func_80140EF4
