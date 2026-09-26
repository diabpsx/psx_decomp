.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching StrDate, 0xC

glabel StrDate
    /* A07C8 800B07C8 4D617920 */  addi       $t9, $v1, 0x614D /* handwritten instruction */
    /* A07CC 800B07CC 32392031 */  andi       $zero, $t1, 0x3932
    /* A07D0 800B07D0 39393800 */  .word      0x00383939                    # INVALID    $at, $t8, 0x3939 # 00000000 <InstrIdType: CPU_SPECIAL>
endlabel StrDate
