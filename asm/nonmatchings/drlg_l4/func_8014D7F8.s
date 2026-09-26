.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8014D7F8, 0x7C

glabel func_8014D7F8
    /* 13C00 8014D7F8 70737873 */  .word      0x73787370                    # INVALID    $k1, $t8, 0x7370 # 00000000 <InstrIdType: CPU_NORMAL>
    /* 13C04 8014D7FC 72632F67 */  daddiu     $t7, $t9, 0x6372
    /* 13C08 8014D800 6D616E2E */  sltiu      $t6, $s3, 0x616D
    /* 13C0C 8014D804 68000000 */  .word      0x00000068                    # INVALID    $zero, $zero, 0x68 # 00000000 <InstrIdType: CPU_SPECIAL>
    /* 13C10 8014D808 5761726C */  ldr        $s2, 0x6157($v1)
    /* 13C14 8014D80C 6F72642E */  sltiu      $a0, $s3, 0x726F
    /* 13C18 8014D810 44554E00 */  .word      0x004E5544                    # sllv       $t2, $t6, $v0 # 00000540 <InstrIdType: CPU_SPECIAL>
    /* 13C1C 8014D814 56696C65 */  daddiu     $t4, $t3, 0x6956
    /* 13C20 8014D818 31342E44 */  .word      0x442E3431                    # dmfc1      $t6, $f6 # 00000431 <InstrIdType: CPU_COP1>
    /* 13C24 8014D81C 554E0000 */  .word      0x00004E55                    # INVALID    $zero, $zero, 0x4E55 # 00000000 <InstrIdType: CPU_SPECIAL>
    /* 13C28 8014D820 64696162 */  daddi      $at, $s3, 0x6964
    /* 13C2C 8014D824 312E4455 */  bnel       $t2, $a0, .L801590EC
    /* 13C30 8014D828 4E000000 */   .word     0x0000004E                     # INVALID   $zero, $zero, 0x4E # 00000000 <InstrIdType: CPU_SPECIAL>
    /* 13C34 8014D82C 64696162 */  daddi      $at, $s3, 0x6964
    /* 13C38 8014D830 32622E44 */  .word      0x442E6232                    # dmfc1      $t6, $f12 # 00000232 <InstrIdType: CPU_COP1>
    /* 13C3C 8014D834 554E0000 */  .word      0x00004E55                    # INVALID    $zero, $zero, 0x4E55 # 00000000 <InstrIdType: CPU_SPECIAL>
    /* 13C40 8014D838 64696162 */  daddi      $at, $s3, 0x6964
    /* 13C44 8014D83C 32612E44 */  .word      0x442E6132                    # dmfc1      $t6, $f12 # 00000132 <InstrIdType: CPU_COP1>
    /* 13C48 8014D840 554E0000 */  .word      0x00004E55                    # INVALID    $zero, $zero, 0x4E55 # 00000000 <InstrIdType: CPU_SPECIAL>
    /* 13C4C 8014D844 64696162 */  daddi      $at, $s3, 0x6964
    /* 13C50 8014D848 33622E44 */  .word      0x442E6233                    # dmfc1      $t6, $f12 # 00000233 <InstrIdType: CPU_COP1>
    /* 13C54 8014D84C 554E0000 */  .word      0x00004E55                    # INVALID    $zero, $zero, 0x4E55 # 00000000 <InstrIdType: CPU_SPECIAL>
    /* 13C58 8014D850 64696162 */  daddi      $at, $s3, 0x6964
    /* 13C5C 8014D854 33612E44 */  .word      0x442E6133                    # dmfc1      $t6, $f12 # 00000133 <InstrIdType: CPU_COP1>
    /* 13C60 8014D858 554E0000 */  .word      0x00004E55                    # INVALID    $zero, $zero, 0x4E55 # 00000000 <InstrIdType: CPU_SPECIAL>
    /* 13C64 8014D85C 64696162 */  daddi      $at, $s3, 0x6964
    /* 13C68 8014D860 34622E44 */  .word      0x442E6234                    # dmfc1      $t6, $f12 # 00000234 <InstrIdType: CPU_COP1>
    /* 13C6C 8014D864 554E0000 */  .word      0x00004E55                    # INVALID    $zero, $zero, 0x4E55 # 00000000 <InstrIdType: CPU_SPECIAL>
    /* 13C70 8014D868 64696162 */  daddi      $at, $s3, 0x6964
    /* 13C74 8014D86C 34612E44 */  .word      0x442E6134                    # dmfc1      $t6, $f12 # 00000134 <InstrIdType: CPU_COP1>
    /* 13C78 8014D870 554E0000 */  .word      0x00004E55                    # INVALID    $zero, $zero, 0x4E55 # 00000000 <InstrIdType: CPU_SPECIAL>
endlabel func_8014D7F8
