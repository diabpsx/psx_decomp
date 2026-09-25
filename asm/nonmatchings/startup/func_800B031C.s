.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_800B031C, 0x4

glabel func_800B031C
    /* A031C 800B031C 05000000 */  .word      0x00000005                    # INVALID    $zero, $zero, 0x5 # 00000000 <InstrIdType: CPU_SPECIAL>
endlabel func_800B031C
