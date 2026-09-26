.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_801486A4, 0x10

glabel func_801486A4
    /* EAAC 801486A4 70737873 */  .word      0x73787370                    # INVALID    $k1, $t8, 0x7370 # 00000000 <InstrIdType: CPU_NORMAL>
    /* EAB0 801486A8 72632F67 */  daddiu     $t7, $t9, 0x6372
    /* EAB4 801486AC 6D616E2E */  sltiu      $t6, $s3, 0x616D
    /* EAB8 801486B0 68000000 */  .word      0x00000068                    # INVALID    $zero, $zero, 0x68 # 00000000 <InstrIdType: CPU_SPECIAL>
endlabel func_801486A4
