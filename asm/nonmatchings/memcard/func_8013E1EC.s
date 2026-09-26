.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8013E1EC, 0x8

glabel func_8013E1EC
    /* 45F4 8013E1EC 62752564 */  daddiu     $a1, $at, 0x7562
    /* 45F8 8013E1F0 303A2573 */  .word      0x73253A30                    # INVALID    $t9, $a1, 0x3A30 # 00000000 <InstrIdType: CPU_NORMAL>
endlabel func_8013E1EC
    /* 45FC 8013E1F4 00000000 */  nop
